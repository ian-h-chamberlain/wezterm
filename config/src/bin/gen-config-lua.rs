//! Generate an *approximate* [LuaLS definition file](https://luals.github.io/wiki/definition-files)
//! for the [`Config`] table format.
//!
//! Not all types have a proper representation; those without are simply marked `@class`
//! in the generated annotations. Not handled currently:
//!
//! - Enum-like types
//! - `Vec<Vec<T>>` and otherwise nested types
//! - Structured table types like `{ foo: string, bar: number }`

use std::collections::BTreeMap;

use config::meta::{ConfigContainer, ConfigMeta, ConfigOption};
use config::Config;

fn main() {
    let cfg = Config::default();

    print!(
        "---@meta

---@class Config
---
"
    );

    let mut userdata_type_docs = BTreeMap::new();

    let mut options: Vec<_> = cfg.get_config_options().iter().collect();
    options.sort_by_key(|opt| opt.name);

    for option in &options {
        let &ConfigOption { name, mut doc, .. } = option;

        let base_type = match option.type_name {
            "f32" | "f64" => "number",
            "i32" | "i64" | "isize" | "u8" | "u16" | "u32" | "u64" | "usize" => "integer",
            "bool" => "boolean",
            "Vec" => "[any]", // close enough
            "String" | "PathBuf" => "string",
            // assume all other types are userdata or their own class; maybe not perfect but "good enough"
            ty => {
                userdata_type_docs.insert(ty, doc);
                doc = "";
                ty
            }
        };

        let ty = match option.container {
            ConfigContainer::None => base_type.into(),
            ConfigContainer::Option => format!("{base_type}?"),
            ConfigContainer::Vec => format!("[{base_type}]"),
            // For now, don't handle { key: value } table types and assume just string keys
            ConfigContainer::Map => format!("table<string, {base_type}>"),
        };

        let doc = doc.replace("\n", "");

        println!("---@field {name} {ty}{doc}")
    }

    println!("Config = {{}}");
    println!();

    for (ty, doc) in userdata_type_docs {
        println!("---@class {ty}");
        for line in doc.lines() {
            println!("--- {line}");
        }
        println!("{ty} = {{}}");
        println!();
    }
}

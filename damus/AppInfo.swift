// DO NOT EDIT, // IT IS A MACHINE GENERATED FILE

// AppInfo.swift on Aug 8 17:45:30 2022 -0400

import Foundation
class AppInfo {
let version: String
let build: String
let gitCommitSHA: String = "a6e7530"
init?() {
    guard let version =
Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String, let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else { return nil }
    self.version = version
    self.build = build }
}

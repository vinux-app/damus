// DO NOT EDIT, // IT IS A MACHINE GENERATED FILE

// AppInfo.swift un Aug 7 19:31:02 2022 -0700

import Foundation
class AppInfo {
let version: String
let build: String
let gitCommitSHA: String = "df5d655"
init?() {
    guard let version =
Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String, let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else { return nil }
    self.version = version
    self.build = build }
}

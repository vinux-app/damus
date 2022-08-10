// DO NOT EDIT, // IT IS A MACHINE GENERATED FILE

// AppInfo.swift ed Aug 10 01:57:22 2022 -0400

import Foundation
class AppInfo {
let version: String
let build: String
let gitCommitSHA: String = "8964148"
init?() {
    guard let version =
Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String, let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else { return nil }
    self.version = version
    self.build = build }
}

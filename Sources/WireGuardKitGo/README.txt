==============================
Test wireguard-rust Library
==============================

${PROJECT_DIR}/../wireguard-rust/target/aarch64-apple-ios/release

Other Linker Flags:
-lwireguard_rust

MakeFile WireGuardKitGo:

RUST_INCLUDE_DIR := $(CURDIR)/../../../wireguard-rust/target/include
RUST_LIB_DIR := $(CURDIR)/../../../wireguard-rust/target/aarch64-apple-ios/releas



==============================
VPNPACKETFILTER
==============================

Library Search Paths:
${PROJECT_DIR}/../../Revoke/RevokeVPNApp/rustlib/vpnpacketfilter/target/aarch64-apple-ios/release

Other Linker Flags:
-lvpnpacketfilter

MakeFile WireGuardKitGo:

RUST_INCLUDE_DIR := $(CURDIR)/../../../../Revoke/RevokeVPNApp/rustlib/vpnpacketfilter/target/include
RUST_LIB_DIR := $(CURDIR)/../../../../Revoke/RevokeVPNApp/rustlib/vpnpacketfilter/target/aarch64-apple-ios/release
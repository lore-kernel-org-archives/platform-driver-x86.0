From: Y Paritcher <y.linux@paritcher.com>
Subject: [PATCH 3/3] platform/x86: dell-wmi: add keys to bios_to_linux_keycode
Date: Mon,  8 Jun 2020 00:22:26 -0400
Message-ID: <13951508596a3f654c6d47f5380ddb4f38e2f6b5.1591584631.git.y.linux@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1591584631.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Increase length of bios_to_linux_keycode to 2 bytes to allow for a new
keycode 0xffff, this silences the following messages being logged at
startup on a Dell Inspiron 5593

dell_wmi: firmware scancode 0x48 maps to unrecognized keycode 0xffff
dell_wmi: firmware scancode 0x50 maps to unrecognized keycode 0xffff

Signed-off-by: Y Paritcher <y.linux@paritcher.com>
---
 drivers/platform/x86/dell-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index f37e7e9093c2..5ef716e3034f 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -196,7 +196,7 @@ struct dell_dmi_results {
 };
 
 /* Uninitialized entries here are KEY_RESERVED == 0. */
-static const u16 bios_to_linux_keycode[256] = {
+static const u16 bios_to_linux_keycode[65536] = {
 	[0]	= KEY_MEDIA,
 	[1]	= KEY_NEXTSONG,
 	[2]	= KEY_PLAYPAUSE,
@@ -237,6 +237,7 @@ static const u16 bios_to_linux_keycode[256] = {
 	[37]	= KEY_UNKNOWN,
 	[38]	= KEY_MICMUTE,
 	[255]	= KEY_PROG3,
+	[65535]	= KEY_UNKNOWN,
 };
 
 /*
-- 
2.27.0

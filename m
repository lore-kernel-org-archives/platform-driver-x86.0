From: Y Paritcher <y.linux@paritcher.com>
Subject: [PATCH v2 1/3] platform/x86: dell-wmi: add new backlight events
Date: Mon,  8 Jun 2020 19:05:28 -0400
Message-ID: <1ddd0496403199130532923e4ccb30481ff167b6.1591656154.git.y.linux@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com> <cover.1591656154.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1591656154.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

Add events with a type of 0x0010 and a code of 0x57 / 0x58,
this silences the following messages being logged on a
Dell Inspiron 5593:

dell_wmi: Unknown key with type 0x0010 and code 0x0057 pressed
dell_wmi: Unknown key with type 0x0010 and code 0x0058 pressed

These are brightness events and will be handled by acpi-video

Signed-off-by: Y Paritcher <y.linux@paritcher.com>
---
 drivers/platform/x86/dell-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index c25a4286d766..0b2edfe2767d 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -255,6 +255,10 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
 	/* Keyboard backlight change notification */
 	{ KE_IGNORE, 0x3f, { KEY_RESERVED } },
 
+	/* Backlight brightness level */
+	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
+
 	/* Mic mute */
 	{ KE_KEY, 0x150, { KEY_MICMUTE } },
 
-- 
2.27.0

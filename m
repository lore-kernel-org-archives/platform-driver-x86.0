From: Y Paritcher <y.linux@paritcher.com>
Subject: [PATCH 1/3] platform/x86: dell-wmi: add new backlight events
Date: Mon,  8 Jun 2020 00:22:24 -0400
Message-ID: <7dbe4e9e5ed64e4704b1c4ae13ac84df644ccc13.1591584631.git.y.linux@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1591584631.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Ignore events with a type of 0x0010 and a code of 0x57 / 0x58,
this silences the following messages being logged on a
Dell Inspiron 5593:

dell_wmi: Unknown key with type 0x0010 and code 0x0057 pressed
dell_wmi: Unknown key with type 0x0010 and code 0x0058 pressed

Signed-off-by: Y Paritcher <y.linux@paritcher.com>
---
 drivers/platform/x86/dell-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index c25a4286d766..0b4f72f923cd 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -252,6 +252,10 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
 	/* Fn-lock switched to multimedia keys */
 	{ KE_IGNORE, 0x1, { KEY_RESERVED } },
 
+	/* Backlight brightness level */
+	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
+
 	/* Keyboard backlight change notification */
 	{ KE_IGNORE, 0x3f, { KEY_RESERVED } },
 
-- 
2.27.0

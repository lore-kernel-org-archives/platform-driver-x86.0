From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: dell-wmi: Ignore keyboard attached / detached events
Date: Wed, 13 May 2020 15:05:44 +0200
Message-ID: <20200513130544.90243-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Ignore events with a type of 0x0011 and a code of 0xfff2 / 0xfff3,
this silences the following messages being logged when the keyboard is
detached / attached on a Dell Venue 11 Pro 7130:

[   63.621953] dell_wmi: Unknown key with type 0x0011 and code 0xfff2 pressed
[   70.240558] dell_wmi: Unknown key with type 0x0011 and code 0xfff3 pressed

Note SW_TABLET_MODE is already reported through the intel_vbtn driver on
this and other Dell devices, so dell_wmi should not report this too,
to avoid duplicate events.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-wmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 86e8dd6a8b33..c25a4286d766 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -310,6 +310,16 @@ static const struct key_entry dell_wmi_keymap_type_0011[] = {
 	/* Battery inserted */
 	{ KE_IGNORE, 0xfff1, { KEY_RESERVED } },
 
+	/*
+	 * Detachable keyboard detached / undocked
+	 * Note SW_TABLET_MODE is already reported through the intel_vbtn
+	 * driver for this, so we ignore it.
+	 */
+	{ KE_IGNORE, 0xfff2, { KEY_RESERVED } },
+
+	/* Detachable keyboard attached / docked */
+	{ KE_IGNORE, 0xfff3, { KEY_RESERVED } },
+
 	/* Keyboard backlight level changed */
 	{ KE_IGNORE, KBD_LED_OFF_TOKEN,      { KEY_RESERVED } },
 	{ KE_IGNORE, KBD_LED_ON_TOKEN,       { KEY_RESERVED } },
-- 
2.26.0

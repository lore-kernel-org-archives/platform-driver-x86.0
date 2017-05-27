From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH] platform/x86: dell-wmi: Add a better description for "stealth mode"
Date: Fri, 26 May 2017 22:16:12 -0700
Message-ID: <a959f34a4a8586b9fd71550cf2920371daefacf0.1495862172.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Andy Lutomirski <luto@kernel.org>

This is based on Mario's explanation and observation of my laptop.

Suggested-by: "Pali Rohár" <pali.rohar@gmail.com>
Signed-off-by: Andy Lutomirski <luto@kernel.org>
Cc: Mario Limonciello <mario_limonciello@dell.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/dell-wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 24467b1..73aee0d 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -272,7 +272,12 @@ static const struct key_entry dell_wmi_keymap_type_0010[] __initconst = {
 	/* RGB keyboard backlight control */
 	{ KE_IGNORE, 0x154, { KEY_RESERVED } },
 
-	/* Stealth mode toggle */
+	/*
+	 * Stealth mode toggle. This will "disable all lights and sounds".
+	 * The action is performed by the BIOS and EC; the WMI event is just
+	 * a notification. On the XPS 13 9350, this is Fn+F7, and there's
+	 * a BIOS setting to enable and disable the hotkey.
+	 */
 	{ KE_IGNORE, 0x155, { KEY_RESERVED } },
 
 	/* Rugged magnetic dock attach/detach events */
-- 
2.9.4

From: Danny Baumann <dannybaumann@web.de>
Subject: [PATCH 1/1] dell-wmi: Add support for keys present on Inspiron 15R SE.
Date: Tue, 26 Mar 2013 12:36:34 +0100
Message-ID: <1364297794-3931-2-git-send-email-dannybaumann@web.de>
References: <1364297794-3931-1-git-send-email-dannybaumann@web.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1364297794-3931-1-git-send-email-dannybaumann@web.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Danny Baumann <dannybaumann@web.de>
List-Id: platform-driver-x86.vger.kernel.org

Those devices have some additional buttons:
- A 'Windows Mobility Center' button that sends Windows+X
- A 'Dell audio preset switch' button that sends key code 0xe02a on
  press (with auto-repeat) and 0xe02c on release
- An 'instant launch' button that sends key code 0xe024

The first one doesn't require handling; the two latter ones do not have
a real meaning in Linux, so bind them to launcher keycodes.

Signed-off-by: Danny Baumann <dannybaumann@web.de>
---
 drivers/platform/x86/dell-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index fa9a217..7b1ffd3 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -88,6 +88,15 @@ static const struct key_entry dell_wmi_legacy_keymap[] __initconst = {
 
 	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
 
+	/* Instant launch button */
+	{ KE_KEY, 0xe024, { KEY_PROG3 } },
+
+	/* 'Dell audio with preset switch' button -
+	   0xe02a is fired on press (with auto-repeat),
+	   0xe02c is fired on release */
+	{ KE_IGNORE, 0xe02a, { KEY_RESERVED } },
+	{ KE_KEY, 0xe02c, { KEY_PROG4 } },
+
 	/* Shortcut and audio panel keys */
 	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
-- 
1.8.1.4

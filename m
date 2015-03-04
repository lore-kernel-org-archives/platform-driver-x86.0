From: Joseph Salisbury <joseph.salisbury@canonical.com>
Subject: [PATCH 2/2] toshiba_acpi: Add Satellite P50W-B to alternative keymap and create new mappings.
Date: Wed,  4 Mar 2015 16:52:34 -0500
Message-ID: <2c7d7f26e69b6e28e1f97be2d5021c0c46427d86.1425502427.git.joseph.salisbury@canonical.com>
References: <f550a80e50ed5296cb8bc9b6a536c68c05dc66c6.1425502427.git.joseph.salisbury@canonical.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <f550a80e50ed5296cb8bc9b6a536c68c05dc66c6.1425502427.git.joseph.salisbury@canonical.com>
In-Reply-To: <f550a80e50ed5296cb8bc9b6a536c68c05dc66c6.1425502427.git.joseph.salisbury@canonical.com>
References: <f550a80e50ed5296cb8bc9b6a536c68c05dc66c6.1425502427.git.joseph.salisbury@canonical.com>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

BugLink: http://bugs.launchpad.net/bugs/1416277

The Toshiba Satellite P50W-B is required in the alternate keymap for all
keys to properly function.  There are also some new key ids that need to
be added(PREVIOUSSONG, NEXTSONG and PLAYPAUSE).  Also, the alt keymap has changed the key ids for
mute, brightness up/down.  Adding those key ids to the alternate keymap as well(MUTE, BRIGHTNESSDOWN
and BRIGHTNESSUP).

Signed-off-by: Joseph Salisbury <joseph.salisbury@canonical.com>
Reported-and-tested-by: robert.ancell@canonical.com
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/toshiba_acpi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 333aaca..fe0d2b2 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -269,11 +269,18 @@ static const struct dmi_system_id toshiba_alt_keymap_dmi[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Satellite-L845"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Satellite P50W-B"),
+		},
+	},
 	{}
 };
 
 static const struct key_entry toshiba_acpi_alt_keymap[] = {
-	{ KE_KEY, 0x157, { KEY_MUTE } },
+	{ KE_KEY, 0x9e, { KEY_RFKILL } },
+	{ KE_KEY, 0x101, { KEY_MUTE } },
 	{ KE_KEY, 0x102, { KEY_ZOOMOUT } },
 	{ KE_KEY, 0x103, { KEY_ZOOMIN } },
 	{ KE_KEY, 0x12c, { KEY_KBDILLUMTOGGLE } },
@@ -281,8 +288,14 @@ static const struct key_entry toshiba_acpi_alt_keymap[] = {
 	{ KE_KEY, 0x13e, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0x13c, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY, 0x13d, { KEY_BRIGHTNESSUP } },
+	{ KE_KEY, 0x140, { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY, 0x141, { KEY_BRIGHTNESSUP } },
+	{ KE_KEY, 0x157, { KEY_MUTE } },
 	{ KE_KEY, 0x158, { KEY_WLAN } },
 	{ KE_KEY, 0x13f, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY, 0xb31, { KEY_PREVIOUSSONG } },
+	{ KE_KEY, 0xb32, { KEY_NEXTSONG } },
+	{ KE_KEY, 0xb33, { KEY_PLAYPAUSE } },
 	{ KE_END, 0 },
 };
 
-- 
2.1.0

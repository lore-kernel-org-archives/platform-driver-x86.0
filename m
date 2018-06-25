From: Matt Delco <delco@chromium.org>
Subject: [PATCH v2] platform/x86: intel-vbtn: Add support for dock mode detection
Date: Sun, 24 Jun 2018 17:29:40 -0700
Message-ID: <20180625002940.117141-1-delco@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Matt Delco <delco@chromium.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The Dell laptop I have has an ACPI that sends 0xCB and 0xCC on entering
tablet mode.  On exiting tablet mode it sends 0xCA and 0xCD. Based on:

http://www.traby.de/medion/DSDT/dsdt.dsl
https://gist.github.com/jprvita/5737de3cbb670e80973b7d4e51c38ab6
https://osdn.net/projects/android-x86/scm/git/kernel/commits/
7cbe5a330687b851f32dd9f1048a6ce182d0ff44

It appears that 0xCA and 0xCB are about dock mode, which for my
convertible laptop seems questionably tied to whether I've put
the laptop in tablet or laptop mode.  I previously proposed no-oping
0xCA and 0xCB but this revised change attempts to add support for
detecting dock mode--this detection will essentially be broken for
my laptop (the main workaround would be for 0xCA and 0xCB to be used
to provoke a query of the VGBS method that reports the current dock &
tablet mode [which is accurately reported on my laptop but based on
the prior workarounds in the driver it apparently can't be trusted
for all systems]).

Signed-off-by: Matt Delco <delco@chromium.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/intel-vbtn.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index c13780b8dabb..06cd7e818ed5 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -17,6 +17,7 @@
 
 /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
 #define TABLET_MODE_FLAG 0x40
+#define DOCK_MODE_FLAG   0x80
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("AceLan Kao");
@@ -38,6 +39,8 @@ static const struct key_entry intel_vbtn_keymap[] = {
 	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
 	{ KE_KEY,    0xC8, { KEY_ROTATE_LOCK_TOGGLE } },	/* rotate-lock key press */
 	{ KE_KEY,    0xC9, { KEY_ROTATE_LOCK_TOGGLE } },	/* rotate-lock key release */
+	{ KE_SW,     0xCA, { .sw = { SW_DOCK, 1 } } },		/* Docked */
+	{ KE_SW,     0xCB, { .sw = { SW_DOCK, 0 } } },		/* Undocked */
 	{ KE_SW,     0xCC, { .sw = { SW_TABLET_MODE, 1 } } },	/* Tablet */
 	{ KE_SW,     0xCD, { .sw = { SW_TABLET_MODE, 0 } } },	/* Laptop */
 	{ KE_END },
@@ -121,6 +124,8 @@ static void detect_tablet_mode(struct platform_device *device)
 
 	m = !(obj->integer.value & TABLET_MODE_FLAG);
 	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
+	m = (obj->integer.value & DOCK_MODE_FLAG) ? 1 : 0;
+	input_report_switch(priv->input_dev, SW_DOCK, m);
 out:
 	kfree(vgbs_output.pointer);
 }
-- 
2.18.0.rc2.346.g013aa6912e-goog

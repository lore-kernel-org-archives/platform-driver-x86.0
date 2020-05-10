From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/3] platform/x86: asus-wmi: Add support for SW_TABLET_MODE
Date: Sun, 10 May 2020 14:24:31 +0200
Message-ID: <20200510122432.123751-2-hdegoede@redhat.com>
References: <20200510122432.123751-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200510122432.123751-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Asus 2-in-1s with a detachable keyboard the Asus WMI interface
reports if the tablet is attached to the keyboard or not.

Report if the 2-in-1 is in tablet or clamshell mode to userspace
by reporting SW_TABLET_MODE events to userspace.

This has been tested on a T100TA, T100CHI, T100HA and T200TA.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c            | 24 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  3 +++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 25ec821dae21..1ab07fa9b08a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -57,6 +57,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_BRNDOWN_MIN		0x20
 #define NOTIFY_BRNDOWN_MAX		0x2e
 #define NOTIFY_FNLOCK_TOGGLE		0x4e
+#define NOTIFY_KBD_DOCK_CHANGE		0x75
 #define NOTIFY_KBD_BRTUP		0xc4
 #define NOTIFY_KBD_BRTDWN		0xc5
 #define NOTIFY_KBD_BRTTOGGLE		0xc7
@@ -346,7 +347,7 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
 
 static int asus_wmi_input_init(struct asus_wmi *asus)
 {
-	int err;
+	int err, result;
 
 	asus->inputdev = input_allocate_device();
 	if (!asus->inputdev)
@@ -362,6 +363,14 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 	if (err)
 		goto err_free_dev;
 
+	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
+	if (result >= 0) {
+		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
+		input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
+	} else if (result != -ENODEV) {
+		pr_err("Error checking for keyboard-dock: %d\n", result);
+	}
+
 	err = input_register_device(asus->inputdev);
 	if (err)
 		goto err_free_dev;
@@ -2055,9 +2064,9 @@ static int asus_wmi_get_event_code(u32 value)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
-	int orig_code;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
+	int result, orig_code;
 
 	orig_code = code;
 
@@ -2102,6 +2111,17 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
+	if (code == NOTIFY_KBD_DOCK_CHANGE) {
+		result = asus_wmi_get_devstate_simple(asus,
+						      ASUS_WMI_DEVID_KBD_DOCK);
+		if (result >= 0) {
+			input_report_switch(asus->inputdev, SW_TABLET_MODE,
+					    !result);
+			input_sync(asus->inputdev);
+		}
+		return;
+	}
+
 	if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
 		fan_boost_mode_switch_next(asus);
 		return;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index d39fc658c320..897b8332a39f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -85,6 +85,9 @@
 /* Maximum charging percentage */
 #define ASUS_WMI_DEVID_RSOC		0x00120057
 
+/* Keyboard dock */
+#define ASUS_WMI_DEVID_KBD_DOCK		0x00120063
+
 /* DSTS masks */
 #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
 #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002
-- 
2.26.0

From: Leonid Maksymchuk <leonmaxx@gmail.com>
Subject: [PATCH v4 2/3] asus_wmi: Support fan boost mode on FX505DY/FX705DY
Date: Fri,  8 Nov 2019 18:45:37 +0200
Message-ID: <20191108164537.3123-1-leonmaxx@gmail.com>
References: <20191108164317.2874-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191108164317.2874-1-leonmaxx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, chiu@endlessm.com, yurii.pavlovskyi@gmail.com, kristian@klausen.dk, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com, Leonid Maksymchuk <leonmaxx@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On ASUS FX505DY/FX705DY laptops fan boost mode is same as in other
TUF laptop models but have different ACPI device ID and different hotkey
code.

Signed-off-by: Leonid Maksymchuk <leonmaxx@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 29 ++++++++++++++++------
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 723aa4d969dc..4f9c0b99f352 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -61,6 +61,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_KBD_BRTDWN		0xc5
 #define NOTIFY_KBD_BRTTOGGLE		0xc7
 #define NOTIFY_KBD_FBM			0x99
+#define NOTIFY_KBD_FBM_2		0xae
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -195,6 +196,7 @@ struct asus_wmi {
 	int agfn_pwm;
 
 	bool fan_boost_mode_available;
+	u32 fan_boost_mode_dev_id;
 	u8 fan_boost_mode_mask;
 	u8 fan_boost_mode;
 
@@ -1611,15 +1613,12 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 
 /* Fan mode *******************************************************************/
 
-static int fan_boost_mode_check_present(struct asus_wmi *asus)
+static int fan_boost_mode_check_device(struct asus_wmi *asus, u32 dev_id)
 {
 	u32 result;
 	int err;
 
-	asus->fan_boost_mode_available = false;
-
-	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_BOOST_MODE,
-				    &result);
+	err = asus_wmi_get_devstate(asus, dev_id, &result);
 	if (err) {
 		if (err == -ENODEV)
 			return 0;
@@ -1630,12 +1629,27 @@ static int fan_boost_mode_check_present(struct asus_wmi *asus)
 	if ((result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
 			(result & ASUS_FAN_BOOST_MODES_MASK)) {
 		asus->fan_boost_mode_available = true;
+		asus->fan_boost_mode_dev_id = dev_id;
 		asus->fan_boost_mode_mask = result & ASUS_FAN_BOOST_MODES_MASK;
 	}
 
 	return 0;
 }
 
+static int fan_boost_mode_check_present(struct asus_wmi *asus)
+{
+	int err;
+
+	asus->fan_boost_mode_available = false;
+	err = fan_boost_mode_check_device(asus, ASUS_WMI_DEVID_FAN_BOOST_MODE);
+
+	if (err || asus->fan_boost_mode_available)
+		return err;
+
+	return fan_boost_mode_check_device(asus,
+					   ASUS_WMI_DEVID_FAN_BOOST_MODE_2);
+}
+
 static int fan_boost_mode_write(struct asus_wmi *asus)
 {
 	int err;
@@ -1645,7 +1659,7 @@ static int fan_boost_mode_write(struct asus_wmi *asus)
 	value = asus->fan_boost_mode;
 
 	pr_info("Set fan boost mode: %u\n", value);
-	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_FAN_BOOST_MODE, value,
+	err = asus_wmi_set_devstate(asus->fan_boost_mode_dev_id, value,
 				    &retval);
 	if (err) {
 		pr_warn("Failed to set fan boost mode: %d\n", err);
@@ -2000,7 +2014,8 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
+	if (asus->fan_boost_mode_available &&
+			(code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_FBM_2)) {
 		fan_boost_mode_switch_next(asus);
 		return;
 	}
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 60249e22e844..714782b193b3 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -58,6 +58,7 @@
 #define ASUS_WMI_DEVID_LIGHT_SENSOR	0x00050022 /* ?? */
 #define ASUS_WMI_DEVID_LIGHTBAR		0x00050025
 #define ASUS_WMI_DEVID_FAN_BOOST_MODE	0x00110018
+#define ASUS_WMI_DEVID_FAN_BOOST_MODE_2	0x00120075
 
 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
-- 
2.23.0

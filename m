From: Leon Maxx <leonmaxx@gmail.com>
Subject: [RFC PATCH 2/3] platform/x86: asus_wmi: Support fan boost mode on FX505DY/FX705DY
Date: Mon, 4 Nov 2019 12:55:11 +0200
Message-ID: <CAPW-Pu2g3yiD8H5yUhAsCCN0vMzojoQ6QOn+4iOKCzHizE4T4A@mail.gmail.com>
References: <CAPW-Pu0KuxqbKSQ2JQaxh5AHbdZdNQZJfOgxoe_XZSxow+9e3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPW-Pu0KuxqbKSQ2JQaxh5AHbdZdNQZJfOgxoe_XZSxow+9e3A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com, Daniel Drake <drake@endlessm.com>, yurii.pavlovskyi@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On ASUS FX505DY/FX705DY laptops fan boost mode is same as in other
TUF laptop models but have different ACPI device ID and different key
code.

Signed-off-by: Leonid Maksymchuk <leonmaxx@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 42 ++++++++++++++++++++----------
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 723aa4d..f4e5840 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -61,6 +61,7 @@
 #define NOTIFY_KBD_BRTDWN 0xc5
 #define NOTIFY_KBD_BRTTOGGLE 0xc7
 #define NOTIFY_KBD_FBM 0x99
+#define NOTIFY_KBD_FBM_2 0xae

 #define ASUS_WMI_FNLOCK_BIOS_DISABLED BIT(0)

@@ -194,7 +195,7 @@ struct asus_wmi {
  int fan_pwm_mode;
  int agfn_pwm;

- bool fan_boost_mode_available;
+ int fan_boost_mode_available;
  u8 fan_boost_mode_mask;
  u8 fan_boost_mode;

@@ -1616,24 +1617,33 @@ static int fan_boost_mode_check_present(struct
asus_wmi *asus)
  u32 result;
  int err;

- asus->fan_boost_mode_available = false;
+ asus->fan_boost_mode_available = 0;

  err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_BOOST_MODE,
      &result);
- if (err) {
- if (err == -ENODEV)
- return 0;
- else
- return err;
+
+ if (err == 0 &&
+ (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
+ (result & ASUS_FAN_BOOST_MODES_MASK)) {
+ asus->fan_boost_mode_available = 1;
+ asus->fan_boost_mode_mask = result & ASUS_FAN_BOOST_MODES_MASK;
+ return 0;
  }

- if ((result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
+ err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_BOOST_MODE_2,
+     &result);
+
+ if (err == 0 &&
+ (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
  (result & ASUS_FAN_BOOST_MODES_MASK)) {
- asus->fan_boost_mode_available = true;
+ asus->fan_boost_mode_available = 2;
  asus->fan_boost_mode_mask = result & ASUS_FAN_BOOST_MODES_MASK;
  }

- return 0;
+ if (err == -ENODEV)
+ return 0;
+
+ return err;
 }

 static int fan_boost_mode_write(struct asus_wmi *asus)
@@ -1641,12 +1651,15 @@ static int fan_boost_mode_write(struct asus_wmi *asus)
  int err;
  u8 value;
  u32 retval;
+ u32 dev_id = asus->fan_boost_mode_available == 1 ?
+ ASUS_WMI_DEVID_FAN_BOOST_MODE :
+ ASUS_WMI_DEVID_FAN_BOOST_MODE_2;

  value = asus->fan_boost_mode;

  pr_info("Set fan boost mode: %u\n", value);
- err = asus_wmi_set_devstate(ASUS_WMI_DEVID_FAN_BOOST_MODE, value,
-     &retval);
+ err = asus_wmi_set_devstate(dev_id, value, &retval);
+
  if (err) {
  pr_warn("Failed to set fan boost mode: %d\n", err);
  return err;
@@ -2000,7 +2013,8 @@ static void asus_wmi_handle_event_code(int code,
struct asus_wmi *asus)
  return;
  }

- if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
+ if (asus->fan_boost_mode_available &&
+ (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_FBM_2) {
  fan_boost_mode_switch_next(asus);
  return;
  }
@@ -2177,7 +2191,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
  else if (attr == &dev_attr_als_enable.attr)
  devid = ASUS_WMI_DEVID_ALS_ENABLE;
  else if (attr == &dev_attr_fan_boost_mode.attr)
- ok = asus->fan_boost_mode_available;
+ ok = asus->fan_boost_mode_available != 0;

  if (devid != -1)
  ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
diff --git a/include/linux/platform_data/x86/asus-wmi.h
b/include/linux/platform_data/x86/asus-wmi.h
index 60249e2..714782b 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -58,6 +58,7 @@
 #define ASUS_WMI_DEVID_LIGHT_SENSOR 0x00050022 /* ?? */
 #define ASUS_WMI_DEVID_LIGHTBAR 0x00050025
 #define ASUS_WMI_DEVID_FAN_BOOST_MODE 0x00110018
+#define ASUS_WMI_DEVID_FAN_BOOST_MODE_2 0x00120075

 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA 0x00060013
-- 
1.8.3.1

From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 3/9] platform/x86: hp-wmi: Standardize enum usage for constants
Date: Wed, 19 Apr 2017 19:25:15 -0700
Message-ID: <cc3b1c2116f52fd13a2f9a64948d48bb380dc88a.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlo@caione.org
List-Id: platform-driver-x86.vger.kernel.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Use enums consistently throughout the hp-wmi driver for groups of
related constants. Use hex and align the assignment within groups. Move
the *QUERY constants into an enum, create a new enum defining the READ,
WRITE, and ODM constants and use them instead of 0 and 1 at the call
sites.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/hp-wmi.c | 119 +++++++++++++++++++++++-------------------
 1 file changed, 64 insertions(+), 55 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index aa9d99c..60d1e4c 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -48,41 +48,29 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
 
-#define HPWMI_DISPLAY_QUERY 0x1
-#define HPWMI_HDDTEMP_QUERY 0x2
-#define HPWMI_ALS_QUERY 0x3
-#define HPWMI_HARDWARE_QUERY 0x4
-#define HPWMI_WIRELESS_QUERY 0x5
-#define HPWMI_BIOS_QUERY 0x9
-#define HPWMI_FEATURE_QUERY 0xb
-#define HPWMI_HOTKEY_QUERY 0xc
-#define HPWMI_FEATURE2_QUERY 0xd
-#define HPWMI_WIRELESS2_QUERY 0x1b
-#define HPWMI_POSTCODEERROR_QUERY 0x2a
-
 enum hp_wmi_radio {
-	HPWMI_WIFI = 0,
-	HPWMI_BLUETOOTH = 1,
-	HPWMI_WWAN = 2,
-	HPWMI_GPS = 3,
+	HPWMI_WIFI	= 0x0,
+	HPWMI_BLUETOOTH	= 0x1,
+	HPWMI_WWAN	= 0x2,
+	HPWMI_GPS	= 0x3,
 };
 
 enum hp_wmi_event_ids {
-	HPWMI_DOCK_EVENT = 1,
-	HPWMI_PARK_HDD = 2,
-	HPWMI_SMART_ADAPTER = 3,
-	HPWMI_BEZEL_BUTTON = 4,
-	HPWMI_WIRELESS = 5,
-	HPWMI_CPU_BATTERY_THROTTLE = 6,
-	HPWMI_LOCK_SWITCH = 7,
-	HPWMI_LID_SWITCH = 8,
-	HPWMI_SCREEN_ROTATION = 9,
-	HPWMI_COOLSENSE_SYSTEM_MOBILE = 0x0A,
-	HPWMI_COOLSENSE_SYSTEM_HOT = 0x0B,
-	HPWMI_PROXIMITY_SENSOR = 0x0C,
-	HPWMI_BACKLIT_KB_BRIGHTNESS = 0x0D,
-	HPWMI_PEAKSHIFT_PERIOD = 0x0F,
-	HPWMI_BATTERY_CHARGE_PERIOD = 0x10,
+	HPWMI_DOCK_EVENT		= 0x01,
+	HPWMI_PARK_HDD			= 0x02,
+	HPWMI_SMART_ADAPTER		= 0x03,
+	HPWMI_BEZEL_BUTTON		= 0x04,
+	HPWMI_WIRELESS			= 0x05,
+	HPWMI_CPU_BATTERY_THROTTLE	= 0x06,
+	HPWMI_LOCK_SWITCH		= 0x07,
+	HPWMI_LID_SWITCH		= 0x08,
+	HPWMI_SCREEN_ROTATION		= 0x09,
+	HPWMI_COOLSENSE_SYSTEM_MOBILE	= 0x0A,
+	HPWMI_COOLSENSE_SYSTEM_HOT	= 0x0B,
+	HPWMI_PROXIMITY_SENSOR		= 0x0C,
+	HPWMI_BACKLIT_KB_BRIGHTNESS	= 0x0D,
+	HPWMI_PEAKSHIFT_PERIOD		= 0x0F,
+	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
 };
 
 struct bios_args {
@@ -93,6 +81,27 @@ struct bios_args {
 	u32 data;
 };
 
+enum hp_wmi_commandtype {
+	HPWMI_DISPLAY_QUERY		= 0x01,
+	HPWMI_HDDTEMP_QUERY		= 0x02,
+	HPWMI_ALS_QUERY			= 0x03,
+	HPWMI_HARDWARE_QUERY		= 0x04,
+	HPWMI_WIRELESS_QUERY		= 0x05,
+	HPWMI_BATTERY_QUERY		= 0x07,
+	HPWMI_BIOS_QUERY		= 0x09,
+	HPWMI_FEATURE_QUERY		= 0x0b,
+	HPWMI_HOTKEY_QUERY		= 0x0c,
+	HPWMI_FEATURE2_QUERY		= 0x0d,
+	HPWMI_WIRELESS2_QUERY		= 0x1b,
+	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
+};
+
+enum hp_wmi_command {
+	HPWMI_READ	= 0x00,
+	HPWMI_WRITE	= 0x01,
+	HPWMI_ODM	= 0x03,
+};
+
 #define BIOS_ARGS_INIT(write, ctype, size)				\
 	(struct bios_args)	{	.signature = 0x55434553,	\
 					.command = (write) ? 0x2 : 0x1,	\
@@ -177,8 +186,8 @@ static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
 /*
  * hp_wmi_perform_query
  *
- * query:	The commandtype -> What should be queried
- * write:	The command -> 0 read, 1 write, 3 ODM specific
+ * query:	The commandtype (enum hp_wmi_commandtype)
+ * write:	The command (enum hp_wmi_command)
  * buffer:	Buffer used as input and/or output
  * insize:	Size of input buffer
  * outsize:	Size of output buffer
@@ -189,10 +198,10 @@ static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
  *         -EINVAL if the output buffer size exceeds buffersize
  *
  * Note: The buffersize must at least be the maximum of the input and output
- *       size. E.g. Battery info query (0x7) is defined to have 1 byte input
+ *       size. E.g. Battery info query is defined to have 1 byte input
  *       and 128 byte output. The caller would do:
  *       buffer = kzalloc(128, GFP_KERNEL);
- *       ret = hp_wmi_perform_query(0x7, 0, buffer, 1, 128)
+ *       ret = hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ, buffer, 1, 128)
  */
 static int hp_wmi_perform_query(int query, int write, void *buffer,
 				int insize, int outsize)
@@ -246,7 +255,7 @@ static int hp_wmi_perform_query(int query, int write, void *buffer,
 static int hp_wmi_display_state(void)
 {
 	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_DISPLAY_QUERY, 0, &state,
+	int ret = hp_wmi_perform_query(HPWMI_DISPLAY_QUERY, HPWMI_READ, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -256,7 +265,7 @@ static int hp_wmi_display_state(void)
 static int hp_wmi_hddtemp_state(void)
 {
 	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, 0, &state,
+	int ret = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, HPWMI_READ, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -266,7 +275,7 @@ static int hp_wmi_hddtemp_state(void)
 static int hp_wmi_als_state(void)
 {
 	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, 0, &state,
+	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_READ, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -276,7 +285,7 @@ static int hp_wmi_als_state(void)
 static int hp_wmi_dock_state(void)
 {
 	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, 0, &state,
+	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
 				       sizeof(state), sizeof(state));
 
 	if (ret)
@@ -288,7 +297,7 @@ static int hp_wmi_dock_state(void)
 static int hp_wmi_tablet_state(void)
 {
 	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, 0, &state,
+	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -299,7 +308,7 @@ static int hp_wmi_tablet_state(void)
 static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, 0, &state,
+	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
 				       sizeof(state), sizeof(state));
 	if (!ret)
 		return 1;
@@ -310,7 +319,7 @@ static int __init hp_wmi_bios_2008_later(void)
 static int __init hp_wmi_bios_2009_later(void)
 {
 	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &state,
+	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
 				       sizeof(state), sizeof(state));
 	if (!ret)
 		return 1;
@@ -321,7 +330,7 @@ static int __init hp_wmi_bios_2009_later(void)
 static int __init hp_wmi_enable_hotkeys(void)
 {
 	int value = 0x6e;
-	int ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
+	int ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, HPWMI_WRITE, &value,
 				       sizeof(value), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -334,7 +343,7 @@ static int hp_wmi_set_block(void *data, bool blocked)
 	int query = BIT(r + 8) | ((!blocked) << r);
 	int ret;
 
-	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 1,
+	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE,
 				   &query, sizeof(query), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -350,7 +359,7 @@ static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
 	int mask = 0x200 << (r * 8);
 	int wireless = 0;
 
-	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0,
+	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ,
 			     &wireless, sizeof(wireless),
 			     sizeof(wireless));
 	/* TBD: Pass error */
@@ -366,7 +375,7 @@ static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
 	int mask = 0x800 << (r * 8);
 	int wireless = 0;
 
-	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0,
+	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ,
 			     &wireless, sizeof(wireless),
 			     sizeof(wireless));
 	/* TBD: Pass error */
@@ -382,7 +391,7 @@ static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
 	int rfkill_id = (int)(long)data;
 	char buffer[4] = { 0x01, 0x00, rfkill_id, !blocked };
 
-	if (hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, 1,
+	if (hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_WRITE,
 				   buffer, sizeof(buffer), 0))
 		return -EINVAL;
 	return 0;
@@ -397,7 +406,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	struct bios_rfkill2_state state;
 	int err, i;
 
-	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, 0, &state,
+	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
 				   0, sizeof(state));
 	if (err)
 		return err;
@@ -424,7 +433,7 @@ static int hp_wmi_rfkill2_refresh(void)
 static int hp_wmi_post_code_state(void)
 {
 	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, 0, &state,
+	int ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_READ, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -490,7 +499,7 @@ static ssize_t set_als(struct device *dev, struct device_attribute *attr,
 		       const char *buf, size_t count)
 {
 	u32 tmp = simple_strtoul(buf, NULL, 10);
-	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, 1, &tmp,
+	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
 				       sizeof(tmp), sizeof(tmp));
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -511,7 +520,7 @@ static ssize_t set_postcode(struct device *dev, struct device_attribute *attr,
 
 	/* Clear the POST error code. It is kept until until cleared. */
 	tmp = (u32) tmp2;
-	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, 1, &tmp,
+	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_WRITE, &tmp,
 				       sizeof(tmp), sizeof(tmp));
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -584,7 +593,7 @@ static void hp_wmi_notify(u32 value, void *context)
 	case HPWMI_SMART_ADAPTER:
 		break;
 	case HPWMI_BEZEL_BUTTON:
-		ret = hp_wmi_perform_query(HPWMI_HOTKEY_QUERY, 0,
+		ret = hp_wmi_perform_query(HPWMI_HOTKEY_QUERY, HPWMI_READ,
 					   &key_code,
 					   sizeof(key_code),
 					   sizeof(key_code));
@@ -719,12 +728,12 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
 {
 	int err, wireless = 0;
 
-	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0, &wireless,
+	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
 				   sizeof(wireless), sizeof(wireless));
 	if (err)
 		return err;
 
-	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 1, &wireless,
+	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE, &wireless,
 				   sizeof(wireless), 0);
 	if (err)
 		return err;
@@ -804,7 +813,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	struct bios_rfkill2_state state;
 	int err, i;
 
-	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, 0, &state,
+	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
 				   0, sizeof(state));
 	if (err)
 		return err;
-- 
2.9.3

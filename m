From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 15/19] sony-laptop: add the ALS interface via SNC
Date: Sat, 19 May 2012 22:35:58 +0900
Message-ID: <1337434562-12283-16-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47648 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758129Ab2ESNpQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:16 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>Javier Achirica <achirica@gmail.com>, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

SNC provides an interface to the ALS chip present on a number of recent
Vaio models.

[marco@absence.it: extend support to recent models, sysfs interface]

Signed-off-by: Javier Achirica <achirica@gmail.com>
Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  922 ++++++++++++++++++++++++++++++++++++
 1 file changed, 922 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 7f8de3f..4ffcc1f 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -186,6 +186,42 @@ static int sony_nc_rfkill_setup(struct acpi_device *device,
 static void sony_nc_rfkill_cleanup(void);
 static void sony_nc_rfkill_update(void);
 
+#define ALS_TABLE_SIZE	25
+
+struct als_device_ops {
+	int (*init)(const u8 defaults[]);
+	int (*exit)(void);
+	int (*event_handler)(void);
+	int (*set_power)(unsigned int);
+	int (*get_power)(unsigned int *);
+	int (*get_lux)(unsigned int *, unsigned int *);
+	int (*get_kelvin)(unsigned int *);
+};
+
+struct als_device {
+	int handle;
+	unsigned int power;
+	unsigned int managed;
+
+	unsigned int levels_num;
+	u8 *levels;
+	unsigned int defaults_num;
+	u8 *defaults;
+	u8 parameters[ALS_TABLE_SIZE];
+
+	/* common device operations */
+	const struct als_device_ops *ops;
+
+	/* basic ALS sys interface */
+	unsigned int attrs_num;
+	struct device_attribute attrs[7];
+};
+static struct als_device *als_handle;
+
+static int sony_nc_als_setup(struct platform_device *pd, unsigned int handle);
+static void sony_nc_als_cleanup(struct platform_device *pd);
+static void sony_nc_als_resume(void);
+
 /*********** Input Devices ***********/
 
 #define SONY_LAPTOP_BUF_SIZE	128
@@ -1235,6 +1271,31 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 			ev_type = 3;
 			break;
 
+		case 0x0143:
+			sony_call_snc_handle(handle, 0x2000, &result);
+			/* event reasons are inverted ? */
+			real_ev = (result & 0x03) == 1 ? 2 : 1;
+			dprintk("ALS event received (%s change)\n",
+					real_ev == 1 ?
+					"light" : "backlight");
+
+			ev_type = 4;
+			break;
+
+		case 0x012f:
+		case 0x0137:
+			sony_call_snc_handle(handle, 0x0800, &result);
+			real_ev = result & 0x03;
+			dprintk("ALS event received (%s change)\n",
+					real_ev == 1 ?
+					"light" : "backlight");
+			if (real_ev == 1 &&
+					als_handle->ops->event_handler)
+				als_handle->ops->event_handler();
+
+			ev_type = 4;
+			break;
+
 		default:
 			dprintk("Unknown event 0x%x for handle 0x%x\n",
 					event, handle);
@@ -1323,6 +1384,11 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up thermal profile function (%d)\n",
 						result);
 			break;
+		case 0x012f:
+			result = sony_nc_als_setup(pf_device, handle);
+			if (result)
+				pr_err("couldn't set up ALS (%d)\n", result);
+			break;
 		case 0x0131:
 			result = sony_nc_highspeed_charging_setup(pf_device);
 			if (result)
@@ -1349,6 +1415,9 @@ static void sony_nc_function_setup(struct acpi_device *device,
 			if (result)
 				pr_err("couldn't set up keyboard backlight function (%d)\n",
 						result);
+			result = sony_nc_als_setup(pf_device, handle);
+			if (result)
+				pr_err("couldn't set up ALS (%d)\n", result);
 			break;
 		default:
 			continue;
@@ -1390,6 +1459,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0122:
 			sony_nc_thermal_cleanup(pd);
 			break;
+		case 0x012f:
+			sony_nc_als_cleanup(pd);
+			break;
 		case 0x0131:
 			sony_nc_highspeed_charging_cleanup(pd);
 			break;
@@ -1404,6 +1476,7 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0137:
 		case 0x0143:
 			sony_nc_kbd_backlight_cleanup(pd);
+			sony_nc_als_cleanup(pd);
 			break;
 		default:
 			continue;
@@ -1444,9 +1517,13 @@ static void sony_nc_function_resume(void)
 		case 0x0135:
 			sony_nc_rfkill_update();
 			break;
+		case 0x012f:
+			sony_nc_als_resume();
+			break;
 		case 0x0137:
 		case 0x0143:
 			sony_nc_kbd_backlight_resume();
+			sony_nc_als_resume();
 			break;
 		default:
 			continue;
@@ -1667,6 +1744,851 @@ static int sony_nc_rfkill_setup(struct acpi_device *device,
 	return 0;
 }
 
+/* ALS */
+
+/* model specific ALS data and controls
+ * TAOS TSL256x device data
+ */
+#define LUX_SHIFT_BITS		16	/* for non-floating point math */
+/* scale 100000 multiplied fractional coefficients rounding the values */
+#define SCALE(u)	((((((u64) u) << LUX_SHIFT_BITS) / 10000) + 5) / 10)
+
+#define TSL256X_REG_CTRL	0x00
+#define TSL256X_REG_TIMING	0x01
+#define TSL256X_REG_TLOW	0x02
+#define TSL256X_REG_THIGH	0x04
+#define TSL256X_REG_INT		0x06
+#define TSL256X_REG_ID		0x0a
+#define TSL256X_REG_DATA0	0x0c
+#define TSL256X_REG_DATA1	0x0e
+
+#define TSL256X_POWER_ON	0x03
+#define TSL256X_POWER_OFF	0x00
+
+#define TSL256X_POWER_MASK	0x03
+#define TSL256X_INT_MASK	0x10
+
+struct tsl256x_coeff {
+	u32 ratio;
+	u32 ch0;
+	u32 ch1;
+	u32 ka;
+	s32 kb;
+};
+
+struct tsl256x_data {
+	unsigned int gaintime;
+	unsigned int periods;
+	u8 *defaults;
+	struct tsl256x_coeff const *coeff_table;
+};
+static struct tsl256x_data *tsl256x_handle;
+
+static const struct tsl256x_coeff tsl256x_coeff_fn[] = {
+	{
+		.ratio	= SCALE(12500),	/* 0.125 * 2^LUX_SHIFT_BITS  */
+		.ch0	= SCALE(3040),	/* 0.0304 * 2^LUX_SHIFT_BITS */
+		.ch1	= SCALE(2720),	/* 0.0272 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(313550000),
+		.kb	= -10651,
+	}, {
+		.ratio	= SCALE(25000),	/* 0.250 * 2^LUX_SHIFT_BITS  */
+		.ch0	= SCALE(3250),	/* 0.0325 * 2^LUX_SHIFT_BITS */
+		.ch1	= SCALE(4400),	/* 0.0440 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(203390000),
+		.kb	= -2341,
+	}, {
+		.ratio	= SCALE(37500),	/* 0.375 * 2^LUX_SHIFT_BITS  */
+		.ch0	= SCALE(3510),	/* 0.0351 * 2^LUX_SHIFT_BITS */
+		.ch1	= SCALE(5440),	/* 0.0544 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(152180000),
+		.kb	= 157,
+	}, {
+		.ratio	= SCALE(50000),	/* 0.50 * 2^LUX_SHIFT_BITS   */
+		.ch0	= SCALE(3810),	/* 0.0381 * 2^LUX_SHIFT_BITS */
+		.ch1	= SCALE(6240),	/* 0.0624 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(163580000),
+		.kb	= -145,
+	}, {
+		.ratio	= SCALE(61000),	/* 0.61 * 2^LUX_SHIFT_BITS   */
+		.ch0	= SCALE(2240),	/* 0.0224 * 2^LUX_SHIFT_BITS */
+		.ch1	= SCALE(3100),	/* 0.0310 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(180800000),
+		.kb	= -495,
+	}, {
+		.ratio	= SCALE(80000),	/* 0.80 * 2^LUX_SHIFT_BITS   */
+		.ch0	= SCALE(1280),	/* 0.0128 * 2^LUX_SHIFT_BITS */
+		.ch1	= SCALE(1530),	/* 0.0153 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(197340000),
+		.kb	= -765
+	}, {
+		.ratio	= SCALE(130000),/* 1.3 * 2^LUX_SHIFT_BITS     */
+		.ch0	= SCALE(146),	/* 0.00146 * 2^LUX_SHIFT_BITS */
+		.ch1	= SCALE(112),	/* 0.00112 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(182900000),
+		.kb	= -608,
+	}, {
+		.ratio	= UINT_MAX,	/* for higher ratios */
+		.ch0	= 0,
+		.ch1	= 0,
+		.ka	= 0,
+		.kb	= 830,
+	}
+};
+
+static const struct tsl256x_coeff tsl256x_coeff_cs[] = {
+	{
+		.ratio  = SCALE(13000),	/* 0.130 * 2^LUX_SHIFT_BITS  */
+		.ch0    = SCALE(3150),	/* 0.0315 * 2^LUX_SHIFT_BITS */
+		.ch1    = SCALE(2620),	/* 0.0262 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(300370000),
+		.kb	= -9587,
+	}, {
+		.ratio  = SCALE(26000),	/* 0.260 * 2^LUX_SHIFT_BITS  */
+		.ch0    = SCALE(3370),	/* 0.0337 * 2^LUX_SHIFT_BITS */
+		.ch1    = SCALE(4300),	/* 0.0430 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(194270000),
+		.kb	= -1824,
+	}, {
+		.ratio  = SCALE(39000),	/* 0.390 * 2^LUX_SHIFT_BITS  */
+		.ch0    = SCALE(3630),	/* 0.0363 * 2^LUX_SHIFT_BITS */
+		.ch1    = SCALE(5290),	/* 0.0529 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(152520000),
+		.kb	= 145,
+	}, {
+		.ratio  = SCALE(52000),	/* 0.520 * 2^LUX_SHIFT_BITS  */
+		.ch0    = SCALE(3920),	/* 0.0392 * 2^LUX_SHIFT_BITS */
+		.ch1    = SCALE(6050),	/* 0.0605 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(165960000),
+		.kb	= -200,
+	}, {
+		.ratio  = SCALE(65000),	/* 0.650 * 2^LUX_SHIFT_BITS  */
+		.ch0    = SCALE(2290),	/* 0.0229 * 2^LUX_SHIFT_BITS */
+		.ch1    = SCALE(2910),	/* 0.0291 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(184800000),
+		.kb	= -566,
+	}, {
+		.ratio  = SCALE(80000),	/* 0.800 * 2^LUX_SHIFT_BITS  */
+		.ch0    = SCALE(1570),	/* 0.0157 * 2^LUX_SHIFT_BITS */
+		.ch1    = SCALE(1800),	/* 0.0180 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(199220000),
+		.kb	= -791,
+	}, {
+		.ratio  = SCALE(130000),/* 0.130 * 2^LUX_SHIFT_BITS  */
+		.ch0    = SCALE(338),	/* 0.00338 * 2^LUX_SHIFT_BITS */
+		.ch1    = SCALE(260),	/* 0.00260 * 2^LUX_SHIFT_BITS */
+		.ka	= SCALE(182900000),
+		.kb	= -608,
+	}, {
+		.ratio  = UINT_MAX,	/* for higher ratios */
+		.ch0    = 0,
+		.ch1    = 0,
+		.ka	= 0,
+		.kb	= 830,
+	}
+};
+
+/* TAOS helper & control functions */
+static inline int tsl256x_exec_writebyte(unsigned int reg,
+						unsigned int const *value)
+{
+	unsigned int result;
+
+	return (sony_call_snc_handle(als_handle->handle, (*value << 0x18) |
+		(reg << 0x10) | 0x800500, &result) || !(result & 0x01))
+		? -EIO : 0;
+}
+
+static inline int tsl256x_exec_writeword(unsigned int reg,
+						unsigned int const *value)
+{
+	u8 result[1];
+	int offset = sony_find_snc_handle(als_handle->handle);
+	u64 arg = (*value << 0x18) | (reg << 0x10) | 0xA00700 | offset;
+
+	/* using sony_call_snc_handle_buffer due to possible input overflows */
+	if (sony_nc_buffer_call(sony_nc_acpi_handle, "SN06", &arg,
+				result, 1) < 0)
+		return -EIO;
+
+	return result[0] & 0x01;
+}
+
+static inline int tsl256x_exec_readbyte(unsigned int reg, unsigned int *result)
+{
+	int arg = (reg << 0x10) | 0x800400;
+
+	if (sony_call_snc_handle(als_handle->handle, arg, result) < 0)
+		return -EIO;
+
+	if (!(*result & 0x01))
+		return -EINVAL;
+
+	*result = (*result >> 0x08) & 0xFF;
+
+	return 0;
+}
+
+static inline int tsl256x_exec_readword(unsigned int reg, unsigned int *result)
+{
+	int arg = (reg << 0x10) | 0xA00600;
+
+	if (sony_call_snc_handle(als_handle->handle, arg, result) < 0)
+		return -EIO;
+
+	if (!(*result & 0x01))
+		return -EINVAL;
+
+	*result = (*result >> 0x08) & 0xFFFF;
+
+	return 0;
+}
+
+static int tsl256x_interrupt_ctrls(unsigned int *interrupt,
+					unsigned int *periods)
+{
+	unsigned int value, result;
+
+	/* if no interrupt parameter, retrieve interrupt status */
+	if (!interrupt) {
+		if (tsl256x_exec_readbyte(TSL256X_REG_INT, &result))
+			return -EIO;
+
+		value = (result & TSL256X_INT_MASK);
+	} else {
+		value = *interrupt << 0x04;
+	}
+
+	/* if no periods provided use the last one set */
+	value |= (periods ? *periods : tsl256x_handle->periods);
+
+	if (tsl256x_exec_writebyte(TSL256X_REG_INT, &value))
+		return -EIO;
+
+	if (periods)
+		tsl256x_handle->periods = *periods;
+
+	return 0;
+}
+
+static int tsl256x_setup(void)
+{
+	unsigned int interr = 1, zero = 0;
+
+	/*
+	 *   reset the threshold settings to trigger an event as soon
+	 *   as the event goes on, forcing a backlight adaptation to
+	 *   the current lighting conditions
+	 */
+	tsl256x_exec_writeword(TSL256X_REG_TLOW, &zero);
+	tsl256x_exec_writeword(TSL256X_REG_THIGH, &zero);
+
+	/* set gain and time */
+	if (tsl256x_exec_writebyte(TSL256X_REG_TIMING,
+				&tsl256x_handle->gaintime))
+		return -EIO;
+
+	/* restore persistence value and enable the interrupt generation */
+	if (tsl256x_interrupt_ctrls(&interr, &tsl256x_handle->periods))
+		return -EIO;
+
+	return 0;
+}
+
+static int tsl256x_set_power(unsigned int status)
+{
+	int ret;
+
+	if (status) {
+		ret = tsl256x_setup();
+		if (ret)
+			return ret;
+	}
+
+	status = status ? TSL256X_POWER_ON : TSL256X_POWER_OFF;
+	ret = tsl256x_exec_writebyte(TSL256X_REG_CTRL, &status);
+
+	return ret;
+}
+
+static int tsl256x_get_power(unsigned int *status)
+{
+	if (tsl256x_exec_readbyte(TSL256X_REG_CTRL, status))
+		return -EIO;
+
+	*status = ((*status & TSL256X_POWER_MASK) == TSL256X_POWER_ON) ? 1 : 0;
+
+	return 0;
+}
+
+static int tsl256x_get_raw_data(unsigned int *ch0, unsigned int *ch1)
+{
+	if (!ch0)
+		return -1;
+
+	if (tsl256x_exec_readword(TSL256X_REG_DATA0, ch0))
+		return -EIO;
+
+	if (ch1) {
+		if (tsl256x_exec_readword(TSL256X_REG_DATA1, ch1))
+			return -EIO;
+	}
+
+	return 0;
+}
+
+static int tsl256x_set_thresholds(const unsigned int *ch0)
+{
+	unsigned int tlow, thigh;
+
+	tlow = (*ch0 * tsl256x_handle->defaults[0]) / 100;
+	thigh = ((*ch0 * tsl256x_handle->defaults[1]) / 100) + 1;
+
+	if (thigh > 0xffff)
+		thigh = 0xffff;
+
+	if (tsl256x_exec_writeword(TSL256X_REG_TLOW, &tlow) ||
+		tsl256x_exec_writeword(TSL256X_REG_THIGH, &thigh))
+		return -EIO;
+
+	return 0;
+}
+
+#define MAX_LUX 1500
+static void tsl256x_calculate_lux(const u32 ch0, const u32 ch1,
+				unsigned int *integ, unsigned int *fract)
+{
+	/* the raw output from the sensor is just a "count" value, as it is the
+	 * result of the integration of the analog sensor signal, the
+	 * counts-to-lux curve (and its approximation can be found on the
+	 * datasheet.
+	 */
+	const struct tsl256x_coeff *coeff = tsl256x_handle->coeff_table;
+	u32 ratio, temp, integer, fractional;
+
+	if (ch0 >= 65535 || ch1 >= 65535)
+		goto saturation;
+
+	/* STEP 1: ratio calculation, for ch0 & ch1 coeff selection */
+
+	/* protect against division by 0 */
+	ratio = ch0 ? ((ch1 << (LUX_SHIFT_BITS + 1)) / ch0) : UINT_MAX;
+	/* round the ratio value */
+	ratio = (ratio + 1) >> 1;
+
+	/* coeff selection rule */
+	while (coeff->ratio < ratio)
+		coeff++;
+
+	/* STEP 2: lux calculation formula using the right coeffcients */
+	temp = (ch0 * coeff->ch0) - (ch1 * coeff->ch1);
+	/* the sensor is placed under a plastic or glass cover which filters
+	   a certain ammount of light (depending on that particular material).
+	   To have an accurate reading, we need to compensate for this loss,
+	   multiplying for compensation parameter, taken from the DSDT.
+	*/
+	temp *= tsl256x_handle->defaults[3] / 10;
+
+	/* STEP 3: separate integer and fractional part */
+	/* remove the integer part and multiply for the 10^N, N decimals  */
+	fractional = (temp % (1 << LUX_SHIFT_BITS)) * 100; /* two decimals */
+	/* scale down the value */
+	fractional >>= LUX_SHIFT_BITS;
+
+	/* strip off fractional portion to obtain the integer part */
+	integer = temp >> LUX_SHIFT_BITS;
+
+	if (integer > MAX_LUX)
+		goto saturation;
+
+	*integ = integer;
+	*fract = fractional;
+
+	return;
+
+saturation:
+	*integ = MAX_LUX;
+	*fract = 0;
+}
+
+static void tsl256x_calculate_kelvin(const u32 *ch0, const u32 *ch1,
+					unsigned int *temperature)
+{
+	const struct tsl256x_coeff *coeff = tsl256x_handle->coeff_table;
+	u32 ratio;
+
+	/* protect against division by 0 */
+	ratio = *ch0 ? ((*ch1 << (LUX_SHIFT_BITS + 1)) / *ch0) : UINT_MAX;
+	/* round the ratio value */
+	ratio = (ratio + 1) >> 1;
+
+	/* coeff selection rule */
+	while (coeff->ratio < ratio)
+		coeff++;
+
+	*temperature = ratio ? coeff->ka / ratio + coeff->kb : 0;
+}
+
+static int tsl256x_get_lux(unsigned int *integ, unsigned int *fract)
+{
+	int ret = 0;
+	unsigned int ch0, ch1;
+
+	if (!integ || !fract)
+		return -1;
+
+	ret = tsl256x_get_raw_data(&ch0, &ch1);
+	if (!ret)
+		tsl256x_calculate_lux(ch0, ch1, integ, fract);
+
+	return ret;
+}
+
+static int tsl256x_get_kelvin(unsigned int *temperature)
+{
+	int ret = -1;
+	unsigned int ch0, ch1;
+
+	if (!temperature)
+		return ret;
+
+	ret = tsl256x_get_raw_data(&ch0, &ch1);
+	if (!ret)
+		tsl256x_calculate_kelvin(&ch0, &ch1, temperature);
+
+	return ret;
+}
+
+static int tsl256x_get_id(char *model, unsigned int *id, bool *cs)
+{
+	int ret;
+	unsigned int result;
+	char *name = NULL;
+	bool unknown = false;
+	bool type_cs = false;
+
+	ret = tsl256x_exec_readbyte(TSL256X_REG_ID, &result);
+	if (ret)
+		return ret;
+
+	switch ((result >> 0x04) & 0x0F) {
+	case 11:
+		name = "TAOS TSL2569";
+		break;
+	case 5:
+		name = "TAOS TSL2561";
+		break;
+	case 3:
+		name = "TAOS TSL2563";
+		break;
+	case 0:
+		type_cs = true;
+		name = "TAOS TSL2560CS";
+		break;
+	default:
+		unknown = true;
+		break;
+	}
+
+	if (id)
+		*id = result;
+	if (cs)
+		*cs = type_cs;
+	if (model && name)
+		strcpy(model, name);
+
+	return unknown;
+}
+
+static int tsl256x_event_handler(void)
+{
+	unsigned int ch0, interr = 1;
+
+	/* clear the notification */
+	sony_call_snc_handle(als_handle->handle, 0x04C60500, &interr);
+
+	/* read the raw data */
+	tsl256x_get_raw_data(&ch0, NULL);
+
+	/* set the thresholds */
+	tsl256x_set_thresholds(&ch0);
+
+	/* enable interrupt */
+	tsl256x_interrupt_ctrls(&interr, NULL);
+
+	return 0;
+}
+
+static int tsl256x_init(const u8 defaults[])
+{
+	unsigned int id = 0;
+	int ret = 0;
+	bool cs = false; /* if CS package choose CS coefficients */
+	char model[64];
+
+	/* detect the device */
+	ret = tsl256x_get_id(model, &id, &cs);
+	if (ret < 0)
+		return ret;
+	if (ret) {
+		dprintk("unsupported ALS model %u rev%u\n", id >> 4, id & 0x0F);
+		return ret;
+	} else {
+		dprintk("ALS model %u rev%u (%s)\n", id >> 4, id & 0x0F, model);
+	}
+
+	tsl256x_handle = kzalloc(sizeof(struct tsl256x_data), GFP_KERNEL);
+	if (!tsl256x_handle)
+		return -ENOMEM;
+
+	tsl256x_handle->defaults = kzalloc(sizeof(u8) * 4, GFP_KERNEL);
+	if (!tsl256x_handle->defaults) {
+		kfree(tsl256x_handle);
+		return -ENOMEM;
+	}
+
+	/* populate the device data */
+	tsl256x_handle->defaults[0] = defaults[3];  /* low threshold % */
+	tsl256x_handle->defaults[1] = defaults[4];  /* high threshold % */
+	tsl256x_handle->defaults[2] = defaults[9];  /* sensor interrupt rate */
+	tsl256x_handle->defaults[3] = defaults[10]; /* light compensat. rate */
+	tsl256x_handle->gaintime = 0x12;
+	tsl256x_handle->periods = defaults[9];
+	tsl256x_handle->coeff_table = cs ? tsl256x_coeff_cs : tsl256x_coeff_fn;
+
+	ret = tsl256x_setup();
+
+	return ret;
+}
+
+static int tsl256x_exit(void)
+{
+	unsigned int interr = 0, periods = tsl256x_handle->defaults[2];
+
+	/* disable the interrupt generation, restore defaults */
+	tsl256x_interrupt_ctrls(&interr, &periods);
+
+	tsl256x_handle->coeff_table = NULL;
+	kfree(tsl256x_handle->defaults);
+	tsl256x_handle->defaults = NULL;
+	kfree(tsl256x_handle);
+
+	return 0;
+}
+
+/* TAOS TSL256x specific ops */
+static const struct als_device_ops tsl256x_ops = {
+	.init = tsl256x_init,
+	.exit = tsl256x_exit,
+	.event_handler = tsl256x_event_handler,
+	.set_power = tsl256x_set_power,
+	.get_power = tsl256x_get_power,
+	.get_lux = tsl256x_get_lux,
+	.get_kelvin = tsl256x_get_kelvin,
+};
+
+/* unknown ALS sensors controlled by the EC present on newer Vaios */
+static inline int ngals_get_raw_data(unsigned int *data)
+{
+	if (sony_call_snc_handle(als_handle->handle, 0x1000, data))
+		return -EIO;
+
+	return 0;
+}
+
+static int ngals_get_lux(unsigned int *integ, unsigned int *fract)
+{
+	unsigned int data;
+
+	if (sony_call_snc_handle(als_handle->handle, 0x1000, &data))
+		return -EIO;
+
+	/* if we have a valid lux data */
+	if (!!(data & 0xff0000) == 0x01) {
+		*integ = 0xffff & data;
+		*fract = 0;
+	} else {
+		return -1;
+	}
+
+	return 0;
+}
+
+static const struct als_device_ops ngals_ops = {
+	.init = NULL,
+	.exit = NULL,
+	.event_handler = NULL,
+	.set_power = NULL,
+	.get_power = NULL,
+	.get_lux = ngals_get_lux,
+	.get_kelvin = NULL,
+};
+
+static int __sony_nc_als_power_set(unsigned int status)
+{
+	unsigned int cmd, result;
+
+	if (als_handle->ops->set_power) {
+		if (als_handle->ops->set_power(status))
+			return -EIO;
+		else
+			als_handle->power = status;
+	}
+
+
+	/*  turn on/off the event notification */
+	cmd = als_handle->handle == 0x0143 ? 0x2200 : 0x0900;
+	if (sony_call_snc_handle(als_handle->handle,
+				(status << 0x10) | cmd, &result))
+		return -EIO;
+
+	return 0;
+}
+
+/* ALS sys interface */
+static ssize_t sony_nc_als_power_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	int status;
+
+	if (!als_handle->ops->get_power)
+		status = 1;
+	/* TODO: can't use the cached value instead? */
+	else if (als_handle->ops->get_power(&status))
+		return -EIO;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", status);
+
+	return count;
+}
+
+static ssize_t sony_nc_als_power_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	int ret;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+
+	if (kstrtoul(buffer, 10, &value) || value > 1)
+		return -EINVAL;
+
+	/* no action if already set */
+	if (value == als_handle->power)
+		return count;
+
+	ret = __sony_nc_als_power_set(value);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t sony_nc_als_lux_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int integ = 0, fract = 0;
+
+	if (als_handle->power)
+		/* als_handle->ops->get_lux is mandatory, no check */
+		als_handle->ops->get_lux(&integ, &fract);
+
+	count = snprintf(buffer, PAGE_SIZE, "%u.%.2u\n", integ, fract);
+
+	return count;
+}
+
+static ssize_t sony_nc_als_parameters_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int i, num;
+	u8 *list;
+
+	if (!strcmp(attr->attr.name, "als_defaults")) {
+		list = als_handle->defaults;
+		num = als_handle->defaults_num;
+	} else {
+		/* als_backlight_levels */
+		list = als_handle->levels;
+		num = als_handle->levels_num;
+	}
+
+	for (i = 0; i < num; i++)
+		count += snprintf(buffer + count, PAGE_SIZE - count,
+				"0x%.2x ", list[i]);
+
+	count += snprintf(buffer + count, PAGE_SIZE - count, "\n");
+
+	return count;
+}
+
+static ssize_t sony_nc_als_kelvin_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int kelvin = 0;
+
+	if (als_handle->ops->get_kelvin && als_handle->power)
+		als_handle->ops->get_kelvin(&kelvin);
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", kelvin);
+
+	return count;
+}
+
+
+/* ALS attach/detach functions */
+static int sony_nc_als_setup(struct platform_device *pd, unsigned int handle)
+{
+	unsigned int result;
+	int i = 0;
+	u64 arg;
+
+	/* check the device presence */
+	if (handle == 0x0137) {
+		if (sony_call_snc_handle(als_handle->handle, 0xB00, &result))
+			return -EIO;
+
+		if (!(result & 0x01))
+			/* no ALS controls */
+			return 0;
+	}
+
+	als_handle = kzalloc(sizeof(struct als_device), GFP_KERNEL);
+	if (!als_handle)
+		return -ENOMEM;
+
+	als_handle->handle = handle;
+
+	/* set model specific data
+	 * if handle 0x012f or 0x0137 use tsl256x_ops, else new als controls
+	 */
+	if (handle == 0x0143) {
+		als_handle->ops = &ngals_ops;
+		als_handle->levels_num = 16;
+		als_handle->defaults_num = 9;
+	} else {
+		als_handle->ops = &tsl256x_ops;
+		als_handle->levels_num = 9;
+		als_handle->defaults_num = 13;
+	}
+	/* backlight levels are the first levels_num values, the remaining
+	 * defaults_num values are default settings for als regulation
+	 */
+	als_handle->levels = als_handle->parameters;
+	als_handle->defaults = als_handle->parameters + als_handle->levels_num;
+
+	/* get power state */
+	if (als_handle->ops->get_power) {
+		if (als_handle->ops->get_power(&als_handle->power))
+			pr_warn("unable to retrieve the power status\n");
+	}
+
+	/* get ALS parameters */
+	arg = sony_find_snc_handle(handle);
+	if (sony_nc_buffer_call(sony_nc_acpi_handle, "SN06", &arg,
+		als_handle->parameters, ALS_TABLE_SIZE) < 0)
+		goto nosensor;
+
+	/* initial device configuration */
+	if (als_handle->ops->init) {
+		result = als_handle->ops->init(als_handle->defaults);
+		if (result)
+			goto nosensor;
+	}
+
+	/* set up the sys interface */
+
+	/* lux equivalent value */
+	sysfs_attr_init(&als_handle->attrs[0].attr);
+	als_handle->attrs[0].attr.name = "als_lux";
+	als_handle->attrs[0].attr.mode = S_IRUGO;
+	als_handle->attrs[0].show = sony_nc_als_lux_show;
+	als_handle->attrs_num++;
+
+	/* ALS default parameters */
+	sysfs_attr_init(&als_handle->attrs[1].attr);
+	als_handle->attrs[1].attr.name = "als_defaults";
+	als_handle->attrs[1].attr.mode = S_IRUGO;
+	als_handle->attrs[1].show = sony_nc_als_parameters_show;
+	als_handle->attrs_num++;
+
+	if (als_handle->ops->get_power || als_handle->ops->set_power) {
+		/* als power control */
+		sysfs_attr_init(&als_handle->attrs[als_handle->attrs_num].attr);
+		als_handle->attrs[als_handle->attrs_num].attr.name =
+			"als_power";
+		als_handle->attrs[als_handle->attrs_num].attr.mode =
+			S_IRUGO | S_IWUSR;
+		als_handle->attrs[als_handle->attrs_num].show =
+			sony_nc_als_power_show;
+		als_handle->attrs[als_handle->attrs_num].store =
+			sony_nc_als_power_store;
+		als_handle->attrs_num++;
+	}
+
+	if (als_handle->ops->get_kelvin) {
+		/* light temperature */
+		sysfs_attr_init(&als_handle->attrs[als_handle->attrs_num].attr);
+		als_handle->attrs[als_handle->attrs_num].attr.name =
+			"als_kelvin";
+		als_handle->attrs[als_handle->attrs_num].attr.mode = S_IRUGO;
+		als_handle->attrs[als_handle->attrs_num].show =
+			sony_nc_als_kelvin_show;
+		als_handle->attrs_num++;
+	}
+
+	for (; i < als_handle->attrs_num; i++) {
+		result = device_create_file(&pd->dev, &als_handle->attrs[i]);
+		if (result)
+			goto attrserror;
+	}
+
+	return 0;
+
+attrserror:
+	for (; i > 0; i--)
+		device_remove_file(&pd->dev, &als_handle->attrs[i]);
+nosensor:
+	kfree(als_handle);
+	als_handle = NULL;
+
+	return result;
+}
+
+static void sony_nc_als_resume(void)
+{
+	if (als_handle->power)
+		__sony_nc_als_power_set(1);
+}
+
+static void sony_nc_als_cleanup(struct platform_device *pd)
+{
+	if (als_handle) {
+		int i;
+
+		for (i = 0; i < als_handle->attrs_num; i++)
+			device_remove_file(&pd->dev, &als_handle->attrs[i]);
+
+		if (als_handle->power)
+			if (__sony_nc_als_power_set(0))
+				pr_info("ALS power off failed\n");
+
+		if (als_handle->ops->exit)
+			if (als_handle->ops->exit())
+				pr_info("ALS device clean-up failed\n");
+
+		kfree(als_handle);
+		als_handle = NULL;
+	}
+}
+/* end ALS code */
+
 /* Keyboard backlight feature */
 struct kbd_backlight {
 	unsigned int handle;
-- 
1.7.10

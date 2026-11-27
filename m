Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.165.43.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765534;
	b=Vf8dXtKjpjDEEiPlnZFzpmmiszQ29ZYwYY2mE8/rKjldySYHFv27FkZKX6G0Wzxbk583
	 ISbtkkEdc7IgKdLDY8fTxIE+hooaJjMaUFfJUeovbVQOYWXSMQXU9G6DJk2Yst8s4kkCE
	 TUkJils6fJvplHYqlfJ5uJzhYZMcyhqi01RUEQxCq5jniDQhVSC0v1UeAljKJim4bh48y
	 mISOCoemROQ1CqVq1tx9jzZeOjt1At/NyGW4ufkX0I2I2YfLx721iBf24obCcxxyPSfQ+
	 MKq8n1dX79WZXOVzkH8GrKsPYioyqqhHBIC6FRh2lniQwXBer19VIw8WbiAJkn2nJpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765534;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=z9vJoDrmi4VvPz/fdIYst5MH9N34CWVA51+Tn9NBe24=;
	b=MuInL8RlBxHBWgSQhiw5uOQEpCkWln0eVntsVAs3x4MSuK+oU+QGdcnCcoquQS1LID0v
	 danL3avvgiFnbH2VWOBM/KP7LI+gcJNujHNFaHJ3hSC0DXL/T6PWhWoc/kxzt4qWAk1Pp
	 XwIISk+3nyjYd6FlNoIRpAummT58Vd7l0M+Spj3nzooec5iM5qh2aUwzktSQNJrLHCxhl
	 UowzdI9MHpkTDfjPOVJvwnY0BW+pB6Pg+9XOXBEYtfBO4pGAAXv9/pvIz/Pb+/Pdx6Aqt
	 /0OCYliUrw0E7B8wc9pH84ApNY1O+a3zcfdYVAFA9nVo9hvrXo+CwjIxZFBzfXLHVIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=GFth3eKQ;
	arc=none smtp.remote-ip=188.165.43.98
Received: from 14.mo561.mail-out.ovh.net (14.mo561.mail-out.ovh.net [188.165.43.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6F8606A338
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 07:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6F8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=GFth3eKQ
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.54.182])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4jbQSP5tFsz5yGT
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 07:45:25 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-dkqtv (unknown [10.111.182.117])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 391E481F60;
	Fri, 27 Nov 2026 07:45:25 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
	by ghost-submission-7ccd8bbbb6-dkqtv with ESMTPSA
	id +aujBBI1CWsizRQAjZbTUQ:T4
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 07:45:25 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S00232aad674-6475-467b-86ac-5f9238b4053e,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v3 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Date: Fri, 27 Nov 2026 08:45:18 +0100
Message-ID: <20261127074518.3244152-4-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127074518.3244152-1-filip.golas@3mdeb.com>
References: <20261127074518.3244152-1-filip.golas@3mdeb.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 3824963461177339887
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE3aoIt9ZbT9+ThQKh2A4MdYGWex/GSt+Rp12USAIE6G6DBzatBv/M83d6W/OnIX3mxwK72pSip8x3QuWgUHV5qjHbrkRpWVdUV9qoAgZ8a2eejD/lenMXheNlZBCKi6Fy2fWj9kj5YpyHMYRXt8w1/BqJsUAbeV+nxVlWISB+Z/XYm3TT2RuKqVRippYrLodcFhtWj0oj/1Z0K3J8lTZVP/WKvi+epIyqr6HIWNUEWfGoC+ApCytv2L+OtVFIC3Pe7Ywqaxa7IrM7oDik89E60RJM3HqWG4jJWani2BYbirfA1XKS/HMYp+GzdAy7pTmoqOjJeSiULBJk710UwRLPITDRNodBOXnI46NBTmQlCV91fZpHsuFvuVcLqkIFPDmxPgULx5oxfVPoWLH7A0cOvO3yZ/9NxcT37WS7+hQp/tNGDcm6JJl8sbEgp8OZtr9rRn6fOTuweWcRa/r7UuD6qy0zv+YoF6LG2cyFC3tyGaOU3ZvPPMmoBQzy2ad/QBz2vOsBMjR3S+Cq6iuISbRqnl9DOdagwpijTCXUyWH1TGu4z8ye99e+owx7DSa3I2+NcUfYyETIweXqwQITsq5CxkIoalWSnvKcAHhZhJX80GfV7fh0uTamT1ztKA5/u2jNLDxnEjvadyxDbtnfal3I2t/WvadtU5tcaJMxxwFdnkQ
DKIM-Signature: a=rsa-sha256; bh=z9vJoDrmi4VvPz/fdIYst5MH9N34CWVA51+Tn9NBe24=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795765525; v=1;
 b=GFth3eKQjthlN3AvkVe7d9u8/H7cdSjF1TceER9FnP2NFDTD1b614f3WK/epVecNNt3/casi
 c5JzeI3uSAKKoEdc/+qD3XM/jgSjdmPX4vDXVfS89zWP/LUb3nbYwkLZbj4tKeVFihhpbEEGQ01
 0fflVSdLV3vM9Za+XmPkBHMalmf7cSndlz31lEomYIZJF4LHsQoNi3OmQo5pxcnj2qPDqSzgHTg
 4Wapi7KALR+HqEtPnbfR0czdzuM75ZUm/aiTF4t33x/WRNJsvBC8qhUXTJlGLGlBPqnPrR2R4L6
 bYGjWY3T//FgJsZU8w7YDRfFjOhFgdOygLW00QlwMlWxA==

Expose the four-point fan curve run by the EC as pwmN_auto_pointM_temp
and pwmN_auto_pointM_pwm, so that userspace can read and change it.
The EC validates the curve on every write and keeps running the
previous one if the new curve is invalid.

On shutdown, ask the firmware to store the current curve, so that it is
restored on the next boot.

Fan curve control is only exposed for fans on which the firmware reports
support for it.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
Changes in v2:
- Make the curve point attributes static, so DASHARO_POINT_ATTRS()
  does not define 16 global symbols.
- Reject negative fan curve temperatures before converting them to
  degrees, which can round to positive.
- Use DIV_ROUND_CLOSEST_ULL() for showing curve PWM instead of
  DIV_ROUND_CLOSEST(), so it links on 32-bit x86.
- Setting a curve point stages it, applying it is a separate ACPI call.
  Add a mutex to prevent staging more changes before the first set is
  applied.
- Use dasharo_fan_channel to find correct channel for DASHARO_FEATURE_FAN_POINTS.
- SFCS now takes no arguments and saves all fans. The Dasharo dev
  build previously was accepting and ignoring the argument.

Changes in v3:
- Fix inconsistent use of parentheses in DASHARO_POINT_ATTRS macro
- Create curve point attributes for all 24 PWM channels
- Use DIV_ROUND_CLOSEST for temperature unit conversion
- Use hwmon_lock instead of a private mutex
---
 drivers/platform/x86/dasharo-acpi.c | 208 +++++++++++++++++++++++++++-
 1 file changed, 207 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 85f88b11fcf9..c0b65f5e4146 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -6,6 +6,8 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
@@ -407,6 +409,197 @@ static const struct hwmon_chip_info dasharo_hwmon_chip_info = {
 	.info = dasharo_hwmon_info,
 };
 
+static int dasharo_curve_point_call(struct dasharo_data *data, int pwm_channel, const char *method,
+				    const u64 *args, unsigned int n_args, u64 *ret)
+{
+	int channel = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_POINTS, pwm_channel);
+
+	if (channel < 0)
+		return channel;
+
+	return dasharo_call(data, method, DASHARO_FEATURE_FAN_POINTS, channel, args, n_args, ret);
+}
+
+static int dasharo_curve_point_store(struct dasharo_data *data, int channel, const char *method,
+				     unsigned int point, u64 value)
+{
+	u64 args[2] = { point, value };
+	u64 ret;
+	int err;
+
+	// set of temp/duty
+	err = dasharo_curve_point_call(data, channel, method, args, 2, &ret);
+	if (err)
+		return err;
+	if (ret)
+		return -EPERM;
+
+	// commit
+	err = dasharo_curve_point_call(data, channel, "CFCV", NULL, 0, &ret);
+	if (err)
+		return err;
+
+	// The EC rejected the curve
+	return ret ? -EINVAL : 0;
+}
+
+static ssize_t curve_point_temp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	u64 point = sattr->index;
+	u64 val;
+	int err;
+
+	guard(hwmon_lock)(dev);
+
+	err = dasharo_curve_point_call(data, sattr->nr, "GFPT", &point, 1, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%llu\n", val * MILLIDEGREE_PER_DEGREE);
+}
+
+static ssize_t curve_point_temp_store(struct device *dev, struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	long val;
+	int err;
+
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
+
+	if (val < 0)
+		return -EINVAL;
+
+	val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
+	if (val > U8_MAX)
+		return -EINVAL;
+
+	guard(hwmon_lock)(dev);
+
+	err = dasharo_curve_point_store(data, sattr->nr, "SFPT", sattr->index, val);
+	return err ?: count;
+}
+
+static ssize_t curve_point_pwm_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	u64 point = sattr->index;
+	u64 val;
+	int err;
+
+	guard(hwmon_lock)(dev);
+
+	err = dasharo_curve_point_call(data, sattr->nr, "GFPD", &point, 1, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%llu\n", DIV_ROUND_CLOSEST_ULL(val * 255, 100));
+}
+
+static ssize_t curve_point_pwm_store(struct device *dev, struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	long val;
+	int err;
+
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
+
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	guard(hwmon_lock)(dev);
+
+	err = dasharo_curve_point_store(data, sattr->nr, "SFPD", sattr->index,
+					DIV_ROUND_CLOSEST(val * 100, 255));
+	return err ?: count;
+}
+
+#define DASHARO_POINT_ATTR(ch, pt) \
+	static SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_temp, curve_point_temp, \
+				       (ch) - 1, (pt) - 1); \
+	static SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_pwm, curve_point_pwm, \
+				       (ch) - 1, (pt) - 1)
+
+#define DASHARO_POINT_ATTR_PTRS(ch, pt) \
+	&sensor_dev_attr_pwm##ch##_auto_point##pt##_temp.dev_attr.attr, \
+	&sensor_dev_attr_pwm##ch##_auto_point##pt##_pwm.dev_attr.attr
+
+#define DASHARO_POINT_ATTRS(ch) \
+	DASHARO_POINT_ATTR(ch, 1); \
+	DASHARO_POINT_ATTR(ch, 2); \
+	DASHARO_POINT_ATTR(ch, 3); \
+	DASHARO_POINT_ATTR(ch, 4)
+
+#define DASHARO_CHANNEL_PTRS(ch) \
+	DASHARO_POINT_ATTR_PTRS(ch, 1), \
+	DASHARO_POINT_ATTR_PTRS(ch, 2), \
+	DASHARO_POINT_ATTR_PTRS(ch, 3), \
+	DASHARO_POINT_ATTR_PTRS(ch, 4)
+
+DASHARO_POINT_ATTRS(1);
+DASHARO_POINT_ATTRS(2);
+DASHARO_POINT_ATTRS(3);
+DASHARO_POINT_ATTRS(4);
+DASHARO_POINT_ATTRS(5);
+DASHARO_POINT_ATTRS(6);
+DASHARO_POINT_ATTRS(7);
+DASHARO_POINT_ATTRS(8);
+DASHARO_POINT_ATTRS(9);
+DASHARO_POINT_ATTRS(10);
+DASHARO_POINT_ATTRS(11);
+DASHARO_POINT_ATTRS(12);
+DASHARO_POINT_ATTRS(13);
+DASHARO_POINT_ATTRS(14);
+DASHARO_POINT_ATTRS(15);
+DASHARO_POINT_ATTRS(16);
+DASHARO_POINT_ATTRS(17);
+DASHARO_POINT_ATTRS(18);
+DASHARO_POINT_ATTRS(19);
+DASHARO_POINT_ATTRS(20);
+DASHARO_POINT_ATTRS(21);
+DASHARO_POINT_ATTRS(22);
+DASHARO_POINT_ATTRS(23);
+DASHARO_POINT_ATTRS(24);
+
+static struct attribute *dasharo_point_attrs[] = {
+	DASHARO_CHANNEL_PTRS(1),
+	DASHARO_CHANNEL_PTRS(2),
+	NULL
+};
+
+static umode_t dasharo_curve_point_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
+	int channel = to_sensor_dev_attr_2(dattr)->nr;
+
+	if (dasharo_fan_channel(data, DASHARO_FEATURE_FAN_POINTS, channel) < 0)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group dasharo_point_group = {
+	.attrs = dasharo_point_attrs,
+	.is_visible = dasharo_curve_point_is_visible,
+};
+
+static const struct attribute_group *dasharo_groups[] = {
+	&dasharo_point_group,
+	NULL
+};
+
 static void dasharo_fill_feature_caps(struct dasharo_data *data, enum dasharo_feature feat)
 {
 	struct dasharo_capability *cap;
@@ -437,21 +630,33 @@ static int dasharo_probe(struct platform_device *pdev)
 {
 	struct dasharo_data *data;
 	struct device *hwmon;
+	int ret;
 
 	data = devm_kzalloc_obj(&pdev->dev, *data);
 	if (!data)
 		return -ENOMEM;
 	data->pdev = pdev;
+	platform_set_drvdata(pdev, data);
 
 	for (unsigned int i = 0; i < DASHARO_FEATURE_MAX; ++i)
 		dasharo_fill_feature_caps(data, i);
 
 	hwmon = devm_hwmon_device_register_with_info(&pdev->dev, "dasharo_acpi", data,
-						     &dasharo_hwmon_chip_info, NULL);
+						     &dasharo_hwmon_chip_info, dasharo_groups);
 
 	return PTR_ERR_OR_ZERO(hwmon);
 }
 
+static void dasharo_shutdown(struct platform_device *pdev)
+{
+	struct dasharo_data *data = platform_get_drvdata(pdev);
+	u64 ret;
+
+	/* Let the firmware persist the fan curve the EC runs */
+	if (data->caps_found[DASHARO_FEATURE_FAN_POINTS])
+		acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev), "SFCS", NULL, &ret);
+}
+
 static const struct acpi_device_id dasharo_device_ids[] = {
 	{"DSHR0001", 0},
 	{}
@@ -464,6 +669,7 @@ static struct platform_driver dasharo_driver = {
 		.acpi_match_table = dasharo_device_ids,
 	},
 	.probe = dasharo_probe,
+	.shutdown = dasharo_shutdown,
 };
 module_platform_driver(dasharo_driver);
 
-- 
2.56.0


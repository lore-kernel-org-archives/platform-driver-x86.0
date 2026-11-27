Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.35.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769362;
	b=tfT6y0cci9CCZ3pOr8RWkQqX5oHlv1Z+FpZXzT3gT/t06hxYsWRWIQJ2rQi2EFDmpXYs
	 sjBgyg97TU+FvIRGlf8yPEikJJCb1HczPZo1vWRTefxpbw90S0avjuI9KLeZ56Cu/tdll
	 Njb5M+EbpJqvKTJyZqFaI1k4emF/FKS0Wcd2wr8TxTV07V0b8bfoEyyGkKF43ZgMqpYFm
	 WA7HC6FEIOJc501Nn38rUcXR6IGhqCf1P76R9qJqJzpvp/SQN1Mhh5SuXkwAIx09ieEpV
	 Wn3y6DfKXvHzyEg9hTpTTjkahTIYybavnZKdmVLwXo0FtxJJGjLujf7cO7fkL2i071A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769362;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=r89bRA8yzwUIEW3HEm2+uSrVCpmeaUYdaQjH7diumMY=;
	b=MoOncpuUzY9MWLxvKtkOv22biFNO7/AjMq5Rkw78bG3TL8j6wOEwDbcrWB4LDj+ZYFXv
	 2x4e5JslhgGGz2Y608VcnurKdV9DIGHfo+jZRNY3CUpWkyqMh+bluGrwOs+jsNYnN8+tq
	 7AObyNNvw0pltLEzjeGfTG9GtpiVIqXBlvd/sYMLweGLPxTJqMI3YcPPFZInItmaOIfvN
	 r6Ta8K6DNJsbm41MbWEleqkWsrj6JSnxip32Nf92/9e+yqd47K52rw1MYiQRrkl3KKUhq
	 WcmVjqyuPbfJgC3afv34DRuZjqRvuoOhO4M3FFzB+Dkr/WBftAtwqae8UBTigZOZ6GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=MR9vKr0Z;
	arc=none smtp.remote-ip=46.105.35.72
Received: from 18.mo550.mail-out.ovh.net (18.mo550.mail-out.ovh.net [46.105.35.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63083606A6B8
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 08:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63083606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=MR9vKr0Z
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.231.5])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4jbRt21sYsz5xY1
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 08:49:14 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-bntqx (unknown [10.110.113.124])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C0EA4C2B7C;
	Fri, 27 Nov 2026 08:49:13 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-bntqx with ESMTPSA
	id 3zMOCghECWtv1hQAXudyjw:T3
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 08:49:13 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00415ab9dec-e926-4c8c-a97a-18603ef2f58c,
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
Subject: [PATCH v4 2/3] platform/x86: dasharo-acpi: Add fan mode and PWM write support
Date: Fri, 27 Nov 2026 09:49:09 +0100
Message-ID: <20261127084910.3355833-3-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127084910.3355833-1-filip.golas@3mdeb.com>
References: <20261127084910.3355833-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 4902731144467967983
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGmTo2SJLw22JHTIqldyJfHVhl4m6anTstpuqlZPPd16K+Tn0/hy/vNxAz0zWtSwAiC17uO1AVxzXNJJSVsGCbQTSajakJkTp/DEQkNG9r2WjLD5Z3btMqPcIeIX1fKFgdY1lFT5SIMPHl+lPJbd77O/Kgfm39lQRLbUmJNW9EwQL3wudFcBgi1xIWV0FzY0ws+I8mejZoac/VXb0AV4ArJH7gyBp2biRp0EqjiLtd1gyTb1WOxMmYdPke6kdgHwGERZvoG4u4YqKeb63bTlueqMyKpyE4mWvtsmRphwEVzmCEvJFvUQPdEm0bOXofatBDJP7tkbjDo4L3wYChzhtjBp3FSFMHnXWhQ+ZJOHnrVVXldx3QuJ3gzh/JzKe48+bXB49uDFEWDEc8efHDWMydHyoNIfRIFWbHjkl4GV+Zpc0evpnSjx/ZGJglYoy2AZ15qxGbr48orBaMfJffqeUFNVBoRTnerhwelZYjjkN+f/sXr/PBnOdTAYxT3/qkEw8KqRMHvxXBgU551qqWSK3MaEK/WTa169IZFyi2EPI1/fCr5mRmqTGcgxlsdpvoEnYggsaQsgVbaOdNHLxEfPIyDKjJJvGxxpypuhAkDMecUR9G91OgfpSlDQOusLy2SZ+Q3IxvzaYyzxtYNdbHAM+tNZQPGbLpk+VWuby58/XAk3A
DKIM-Signature: a=rsa-sha256; bh=r89bRA8yzwUIEW3HEm2+uSrVCpmeaUYdaQjH7diumMY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795769354; v=1;
 b=MR9vKr0Z1hRw97rovJKlA3uKKpcnhxROikc2MuNqM45zIYVzvOyY0rbNO+QKxQ/7qcVUigNm
 im/K8FmnHTbLDsirA8mVe+Wk5ZJPuZTXs001jUiS9RbPjYmg/n41OfmGztUULKygS+g/n6cZzsT
 so6NaYdEgeuXsy1hbCRnwzKE4Gm50wdUgYDs4XkqrwofmXpnwKHzncAZXLiX+jqp5cTtASL0ZUQ
 vccZyZeiMlNWq2VpuaP5a72D7qmgbt0OkRiD66xDF7wUGjd2QP4vTFcJYrsdZeWFjz8gRh0lYQC
 e55nvdBPnp7M9bU6tSVgh8JVegZJlpoZswHGWrn57htOw==

Allow switching fans between automatic control by the EC and manual
control via pwmN_enable (1=manual, 2=automatic), and setting the duty
cycle via pwmN. The EC refuses duty cycle writes in automatic mode.

Fan mode control is only exposed for fans on which the firmware reports
support for it.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
Changes in v2:
- The capabilities of each feature are packed independently, so channel N
  of DASHARO_FEATURE_FAN_MODE will not necessarily be the fan of PWM channel N
  if the two fans have different capabilities.
  Use dasharo_fan_channel for looking up the fan mode capabilities by
  comparing the group and index.
---
 drivers/platform/x86/dasharo-acpi.c | 146 +++++++++++++++++++++++-----
 1 file changed, 119 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 13d97eb43511..85f88b11fcf9 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -15,6 +15,8 @@ enum dasharo_feature {
 	DASHARO_FEATURE_TEMPERATURE = 0,
 	DASHARO_FEATURE_FAN_PWM,
 	DASHARO_FEATURE_FAN_TACH,
+	DASHARO_FEATURE_FAN_POINTS,
+	DASHARO_FEATURE_FAN_MODE,
 	DASHARO_FEATURE_MAX
 };
 
@@ -54,6 +56,16 @@ static const char * const dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PE
 		[DASHARO_FAN_GPU] = "GPU",
 		[DASHARO_FAN_CHASSIS] = "Chassis",
 	},
+	[DASHARO_FEATURE_FAN_MODE] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_POINTS] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
 };
 
 struct dasharo_capability {
@@ -143,10 +155,45 @@ static int dasharo_read_channel(struct dasharo_data *data, const char *method,
 	return ret;
 }
 
+static int dasharo_write_channel(struct dasharo_data *data, const char *method,
+				 enum dasharo_feature feat, int channel, long value)
+{
+	u64 arg = value;
+	u64 ret;
+	int err;
+
+	err = dasharo_call(data, method, feat, channel, &arg, 1, &ret);
+	if (err)
+		return err;
+
+	/* Non-zero status from the method means the EC refused the write */
+	return ret ? -EPERM : 0;
+}
+
+static int dasharo_fan_channel(const struct dasharo_data *data, enum dasharo_feature feat,
+			       int pwm_channel)
+{
+	const struct dasharo_capability *fan;
+	int i;
+
+	if (pwm_channel >= data->caps_found[DASHARO_FEATURE_FAN_PWM])
+		return -EINVAL;
+
+	fan = &data->capabilities[DASHARO_FEATURE_FAN_PWM][pwm_channel];
+	for (i = 0; i < data->caps_found[feat]; i++) {
+		if (data->capabilities[feat][i].group == fan->group &&
+		    data->capabilities[feat][i].index == fan->index)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
 	struct dasharo_data *data = dev_get_drvdata(dev);
+	int mode_ch;
 	long value;
 	int ret;
 
@@ -162,6 +209,17 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			*val = value;
 		break;
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_enable) {
+			/* hwmon: 1 = manual, 2 = automatic */
+			mode_ch = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel);
+			if (mode_ch < 0)
+				return mode_ch;
+			ret = dasharo_read_channel(data, "GFMD", DASHARO_FEATURE_FAN_MODE,
+						   mode_ch, &value);
+			if (!ret)
+				*val = value ? 1 : 2;
+			break;
+		}
 		ret = dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM, channel, &value);
 		if (!ret)
 			*val = value;
@@ -174,6 +232,35 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	return ret;
 }
 
+static int dasharo_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	int mode_ch;
+
+	if (type != hwmon_pwm)
+		return -EINVAL;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		if (val != 1 && val != 2)
+			return -EINVAL;
+		mode_ch = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel);
+		if (mode_ch < 0)
+			return mode_ch;
+		return dasharo_write_channel(data, "SFMD", DASHARO_FEATURE_FAN_MODE,
+					     mode_ch, val == 1);
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+		/* Refused by the EC unless in manual mode */
+		return dasharo_write_channel(data, "SFDC", DASHARO_FEATURE_FAN_PWM,
+					     channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
 				     u32 attr, int channel, const char **str)
 {
@@ -203,6 +290,7 @@ static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 					u32 attr, int channel)
 {
 	const struct dasharo_data *data = drvdata;
+	bool has_mode;
 
 	switch (type) {
 	case hwmon_temp:
@@ -210,9 +298,12 @@ static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 			return 0444;
 		break;
 	case hwmon_pwm:
-		if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
-			return 0444;
-		break;
+		if (channel >= data->caps_found[DASHARO_FEATURE_FAN_PWM])
+			break;
+		has_mode = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_MODE, channel) >= 0;
+		if (attr == hwmon_pwm_enable)
+			return has_mode ? 0644 : 0;
+		return has_mode ? 0644 : 0444;
 	case hwmon_fan:
 		if (channel < data->caps_found[DASHARO_FEATURE_FAN_TACH])
 			return 0444;
@@ -228,6 +319,7 @@ static const struct hwmon_ops dasharo_hwmon_ops = {
 	.is_visible = dasharo_hwmon_is_visible,
 	.read_string = dasharo_hwmon_read_string,
 	.read = dasharo_hwmon_read,
+	.write = dasharo_hwmon_write,
 };
 
 // Max 24 capabilities per feature
@@ -283,30 +375,30 @@ static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
 		HWMON_T_INPUT | HWMON_T_LABEL,
 		HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(pwm,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT),
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
-- 
2.56.0


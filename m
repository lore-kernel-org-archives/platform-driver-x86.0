Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.59.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555896;
	b=pYqSxCDMKepLwv6/WJK5QndQdOIUqAQehdAE0Eao6jVmFpr3weQ8sH9MNBFKKiBQhDBt
	 pS4lBF8ifxbTuZJ8b//9t20YciVNoeXbS9aIgi3v5YnrLlmssZbVOoOaELCzq4kiUv6ln
	 Cdd5rMME+eQHoHFJUCsvrpc05ZBAjahDlRaev+GHFCxQZp5xVHezxsVk+FmU92dBsFat7
	 OYjiAy3CoyyEjbkG3RxCQaLaO0TW99h8icUEkKiraa42pgTdJ1F4nApNXBkV+BPybtY4t
	 w/M8Jh5HJFl5MzYZuhTWqcvndR5QsZyXekJa36gnenEcZ8Xhb34sEiqJvoRti47GTzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555896;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=9aITCtlwXLCbRIOSoGqqiyviWUF2fF7265UIaIYTMxA=;
	b=JpiCavkHUoHzplLmX+FqXaC+gDeetSKpLG3D6HeIc6hxt6+oBnJv5o1dQoxulfAJDcaY
	 IupSmYy3G6AhDwFIKiduQQbIFFcobMEBk3/fa5mZ5QXS4zmCPtAh0BIy5kaPewWuCS+vy
	 aX6XlttyZj5FX5t7ZjdrjPRZOaisi2k8WrP06ClMQTCAUP9Jy1qZMarI+FjIy1aEnr1bX
	 BlnM0kQ+5QGDwKM8/Nmf6Ia9TY9uEgqvWbcjiM6nOCrP5XZTEDVM5i0gSpN5YmZm06r5i
	 32TJ0ZiffQTD6IRp7W9zS146BxuKttfVjMeJpEiHuRSdcLhIlWQ2yxS1P33QWDjmG6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=eJOWFJHo;
	arc=none smtp.remote-ip=46.105.59.63
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net [46.105.59.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E8606A880
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 07:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729E8606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=eJOWFJHo
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.58.202])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4jQq676gyyz64Yh
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 07:44:47 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-cl275 (unknown [10.108.42.118])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D1757C014E;
	Fri, 13 Nov 2026 07:44:46 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-cl275 with ESMTPSA
	id Hrv+B+u/9mr5jjgAjijQbg:T3
	(envelope-from <filip.golas@3mdeb.com>); Fri, 13 Nov 2026 07:44:46 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0035971ddc7-f925-4642-b338-66dc92d02e97,
                    F6EB7A3E9421D9EE3A955D9585EDAC62A977302C) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:37.47.248.243
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH 2/3] platform/x86: dasharo-acpi: Add fan mode and PWM write support
Date: Fri, 13 Nov 2026 08:43:46 +0100
Message-ID: <20261113074347.2301465-3-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113074347.2301465-1-filip.golas@3mdeb.com>
References: <20261113074347.2301465-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 13830272982746656751
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGqPbLBnmhj9UiFXX2NOcBYIwS07K8qgh9kfk6ccOz66CsdC5JWaCqGim4Imyt8j5YZJeTG8bqDy/xHFry5ExUbRLAD379m/2NhU/GplVCFvveAw47KA4jOla1aRVoc1rGMC4je8sAQK+T/Pp4AfQEbX60i8X7QApiM1yjobkCpaZ+eEiNTv2en3ecvQOPTeFd8erfHFf5Gfnu7iR6o+3fJp3mTDk/hhDqJYsLcjCbMpix+9na2VQc7tfuEN3Dcvl3kscqSwwaFXikkNOF/+Txml4scGJ0XG/URqJKCZbgXtuPG+fphWGYj8touRvwb19YRNg9eHY/Sc+c42piob69RaPMkHiCOV9jq6HSPO4/4pWCz2Ma1WId5pBwEsIdAMnyUyYW38nIVrwbf/1/iZfI62AyFb0hqXq4e0SJ3B6pfeYXJjKN6lKRZGQdWGKNP83XjYfrzJuAk0qXZgWvfWv6LfSFNBcRZf0NGqI6vB4i9zqPeIzkgk3mgNH2G9Ggy/ND48T/QLfWJEgy6ewC/w7KzqdkkiyeYbZwXMH5IxhRpu9Hvl6OZfjKcW24chrlbiKZZes/kzIwBsPCzjpD6iH6lAnYfc3Zw60SMYq4zdAg5wRbE9ARN7biKcucQ1AR6JV+qSlipbxt1Qsem58c3dAzfvIij4EM8YVA5yK8c4jyf0Q
DKIM-Signature: a=rsa-sha256; bh=9aITCtlwXLCbRIOSoGqqiyviWUF2fF7265UIaIYTMxA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1794555888; v=1;
 b=eJOWFJHorDEpnsGhl2TcOIducYrOBlh/JWuUzJBhHz/D4Y5nY/wkLmSXpxr/+VXxvpK/p7Jg
 5nTpwzy0dRNFuTwT98bhRe0NVgSLgmWwPiU0idfNoaclZYrYWcFT4VZ1nAfsqwotJQepEZvOchz
 z5WOWZli4GXn2n/Dn6a0uL0AgcXSiP6YOEEak/PQL/YOHaCTH17idKfKrmLqgFhfmH047ii1eKS
 ovltmNgFxgnUvbiK+EjsKfkBf1tp7xVIubbJdGpmKMDsj5m8vinT2anOXCEhdbVOvy7xBIxOk4j
 QRi0oIom3IO5yknxUXwJ9Z+6zzECWFz6yDNfr47YBuzjA==

Allow switching fans between automatic control by the EC and manual
control via pwmN_enable (1=manual, 2=automatic), and setting the duty
cycle via pwmN. The EC refuses duty cycle writes in automatic mode.

Fan mode control is only exposed for fans on which the firmware reports
support for it.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
 drivers/platform/x86/dasharo-acpi.c | 117 +++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 13d97eb43511..29afcf78564c 100644
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
@@ -143,6 +155,21 @@ static int dasharo_read_channel(struct dasharo_data *data, const char *method,
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
 static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
@@ -162,6 +189,14 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			*val = value;
 		break;
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_enable) {
+			/* hwmon: 1 = manual, 2 = automatic */
+			ret = dasharo_read_channel(data, "GFMD", DASHARO_FEATURE_FAN_MODE,
+						   channel, &value);
+			if (!ret)
+				*val = value ? 1 : 2;
+			break;
+		}
 		ret = dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM, channel, &value);
 		if (!ret)
 			*val = value;
@@ -174,6 +209,31 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	return ret;
 }
 
+static int dasharo_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm)
+		return -EINVAL;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		if (val != 1 && val != 2)
+			return -EINVAL;
+		return dasharo_write_channel(data, "SFMD", DASHARO_FEATURE_FAN_MODE,
+					     channel, val == 1);
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
@@ -210,9 +270,11 @@ static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 			return 0444;
 		break;
 	case hwmon_pwm:
-		if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
-			return 0444;
-		break;
+		if (channel >= data->caps_found[DASHARO_FEATURE_FAN_PWM])
+			break;
+		if (attr == hwmon_pwm_enable)
+			return channel < data->caps_found[DASHARO_FEATURE_FAN_MODE] ? 0644 : 0;
+		return data->caps_found[DASHARO_FEATURE_FAN_MODE] ? 0644 : 0444;
 	case hwmon_fan:
 		if (channel < data->caps_found[DASHARO_FEATURE_FAN_TACH])
 			return 0444;
@@ -228,6 +290,7 @@ static const struct hwmon_ops dasharo_hwmon_ops = {
 	.is_visible = dasharo_hwmon_is_visible,
 	.read_string = dasharo_hwmon_read_string,
 	.read = dasharo_hwmon_read,
+	.write = dasharo_hwmon_write,
 };
 
 // Max 24 capabilities per feature
@@ -283,30 +346,30 @@ static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
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


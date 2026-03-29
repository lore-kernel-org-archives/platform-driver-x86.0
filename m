Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E11A6800
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 05:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774762757; cv=none; b=KHlSbgjIxmg9GSLTe09rFSbQ4w92TRTz92Tdm6Ax9+e1qqhHbp988E2C8yE16jAQvWUul3ePt6rnRIp0bPtP/uCJA/3xlwsFqtR+ZkKGDRrCKQPOXmnEYyRqFcUWOmWzMkwOJwQJaPkGaauK8vXyTCM7urz08BkeUASL56REkDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774762757; c=relaxed/simple;
	bh=mghBULNVYcPQDCfOhOVjq2FEvuBPQ/lJcinugvcTByU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pEsYOur//NsLaW0+RHGxcbMsDXeZu/1SrTrmP06MqjW4nBNQdjgWeJhvxtL35/sD7dMDodN4CIMGzocONoU3zdBdZev1JVj6Xe8//3hrXyM7Nu01c04soKmIT4YkDW5XaW6OAKpkqhyxhtSTKdXhrwKgIlSkHGAriArjulLFXBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9MgPKIH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9MgPKIH"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso2215811a91.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 22:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774762755; x=1775367555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+lckgw6UmGvJZEicF/O4AgCi9bwg1ZzjiyXQ1bC0BU=;
        b=a9MgPKIHvBEc6RY1Cm+IrBM7S2UARabziQagSGSU38uv1T7+cBF1A4N0OHinpZ8gTb
         Uwkk6UhevydghT6s9cOjHVSuiGTLFV8iiUmuZPPI+rhDN6kJwSbJUc41jX8UyyU5kxXl
         zc7cyOaqK1MWw5MZwKo/ipSO1WbXalRqceBPg1et86UCBKPzaeAQ2jHW/P9IlRcOWkmQ
         IkdN6zwkaB11LzbMD6xJKwC4ZTWjdvAhg7gWBt1pHzMD4H4qs/Pz7nOVI8f8+xBp497e
         KXsfG3I4TBzyDxc6YXlC6RG7BVZo+HCNXsU6Stj48DS4cgYIJ7OxCsvjj4Tyl2jdflto
         2h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774762755; x=1775367555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+lckgw6UmGvJZEicF/O4AgCi9bwg1ZzjiyXQ1bC0BU=;
        b=DqXtyDrVZIg09jZH8n5tcu031yywi9TYnjyWitGyYKdhMT79DyCxacPGeC4Tzbqci7
         2v2wDJqY/3QJu1F88bqPhPM1OshcH4qnI4g/JyCY/cMkvK6cbUX3ANZj/2uwIbcbo1y7
         lmftAvz+OiZUi2g3WrD8oXV1WKEBPHtgyEZ1BxPxX9DRLLT45uHom/CFYQu+uOgBlZ9Y
         KgusXxbOc5ZeFeH8Ppd1JtgVEVcylNWTHolcOqYVDja6H99txIDgbYIl/dSZ3GjDTRHS
         kF6I6hI0khqW/6WafoYXB5XxdxDk6/LgqXtukXyKw3kKKKnjOINB1URcXTTqaD7Z88lD
         AG9g==
X-Gm-Message-State: AOJu0YzWuV3NBqxkOjgJ0AMiSXy7Ebdv4DA7XO+Fv6S9YojW3KcSDLEO
	+28uIddQjWnsCFlJZ4IAv64DD/1YpdlaEhsu/Tp4YWDq5y3U8TulPcRPHYVTB5mKwOk=
X-Gm-Gg: ATEYQzx1EYWdFqTD5p9xCuuBU59ryXyri/5CIwf9Nd0pWvWm9MS3Mhnf0vv9a41wJhK
	LrlKTuN+wLufOOScbkM39WamudR1Wvrueuc//f/Wiiq1Un5Wx6TQs3S8l4g53Fi8JJ35kez1gt/
	WQV54y28ud4aLgWIwDPMTugKUbdwqlCVXb1bC1VrGP3slDiTOEs0XidC1FKQvWSaOI4WjZzww2w
	EpKZ7JmneQMVgZYecVyIvc2cpv692luFPFRdY0BzLZFj0HcpZIKwM7lDQNAiHonxJsaZI9ShUxi
	fU8d2Ljbcp0Znp/WjI9aRIMrehcR5ZcfFa/IiOPZzTbV73xS2SwqmIfA9NKRU2XaYqb5RZJGMrY
	uQFnbt9DJRflGrJcRm16uAGXPzX5w7uBHPuszT0iOJjeVMuF6HF+8GV4xE35pv0TeZDnYDV3Ek3
	eEenu0wjQwMbt/wEu6o1yChfJSiqy8CXWZG62ipanbXwuZ3JeRP5Ogj7uRsGU+3EnBpWpujCADJ
	c8j9Lpv
X-Received: by 2002:a05:6a20:60d3:b0:39c:14c1:43f6 with SMTP id adf61e73a8af0-39c87c0b0b5mr6478587637.61.1774762754560;
        Sat, 28 Mar 2026 22:39:14 -0700 (PDT)
Received: from cachyos-x8664.iitd.ac.in ([2001:df4:e000:3fd2:59eb:b75c:7ede:19e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8437441sm3710896b3a.3.2026.03.28.22.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 22:39:14 -0700 (PDT)
From: Bani Brata <banibrata2007@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Bani Brata <banibrata2007@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: hp-wmi: Add ACPI PWM fan control for HP ENVY 13-bd0xxx
Date: Sun, 29 Mar 2026 11:09:05 +0530
Message-ID: <20260329053907.31647-1-banibrata2007@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP ENVY x360 Convertible 13-bd0xxx (board 8824), standard WMI
methods for fan speed control and RPM reporting do not function.

However, the DSDT exposes ACPI methods (\_SB.PC00.LPCB.EC0.FANG and FANW)
that allow reading and writing an 8-bit PWM level (0-255) to the EC.

This patch maps these ACPI methods to standard hwmon `pwm1` and
`pwm1_enable` nodes, allowing userspace tools to successfully control
the fan speed.

Signed-off-by: Bani Brata <banibrata2007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 155 ++++++++++++++++++++++++++++++-
 1 file changed, 155 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -48,6 +48,14 @@
 #define HP_FAN_SPEED_AUTOMATIC	 0x00
 #define HP_POWER_LIMIT_DEFAULT	 0x00
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
+#define HP_ENVY_8824_ACPI_FANG "\\_SB.PC00.LPCB.EC0.FANG"
+#define HP_ENVY_8824_ACPI_FANW "\\_SB.PC00.LPCB.EC0.FANW"
+#define HP_ENVY_8824_FAN_VALUE_ARG 33026ULL
+#define HP_ENVY_8824_FAN_PRIME_ARG 33030ULL
+#define HP_ENVY_8824_FAN_PRIME_MANUAL 0xFFULL
+#define HP_ENVY_8824_FAN_PRIME_AUTO 0x8ULL
+#define HP_ENVY_8824_PWM_MODE_MANUAL 1
+#define HP_ENVY_8824_PWM_MODE_AUTO 2
 
 #define ACPI_AC_CLASS "ac_adapter"
 
@@ -193,6 +201,8 @@ static const struct dmi_system_id hp_wmi_rfkill_dmi_table[] __initconst = {
 
 static bool is_victus_s_board;
 static bool is_envy_x360_8824_board;
+static DEFINE_MUTEX(hp_envy_x360_8824_fan_lock);
+static int hp_envy_x360_8824_pwm_mode = HP_ENVY_8824_PWM_MODE_AUTO;
 
 static const struct dmi_system_id hp_envy_x360_8824_boards[] __initconst = {
 	{
@@ -518,6 +528,120 @@ static int hp_wmi_get_fan_speed_victus_s(int fan)
 	return ret;
 }
 
+static int hp_envy_x360_8824_acpi_eval(const char *path,
+				       const unsigned long long *args,
+				       size_t arg_count,
+				       unsigned long long *value)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object params[2] = { };
+	struct acpi_object_list input = { .count = arg_count, .pointer = params };
+	union acpi_object *obj;
+	acpi_status status;
+	size_t i;
+
+	for (i = 0; i < arg_count; i++) {
+		params[i].type = ACPI_TYPE_INTEGER;
+		params[i].integer.value = args[i];
+	}
+
+	status = acpi_evaluate_object(NULL, (acpi_string)path,
+				      arg_count ? &input : NULL, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (!obj)
+		return -ENODATA;
+
+	if (obj->type != ACPI_TYPE_INTEGER) {
+		kfree(obj);
+		return -EINVAL;
+	}
+
+	*value = obj->integer.value;
+	kfree(obj);
+
+	return 0;
+}
+
+static int hp_envy_x360_8824_get_pwm_locked(void)
+{
+	unsigned long long args[] = { HP_ENVY_8824_FAN_VALUE_ARG };
+	unsigned long long value;
+	int ret;
+
+	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANG, args,
+					 ARRAY_SIZE(args), &value);
+	if (ret)
+		return ret;
+	if (value > U8_MAX)
+		return -EINVAL;
+
+	return value;
+}
+
+static int hp_envy_x360_8824_set_pwm_locked(u8 pwm)
+{
+	unsigned long long args[] = {
+		HP_ENVY_8824_FAN_PRIME_ARG,
+		HP_ENVY_8824_FAN_PRIME_MANUAL,
+	};
+	unsigned long long value;
+	int ret;
+
+	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANW, args,
+					 ARRAY_SIZE(args), &value);
+	if (ret)
+		return ret;
+
+	args[0] = HP_ENVY_8824_FAN_VALUE_ARG;
+	args[1] = pwm;
+	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANW, args,
+					 ARRAY_SIZE(args), &value);
+	if (ret)
+		return ret;
+
+	hp_envy_x360_8824_pwm_mode = HP_ENVY_8824_PWM_MODE_MANUAL;
+	return 0;
+}
+
+static int hp_envy_x360_8824_set_auto_locked(void)
+{
+	unsigned long long args[] = {
+		HP_ENVY_8824_FAN_PRIME_ARG,
+		HP_ENVY_8824_FAN_PRIME_AUTO,
+	};
+	unsigned long long value;
+	int ret;
+
+	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANW, args,
+					 ARRAY_SIZE(args), &value);
+	if (ret)
+		return ret;
+
+	args[0] = HP_ENVY_8824_FAN_VALUE_ARG;
+	args[1] = HP_ENVY_8824_FAN_PRIME_MANUAL;
+	ret = hp_envy_x360_8824_acpi_eval(HP_ENVY_8824_ACPI_FANW, args,
+					 ARRAY_SIZE(args), &value);
+	if (ret)
+		return ret;
+
+	hp_envy_x360_8824_pwm_mode = HP_ENVY_8824_PWM_MODE_AUTO;
+	return 0;
+}
+
+static int hp_envy_x360_8824_set_manual_locked(void)
+{
+	int pwm;
+
+	pwm = hp_envy_x360_8824_get_pwm_locked();
+	if (pwm < 0)
+		return pwm;
+
+	return hp_envy_x360_8824_set_pwm_locked(pwm);
+}
+
 /*
  * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
  * and/or maintains the laptop in user defined thermal and fan states, instead
@@ -2103,6 +2227,12 @@ static void hp_wmi_rfkill_setup(struct platform_device *device)
 		rfkill_unregister(wifi_rfkill);
 		rfkill_destroy(wifi_rfkill);
 	}
+
+	if (is_envy_x360_8824_board) {
+		mutex_lock(&hp_envy_x360_8824_fan_lock);
+		hp_envy_x360_8824_set_auto_locked();
+		mutex_unlock(&hp_envy_x360_8824_fan_lock);
+	}
 	if (bluetooth_rfkill) {
 		rfkill_unregister(bluetooth_rfkill);
 		rfkill_destroy(bluetooth_rfkill);
@@ -2176,6 +2306,10 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 {
 	switch (type) {
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_input)
+			return is_envy_x360_8824_board ? 0644 : 0;
+		if (attr == hwmon_pwm_enable)
+			return is_envy_x360_8824_board ? 0644 : 0;
 		return 0644;
 	case hwmon_fan:
 		if (is_envy_x360_8824_board)
@@ -2213,6 +2347,25 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 		*val = ret;
 		return 0;
 	case hwmon_pwm:
+		if (is_envy_x360_8824_board) {
+			mutex_lock(&hp_envy_x360_8824_fan_lock);
+			if (attr == hwmon_pwm_input) {
+				ret = hp_envy_x360_8824_get_pwm_locked();
+				if (!ret)
+					*val = ret;
+				else if (ret > 0)
+					*val = ret;
+				mutex_unlock(&hp_envy_x360_8824_fan_lock);
+				return ret < 0 ? ret : 0;
+			}
+			if (attr == hwmon_pwm_enable) {
+				*val = hp_envy_x360_8824_pwm_mode;
+				mutex_unlock(&hp_envy_x360_8824_fan_lock);
+				return 0;
+			}
+			mutex_unlock(&hp_envy_x360_8824_fan_lock);
+			return -EOPNOTSUPP;
+		}
 		switch (hp_wmi_fan_speed_max_get()) {
 		case 0:
 			/* 0 is automatic fan, which is 2 for hwmon */
@@ -2236,8 +2389,40 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long val)
 {
+	int ret;
+
 	switch (type) {
 	case hwmon_pwm:
+		if (is_envy_x360_8824_board) {
+			mutex_lock(&hp_envy_x360_8824_fan_lock);
+			switch (attr) {
+			case hwmon_pwm_input:
+				if (val < 0 || val > U8_MAX) {
+					mutex_unlock(&hp_envy_x360_8824_fan_lock);
+					return -EINVAL;
+				}
+				ret = hp_envy_x360_8824_set_pwm_locked(val);
+				mutex_unlock(&hp_envy_x360_8824_fan_lock);
+				return ret;
+			case hwmon_pwm_enable:
+				switch (val) {
+				case HP_ENVY_8824_PWM_MODE_MANUAL:
+					ret = hp_envy_x360_8824_set_manual_locked();
+					break;
+				case HP_ENVY_8824_PWM_MODE_AUTO:
+					ret = hp_envy_x360_8824_set_auto_locked();
+					break;
+				default:
+					ret = -EINVAL;
+					break;
+				}
+				mutex_unlock(&hp_envy_x360_8824_fan_lock);
+				return ret;
+			default:
+				mutex_unlock(&hp_envy_x360_8824_fan_lock);
+				return -EOPNOTSUPP;
+			}
+		}
 		switch (val) {
 		case 0:
 			if (is_victus_s_thermal_profile())
@@ -2262,7 +2447,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
-- 
2.48.1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009445;
	b=Wm8glOJA0/Nr4UnfguqnSHMGvYRDoX0KO1Ach/2Zxz9nQ+56fqLGxh/j9GN2uee+sz0w
	 CiH8i3cHCMSVDZlX3HOi44SmbsMjv9UZjsd4jAdwGuUw6/XH72z1pOgf4WSHExJJM/+hH
	 uqurMWZm+N08fz/7cbdTBwuVdTbJgYS5lQErQPBPTrFFizg9BN+0lN3lX9gZRmeeOS9Qm
	 iW/L6fGupkTAOqlLKHdLPXBSn1OaHDUIUo01eF2hMP8pSZnIXnL8Sk4Z/iiG6NHInO7nc
	 mNJaT2bSd0yCqZM09WFQYSWTjk9L8zTqgGrLIqGnAhdFMVAqlF//0oXdECDbQ9xVwXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j/F76kbgYrpKb0Fn4+Jj4xeIeX7ZxO8oAt4rxBiqap4=;
	b=2W+jy0weXsvk4oKeqgZQqyiQI1YpLA/HI/rmZ1LqGPzhD7YNgATnCvpQKg7cM6wt4q/O
	 p1e0jkQJBohmC6psaczpLyPs52FW+SzVzSza2LjeO14HTGXzp2Ejuc7XZQmrRq9QoHmpk
	 0BcNbnFfaYFJ2nNEZAuXkFzBQbgGmUry5ovi46LbDB7k/srLMd/fnNB6tm9ABHlEh/Cse
	 v4Bh0yQ6fE74Glqzsb5vfwsyMIKn0kwkkFqGR2LclqwkIsVGyRijcRZrkCwici82EruqF
	 onjroQcNZeDoDCZ8r+oCqNiB/HSpCg3835exdXdcnZ9j6eEiNSXON6zYVJliS448Axw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NHPLPVLj;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BC606A322
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE0BC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NHPLPVLj
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea0efd636dso21809915ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009444; x=1793614244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/F76kbgYrpKb0Fn4+Jj4xeIeX7ZxO8oAt4rxBiqap4=;
        b=NHPLPVLjBuxEDxP9nmgU1oHxRBN7CvVOj4xH+y8VQv88eqjtKIQYKESxzMHTKBR6R1
         89+PkYVAi9R7r3Emo8cozIAm/i1dTyu0nS25+i9BoW6tSTTZLu2pHcVZysJzulzoiXxa
         ela1oj/z7+QX/mHFo/FOdG2lBOUSZ+62IU5lci9H2zeEHcJottoDaKmjr5ONStI9OOFy
         GDf3KpIv+uONTseuVTSZWITe17bz4cf6c2TZmZNUhf5ICsHo7lKqCCbuht0l5jyOmm1v
         j6Fa0zeexNWIjXPo4heL66p0nuL9nolW1fML8bc3FyNVEQ9wi4KsheaocDEf9wiou1yG
         HvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009444; x=1793614244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/F76kbgYrpKb0Fn4+Jj4xeIeX7ZxO8oAt4rxBiqap4=;
        b=PFeEL+K2YXWSAHxDEySOTPT/T146j3rZzzC3lQmnNjk0KWRdSMqefzFlTNk+ZInXjV
         qssoUhPZaJsbMtNyujllh3+gUdLHqNweuiQdmVCSvfxghrQI8x3g3vX3URAtcKyc4Llw
         PH3Q787VwkPm717y1y68kJH+PxL1+wCNTU8pqUqx3V5R3Kou19xkLA9baliAzD92MvjR
         CTj6b3/guMvifIYO2GZ3pg7TK313O0sjeVoIo3aK9DkAxuLHTEmpgPwpMX9WDKqQ4XJw
         FD0W5XRDFOwfGAw5N4iN/QZjTgg2tjhhn+ax0RQVLoeFaOc6+2c6G75UGHdRWMemSjWT
         gOcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm8PLoZ9GzwNkWMdxh0RIKMeUHIDDAqaZXVoEsKxkTIqB1c6oGjhUgH8tFlBINh5QSJTHGC6Z5ZcshmqWo0Ueic67G@vger.kernel.org
X-Gm-Message-State: AFq9FYIa2lxFHtQ79zT17VfR0dTe2Mfj9L4oEgjCSt2XjAnn0WL1FYDo
	eizkTuMP0e6rttIkW1GUTNOF+jd7ErXSJDcT17AI8RAD44NlijVapBko
X-Gm-Gg: AYBFou3/FmrZFu93OVs/m9SK1T9xBzEv2WPv4z2u/7oWv9Gwga+SQxDjKgQUHpDNt41
	g9mdbzLy7J1icDe+W/ersllrGCUOCUOtz0uGGN+SVPALFyHtGkNJRFGyIaRGHG+JA8uvAwlAQwv
	QHu7e6GI+yq8GPCfEJ9lDtehC5hhG6ABWOrEgfym9nO8qNr8tomyy/cLyUoaGBbDfs8lHMIBfD/
	IbmSe801Om7CE9eOqvOmiuEBxhfkho+3s6VzBdGLRhZGZ5gsr1vc/yNOejKFJ6oM5qV0z+DPmOO
	uj5VnIY39fIgC35hf71ZUo85qlBt0jQnvw4r1pJSyebepNInOQaodv2kG/PBka+i3UPi8B6TKKd
	D3ptaTjZIaofchzGKt22VS+Eqlv8rdnX03JM1SQxutubxUtWAis/CGjk9LPlSupOfJGinW/bx+e
	efWctyxgHi+nyZdzxJ5gnbRbcamoXvOTgRlyeBThP6A+O+JMwWRXYMn/ktB2YRfG8YSOXDCnUK4
	WzlzEPC927etGgJCx21iz1tJfmDin4VFx+e5w==
X-Received: by 2002:a17:903:3c28:b0:2e8:795d:34f7 with SMTP id d9443c01a7336-2ea9c7cee78mr55610325ad.28.1793009444209;
        Mon, 26 Oct 2026 03:10:44 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1e52f3sm14586065ad.67.2026.10.26.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:43 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 5/6] platform/x86: bitland-mifs-wmi: Add quirks table
Date: Mon, 26 Oct 2026 18:09:26 +0800
Message-ID: <20261026100927.217643-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026100927.217643-1-qby140326@gmail.com>
References: <20261026100927.217643-1-qby140326@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIFS WMI interface is shared by several Bitland ODM laptops which
differ in the layout of the performance mode values of
WMI_FN_SYSTEM_PER_MODE and in the capability checks.

Introduce a quirks table to support multiple machine families without
sprinkling model checks over the driver.

Tested-by: Chris Taraszka <chris@miget.com>
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 178 ++++++++++++++++--------
 1 file changed, 121 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 0d7815c2faf9..3f8f1ebb10fb 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
+#include <linux/dmi.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
 #include <linux/err.h>
@@ -84,6 +85,38 @@ enum bitland_mifs_power_profile {
 	WMI_PP_FULL_SPEED	= 3,
 };
 
+struct bitland_mifs_wmi_data;
+
+struct bitland_profile_entry {
+	enum platform_profile_option profile;
+	u8 wmi_val;
+	bool no_set;
+};
+
+struct bitland_mifs_quirks {
+	const struct bitland_profile_entry *profile_entries;
+	size_t num_profile_entries;
+
+	bool return_code_at_end;
+	bool skip_ac_type_check;
+};
+
+static const struct bitland_profile_entry default_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,            WMI_PP_QUIET },
+	{ PLATFORM_PROFILE_BALANCED,             WMI_PP_BALANCED },
+	{ PLATFORM_PROFILE_BALANCED_PERFORMANCE, WMI_PP_PERFORMANCE },
+	{ PLATFORM_PROFILE_PERFORMANCE,          WMI_PP_FULL_SPEED },
+};
+
+static const struct bitland_mifs_quirks default_quirks = {
+	.profile_entries = default_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
+};
+
+static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{}
+};
+
 enum bitland_mifs_event_id {
 	WMI_EVENT_SWITCHVIDEOMODE	= 1,
 	WMI_EVENT_SELECTIVE_SCREENSHOT	= 2,
@@ -131,12 +164,24 @@ struct bitland_mifs_input {
 	u8 payload[28];
 } __packed;
 
-struct bitland_mifs_output {
+struct bitland_mifs_output_head_rc {
 	__le16 return_code;
 	__le16 function;
 	u8 data[28];
 } __packed;
 
+struct bitland_mifs_output_tail_rc {
+	__le16 function;
+	u8 data[28];
+	__le16 return_code;
+} __packed;
+
+union bitland_mifs_output_buf {
+	struct bitland_mifs_output_head_rc head;
+	struct bitland_mifs_output_tail_rc tail;
+	u8 raw[32];
+};
+
 struct bitland_mifs_event {
 	u8 event_type;
 	u8 event_id;
@@ -166,27 +211,41 @@ struct bitland_mifs_wmi_data {
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
+	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 				 const struct bitland_mifs_input *input,
-				 struct bitland_mifs_output *output)
+				 struct bitland_mifs_output_head_rc *output)
 {
 	struct wmi_buffer in_buf = { .length = sizeof(*input), .data = (void *)input };
 	struct wmi_buffer out_buf = { 0 };
+	const u8 *payload_data;
+	__le16 return_code;
+	__le16 function;
 	int ret;
 
 	guard(mutex)(&data->lock);
 
 	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf,
-				   sizeof(struct bitland_mifs_output));
+				   sizeof(union bitland_mifs_output_buf));
 	if (ret)
 		return ret;
 
-	struct bitland_mifs_output *result __free(kfree) = out_buf.data;
+	union bitland_mifs_output_buf *result __free(kfree) = out_buf.data;
+
+	if (data->quirks->return_code_at_end) {
+		return_code = result->tail.return_code;
+		function = result->tail.function;
+		payload_data = result->tail.data;
+	} else {
+		return_code = result->head.return_code;
+		function = result->head.function;
+		payload_data = result->head.data;
+	}
 
-	switch (le16_to_cpu(result->return_code)) {
+	switch (le16_to_cpu(return_code)) {
 	case WMI_RETURN_CODE_SUCCESS:
 		break;
 	case WMI_RETURN_CODE_UNKNOWN_FUNCTION:
@@ -195,11 +254,19 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 		return -EIO;
 	}
 
-	if (result->function != input->function)
+	if (function != input->function) {
+		if (function == 0 && input->operation == cpu_to_le16(WMI_METHOD_SET))
+			goto fn_ok;
+
 		return -ENOMSG;
+	}
 
-	if (output)
-		memcpy(output, result, sizeof(*output));
+fn_ok:
+	if (output) {
+		output->return_code = return_code;
+		output->function = function;
+		memcpy(output->data, payload_data, sizeof(output->data));
+	}
 
 	return 0;
 }
@@ -208,45 +275,41 @@ static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
-	struct bitland_mifs_output result;
+	struct bitland_mifs_output_head_rc result;
+	size_t i;
 	int ret;
 
 	ret = bitland_mifs_wmi_call(data, &input, &result);
 	if (ret)
 		return ret;
 
-	switch (result.data[0]) {
-	case WMI_PP_BALANCED:
-		*profile = PLATFORM_PROFILE_BALANCED;
-		break;
-	case WMI_PP_PERFORMANCE:
-		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
-		break;
-	case WMI_PP_QUIET:
-		*profile = PLATFORM_PROFILE_LOW_POWER;
-		break;
-	case WMI_PP_FULL_SPEED:
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
-		break;
-	default:
-		return -EINVAL;
+	for (i = 0; i < quirks->num_profile_entries; i++) {
+		if (quirks->profile_entries[i].wmi_val == result.data[0]) {
+			*profile = quirks->profile_entries[i].profile;
+			return 0;
+		}
 	}
-	return 0;
+
+	return -EINVAL;
 }
 
-static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
+static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
 {
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_AC_TYPE),
 	};
-	struct bitland_mifs_output output;
+	struct bitland_mifs_output_head_rc output;
 	int ret;
 
+	if (data->quirks->skip_ac_type_check)
+		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
+
 	/* Full-speed/performance mode requires DC power (not USB-C) */
 	if (!power_supply_is_system_supplied())
 		return -EOPNOTSUPP;
@@ -269,47 +332,42 @@ static int laptop_profile_set(struct device *dev,
 			      enum platform_profile_option profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_SET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
+	size_t i;
 	int ret;
-	u8 val;
 
-	switch (profile) {
-	case PLATFORM_PROFILE_LOW_POWER:
-		val = WMI_PP_QUIET;
-		break;
-	case PLATFORM_PROFILE_BALANCED:
-		val = WMI_PP_BALANCED;
-		break;
-	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
-		ret = bitland_check_performance_capability(data);
-		if (ret)
-			return ret;
-		val = WMI_PP_PERFORMANCE;
-		break;
-	case PLATFORM_PROFILE_PERFORMANCE:
-		ret = bitland_check_performance_capability(data);
+	if (profile == PLATFORM_PROFILE_PERFORMANCE ||
+	    profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE) {
+		ret = bitland_pp_check_capability(data);
 		if (ret)
 			return ret;
-		val = WMI_PP_FULL_SPEED;
-		break;
-	default:
-		return -EOPNOTSUPP;
 	}
 
-	input.payload[0] = val;
+	for (i = 0; i < quirks->num_profile_entries; i++) {
+		if (quirks->profile_entries[i].profile == profile &&
+		    !quirks->profile_entries[i].no_set) {
+			input.payload[0] = quirks->profile_entries[i].wmi_val;
+			return bitland_mifs_wmi_call(data, &input, NULL);
+		}
+	}
 
-	return bitland_mifs_wmi_call(data, &input, NULL);
+	return -EOPNOTSUPP;
 }
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
 {
-	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
-	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	struct bitland_mifs_wmi_data *data = drvdata;
+	const struct bitland_mifs_quirks *quirks = data->quirks;
+	size_t i;
+
+	for (i = 0; i < quirks->num_profile_entries; i++) {
+		if (!quirks->profile_entries[i].no_set)
+			set_bit(quirks->profile_entries[i].profile, choices);
+	}
 
 	return 0;
 }
@@ -366,7 +424,7 @@ static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 	};
-	struct bitland_mifs_output res;
+	struct bitland_mifs_output_head_rc res;
 	int ret;
 
 	switch (type) {
@@ -455,7 +513,7 @@ static enum led_brightness laptop_kbd_led_get(struct led_classdev *led_cdev)
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_RGB_KB_BRIGHTNESS),
 	};
-	struct bitland_mifs_output res;
+	struct bitland_mifs_output_head_rc res;
 	int ret;
 
 	ret = bitland_mifs_wmi_call(data, &input, &res);
@@ -480,7 +538,7 @@ static ssize_t gpu_mode_show(struct device *dev, struct device_attribute *attr,
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_GPU_MODE),
 	};
-	struct bitland_mifs_output res;
+	struct bitland_mifs_output_head_rc res;
 	u8 mode_val;
 	int ret;
 
@@ -534,7 +592,7 @@ static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_RGB_KB_MODE),
 	};
-	struct bitland_mifs_output res;
+	struct bitland_mifs_output_head_rc res;
 	u8 mode_val;
 	int ret;
 
@@ -712,6 +770,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT,
 		.devname_mandatory = true,
 	};
+	const struct dmi_system_id *dmi_id;
 	int ret;
 
 	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
@@ -726,6 +785,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, drv_data);
 
+	drv_data->quirks = &default_quirks;
+	dmi_id = dmi_first_match(bitland_mifs_dmi_table);
+	if (dmi_id)
+		drv_data->quirks = dmi_id->driver_data;
+
 	if (dev_type == BITLAND_WMI_EVENT) {
 		/* Register input device for hotkeys */
 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
-- 
2.56.0


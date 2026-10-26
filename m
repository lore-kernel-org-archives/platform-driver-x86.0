Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010120;
	b=vHye1v4ztL72CJBeiuhItsustPs/HZXxcLXq2N/AsQjfd+6H5QCsgAbffM/GOeLJP8lf
	 3aYfmEEgttRQHie5Q7W/OVzKI8mOGVChlr9lZsSo17dn36lnpv/ydS/AftNjdjH6EiVQn
	 9CP5WQ4gPQrAm8bdxE4fD0alznHgcuNw2KCSNhcTyak2XJDjHMMjwYrYR9SLpBIBJCaDS
	 ttEdekyEkuG8erh5mcaqhHwYMrwZHInwnVHX9aK+lg+ymeS1ec/U1KhSwwYocBEtC3FwU
	 ARvHwMnK3mbn01jR3hKnqb7rukZa4tQpbmJk7NKsAlO3MRB3hbBujdyWQsxDF4rdDwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j/F76kbgYrpKb0Fn4+Jj4xeIeX7ZxO8oAt4rxBiqap4=;
	b=PEvok3PNBc8C7w3mCu5kLyLscvljiN+7qXkqjdIoJpLtsHM/vIkqPzByxE4mYpCtUXxr
	 m8S5XrBG0hkUv12RMqw1qRxxJF1ts2XICllKaRTqt/3rzBDAvljlzfOt90MNb9HGc5wFB
	 rGzJxKxNEOnQRL4NABi754cpYmygLHdSnl6RVjDEbT7GGo9CT42IEoHYfKypnKxz5ppts
	 oeXWgedi2gAMFwyIN5NVJx68AOuROZfWbMvHSo2BMCeKc7HXg7ePohckv7s56F3IN6V2N
	 g+2FcHdObonN+V5t7W5cKIlHh65X57fj4IpCzDgwK6YyZHKitvQ2Bf5WHuwyklIfHvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W8+u/5mR";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BCC606A333
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BCC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W8+u/5mR
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1725345a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010119; x=1793614919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/F76kbgYrpKb0Fn4+Jj4xeIeX7ZxO8oAt4rxBiqap4=;
        b=W8+u/5mRZrSrA1bRgPzHdGG+TrkBg+N4ooyZ+kPeUjdnRwfeBrqKIAjrsDvDQTO3N8
         sA2OtaWh+yOTG074+ngEMzgwrSIh5Pfo0hD2BKDbKvfXxujXpHFfcJ6qFXTvRzzTsxKT
         LNU5jQEpX/ByaPH8PMi8DwtZfnbM43fF9fJuuWB3jxJqfVEwHkcIBVFuURDtx3AWsXGO
         EkXxL/6IX9Ux1rkIZBDQ2lmGmIuIgIBcZ6B06mipFFaa4uYc8vMPpx1RgrFSDVPnVr2E
         ZVrfTYdqXN23O7NzJNwMzS0UDli46lOTAVuK3035lHQFIKAigbNH/SwXIE43cH2b7/p7
         tYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010119; x=1793614919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/F76kbgYrpKb0Fn4+Jj4xeIeX7ZxO8oAt4rxBiqap4=;
        b=KnDC1akfBAzDZbT/f5NUI5iR1TN/lnaLgDMAcEHnP7fkglCjBUABhrTwBt9xlohcpW
         8fevvStvuVqaR7gPJXbH9lwapjF8xqkTMPX2NPuHXqvgMSDlbL8ObytZej136AdJ1WS/
         wzo8DQmYNyWqzFPrJmvipqCSKM3x/1kt9KhKm+gWmlEkLfGFH0PYQMQ/U0xihLGWoMbB
         9kaWjlfGp9AcH7sY3sWuJeHRlo0XImtcsFR5Yd/yV5+DIKG6YlK8XbqraJ4j7xjUO9bi
         S12P/dYhCa79IZ585bOQ0azaY5Ww36wLSGTdFn5n7rh4u03IBi6E2QoQjCNvXihAM96U
         9cRw==
X-Forwarded-Encrypted: i=1; AKwUvBwfGKj8cZfW/ysy+jUSnYV/jZ/WG5x0+qN3dQuodiEVyk2mIavSgFzt5eJ9XD7jmTtDHcbvz9Rvvaj5gaW4mGCJiUiO@vger.kernel.org
X-Gm-Message-State: AFq9FYIRjl+hdnaTZ74tfdlvOpLQAMnUeuHKFZWhTn/rEFXbKGHwrG6Q
	JIPZnDl8A9Cmy6rJFvW3e5ajNKARH8k9v3PB6w7/aV8qaRZpTuY5dSDJ
X-Gm-Gg: AYBFou2DLle+iAahLLvZjnEKMlQ/fVDIgAUk61ED4Zwut3MwqVun7OPyvbFKCmqlc3A
	RGtb3H5r+wqzuBH8Qjd2arToQWCtnWUMFPpGzwDaJF2y6ceIMb7QR9Br8k15NMRu/FARAZWr/4f
	aRKrSKRhDqksfeg22d+fAZLoJTCgJF8c6gj6hMbZvLjfcRWeb0EbbtqdMFgJjnPImSTjMwx8xcP
	OCAgGJBfHiB6wAi1u7SejCbQJTV/6q9w7teaJwm/I1m8bTbr9GICX7rbVMGV9AiqfZAPjQwsJH5
	9W8V6XWxv8bfBYSGliOCeWH+Zqm77BeEM16V0hnW3LvfHN/wqVKGiiHYb7BCl5Vz41+FCAXBl/t
	sFOnTFNdx6mBkkbkb89TKDPFPOepGURiRXqIvBrFUE+iRfpzS/9vwnREs9mSeCUvGV7Mexi1LYx
	i6XABTgg5knTasuWvIfTncBtBB7E+ICVTalIPA5HsgWW8Gi13EogWtdyky5iHus8uDzsgWTFLtj
	vgKZ8s73WSaka+VYf+zvOdtnI3iZzbVbpV9KQ==
X-Received: by 2002:a17:90b:3e89:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3adeb550e43mr3395769a91.14.1793010119196;
        Mon, 26 Oct 2026 03:21:59 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:58 -0700 (PDT)
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
Date: Mon, 26 Oct 2026 18:21:00 +0800
Message-ID: <20261026102101.224568-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026102101.224568-1-qby140326@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
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


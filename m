Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB93E959A
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774998113; cv=none; b=munkL15LA+vdMvXcY/qMdAhnhUo8GlmJfEUpaHi0TGHnzY4IrmqJDblLrpqbD82hoDFue7SJmHfRKaZ9dRzpdg2fhOZ0EqpExBYPT5ZS0JR4AE98x0g6OIJmrGXqHA95rmJFYLGI+uuqgXArMVfO7pe/Vxb9gAp99a+QQeyXng0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774998113; c=relaxed/simple;
	bh=CJ6+HJlQYyDECpRgJL4CbD+sc7eZDsyDCg50t18Y1zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNm0KEW1VP+SYodd2YXEnMe4KD78N/OoR4B8qhps+0Uo7/BWdb2brscGnyqdlzj3RQaMYkoUyZtP7+bjygtKUIVni5W/6fpr92udmjdvqPZmuUKVI+yaboKdi2/ArIS60xWGEDpkZ3lc8uV77j681O8KfauhItWky7eBrX2t2zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8HD1jrq; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8HD1jrq"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso2471750e0c.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 16:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774998111; x=1775602911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXj6psxl9yBoqC84nEYP2bvo2CztyINw8eq6uGB/RQc=;
        b=K8HD1jrqOb/OKTBgutuNvaAjSl0IeYPGRC2nJTlVB7oSomwBAOFOGrUWJpb2kBiXHX
         XaSlLPE/L4mYsM+6KMd5gxX2n84aXm10MiM6LqD6e/WtsEgqP6otZP8OLbopB6MZ7V4Z
         NRm7knGhSRMLFMzQhCcDBn1dQh1RcjQeeNhLF1mNAQ50UZmyVlZL6gkM9dQSjgLeh1Ua
         8Wf6EqC5RUswBuZQHvWCDHykb4gvT5AfG4pjS+0egpvWoVgM/9SQ60HJmwmfdOh+guoF
         NoRadf0Z0IHrxkfsy5SyuXsad+B8g1mhpI/J67KQmIUJLqVPd6yURjNirSy0j8cUZHsV
         7RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774998111; x=1775602911;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XXj6psxl9yBoqC84nEYP2bvo2CztyINw8eq6uGB/RQc=;
        b=oc/oaQ0KOOHHCBW5v7x2HrBrIrMiLh2AW42lH6w4saRE5wZ3CqpM1t5aMfTmk0lMI8
         eLDzGZtDQFsCGIEyZfcBUHzGXG2v3j7LxJ5E1++g804U3YAAG2gLmVOt3VhkcLkyvn4q
         bzZSW8KUtFW10FSFtN7FMTgzWyPNcYy5c7wNtsxZnTP2vMwy0pxo6SmsBDwLVcCuiHem
         Xsv3J50sqJ3qXbDbKt1GUQmBIdrm7aAhRPbbKZdeN4s4ZIAGldbu5v4L1J0234wraDoo
         +tLaGu/Cw3wW0KcXa3f4lnkE0Bo8rVkFC0t70BBpLr+pLHNNdMcmZTiagOCDSH3AIFPc
         4n5w==
X-Gm-Message-State: AOJu0YyxyUHcVXuF1lF5bvKcga4xCI/v8Gj5mJeQfR2QW0S2oV9ghBZA
	aJsMvCI861wYSguTqZfElPcilFuqvlroQawmEuxdOWFi3zC2Ai6vWcMt
X-Gm-Gg: ATEYQzxFtaVBhvK52aiIreBlYWH1TEtQrEyi7i1bZNMVxBbP/1q/3whLXNMM1rQa950
	YR92bGNIEJ996+C612NJMNY499eiVMXpLXkoRJEc4kYXGkTq+CIuFW6eEOmRkYPj3stFtLUiKhp
	F+pESeByhlHphzNUdtiTNx+VATV24hPMZuHa3MwNajjjdGz0O0PvAcLQ289SJwkkEqy5hbIgFC6
	MrXQq9kBemmscctpfLlmpFvlvSmcS4xYn+nknGIL18E8rt5fRNVRYZ1JbUkpgHiJ1oceVDwu/fF
	wwkpkb5FPUi+1J5XOnYvtDnes7k15hI08eCrob/I9C1LbqPPBINIwg9I0CoYGT1lgCO//p4oxj+
	FiZakmP7aaGlqFW1T7r3h1T7sA7L2yNX+sI45WqMiQP9Mm00TDRvyLbEl/70kaq/94cERUYzf1A
	w5AtXb/8Ntq7kH5qEF8hw4n7n/OrrUBO/C4Cz4
X-Received: by 2002:a05:6122:2a04:b0:56c:ca50:e963 with SMTP id 71dfb90a1353d-56d8a948263mr742917e0c.14.1774998110891;
        Tue, 31 Mar 2026 16:01:50 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:8c1b:8512:ab64:bee:7831])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893cf2sm13960947e0c.4.2026.03.31.16.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 16:01:50 -0700 (PDT)
Date: Tue, 31 Mar 2026 20:01:47 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
Subject: [PATCH] platform/x86: asus-wmi: fix camera key led on Zenbook S14
Message-ID: <acxSW8FgXbnFiqIL@djouze-zen>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Fix key led not turning on/off when the camera key is pressed. The
asus_wmi_dev_is_present(ASUS_WMI_DEVID_CAMERA_LED) check fails on
Zenbook S14, and no sysfs attribute for the camera key led is
created.

The check succeeds for ASUS_WMI_DEVID_CAMERA_LED_NEG, though,
and when it is read, the led state is synchronized. By doing a read after
every key press, the led is guaranteed to stay in sync with the actual
camera state.

This change is not visible to userspace, as no sysfs attribute for
ASUS_WMI_DEVID_CAMERA_LED_NEG exists.

Tested on an ASUS Zenbook S14 with BIOS version UX5406SA.309.

Signed-off-by: José Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 21 +++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 0b87214ddd1b..a50a2a6cee98 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -70,6 +70,8 @@ module_param(fnlock_default, bool, 0444);
 #define NOTIFY_KBD_TTP			0xae
 #define NOTIFY_LID_FLIP			0xfa
 #define NOTIFY_LID_FLIP_ROG		0xbd
+#define NOTIFY_CAMERA_TOGGLE_1          0x82
+#define NOTIFY_CAMERA_TOGGLE_2          0x85
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -307,6 +309,7 @@ struct asus_wmi {
 	u32 kbd_rgb_dev;
 	bool kbd_rgb_state_available;
 	bool oobe_state_available;
+	bool camera_neg_led_available;
 
 	u8 throttle_thermal_policy_mode;
 	u32 throttle_thermal_policy_dev;
@@ -1982,6 +1985,18 @@ static int micmute_led_set(struct led_classdev *led_cdev,
 	return err < 0 ? err : 0;
 }
 
+static bool is_camera_toggle(int code)
+{
+	return code == NOTIFY_CAMERA_TOGGLE_1 || code == NOTIFY_CAMERA_TOGGLE_2;
+}
+
+static void camera_neg_led_trigger_update(struct asus_wmi *asus)
+{
+	u32 result;
+
+	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG, &result);
+}
+
 static enum led_brightness camera_led_get(struct led_classdev *led_cdev)
 {
 	struct asus_wmi *asus;
@@ -4587,6 +4602,11 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
 		return;
 
+	if (is_camera_toggle(code) && asus->camera_neg_led_available) {
+		camera_neg_led_trigger_update(asus);
+		return;
+	}
+
 	if (!sparse_keymap_report_event(asus->inputdev, code,
 					key_value, autorelease))
 		pr_info("Unknown key code 0x%x\n", code);
@@ -5062,6 +5082,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
+	asus->camera_neg_led_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
 		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 554f41b827e1..1a9349da6069 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -56,7 +56,7 @@
 #define ASUS_WMI_DEVID_MICMUTE_LED		0x00040017
 
 /* Disable Camera LED */
-#define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 = on (unused) */
+#define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 = on */
 #define ASUS_WMI_DEVID_CAMERA_LED	0x00060079 /* 1 = on */
 
 /* Backlight and Brightness */
-- 
2.53.0


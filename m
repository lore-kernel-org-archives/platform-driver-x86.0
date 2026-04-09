Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4114639A818
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 23:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775778337; cv=none; b=mONbH2bHBuOOY/reTmN65/J1XfJd9zalQdROvIYh5c1On7wkIwlG2gndSv+iv1RY2PmOP5YIvMfMJsXq0ZpI0czpfLqghBJde6ZSLFc0f7uOPzz/hjrAFJzX/o/6WZPNjfvtPs2jRlmi8jCBuNWwESc++YvEpaYhjWPLFhGM5gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775778337; c=relaxed/simple;
	bh=2P6zAm6CvXpFrFJgiACbPFdpEi37z8+x3+bAs63/Ca4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHxcfPYHUgUXwyYq93bZVw05QtEZuls5geNM2+UaJrFwE0ivXLtgKMchE3zYgz/JjyHXX4Ci/CLD+AkOG4j+ALGf3S0B2hADgIKqzbewK0r3io/y7Ik/g8xmYzBIAOHXecsyIyYPk7znE4E8sR8J0w36LXZDJS4wIY5Wb/QHpbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1TJOdu5; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1TJOdu5"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ce22328930so2083028eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Apr 2026 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775778335; x=1776383135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouN4F/CWT5cLpxIJDhPP//g5FL6B3nOG4Cx/O3IYmuI=;
        b=I1TJOdu5i1612JSmM8KAcM6gQ7OqADIjgHqYIILHcIbxoGZN9Wdsud3KY97qeyQQC9
         GBkK0mtlcb63nj+/I4WRjWT/O4dpJlvLPIu5mJWDmi5DE9G8TDK3EGXFjpewDOmzgJV1
         qUzvPbZosnQNx9yxuF4JQKst7UbpAATJynjmy05FOinG50b3z46h8b86b3n6hTe92/vq
         SgYVSAk5gRKttd9mfJ6ceIBYPAJEHal7jz4qddLh19ydMPfE33B5+C4AN2XZKYcTwtjN
         UkCWPOJQK1DVTiwloPJb6a2WV6D4x+JpKfBGAt90HHFi8d+i9umH9eGtevDAVROaX/xv
         4tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775778335; x=1776383135;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ouN4F/CWT5cLpxIJDhPP//g5FL6B3nOG4Cx/O3IYmuI=;
        b=itQJZj0zC4kTRrcJU0qou2obxVLvz9Se3ynm+t6xo6HhMMObPzkPTzzT+BJ3kvXUCx
         beKBLsS79ImifOXwBnqMmekshovGLtcFyZQyxUG9rVgCSSh8NrdXaC41KhMZYvb0k0xS
         P+zhOH+nzSB1Sr8V9A1Gv+X/R8GMDF5FQOQnLBQPKPeahdSC6HfVyKQIty5QxpKfVdZn
         6Op7WVivMgmr/vvkvRsGPosX7gIrOHrapYuNRorBJg4eeggYzzhdBzqD8WQWd9Wo0YU3
         ChEirDu2NGKnq83PyC9OK/UUYkTN/wFyvbcFxczCO7lwzl/9veyRTc6vLMt2UXdY5Idl
         iWoA==
X-Forwarded-Encrypted: i=1; AJvYcCV950r9Z9oiVFUvkf6xtEC8UzmsM87BoI6P1KyMur1IZLJjuu8jJHeKFUGyOEXX7QwH55rQpNyLProGPR2Uxjb8RyL2@vger.kernel.org
X-Gm-Message-State: AOJu0YyVsnZ3KPIIJ7AgNNVb3X0JLPa5ovqrB6ZPqhyBgDTwTnAvJAZi
	8uppbzcl+1xdSBd8lD2uGzAh0yHLibWVr9bLIa14FEPdz7lkI2xRJ37z
X-Gm-Gg: AeBDieuGhwik1adVSYJ3feoIMN1fVeNkrSzXI7aFUH5//uPH/n4P1sa20VEOfNNZTWI
	cIZhM5jD69u+TAscSF90SfFnUZ68T4mLZ11uypGjyPIs8IoXd7BXoPTkZfbnUg6lorCzm/nvJq+
	lahhUfbyXr/EouHUWKUvqGU0+5qwjc1wHfOqY+bN5bC2M0YrrdTNtW3CS6ONpg+4HHeSvmgPU/z
	g3UlK0hSjzrpn+QMfI5vV4mIHs4VMnQFSYfT/a9srZz1wAiVKWwmIpZis9bTxIxWI8A1yakXX2A
	MQYRYzDzl0FwMvmaWvAvcfPSc4u7JKAMY3RbP0tqMFKJHhzZ1YVO+GDbp5fMY0DoZUWJ8W0yyOC
	9DlRPD8DzLKT1MUNGMELPkL/S0m9nbnX5BBEGongVE4y2/WHucDKNH4VXGRrFVLUbszOP9VgUel
	9tzERklqObgLThgszNz/GQuRR9AIvRPmBIYydwGA==
X-Received: by 2002:a05:7301:4007:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-2d589cb5f67mr744336eec.23.1775778335278;
        Thu, 09 Apr 2026 16:45:35 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:8c1b:bd31:3c86:2fed:6c43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a64easm2076089eec.31.2026.04.09.16.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:45:34 -0700 (PDT)
Date: Thu, 9 Apr 2026 20:45:31 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: asus-wmi: fix camera key led on Zenbook S14
Message-ID: <adg6GzkykThAB_4u@djouze-zen>
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
Changes in v2:
 - Do not return after triggering the update.
 - Use tabs for indentation on new defines.
---
 drivers/platform/x86/asus-wmi.c            | 19 +++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 80144c412b90..32d0d4ce60ff 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -70,6 +70,8 @@ module_param(fnlock_default, bool, 0444);
 #define NOTIFY_KBD_TTP			0xae
 #define NOTIFY_LID_FLIP			0xfa
 #define NOTIFY_LID_FLIP_ROG		0xbd
+#define NOTIFY_CAMERA_TOGGLE_1		0x82
+#define NOTIFY_CAMERA_TOGGLE_2		0x85
 
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
@@ -4587,6 +4602,9 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
 		return;
 
+	if (is_camera_toggle(code) && asus->camera_neg_led_available)
+		camera_neg_led_trigger_update(asus);
+
 	if (!sparse_keymap_report_event(asus->inputdev, code,
 					key_value, autorelease))
 		pr_info("Unknown key code 0x%x\n", code);
@@ -5062,6 +5080,7 @@ static int asus_wmi_add(struct platform_device *pdev)
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


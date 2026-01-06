Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017F2D8390
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 22:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767737403; cv=none; b=VxuOjeqS9jc/PFUvmS8xjae/eMWM4pXAv7LjdJ1SMSnatI/eUa8iQFRkNZb8MGxDUIcv8e2h8xmVPLkS41VSSk5UAIu2SZB9ux79Z5UjUwo3zUT3ocnxHnc0DzXDcRCr3eYVn3LXH8+Drw4JHh8CsGA9igrubJrw44GBqmoEsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767737403; c=relaxed/simple;
	bh=fcpMvtgMT7GoElBxsRwGvsS1wELaQReb4mwUGcCWNKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QgcLEP+WTKXeiWpLIpgENIeQxWJARNiwKClMayUuWL/Y6nhAhtAAsv55ThprhTQXdLtCtgjvZnU39A+DlYtRJwUooh89FfyYXH/iMqvIf9aTOVyA3If/XCUrOcelOHRGyFZKAy1lQNzdSr7aYS93OCijQS+UG3kygo2mxfPpTo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LylHG7Du; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LylHG7Du"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso8435065e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jan 2026 14:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767737399; x=1768342199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+cRDnYnmJsvW4e1q+MXOokUh4bw3J2LGrswV3roVx3Q=;
        b=LylHG7Dud82FNIzSYjmOXVNFA7KFXdbfEdu6zDscjBWZ9uA7V/S1WiNBqQXmh/6wne
         dQxyejJhQIzqQjwfj7wn6NNcvtgOZzIYYGYwSpxHHhusKbHkFVn1qkL+uow1d0lxL0WY
         KGk2NKBwYNQPVZYBZIzwVTo9nW7eP3iMDGscWGTv44pnL9zTQDot4OnbfM+S1xQcWIaF
         azISCCkrHlbJadqbdsy2s+QFjlIPjHws6OJ/QFkew1IPrwFRNFOzJ0lzbFuXAjpVQYSc
         vJyol4IQ6tOASNJ+5okTzJmU4dnjMCbdLSv1J+KYXbI2nZfBBOhK8Oaz8ZZnDSyfXbLB
         Flnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767737399; x=1768342199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cRDnYnmJsvW4e1q+MXOokUh4bw3J2LGrswV3roVx3Q=;
        b=RAKIzsCP+JKcIsKUM+ZEBMi9gJtjxY4COSCnSbVKUrbXs2binuykgQGDOTPn/Vvr7s
         oqpsxqppp1MdxE2/cPb2SjUaVCV/OyVLOfGC0U0AEK6LQx9JS7gtmD+ReumqJKSx81P3
         O+Fri1ORJ9z5EjoVHlwqvY5zdRYyP1ik70w9JeVNbnzCPCFSdAqrcYawevu09dYUa8xy
         ZBJ4Q4uu25UK10iFiLBA5246xCKAkMrw6PaV1xp1hUCRXsJDoDkwVUth+Nm4P1njVKsc
         IvYVtFMgse8H6drL6Y3GokKppgHTNMsnV9XHvmidoC58g1zNAo3yPIbQIh4MdRumMbkL
         ky6g==
X-Gm-Message-State: AOJu0YwIaCJ5+W9clqo9N6r5Dwak8Rnb9wdwPeqZ7Ogd2tH34t0MW0Wc
	PSU2zMRk7USPqOLLmSSaCj3Zp+B/WZJFDS7V2l8+CEJzbYZ4RjfmjyHK
X-Gm-Gg: AY/fxX75N15Q8DsIfLc3vjE+kGVP6bpg875SZKCZl1PCpcU3lD5EiKEgFVFnqLld24R
	l+3WahdOhJV32t3zymiZ0vPgXYh4+q4OXGxv0e2Y0Y40Yn5yipTkEAIsYjbUH8IRyP80/qUQphj
	sdr0KswdOdCySmD2AhJyj3TAQSXrJ9fZJ+uh6eGDwqJC171xvy4JyITTPKPMF2l3niizi/vhqds
	+CMpiqHVAyHjd/O21chKsNcNPawmRmNtwOOqjL14mcqoo8tFV9rNmE8ZDHbkjF2bI6FlwNoQdJ8
	NYMFtuEuobVNVfFFk8dhgMEf1D6vLj3zCFY9dvTPxA/IEdjxujN5AqJWtN6Tz901O/w4YzT0lWs
	gxhrjnntbi1/83AM974RYmJjYo/kuvC1stj4KpCnp4d24N20prF0PwGXyc2n3zZbQ7UNUANUDXY
	/n6uvp7UGojqekBSZV+k9Azw0=
X-Google-Smtp-Source: AGHT+IHhwoKp4RkDXTHMKIODD167WvWfZ/h+Pfk1tlTSu3x6t/rvj9cOZ56e6qcWKOcadGkrJZ/usg==
X-Received: by 2002:a05:600c:8b52:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-47d84b1a348mr3616395e9.6.1767737399415;
        Tue, 06 Jan 2026 14:09:59 -0800 (PST)
Received: from jakob-laptop ([213.55.186.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f668e03sm65572525e9.14.2026.01.06.14.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 14:09:59 -0800 (PST)
From: Jakob <riemenschneiderjakob@gmail.com>
X-Google-Original-From: Jakob <jriemenschne@student.ethz.ch>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	ikepanhc@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jakob <jriemenschne@student.ethz.ch>
Subject: [PATCH v1] platform/x86: ideapad-laptop: Fix resume behavior for Lenovo Yoga 15ILL9
Date: Tue,  6 Jan 2026 23:09:49 +0100
Message-ID: <20260106220949.1518571-1-jriemenschne@student.ethz.ch>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Lenovo Yoga Slim 7 15ILL9, the Embedded Controller fails to restore
its state after resuming from suspend. This results in the cooling fans
remaining stopped (causing overheating), the keyboard backlight and
brightness keys becoming unresponsive, and the power button LED continuing
to pulse as if still suspended.

Testing shows that invoking the UPHK method with command 0x09 properly
resets the EC state. This single command restores fan control, fixes the
keyboard backlight and brightness keys and corrects the power LED behavior.

This patch adds a DMI quirk to invoke this method on resume.

Note: On this model, UPHK is located at \_SB.PC00.LPCB.EC0.UPHK rather
than the standard VPC2004 device, so we access it via its absolute path.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220505
Signed-off-by: Jakob <jriemenschne@student.ethz.ch>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 5171a077f..c9fec590a 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -43,6 +43,7 @@
 #include <dt-bindings/leds/common.h>
 
 #define IDEAPAD_RFKILL_DEV_NUM	3
+#define IDEAPAD_EC_UPHK_PATH "\\_SB.PC00.LPCB.EC0.UPHK"
 
 enum {
 	CFG_CAP_BT_BIT       = 16,
@@ -105,6 +106,10 @@ enum {
 	SALS_FNLOCK_OFF       = 0xf,
 };
 
+enum {
+	UPHK_FAN_RESUME = 0x9,
+};
+
 enum {
 	VPCCMD_R_VPC1 = 0x10,
 	VPCCMD_R_BL_MAX,
@@ -198,6 +203,7 @@ struct ideapad_private {
 		bool ctrl_ps2_aux_port    : 1;
 		bool usb_charging         : 1;
 		bool ymc_ec_trigger       : 1;
+		bool fan_mode_fix         : 1;
 	} features;
 	struct {
 		bool initialized;
@@ -246,6 +252,12 @@ MODULE_PARM_DESC(touchpad_ctrl_via_ec,
 	"Enable registering a 'touchpad' sysfs-attribute which can be used to manually "
 	"tell the EC to enable/disable the touchpad. This may not work on all models.");
 
+static bool fan_mode_fix;
+module_param(fan_mode_fix, bool, 0444);
+MODULE_PARM_DESC(fan_mode_fix,
+	"Enable fan-mode resume fix for laptops that stop cooling after sleep. "
+	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
 static bool ymc_ec_trigger __read_mostly;
 module_param(ymc_ec_trigger, bool, 0444);
 MODULE_PARM_DESC(ymc_ec_trigger,
@@ -2022,6 +2034,24 @@ static const struct dmi_system_id hw_rfkill_list[] = {
 	{}
 };
 
+/*
+ * On the Lenovo Yoga Slim 15ILL9, the EC fails to restore the fan control profile after
+ * resuming from suspend, causing the fans to stop working.
+ * On this model, the driver needs to explicitly reset the fan mode
+ * on resume.
+ * See https://bugzilla.kernel.org/show_bug.cgi?id=220505
+ */
+static const struct dmi_system_id fan_mode_fix_list[] = {
+	{
+	/* Lenovo Yoga Slim 7 15ILL9 */
+	.matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "83HM"),
+	},
+	},
+	{}
+};
+
 /*
  * On some models the EC toggles the touchpad muted LED on touchpad toggle
  * hotkey presses, but the EC does not actually disable the touchpad itself.
@@ -2185,6 +2215,8 @@ static int ideapad_check_features(struct ideapad_private *priv)
 	priv->features.touchpad_ctrl_via_ec = touchpad_ctrl_via_ec;
 	priv->features.ymc_ec_trigger =
 		ymc_ec_trigger || dmi_check_system(ymc_ec_trigger_quirk_dmi_table);
+	priv->features.fan_mode_fix =
+		fan_mode_fix || dmi_check_system(fan_mode_fix_list);
 
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
 		priv->features.fan_mode = true;
@@ -2517,6 +2549,28 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 	ideapad_debugfs_exit(priv);
 }
 
+static void ideapad_fan_mode_fix(struct ideapad_private *priv)
+{
+	acpi_handle handle;
+	acpi_status status;
+
+	if (!priv->features.fan_mode_fix)
+		return;
+
+	status = acpi_get_handle(NULL, IDEAPAD_EC_UPHK_PATH, &handle);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(&priv->platform_device->dev, "Could not find UPHK method for fan fix\n");
+		return;
+	}
+
+	status = acpi_execute_simple_method(handle, NULL, UPHK_FAN_RESUME);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(&priv->platform_device->dev, "Failed to execute UPHK fix: %s\n",
+			acpi_format_exception(status));
+		return;
+	}
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int ideapad_acpi_resume(struct device *dev)
 {
@@ -2528,6 +2582,8 @@ static int ideapad_acpi_resume(struct device *dev)
 	if (priv->dytc)
 		dytc_profile_refresh(priv);
 
+	ideapad_fan_mode_fix(priv);
+
 	return 0;
 }
 #endif
-- 
2.52.0


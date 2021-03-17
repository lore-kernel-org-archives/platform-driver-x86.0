Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B7EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 14:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75A3A64F67
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 14:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbhCQOEd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 10:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbhCQOEM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 10:04:12 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FEEC06175F
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 07:04:11 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u4so3307416ljo.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=KuGkTYBsx2xZQcvlbwACYZJD5cGL+onUZBf1otk12wE=;
        b=YQHvGb0mDQ48yoj/cZDsOk+/AbASjNN9hsK9h7XDdZ96TbquImooScdtsMvcSRaXXF
         uVAlWQlwlzAfk99obtf3wz+HWQaiThSkmjSGScWtr3KkgL1dGURJxe0BZj/qPZ7BH7Kt
         rJ7XfyzbSJx7L4SEpqyWrGTKQvp8KnnttvAz1LW9NWovbVERuepVj5gXQL2hjc3pV5BS
         ouHR8ALBjYnNXirPkvGL5Ahe8mnSGB89fPUrYl6aW1CxH6f5kVZLF6pOFu4V0QMENbHZ
         LrF7E1qKbATQER1VkDVfw/M2aYN1+xYRVh1wQrdHQM3lZO6Wv8EQR6FSH5xDYpCsEdRn
         5h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=KuGkTYBsx2xZQcvlbwACYZJD5cGL+onUZBf1otk12wE=;
        b=TWIE4xov36bWZcwIGaqKCj00rBwVQSSGC7N8YbLsi9q8XSjIwZygRJ7TUU65eUBLCm
         xbsVvERiG2U0bVpCYd3agjzlwPHcqH3SwcADIpXA6dvk6C2CRAhdnnJlgYgYoDh2Z1EA
         xPWUh16yMFUa1qPRlwlnFbTBU56zUNk7xOncKV8tbFc/II2aKlcHc/3TpGIecX9pfGjs
         kQho+GVmTMdrynUeNHXdn4lNbzRSEHIG3budvyuCJbZIs5DEa/1RF72gL8sh2QHQ0zQ5
         uDeREhcGwgPWhOhnKMILKzneEP9dmRD8vqruUN/3br1soc3PWX0qCpFnxaYA0ao12Ob+
         YbSA==
X-Gm-Message-State: AOAM531nzV8Do1IjHFEbCy34CxEdtBzUp4ALA0WIiri2hIcZmyJpaWeB
        AZUgRQaY7LF9vEQgyAH1LLFNSu1Csf8=
X-Google-Smtp-Source: ABdhPJwl8viYKSC6cz7Tc5JR3XkXUIenXD4fvNfhnieHadw4a6iBobUts18Iy7D3H9AL/KzoZee0NQ==
X-Received: by 2002:a2e:7c17:: with SMTP id x23mr2533963ljc.65.1615989850309;
        Wed, 17 Mar 2021 07:04:10 -0700 (PDT)
Received: from [130.238.51.50] (emp-51-50.eduroam.uu.se. [130.238.51.50])
        by smtp.gmail.com with ESMTPSA id k5sm3545151ljb.78.2021.03.17.07.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 07:04:09 -0700 (PDT)
To:     platform-driver-x86@vger.kernel.org
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com, linrunner@gmx.net
From:   Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
Subject: [PATCH 2/3] thinkpad_acpi: add support for inhibit_charge
Message-ID: <d2808930-5840-6ffb-3a59-d235cdb1fe16@gmail.com>
Date:   Wed, 17 Mar 2021 15:04:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Lenovo ThinkPad systems support to hold battery charging
via a manual override called Inhibit Charge.

This patch implements that feature and exposes it via the generic
ACPI battery driver in the generic location:

/sys/class/power_supply/BATx/inhibit_charge

Signed-off-by: Ognjen Galic <smclt30p@gmail.com>
Signed-off-by: Thomas Koch <linrunner@gmx.net>
Signed-off-by: Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 68 ++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 6c7dca3a10d2..a13feb1d7313 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9319,6 +9319,8 @@ static struct ibm_struct mute_led_driver_data = {
 #define SET_STOP	"BCSS"
 #define GET_DISCHARGE	"BDSG"
 #define SET_DISCHARGE	"BDSS"
+#define GET_INHIBIT	"PSSG"
+#define SET_INHIBIT	"BICS"
 
 enum {
 	BAT_ANY = 0,
@@ -9335,7 +9337,8 @@ enum {
 	/* This is used in the get/set helpers */
 	THRESHOLD_START,
 	THRESHOLD_STOP,
-	FORCE_DISCHARGE
+	FORCE_DISCHARGE,
+	INHIBIT_CHARGE
 };
 
 struct tpacpi_battery_data {
@@ -9344,6 +9347,7 @@ struct tpacpi_battery_data {
 	int charge_stop;
 	int stop_support;
 	int discharge_support;
+	int inhibit_support;
 };
 
 struct tpacpi_battery_driver_data {
@@ -9407,6 +9411,13 @@ static int tpacpi_battery_get(int what, int battery, int *ret)
 		/* The force discharge status is in bit 0 */
 		*ret = *ret & 0x01;
 		return 0;
+	case INHIBIT_CHARGE:
+		/* This is actually reading peak shift state, like tpacpi-bat does */
+		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_INHIBIT, ret, battery))
+			return -ENODEV;
+		/* The inhibit charge status is in bit 0 */
+		*ret = *ret & 0x01;
+		return 0;
 	default:
 		pr_crit("wrong parameter: %d", what);
 		return -EINVAL;
@@ -9445,6 +9456,22 @@ static int tpacpi_battery_set(int what, int battery, int value)
 			return -ENODEV;
 		}
 		return 0;
+	case INHIBIT_CHARGE:
+		/* When setting inhibit charge, we set a default value of
+		 * always breaking on AC detach and the effective time is set to
+		 * be permanent.
+		 * The battery ID is in bits 4-5, 2 bits,
+		 * the effective time is in bits 8-23, 2 bytes.
+		 * A time of FFFF indicates forever.
+		 */
+		param = value;
+		param |= battery << 4;
+		param |= 0xFFFF << 8;
+		if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_INHIBIT, &ret, param)) {
+			pr_err("failed to set inhibit charge on %d", battery);
+			return -ENODEV;
+		}
+		return 0;
 	default:
 		pr_crit("wrong parameter: %d", what);
 		return -EINVAL;
@@ -9465,6 +9492,8 @@ static int tpacpi_battery_probe(int battery)
 	 * 4) Check for support
 	 * 5) Get the current force discharge status
 	 * 6) Check for support
+	 * 7) Get the current inhibit charge status
+	 * 8) Check for support
 	 */
 	if (acpi_has_method(hkey_handle, GET_START)) {
 		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret, battery)) {
@@ -9505,12 +9534,17 @@ static int tpacpi_battery_probe(int battery)
 		if (!ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE, &ret, battery)))
 			/* Support is marked in bit 8 */
 			battery_info.batteries[battery].discharge_support = ret & BIT(8);
+	if (acpi_has_method(hkey_handle, GET_INHIBIT))
+		if (!ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_INHIBIT, &ret, battery)))
+			/* Support is marked in bit 5 */
+			battery_info.batteries[battery].inhibit_support = ret & BIT(5);
 
-	pr_info("battery %d registered (start %d, stop %d, force: %d)",
+	pr_info("battery %d registered (start %d, stop %d, force: %d, inhibit: %d)",
 			battery,
 			battery_info.batteries[battery].charge_start,
 			battery_info.batteries[battery].charge_stop,
-			battery_info.batteries[battery].discharge_support);
+			battery_info.batteries[battery].discharge_support,
+			battery_info.batteries[battery].inhibit_support);
 	return 0;
 }
 
@@ -9576,7 +9610,6 @@ static ssize_t tpacpi_battery_store(int what,
 			return -ENODEV;
 		battery_info.batteries[battery].charge_start = value;
 		return count;
-
 	case THRESHOLD_STOP:
 		if (!battery_info.batteries[battery].stop_support)
 			return -ENODEV;
@@ -9605,6 +9638,15 @@ static ssize_t tpacpi_battery_store(int what,
 		if (tpacpi_battery_set(FORCE_DISCHARGE, battery, value))
 			return -ENODEV;
 		return count;
+	case INHIBIT_CHARGE:
+		if (!battery_info.batteries[battery].inhibit_support)
+			return -ENODEV;
+		/* The only valid values are 1 and 0 */
+		if (value != 0 && value != 1)
+			return -EINVAL;
+		if (tpacpi_battery_set(INHIBIT_CHARGE, battery, value))
+			return -ENODEV;
+		return count;
 	default:
 		pr_crit("Wrong parameter: %d", what);
 		return -EINVAL;
@@ -9660,6 +9702,13 @@ static ssize_t force_discharge_show(struct device *device,
 	return tpacpi_battery_show(FORCE_DISCHARGE, device, buf);
 }
 
+static ssize_t inhibit_charge_show(struct device *device,
+				struct device_attribute *attr,
+				char *buf)
+{
+	return tpacpi_battery_show(INHIBIT_CHARGE, device, buf);
+}
+
 static ssize_t charge_control_start_threshold_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
@@ -9681,9 +9730,17 @@ static ssize_t force_discharge_store(struct device *dev,
 	return tpacpi_battery_store(FORCE_DISCHARGE, dev, buf, count);
 }
 
+static ssize_t inhibit_charge_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	return tpacpi_battery_store(INHIBIT_CHARGE, dev, buf, count);
+}
+
 static DEVICE_ATTR_RW(charge_control_start_threshold);
 static DEVICE_ATTR_RW(charge_control_end_threshold);
 static DEVICE_ATTR_RW(force_discharge);
+static DEVICE_ATTR_RW(inhibit_charge);
 static struct device_attribute dev_attr_charge_start_threshold = __ATTR(
 	charge_start_threshold,
 	0644,
@@ -9702,7 +9759,8 @@ static struct attribute *tpacpi_battery_attrs[] = {
 	&dev_attr_charge_start_threshold.attr,
 	&dev_attr_charge_stop_threshold.attr,
 	&dev_attr_force_discharge.attr,
-	NULL,
+	&dev_attr_inhibit_charge.attr,
+	NULL
 };
 
 ATTRIBUTE_GROUPS(tpacpi_battery);
-- 
2.25.1

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED78C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 14:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4960D64F70
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 14:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbhCQOBu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 10:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbhCQOBT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 10:01:19 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B1FC06174A
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 07:01:18 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u10so3288373lju.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=TU/XiH4G/Qe9yC5cuJLRt7/aTlv2y//0HTH/F4MsWZs=;
        b=Ca35Jv0WooEP8L7vG0EbdzaUel8ZgdhYIYvn/sDrxD1FWZtW8nZ8x2P+9TyOdpbtnm
         NVya4vkm1VpWrm4pE/PbHYhdArMVTI7nngx6RN+sRrbb/9ziLZKM7zp+I9bq+5dguFZ5
         17EaRI6xbRLAFaYBT/Tv60lDFNL/Gt97OgMhVtCYOJVMR2CyHl0hwLmukxpLlYTZ+ePD
         erXZE3HdkWmmoNYivMm/BhznhKOqe/KLLck2QUdyxANTw5ReD6D5B3oITifrZgyzrRld
         nsaNFrgZADZ5i3AOzXVfSYzKsIjNo5qwPRaxc2rpnl2M7Ur59AE7W0lyNFQM0A8KObOF
         qQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=TU/XiH4G/Qe9yC5cuJLRt7/aTlv2y//0HTH/F4MsWZs=;
        b=RZguWblTJ1jVgABqb4cxOiMcb+rsNaPZiseodGd0Njy/Z6ZdnMVxTt4bo5HgfuLSMF
         oZIT2pf/IsE4Df1f0zpLYm+RkztuLu3U9PAnA44N8k/pfNwyBt8p3bsUVXPFna9/PsIi
         8Ac2fYTnnvtvFHkuWkBNULXyBLbsq7JMrJ6D0IxYs/IRV4HHk/FGeKKqtlukyuyGfsuI
         KseoBdIxEhVoMVYm2TLgard+vO+ulNboqWgS7k5+TQRw/h4m6/8rt3TpuPj4f60s1+FL
         4avpucdk7m73Wn8E6cfsuGHpNgXD4GeCf5y4BxsaR86Cf1eUpXivECJ6Zy9+ew0R5H0Y
         IPfA==
X-Gm-Message-State: AOAM531e2Gys+Y/G486XYDZzge5hMPeVhNZE+2jSEguQjEJ5bPlMLul+
        /a5igwxYMBY96Z1t5/Q95cA=
X-Google-Smtp-Source: ABdhPJzUPpom+QzLvcQxYCfZ1cU19v3ZjedeANWcuzOEsrBEKoLyCxW5wlXENzclYKdqHAdb30sQIw==
X-Received: by 2002:a2e:9949:: with SMTP id r9mr2587179ljj.428.1615989672318;
        Wed, 17 Mar 2021 07:01:12 -0700 (PDT)
Received: from [130.238.51.50] (emp-51-50.eduroam.uu.se. [130.238.51.50])
        by smtp.gmail.com with ESMTPSA id 200sm3428824lfl.2.2021.03.17.07.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 07:01:11 -0700 (PDT)
To:     platform-driver-x86@vger.kernel.org
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com, linrunner@gmx.net
From:   Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
Subject: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
Message-ID: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
Date:   Wed, 17 Mar 2021 15:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Lenovo ThinkPad systems have a feature that lets you
force the battery to discharge when AC is attached.

This patch implements that feature and exposes it via the generic
ACPI battery driver in the generic location:

/sys/class/power_supply/BATx/force_discharge

Signed-off-by: Ognjen Galic <smclt30p@gmail.com>
Signed-off-by: Thomas Koch <linrunner@gmx.net>
Signed-off-by: Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 59 ++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9c4df41687a3..6c7dca3a10d2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9317,6 +9317,8 @@ static struct ibm_struct mute_led_driver_data = {
 #define SET_START	"BCCS"
 #define GET_STOP	"BCSG"
 #define SET_STOP	"BCSS"
+#define GET_DISCHARGE	"BDSG"
+#define SET_DISCHARGE	"BDSS"
 
 enum {
 	BAT_ANY = 0,
@@ -9333,6 +9335,7 @@ enum {
 	/* This is used in the get/set helpers */
 	THRESHOLD_START,
 	THRESHOLD_STOP,
+	FORCE_DISCHARGE
 };
 
 struct tpacpi_battery_data {
@@ -9340,6 +9343,7 @@ struct tpacpi_battery_data {
 	int start_support;
 	int charge_stop;
 	int stop_support;
+	int discharge_support;
 };
 
 struct tpacpi_battery_driver_data {
@@ -9397,6 +9401,12 @@ static int tpacpi_battery_get(int what, int battery, int *ret)
 		if (*ret == 0)
 			*ret = 100;
 		return 0;
+	case FORCE_DISCHARGE:
+		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE, ret, battery))
+			return -ENODEV;
+		/* The force discharge status is in bit 0 */
+		*ret = *ret & 0x01;
+		return 0;
 	default:
 		pr_crit("wrong parameter: %d", what);
 		return -EINVAL;
@@ -9425,6 +9435,16 @@ static int tpacpi_battery_set(int what, int battery, int value)
 			return -ENODEV;
 		}
 		return 0;
+	case FORCE_DISCHARGE:
+		/* Force discharge is in bit 0,
+		 * break on AC attach is in bit 1 (won't work on some ThinkPads),
+		 * battery ID is in bits 8-9, 2 bits.
+		 */
+		if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_DISCHARGE, &ret, param)) {
+			pr_err("failed to set force dischrage on %d", battery);
+			return -ENODEV;
+		}
+		return 0;
 	default:
 		pr_crit("wrong parameter: %d", what);
 		return -EINVAL;
@@ -9443,6 +9463,8 @@ static int tpacpi_battery_probe(int battery)
 	 * 2) Check for support
 	 * 3) Get the current stop threshold
 	 * 4) Check for support
+	 * 5) Get the current force discharge status
+	 * 6) Check for support
 	 */
 	if (acpi_has_method(hkey_handle, GET_START)) {
 		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret, battery)) {
@@ -9479,11 +9501,16 @@ static int tpacpi_battery_probe(int battery)
 			return -ENODEV;
 		}
 	}
-	pr_info("battery %d registered (start %d, stop %d)",
+	if (acpi_has_method(hkey_handle, GET_DISCHARGE))
+		if (!ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE, &ret, battery)))
+			/* Support is marked in bit 8 */
+			battery_info.batteries[battery].discharge_support = ret & BIT(8);
+
+	pr_info("battery %d registered (start %d, stop %d, force: %d)",
 			battery,
 			battery_info.batteries[battery].charge_start,
-			battery_info.batteries[battery].charge_stop);
-
+			battery_info.batteries[battery].charge_stop,
+			battery_info.batteries[battery].discharge_support);
 	return 0;
 }
 
@@ -9569,6 +9596,15 @@ static ssize_t tpacpi_battery_store(int what,
 		if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
 			return -EINVAL;
 		return count;
+	case FORCE_DISCHARGE:
+		if (!battery_info.batteries[battery].discharge_support)
+			return -ENODEV;
+		/* The only valid values are 1 and 0 */
+		if (value != 0 && value != 1)
+			return -EINVAL;
+		if (tpacpi_battery_set(FORCE_DISCHARGE, battery, value))
+			return -ENODEV;
+		return count;
 	default:
 		pr_crit("Wrong parameter: %d", what);
 		return -EINVAL;
@@ -9617,6 +9653,13 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
 	return tpacpi_battery_show(THRESHOLD_STOP, device, buf);
 }
 
+static ssize_t force_discharge_show(struct device *device,
+				struct device_attribute *attr,
+				char *buf)
+{
+	return tpacpi_battery_show(FORCE_DISCHARGE, device, buf);
+}
+
 static ssize_t charge_control_start_threshold_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
@@ -9631,8 +9674,16 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 	return tpacpi_battery_store(THRESHOLD_STOP, dev, buf, count);
 }
 
+static ssize_t force_discharge_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	return tpacpi_battery_store(FORCE_DISCHARGE, dev, buf, count);
+}
+
 static DEVICE_ATTR_RW(charge_control_start_threshold);
 static DEVICE_ATTR_RW(charge_control_end_threshold);
+static DEVICE_ATTR_RW(force_discharge);
 static struct device_attribute dev_attr_charge_start_threshold = __ATTR(
 	charge_start_threshold,
 	0644,
@@ -9645,12 +9696,12 @@ static struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
 	charge_control_end_threshold_show,
 	charge_control_end_threshold_store
 );
-
 static struct attribute *tpacpi_battery_attrs[] = {
 	&dev_attr_charge_control_start_threshold.attr,
 	&dev_attr_charge_control_end_threshold.attr,
 	&dev_attr_charge_start_threshold.attr,
 	&dev_attr_charge_stop_threshold.attr,
+	&dev_attr_force_discharge.attr,
 	NULL,
 };
 
-- 
2.25.1

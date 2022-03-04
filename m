Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB57C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Mar 2022 20:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiCDUeP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Mar 2022 15:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiCDUcc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Mar 2022 15:32:32 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B61C1E6EA9
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Mar 2022 12:31:35 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id bm39so7418414qkb.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Mar 2022 12:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ett/uv6sbqbFCZS9vI57Mx/wXVZkqvckGL/Cdf6KLho=;
        b=nWSGj8DThy/zbb99CAdWD6uTLncybbmO4Huf7f44x5LTAt4PzJ8f++dKpfXULsjdSd
         G6b3LQ04aP1EtEYHROV9IYoZlStdPWvAS0cRFvSMhfGJf7DhGUmNKFBp+hWOGwqattOo
         TT+2Hn3czT+Gt+iWpP1IZW6i/y3QtxepNZTDMz8ECbRh3ZbtYtJnS+MC89NV6xlzpr6m
         WKaB3Xlp4FeomPd9NEyEg4gk+t4/u2N5tngiO5Px1742OVJ9qf9qyhWB4Oo9mgxU0qQU
         weImFkft86K6R/CZ6m5O32f7BLQHCaA+LSU+viAURwLabaen7hBoex7T7FAk2eqaiIR9
         j9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ett/uv6sbqbFCZS9vI57Mx/wXVZkqvckGL/Cdf6KLho=;
        b=ZadecBg9EQim0M2HpjOAMnc4gxQ70PGBlUIWUorH/EPWPAY0T8tIgeW7ehc7BeBtOd
         q3YyMReEPVVivFFtsA5Gsw98h5wpFRy5FKZSL3bI/Ne/VExOlTjGs0nHgH118PecWZgt
         1deu6S/FuK2jen71SQPmLqwhv9ho3OcwpVA0X5SE7aS2NiVkxRN2KcwWY3sBKyq71LQ/
         km5eGEQX9DN23QdcMSWaopPwXNB8oLR64+8FbVSasWmxjGIVMNVnM0G8t+YJcFAm2oCt
         l1JxL5aUgaNOKzj1a98QTNnvYElCmIrsNCvBjTdMTPrsfftPn4v0NTdYdG9oOdY77mAd
         wrNA==
X-Gm-Message-State: AOAM532KmIDKoGwFViF6nklN3wSQSx3NAwqU+uEXLLQEZ4EYtYirOhCm
        RfUY+4VdLRaEtQu3K5TfL5cFtnobXlI=
X-Google-Smtp-Source: ABdhPJxUbYP5DcjMzVq0TI2av/40EPHNE6NVmDwFRaoizwhfYYJ0CggOtFQjvN526ugRyjVFI+K+YQ==
X-Received: by 2002:ae9:ef09:0:b0:506:aadb:1f1b with SMTP id d9-20020ae9ef09000000b00506aadb1f1bmr248566qkg.609.1646425893794;
        Fri, 04 Mar 2022 12:31:33 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:27a2:529c:40d3:26aa])
        by smtp.gmail.com with ESMTPSA id de18-20020a05620a371200b00662cf4b5631sm2974513qkb.23.2022.03.04.12.31.33
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 12:31:33 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/3] Fix 0x05 error code reported by several WMI calls
Date:   Fri,  4 Mar 2022 14:31:29 -0600
Message-Id: <20220304203130.43150-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304203130.43150-1-jorge.lopez2@hp.com>
References: <20220304203130.43150-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Several WMI queries leverage hp_wmi_read_int function to read their data.
hp_wmi_read_int function was corrected in a previous patch.  Now, this
function invokes hp_wmi_perform_query with input parameter of size zero
and the output buffer of size 4.

WMI commands calling hp_wmi_perform_query with input buffer size value
of zero are listed below.

HPWMI_DISPLAY_QUERY
HPWMI_HDDTEMP_QUERY
HPWMI_ALS_QUERY
HPWMI_HARDWARE_QUERY
HPWMI_WIRELESS_QUERY
HPWMI_BIOS_QUERY
HPWMI_FEATURE_QUERY
HPWMI_HOTKEY_QUERY
HPWMI_FEATURE2_QUERY
HPWMI_WIRELESS2_QUERY
HPWMI_POSTCODEERROR_QUERY
HPWMI_THERMAL_PROFILE_QUERY
HPWMI_FAN_SPEED_MAX_GET_QUERY

Invoking those WMI commands with an input buffer size greater
than zero will cause error 0x05 to be returned.

All WMI commands executed by the driver were reviewed and changes
were made to ensure the expected input and output buffer size match
the WMI specification.

Changes were validated on a HP ZBook Workstation notebook,
HP EliteBook x360, and HP EliteBook 850 G8.  Additional
validation was included in the test process to ensure no other
commands were incorrectly handled.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index a19f8b2b629e..ecf2a3a8ed78 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -320,7 +320,7 @@ static int hp_wmi_get_fan_speed(int fan)
 	char fan_data[4] = { fan, 0, 0, 0 };
 
 	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
-				       &fan_data, sizeof(fan_data),
+				       &fan_data, sizeof(char),
 				       sizeof(fan_data));
 
 	if (ret != 0)
@@ -380,7 +380,7 @@ static int omen_thermal_profile_set(int mode)
 		return -EINVAL;
 
 	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
-				   &buffer, sizeof(buffer), sizeof(buffer));
+				   &buffer, sizeof(buffer), 0);
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -417,7 +417,7 @@ static int hp_wmi_fan_speed_max_set(int enabled)
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
-				   &enabled, sizeof(enabled), sizeof(enabled));
+				   &enabled, sizeof(enabled), 0);
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -430,7 +430,7 @@ static int hp_wmi_fan_speed_max_get(void)
 	int val = 0, ret;
 
 	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, sizeof(val), sizeof(val));
+				   &val, 0, sizeof(val));
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -442,7 +442,7 @@ static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+				       0, sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -453,7 +453,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 	u8 state[128];
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+				       0, sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -531,7 +531,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err;
 
@@ -620,7 +620,7 @@ static ssize_t als_store(struct device *dev, struct device_attribute *attr,
 		return ret;
 
 	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
-				       sizeof(tmp), sizeof(tmp));
+				       sizeof(tmp), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
 
@@ -641,9 +641,9 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	if (clear == false)
 		return -EINVAL;
 
-	/* Clear the POST error code. It is kept until until cleared. */
+	/* Clear the POST error code. It is kept until cleared. */
 	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_WRITE, &tmp,
-				       sizeof(tmp), sizeof(tmp));
+				       sizeof(tmp), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
 
@@ -935,7 +935,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err < 0 ? err : -EINVAL;
 
-- 
2.25.1


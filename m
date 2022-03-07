Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632C4C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Mar 2022 22:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235685AbiCGWKb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Mar 2022 17:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238966AbiCGWKa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 17:10:30 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CE549FBD
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 14:09:35 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso19684336ooi.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Mar 2022 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0Uq31nAQr8iLo1VgbRzTyRDIRnNep4UU9dPszGMjhtU=;
        b=aqY5qZUNGrLx49gauvnpNhvOgrR50pvcrhhyjRKQQF84ZlgMxD3g4HSUCN7PG/+QjT
         Pu+7MWDaEmoe22LyIrxnrbHRtqg1To4bhcOWZ8mW8SB7Tttpht2Z22doyS/MdLkANqdY
         R2yXfbtFWLOhzIk5vNeOgSEyz2r+KJw3PJQqgFMXrMESomTq7ylNkRblOx5BE05M+4aD
         ZBhqSGNa9kxqIrK6oyEMOJtK3TIUlQp22qUmU7L/Hl+JBLL45YlcZYSPk023ErPuTtMo
         2D41z17AeD+w9C6NIWV/yjvCwIeK/oI8NHMbydv5lawxkIudULUYMAQAzfwV7HVtaHWR
         +e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Uq31nAQr8iLo1VgbRzTyRDIRnNep4UU9dPszGMjhtU=;
        b=YfgOdarkijo+YV6nHK0dsvNY+Od37/YSzXPsuG/snKC5/46ZFECytjGx+ksfnOJkmA
         Dg5UYcn7K1Egqx6mctRC4mOsdhDbefd89+iwCd8j2SoR62HwCmD107X+2AQmGCN1enlH
         sV1nXfn3rYonehMvfe96lSNM37sNMzYMfzDhgxVa6E/2SRo2ldCpOqHroZt0BGpoXhQm
         ShwmktR96A+aIC15abf0o17JFuAS9aouEUkJYqcnOG98OPR/mn1Q63m6Iu6SMmkZ1ynZ
         J/8CCuiIYa4Tj5UIfcZ4MMFLMEl7nO0nGeha8avbkr4ei+OR5bh2iZSx9Op7PaPuMUpE
         et0w==
X-Gm-Message-State: AOAM5306boQ/pZwFo93m7UfkoPh4UajdomsTEPGk1dGtuJZ376j01tAe
        bTTXO6bpGkLAioDisNShVFNBeMwOAG4=
X-Google-Smtp-Source: ABdhPJy+GLrQ+PCfld3Gk26u2uqf2zmSYMr3HJHHFl6XDXGRLN9b1fOKB6OGneTBhiOkqhybc9DpYQ==
X-Received: by 2002:a05:6870:9a1d:b0:d9:f73c:d990 with SMTP id fo29-20020a0568709a1d00b000d9f73cd990mr652707oab.26.1646690974856;
        Mon, 07 Mar 2022 14:09:34 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c8fd:9e42:5ced:850e])
        by smtp.gmail.com with ESMTPSA id z25-20020a056808065900b002d97bda386esm6892644oih.51.2022.03.07.14.09.34
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:09:34 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/3] Fix 0x05 error code reported by several WMI calls
Date:   Mon,  7 Mar 2022 16:09:31 -0600
Message-Id: <20220307220932.23607-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307220932.23607-1-jorge.lopez2@hp.com>
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
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
index e142e9a0d317..a0aba7db8a1c 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -329,7 +329,7 @@ static int hp_wmi_get_fan_speed(int fan)
 	char fan_data[4] = { fan, 0, 0, 0 };
 
 	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
-				       &fan_data, sizeof(fan_data),
+				       &fan_data, sizeof(char),
 				       sizeof(fan_data));
 
 	if (ret != 0)
@@ -406,7 +406,7 @@ static int omen_thermal_profile_set(int mode)
 		return -EINVAL;
 
 	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
-				   &buffer, sizeof(buffer), sizeof(buffer));
+				   &buffer, sizeof(buffer), 0);
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -443,7 +443,7 @@ static int hp_wmi_fan_speed_max_set(int enabled)
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
-				   &enabled, sizeof(enabled), sizeof(enabled));
+				   &enabled, sizeof(enabled), 0);
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -456,7 +456,7 @@ static int hp_wmi_fan_speed_max_get(void)
 	int val = 0, ret;
 
 	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, sizeof(val), sizeof(val));
+				   &val, 0, sizeof(val));
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -468,7 +468,7 @@ static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+				       0, sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -479,7 +479,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 	u8 state[128];
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+				       0, sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -557,7 +557,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err;
 
@@ -646,7 +646,7 @@ static ssize_t als_store(struct device *dev, struct device_attribute *attr,
 		return ret;
 
 	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
-				       sizeof(tmp), sizeof(tmp));
+				       sizeof(tmp), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
 
@@ -667,9 +667,9 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	if (clear == false)
 		return -EINVAL;
 
-	/* Clear the POST error code. It is kept until until cleared. */
+	/* Clear the POST error code. It is kept until cleared. */
 	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_WRITE, &tmp,
-				       sizeof(tmp), sizeof(tmp));
+				       sizeof(tmp), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
 
@@ -959,7 +959,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err < 0 ? err : -EINVAL;
 
-- 
2.25.1


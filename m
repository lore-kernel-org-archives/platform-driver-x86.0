Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4CFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 21:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343902AbiCJVKA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 16:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343894AbiCJVKA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 16:10:00 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6A64D273
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:58 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id s16so5506235qks.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iwbfiO4dV4isxj0/47jC10sTAI5+jcOns3DMoibBzAk=;
        b=ZhwHOB02CqKgQHRF0xOU7+BO5pe+IvHYGYh4hf/pmCUGSArs3dfSZaVtJk0j0XNQMy
         qWJj5wTVrKVyifUKFBt/lKVSbZIEXn3mItqoVf0jr7wP57bUdKI0pbZ1wcE/Rq8+QS9F
         IRVho7ISkPduN4DdzJU3e4i48bZ6loA/W+K4j9Kti1aJdJuW0MPxGU8amE7IJoU1GK95
         eQtKrRxqWMzNPU7TAuhNbbEDqZ4tl5Qq2T+9Ii7PXVV9+cDx4H/njLCHPq7cG792yLbc
         x3FXDSQT1ReL39YllYtEt0msibjYDWP6BCTmw5XcrrCukLofoIJUOKLtxELKF/1vuS2s
         QleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwbfiO4dV4isxj0/47jC10sTAI5+jcOns3DMoibBzAk=;
        b=tZ3rFTYpcIngCGuJPE1jl5Yxkq121J0WcYWtOx4fjdjA72tGofZMBkKquMLPln8ts5
         xUT89FZqe4WnrgARIJu0zhPhristVpxaEM/YLtcOaxw+ehZipVZ4sOBpEdp4weRgFC7U
         iDgoC//AEKNlyB8qGZXAwQLJP1rS63jhlfwGhPtLM4Z5w9IdkiPgavM+2sV+57ENCGNR
         b1iNeEhItSuMm8VlSP/MtDyUTz/SQ8Z+pOYFvIi5yCMQNL8X5AjmgjLjhz7k6mF+XD1G
         RgsCISnoO2J97I3I3kqVjGsmltt4D8Cmt8GJ8/Wyft4vCX9NACYjOnQJ7mfkbnqdtZ9D
         OTyw==
X-Gm-Message-State: AOAM530onsaZ2eaJrWRcddJvHy7LQW+cj9ayiqIG69My0xkzeUMzAfDK
        27tg9SL++yHzcoyB5rdzixCSlT3EzwM=
X-Google-Smtp-Source: ABdhPJzRT5tzU0OEPwg+ANsAEcPlbwc1CEoRF9ICnm0EeCxo/MZc60BLJpQSTkCAS2ji79IgNn57Vw==
X-Received: by 2002:a05:620a:1a99:b0:67d:27ba:9bec with SMTP id bl25-20020a05620a1a9900b0067d27ba9becmr4495415qkb.482.1646946537257;
        Thu, 10 Mar 2022 13:08:57 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c0b0:4de4:5b27:f2e7])
        by smtp.gmail.com with ESMTPSA id k6-20020a378806000000b0064915d9584fsm2881727qkd.8.2022.03.10.13.08.56
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:08:56 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 3/4] Fix 0x05 error code reported by several WMI calls
Date:   Thu, 10 Mar 2022 15:08:52 -0600
Message-Id: <20220310210853.28367-4-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310210853.28367-1-jorge.lopez2@hp.com>
References: <20220310210853.28367-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Several WMI queries leverage hp_wmi_read_int function to read their
data. hp_wmi_read_int function was corrected in a previous patch.
Now, this function invokes hp_wmi_perform_query with input parameter
of size zero and the output buffer of size 4.

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
index e9aa05c26a40..e76bd4bef6b5 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -329,7 +329,7 @@ static int hp_wmi_get_fan_speed(int fan)
 	char fan_data[4] = { fan, 0, 0, 0 };
 
 	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
-				       &fan_data, sizeof(fan_data),
+				       &fan_data, sizeof(char),
 				       sizeof(fan_data));
 
 	if (ret != 0)
@@ -399,7 +399,7 @@ static int omen_thermal_profile_set(int mode)
 		return -EINVAL;
 
 	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
-				   &buffer, sizeof(buffer), sizeof(buffer));
+				   &buffer, sizeof(buffer), 0);
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -436,7 +436,7 @@ static int hp_wmi_fan_speed_max_set(int enabled)
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
-				   &enabled, sizeof(enabled), sizeof(enabled));
+				   &enabled, sizeof(enabled), 0);
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -449,7 +449,7 @@ static int hp_wmi_fan_speed_max_get(void)
 	int val = 0, ret;
 
 	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, sizeof(val), sizeof(val));
+				   &val, 0, sizeof(val));
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -461,7 +461,7 @@ static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+				       0, sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -472,7 +472,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 	u8 state[128];
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+				       0, sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -550,7 +550,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err;
 
@@ -639,7 +639,7 @@ static ssize_t als_store(struct device *dev, struct device_attribute *attr,
 		return ret;
 
 	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
-				       sizeof(tmp), sizeof(tmp));
+				       sizeof(tmp), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
 
@@ -660,9 +660,9 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	if (clear == false)
 		return -EINVAL;
 
-	/* Clear the POST error code. It is kept until until cleared. */
+	/* Clear the POST error code. It is kept until cleared. */
 	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_WRITE, &tmp,
-				       sizeof(tmp), sizeof(tmp));
+				       sizeof(tmp), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
 
@@ -952,7 +952,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err < 0 ? err : -EINVAL;
 
-- 
2.25.1


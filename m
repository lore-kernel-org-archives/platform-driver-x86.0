Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB89C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Feb 2022 16:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237433AbiBRQJ3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Feb 2022 11:09:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237441AbiBRQJ2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Feb 2022 11:09:28 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C0B13C9FD
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Feb 2022 08:09:10 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id s8so3539915oij.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Feb 2022 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K5SabeDwNCDEJ86Ip4tYGkDUcK4/rL40rDOJlVN8id4=;
        b=i3AwbqnRoeoQ/jfUp4mWJjKCVN88F2kX5oGTi6OVmKLE4PwqoZV1Iq7fTGeNKn892w
         6xcYJKY1nBCV//JCccfEQ3f/cy/ocWmyoRY6cFDWPub7EMPZ0yXc0+qDzu3bp17n3yM9
         5JI0CmxTTqQPuMwp0w5h9Q3S/QgGextWKm6XGn5CZf3pQWmePefHR9EidefnmZqAInfo
         sxy+T3qQ2YZl2UiIf7OBrrb1GrIVIBZVgcAEfgk7H4+2XWfMexWM9ZSICfSya4x6ZeEu
         cutaW0abCzcn9awEfwRvKnvutPW7VmSPogM+u9wzgs/4lIBNrxsdN73H8t/Os1RC879f
         +7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K5SabeDwNCDEJ86Ip4tYGkDUcK4/rL40rDOJlVN8id4=;
        b=DKxeYH1wKNvpsw0LpADrrR49AHolmmZRFx0BHAKXyh42hM8Nfpc4L1rB6S8rj1qI+4
         Ci1T6PwG0JlzOmQD276+Ul1liYAQOY5ThRrZ1nI1L0UcQqmqILfK561kDAqIlCl5jl74
         Sx07nkstuYdcKbal1V3QpfG0IAkoXVc3994LQhi7ygNkbKUPomcLsbutdWEVmospjTec
         +qvbaWT1n7HsVRIrcoztOG8MKtTK3ggUBTAD6QFJ51Brf9j/oqFW7AYF9S3atri46Tzd
         Btofpj7B/FA8UlYwTvuypmV0kcbiMQoCdFsDqzBQ92jrzxCZQAUPtJ+4FKbm9AMtat+t
         Wwqw==
X-Gm-Message-State: AOAM530TkVl9awglNvx5K3hMWq9fo0OXxGDGB9b2AOlk4xzDWrVHVUfV
        PBz1XN7Z2viIE2I050drSN/TxQ/198U=
X-Google-Smtp-Source: ABdhPJwSRC3ShoJnrGG1jew/boARFSU9jHX7x6DzNrmiavy7sRoDMK7kbuaEZy2ABTvghABI3OXQOg==
X-Received: by 2002:a05:6808:15a9:b0:2d4:5775:d06a with SMTP id t41-20020a05680815a900b002d45775d06amr3659997oiw.138.1645200550132;
        Fri, 18 Feb 2022 08:09:10 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:e8f4:b8ac:759b:cd87])
        by smtp.gmail.com with ESMTPSA id l1sm1648021otd.18.2022.02.18.08.09.09
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 08:09:09 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/3] Fix 0x05 error code reported by several WMI calls
Date:   Fri, 18 Feb 2022 10:09:06 -0600
Message-Id: <20220218160907.3422-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218160907.3422-1-jorge.lopez2@hp.com>
References: <20220218160907.3422-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Several WMI queries leverage hp_wmi_read_int function to read their data.
hp_wmi_read_int function returns the appropiate value if the WMI command
requires an input and output buffer size values greater than zero.
WMI queries such HPWMI_HARDWARE_QUERY, HPWMI_WIRELESS2_QUERY,
HPWMI_FEATURE2_QUERY, HPWMI_DISPLAY_QUERY, HPWMI_ALS_QUERY, and
HPWMI_POSTCODEERROR_QUERY requires calling hp_wmi_perform_query function
with input buffer size value of zero.  Any input buffer size greater
than zero will cause error 0x05 to be returned.

All changes were validated on a ZBook Workstation notebook. Additional
validation was included to ensure no other commands were failing or
incorrectly handled.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 64 ++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 544fce906ce7..de715687021a 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -442,7 +442,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 	u8 state[128];
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+				       0, sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -477,25 +477,37 @@ static const struct rfkill_ops hp_wmi_rfkill_ops = {
 static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
 {
 	int mask = 0x200 << (r * 8);
+	int ret= 0;
+	int wireless = 0;
+
+	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
+				   0, sizeof(wireless));
 
-	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+	if (ret < 0)
+	  return -EINVAL;
 
 	/* TBD: Pass error */
 	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
 
-	return !(wireless & mask);
+	return (wireless & mask);
 }
 
 static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
 {
 	int mask = 0x800 << (r * 8);
+	int ret= 0;
+	int wireless = 0;
 
-	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
+				   0, sizeof(wireless));
+
+	if (ret < 0)
+	  return -EINVAL;
 
 	/* TBD: Pass error */
 	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
 
-	return !(wireless & mask);
+	return (wireless & mask);
 }
 
 static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
@@ -520,7 +532,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err;
 
@@ -546,27 +558,36 @@ static int hp_wmi_rfkill2_refresh(void)
 static ssize_t display_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
-	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
-	if (value < 0)
-		return value;
+	int value = 0;
+	int ret  = hp_wmi_perform_query(HPWMI_DISPLAY_QUERY, HPWMI_READ, &value,
+				   0, sizeof(value));
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
 	return sprintf(buf, "%d\n", value);
 }
 
 static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
-	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
-	if (value < 0)
-		return value;
+	int value = 0;
+	int ret  = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, HPWMI_READ, &value,
+				   0, sizeof(value));
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
 	return sprintf(buf, "%d\n", value);
 }
 
 static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
-	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
-	if (value < 0)
-		return value;
+	int value = 0;
+	int ret  = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_READ, &value,
+				   0, sizeof(value));
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
 	return sprintf(buf, "%d\n", value);
 }
 
@@ -592,9 +613,12 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
 	/* Get the POST error code of previous boot failure. */
-	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
-	if (value < 0)
-		return value;
+	int value = 0;
+	int ret  = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_READ, &value,
+				   0, sizeof(value));
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
 	return sprintf(buf, "0x%x\n", value);
 }
 
@@ -609,7 +633,7 @@ static ssize_t als_store(struct device *dev, struct device_attribute *attr,
 		return ret;
 
 	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
-				       sizeof(tmp), sizeof(tmp));
+				   sizeof(tmp), 0);
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
 
@@ -922,7 +946,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err < 0 ? err : -EINVAL;
 
-- 
2.25.1


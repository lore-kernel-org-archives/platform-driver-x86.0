Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94035C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 06:01:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CEA264E6C
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 06:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhBLGAt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Feb 2021 01:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhBLGAt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Feb 2021 01:00:49 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177F8C061756
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 22:00:09 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id a16so4558447plh.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 22:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I3mH1nI6Ur0zJW1Rdu0vUZSXZr53AT4D53UY6bLhdM0=;
        b=Bwma6eIJdbYROJd90oV5E1ZNVSb3sV3F2zIwGeZBXPIKGe2FqCm8FtihrwcS5+I3gH
         z5UsddNZ+pDFyn5jkk3YiQNx5dTckaAVHHS2ZcvNOfYkfOvXEXwHEFPh6rw6JlUTMweh
         ou7wCP5BH6gapKVgj+TbUhNJUK2baHSSSUsoGRozQHO3dIS8qkehx9CstNhy/E2BLJ16
         AtRx5JZk6jjEAH8ZV3oi7G0etaeboydLGPPz7mT7/Jn7n0WHK7B53OIrq/kh0OeZb/Pe
         AO/TzqLplmhlaN4yZtq7Qe46LTibFUwtkWlBgJEXiBRASvolNM0fga/HRidgzvfAdato
         5GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3mH1nI6Ur0zJW1Rdu0vUZSXZr53AT4D53UY6bLhdM0=;
        b=bjiBA6uWfWJwg5IvFvuh/HPQcs5+GcqXjuu7B3TDuBNKHz0loWO53AJdZPcU68K2Ms
         tBnRVCO8EPgolVycUwRIrsLD1IWN7PJsvVAjbom19oRF5PXIgz98kz09y92/klziX68C
         KhZJajc9HykqUPyHogeZEZL97tE3ECVBG6tyDOiannoH1+Q/RWYfsvdueRbfyjlqv60f
         iUdw+mvzPzIDddP4i6KNR96RSj6onJ5/QGFxEQHhZEGoBwTfgM8r87Nl5AKN972jBNt0
         uGoqhxy9pkx630wSjlmtLer4loOOAUb5l6YB4YHH3lIpN7RGGqnPFkY82aZKghcBNcNn
         Cdwg==
X-Gm-Message-State: AOAM532zCx5Xwk6CzRisfKXbSaXHxYjOvU0pVMh0ZshmvwiDyK8LP9Q0
        6Z2S42au222YwoGqKHmrlwM=
X-Google-Smtp-Source: ABdhPJzeZ2KUiU6KeQZ578LqIYN50N48+E+aK9LlxKFDTfuFY+OwehGcLHtlriR0q6VO9aLQr4FxcA==
X-Received: by 2002:a17:90a:474f:: with SMTP id y15mr1349729pjg.110.1613109608539;
        Thu, 11 Feb 2021 22:00:08 -0800 (PST)
Received: from localhost.localdomain (p926243-ipngn9601hodogaya.kanagawa.ocn.ne.jp. [114.164.25.243])
        by smtp.gmail.com with ESMTPSA id u20sm7136128pjy.36.2021.02.11.22.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 22:00:08 -0800 (PST)
From:   Nitin Joshi <nitjoshi@gmail.com>
X-Google-Original-From: Nitin Joshi <njoshi1@lenovo.com>
To:     hdegoede@redhat.com
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH 2/2] platorm/x86: thinkpad_acpi: sysfs interface to interface to get wwan antenna type
Date:   Fri, 12 Feb 2021 14:58:56 +0900
Message-Id: <20210212055856.232702-2-njoshi1@lenovo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212055856.232702-1-njoshi1@lenovo.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On some newer Thinkpads we need to set SAR value based on antenna type.
This patch provides a sysfs interface that userspace can use to get
antenna type and set corresponding SAR value, as is required for FCC
certification.

Reviewed-by: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++
 drivers/platform/x86/thinkpad_acpi.c          | 55 ++++++++++++++++++-
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 10410811b990..df6904f23dea 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -52,6 +52,7 @@ detailed description):
 	- LCD Shadow (PrivacyGuard) enable and disable
 	- Lap mode sensor
 	- WLAN transmission power control
+	- WWAN Antenna type
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1465,6 +1466,26 @@ The available commands are::
 The first command restores the wlan transmission power and the latter one
 reduces wlan transmission power.
 
+WWAN Antenna type
+-----------------
+
+sysfs: wwan_antenna_type
+
+On some newer Thinkpads we need to set SAR value based on the antenna
+type. This interface will be used by userspace to get the antenna type
+and set the corresponding SAR value, as is required for FCC certification.
+
+The available commands are::
+
+        cat /sys/devices/platform/thinkpad_acpi/wwan_antenna_type
+
+Currently 2 antenna types are supported as mentioned below:
+- type a
+- type b
+
+The property is read-only. If the platform doesn't have support the sysfs
+class is not created.
+
 EXPERIMENTAL: UWB
 -----------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 6dbbd4a14264..db016a2a1837 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9990,8 +9990,11 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DPRC_GET_WLAN_STATE             0x20000
 #define DPRC_SET_WLAN_POWER_REDUCE      0x00030010
 #define DPRC_SET_WLAN_POWER_FULL        0x00030100
+#define DPRC_GET_WWAN_ANTENNA_TYPE      0x40000
 static int has_wlantxreduce;
 static int wlan_txreduce;
+static int has_antennatype;
+static int wwan_antennatype;
 
 static int dprc_command(int command, int *output)
 {
@@ -10035,6 +10038,26 @@ static int get_wlan_state(int *has_wlantxreduce, int *wlan_txreduce)
 	return 0;
 }
 
+static int get_wwan_antenna(int *has_antennatype, int *wwan_antennatype)
+{
+	int output, err;
+
+	/* Get current Antenna type */
+	err = dprc_command(DPRC_GET_WWAN_ANTENNA_TYPE, &output);
+	if (err)
+		return err;
+
+	if (output & BIT(4))
+		*wwan_antennatype = 1;
+	else if (output & BIT(8))
+		*wwan_antennatype = 2;
+	else
+		*wwan_antennatype = -1;
+
+	*has_antennatype = 1;
+	return 0;
+}
+
 /* sysfs wlan entry */
 static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
 				struct device_attribute *attr,
@@ -10049,6 +10072,21 @@ static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", wlan_txreduce);
 }
 
+/* sysfs wwan antenna type entry */
+static ssize_t wwan_antenna_type_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	switch (wwan_antennatype) {
+	case 1:
+		return sysfs_emit(buf, "type a\n");
+	case 2:
+		return sysfs_emit(buf, "type b\n");
+	default:
+		return sysfs_emit(buf, "unknown type\n");
+	}
+}
+
 static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
@@ -10076,24 +10114,29 @@ static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
 	}
 
 	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "wlan_tx_strength_reduce");
+
 	return count;
 }
 static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
+static DEVICE_ATTR_RO(wwan_antenna_type);
 
 static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
 {
-	int wlantx_err, err;
+	int wlantx_err, wwanantenna_err, err;
 
 	wlantx_err = get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
+	wwanantenna_err = get_wwan_antenna(&has_antennatype, &wwan_antennatype);
 	/*
 	 * If support isn't available (ENODEV) for both devices then quit, but
 	 * don't return an error.
 	 */
-	if (wlantx_err == -ENODEV)
+	if ((wlantx_err == -ENODEV) && (wwanantenna_err == -ENODEV))
 		return 0;
 	/* Otherwise, if there was an error return it */
 	if (wlantx_err && (wlantx_err != -ENODEV))
 		return wlantx_err;
+	if (wwanantenna_err && (wwanantenna_err != -ENODEV))
+		return wwanantenna_err;
 
 	if (has_wlantxreduce) {
 		err = sysfs_create_file(&tpacpi_pdev->dev.kobj,
@@ -10101,6 +10144,12 @@ static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
 		if (err)
 			return err;
 	}
+
+	if (has_antennatype) {
+		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_antenna_type.attr);
+		if (err)
+			return err;
+	}
 	return 0;
 }
 
@@ -10108,6 +10157,8 @@ static void dprc_exit(void)
 {
 	if (has_wlantxreduce)
 		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wlan_tx_strength_reduce.attr);
+	if (has_antennatype)
+		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_antenna_type.attr);
 }
 
 static struct ibm_struct dprc_driver_data = {
-- 
2.25.1


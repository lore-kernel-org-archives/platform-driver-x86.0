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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7FEC433E6
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Feb 2021 07:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A9C364E08
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Feb 2021 07:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhBPHiM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Feb 2021 02:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhBPHiD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Feb 2021 02:38:03 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4D7C061756
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 23:37:23 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id z21so5723628pgj.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 23:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7L8DKLlnVG3UUI1KgAzvVMXy6KnDtpNaaM9mizcM8oQ=;
        b=ZMYipoFNxghn5IXjXBKzzWybeuT2tfIuKHOLiJALRW6qhH4OHrWsAg8l4Miv5jX7bg
         WmbRWVWwd8IlIqPOfXOTJilXPsbSLcZbbHLApe62zDGAQSg7piUEkRjTaNwI3B55VlGk
         X3MKF5ZOPI4q1dWtPc4MHjf2+Lmn7OXP/SwT8qc/zA3UoAcGng9LM2Qfj2aZq2MiEVg3
         C9WcWL1ma4aVhzHV/Xe54Z2b11ca2KOiqV+/3+3WgbAcUJgFEFZreIwWdOnVNJwvLs8q
         JevZx5A4JTxCVWxEylGVoAflGOkWfl8l3NKQV93XkTdao60qJpvRzDmcLqPCiG+Vs58j
         cCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7L8DKLlnVG3UUI1KgAzvVMXy6KnDtpNaaM9mizcM8oQ=;
        b=BLU738XrACeALM/YqfqJ52t4gEPz/WEWcdt0BNP1kNsuO9B93a6A8V7xYroOA3Ez8t
         LcmPJPWggZUZ35lOAJXJ0mbVLRHPrczkCWg38HdNFWbti8Setym7S2pMQr+ydDtMgZPa
         HGWmVO8baCexu9xA+CbLVnHlpB2yJ1hAQ5AggjggZGvLM+b2NF8EIvoOnpeYRbktDg4P
         zQZ/yWQER7XXZoW52VTGwqX9cNO3xplalI/hGvjCcfjuBCaXh4mcbzyv7R/QUmERdfec
         oKZAlnqXD+A2OLcAMGDa/vDLA2Jol17p/AAVkyNFLlZJ9QA3jsqdTvktBGXYy1lwtHye
         nGTQ==
X-Gm-Message-State: AOAM532zN/rry4wWGX/Ln8M6nT7PAajigHDPXytLfRnWP9n0GSvyW94t
        GNL0GUZyZGsRS09FMzCOgb/aDjOSnxNjcuCH
X-Google-Smtp-Source: ABdhPJwsLguxzLbUqz46Sst6/ccEDuKf6XI9tSTsK30+QUZKSPhknLRcxuU2ihYhvROnenKroKRdoA==
X-Received: by 2002:a63:4405:: with SMTP id r5mr18072255pga.168.1613461042554;
        Mon, 15 Feb 2021 23:37:22 -0800 (PST)
Received: from localhost.localdomain (p926243-ipngn9601hodogaya.kanagawa.ocn.ne.jp. [114.164.25.243])
        by smtp.gmail.com with ESMTPSA id x190sm20695145pfx.166.2021.02.15.23.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 23:37:22 -0800 (PST)
From:   Nitin Joshi <nitjoshi@gmail.com>
X-Google-Original-From: Nitin Joshi <njoshi1@lenovo.com>
To:     hdegoede@redhat.com
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH v2 2/2] platorm/x86: thinkpad_acpi: sysfs interface to interface to get wwan antenna type
Date:   Tue, 16 Feb 2021 16:36:39 +0900
Message-Id: <20210216073639.687703-2-njoshi1@lenovo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216073639.687703-1-njoshi1@lenovo.com>
References: <20210216073639.687703-1-njoshi1@lenovo.com>
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
 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 ++++++
 drivers/platform/x86/thinkpad_acpi.c          | 65 +++++++++++++++++--
 2 files changed, 82 insertions(+), 4 deletions(-)

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
index af90251d79d7..1faf260f6bbf 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9992,8 +9992,13 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DPRC_SET_WLAN_POWER_FULL        0x00030100
 #define DPRC_WLAN_POWER_REDUCE_BIT      BIT(4)
 #define DPRC_WLAN_POWER_FULL_BIT        BIT(8)
+#define DPRC_GET_WWAN_ANTENNA_TYPE      0x40000
+#define DPRC_WWAN_ANTENNA_TYPE_A_BIT    BIT(4)
+#define DPRC_WWAN_ANTENNA_TYPE_B_BIT    BIT(8)
 static bool has_wlantxreduce;
 static int wlan_txreduce;
+static bool has_antennatype;
+static int wwan_antennatype;
 
 static int dprc_command(int command, int *output)
 {
@@ -10017,6 +10022,25 @@ static int dprc_command(int command, int *output)
 	return 0;
 }
 
+static int get_wwan_antenna(int *wwan_antennatype)
+{
+	int output, err;
+
+	/* Get current Antenna type */
+	err = dprc_command(DPRC_GET_WWAN_ANTENNA_TYPE, &output);
+	if (err)
+		return err;
+
+	if (output & DPRC_WWAN_ANTENNA_TYPE_A_BIT)
+		*wwan_antennatype = 1;
+	else if (output & DPRC_WWAN_ANTENNA_TYPE_B_BIT)
+		*wwan_antennatype = 2;
+	else
+		return -ENODATA;
+
+	return 0;
+}
+
 static int get_wlan_state(int *wlan_txreduce)
 {
 	int output, err;
@@ -10036,6 +10060,21 @@ static int get_wlan_state(int *wlan_txreduce)
 	return 0;
 }
 
+/* sysfs wwan antenna type entry */
+static ssize_t wwan_antenna_type_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	switch (wwan_antennatype) {
+	case 1:
+		return sysfs_emit(buf, "type a\n");
+	case 2:
+		return sysfs_emit(buf, "type b\n");
+	default:
+		return -ENODATA;
+	}
+}
+
 /* sysfs wlan entry */
 static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
 						struct device_attribute *attr,
@@ -10071,18 +10110,22 @@ static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
 	return count;
 }
 static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
+static DEVICE_ATTR_RO(wwan_antenna_type);
 
 static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
 {
-	int wlantx_err, err;
+	int wlantx_err, wwanantenna_err, err;
 
 	wlantx_err = get_wlan_state(&wlan_txreduce);
+	wwanantenna_err = get_wwan_antenna(&wwan_antennatype);
 	/*
-	 * If support isn't available (ENODEV) for both devices then quit, but
-	 * don't return an error.
+	 * If support isn't available (ENODEV) or no data available (ENODATA) for both devices
+	 * then quit, but don't return an error.
 	 */
-	if ((wlantx_err == -ENODEV) || (wlantx_err == -ENODATA))
+	if (((wlantx_err == -ENODEV) || (wlantx_err == -ENODATA)) &&
+		((wwanantenna_err == -ENODEV) || (wwanantenna_err == -ENODATA)))
 		return 0;
+
 	/* Otherwise, if there was an error return it */
 	if (wlantx_err && (wlantx_err != -ENODEV) && (wlantx_err != -ENODATA))
 		return wlantx_err;
@@ -10095,6 +10138,18 @@ static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
 		if (err)
 			return err;
 	}
+
+	/* if there was an error return it */
+	if (wwanantenna_err && (wwanantenna_err != -ENODEV) && (wwanantenna_err != -ENODATA))
+		return wwanantenna_err;
+	else if (!wwanantenna_err)
+		has_antennatype = true;
+
+	if (has_antennatype) {
+		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_antenna_type.attr);
+		if (err)
+			return err;
+	}
 	return 0;
 }
 
@@ -10102,6 +10157,8 @@ static void dprc_exit(void)
 {
 	if (has_wlantxreduce)
 		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wlan_tx_strength_reduce.attr);
+	if (has_antennatype)
+		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_antenna_type.attr);
 }
 
 static struct ibm_struct dprc_driver_data = {
-- 
2.25.1


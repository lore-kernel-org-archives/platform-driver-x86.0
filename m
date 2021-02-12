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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE29C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 06:01:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DECB64E65
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 06:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhBLGAo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Feb 2021 01:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhBLGAo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Feb 2021 01:00:44 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97F7C061574
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 22:00:03 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id k22so4567007pll.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 22:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WKfwcHEkRwzLTqNMhOrXP004AdBPHHuBVOsro3LipxY=;
        b=TH5zkNA+HW3qBRp4g1nTZm0JjZIy7COuAa76gYK7gu0bTXUX9ryfnoGiiT6BaOoZdG
         A+uq0C/X4syiVpPPqkj0PWUqKJC7nVW/NdoI5iIZWnMi0vWQkrRwdUPFpSt0shIn9oXk
         pzK2QtfO/aRVB0TjbPL7lwF7Q8d7T7iC+ebhPXH4iByi4SV4x3fqYyK8TmTLyQoWDFcg
         jH+dj4EpoCO++QjqmwcHKQoCRdTfOtsJUVwJZw8EqMXaf6u1ML6oLmWAJJhLaFLxMJVB
         3AeXiEDt5g9r/3cbAUrcpkdhdMIIio+zlb6wZjNkHR8SkGBtrZkqjuGLwOBg+iwOru5U
         MKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WKfwcHEkRwzLTqNMhOrXP004AdBPHHuBVOsro3LipxY=;
        b=WI1MdRIjr2c9JOaKHPjK/9OiZHFbZe+skpBg6gJmEjn3t6u5CVG6u1Ro3CUgQAgXRG
         OGhNJxmKraAhkjprOiwfV79RFwqc2ozifnNAVD7AZnhEKO88IZqNT005q7W8+lE2dI8U
         vGFSYNxiieM5LT9FfDJ1dj5s9EoCSJsPbvoOa7GE0ctB4iub29jGRhtsiaLbyDm5TdFd
         4b2+BjKyxIBhppmMuAk2Ljv/AjmgoyToEShC5Mtv4iynbgNesULr44zwjzMYsAh8637i
         zqmrUGEBz8zR9127sew3OnXMnZgpwmTWTCHocArWr2e/gOBUoaGE+vRjQf/TtswZlgi/
         4p/Q==
X-Gm-Message-State: AOAM5314K+FkXgUNZTF0Pgme9s0FiYgpk5hBlRY2c8pjxx2cfZp6OrEM
        rOr2HAYvZjirXwjiYekvzH4=
X-Google-Smtp-Source: ABdhPJxOZNP63iokUqzOCZftfS9t8uAwWPHrP+zoybaPywBh5YApZBtDLdfjksXb2kVu2gXKuxrFdg==
X-Received: by 2002:a17:90a:1b6c:: with SMTP id q99mr1302123pjq.137.1613109603108;
        Thu, 11 Feb 2021 22:00:03 -0800 (PST)
Received: from localhost.localdomain (p926243-ipngn9601hodogaya.kanagawa.ocn.ne.jp. [114.164.25.243])
        by smtp.gmail.com with ESMTPSA id u20sm7136128pjy.36.2021.02.11.22.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 22:00:02 -0800 (PST)
From:   Nitin Joshi <nitjoshi@gmail.com>
X-Google-Original-From: Nitin Joshi <njoshi1@lenovo.com>
To:     hdegoede@redhat.com
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs interface to reduce wlan tx power
Date:   Fri, 12 Feb 2021 14:58:55 +0900
Message-Id: <20210212055856.232702-1-njoshi1@lenovo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some newer Thinkpads have the WLAN antenna placed close to the WWAN
antenna. In these cases FCC certification requires that when WWAN is
active we reduce WLAN transmission power. A new Dynamic Power
Reduction Control (DPRC) method is available from the BIOS on these
platforms to reduce or restore WLAN Tx power.

This patch provides a sysfs interface that userspace can use to adjust the
WLAN power appropriately.

Reviewed-by: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  18 +++
 drivers/platform/x86/thinkpad_acpi.c          | 136 ++++++++++++++++++
 2 files changed, 154 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 5fe1ade88c17..10410811b990 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -51,6 +51,7 @@ detailed description):
 	- UWB enable and disable
 	- LCD Shadow (PrivacyGuard) enable and disable
 	- Lap mode sensor
+	- WLAN transmission power control
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1447,6 +1448,23 @@ they differ between desk and lap mode.
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+WLAN transmission power control
+--------------------------------
+
+sysfs: wlan_tx_strength_reduce
+
+Some newer Thinkpads have the WLAN antenna placed close to the WWAN antenna.
+This interface will be used by userspace to reduce the WLAN Tx power strength
+when WWAN is active, as is required for FCC certification.
+
+The available commands are::
+
+        echo '0' > /sys/devices/platform/thinkpad_acpi/wlan_tx_strength_reduce
+        echo '1' > /sys/devices/platform/thinkpad_acpi/wlan_tx_strength_reduce
+
+The first command restores the wlan transmission power and the latter one
+reduces wlan transmission power.
+
 EXPERIMENTAL: UWB
 -----------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f3e8eca8d86d..6dbbd4a14264 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9983,6 +9983,138 @@ static struct ibm_struct proxsensor_driver_data = {
 	.exit = proxsensor_exit,
 };
 
+/*************************************************************************
+ * DPRC(Dynamic Power Reduction Control) subdriver, for the Lenovo WWAN
+ * and WLAN feature.
+ */
+#define DPRC_GET_WLAN_STATE             0x20000
+#define DPRC_SET_WLAN_POWER_REDUCE      0x00030010
+#define DPRC_SET_WLAN_POWER_FULL        0x00030100
+static int has_wlantxreduce;
+static int wlan_txreduce;
+
+static int dprc_command(int command, int *output)
+{
+	acpi_handle dprc_handle;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DPRC", &dprc_handle))) {
+		/* Platform doesn't support DPRC */
+		return -ENODEV;
+	}
+
+	if (!acpi_evalf(dprc_handle, output, NULL, "dd", command))
+		return -EIO;
+
+	/*
+	 * METHOD_ERR gets returned on devices where few commands are not supported
+	 * for example WLAN power reduce command is not supported on some devices.
+	 */
+	if (*output & METHOD_ERR)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int get_wlan_state(int *has_wlantxreduce, int *wlan_txreduce)
+{
+	int output, err;
+
+	/* Get current WLAN Power Transmission state */
+	err = dprc_command(DPRC_GET_WLAN_STATE, &output);
+	if (err)
+		return err;
+
+	if (output & BIT(4))
+		*wlan_txreduce = 1;
+	else if (output & BIT(8))
+		*wlan_txreduce = 0;
+	else
+		*wlan_txreduce = -1;
+
+	*has_wlantxreduce = 1;
+	return 0;
+}
+
+/* sysfs wlan entry */
+static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	int err;
+
+	err = get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", wlan_txreduce);
+}
+
+static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int output, err;
+	unsigned long t;
+
+	if (parse_strtoul(buf, 1, &t))
+		return -EINVAL;
+
+	tpacpi_disclose_usertask(attr->attr.name,
+				"WLAN tx strength reduced %lu\n", t);
+
+	switch (t) {
+	case 0:
+		err = dprc_command(DPRC_SET_WLAN_POWER_FULL, &output);
+		break;
+	case 1:
+		err = dprc_command(DPRC_SET_WLAN_POWER_REDUCE, &output);
+		break;
+	default:
+		err = -EINVAL;
+		dev_err(&tpacpi_pdev->dev, "Unknown operating mode. Ignoring\n");
+		break;
+	}
+
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "wlan_tx_strength_reduce");
+	return count;
+}
+static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
+
+static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
+{
+	int wlantx_err, err;
+
+	wlantx_err = get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
+	/*
+	 * If support isn't available (ENODEV) for both devices then quit, but
+	 * don't return an error.
+	 */
+	if (wlantx_err == -ENODEV)
+		return 0;
+	/* Otherwise, if there was an error return it */
+	if (wlantx_err && (wlantx_err != -ENODEV))
+		return wlantx_err;
+
+	if (has_wlantxreduce) {
+		err = sysfs_create_file(&tpacpi_pdev->dev.kobj,
+				&dev_attr_wlan_tx_strength_reduce.attr);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
+static void dprc_exit(void)
+{
+	if (has_wlantxreduce)
+		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wlan_tx_strength_reduce.attr);
+}
+
+static struct ibm_struct dprc_driver_data = {
+	.name = "dprc",
+	.exit = dprc_exit,
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -10475,6 +10607,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_proxsensor_init,
 		.data = &proxsensor_driver_data,
 	},
+	{
+		.init = tpacpi_dprc_init,
+		.data = &dprc_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.25.1


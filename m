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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FDBC433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Feb 2021 07:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BD7064E00
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Feb 2021 07:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhBPHh4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Feb 2021 02:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhBPHhz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Feb 2021 02:37:55 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF71C061574
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 23:37:14 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id cv23so5164525pjb.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 23:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=64NMGncGc4dQIt5Leaf0R0POzyFMalZ8W2AQ9RuBqpw=;
        b=Lrrpt0TSsccvoXPd6fwU+/u/8MyyPYj/mpx2v0xJXJYEiHo20xMBUmZr2CEJb+fd3C
         JojI+iIgWEJxk3HuqwtJZ1Y/Y9wnP8xcN+wWX1hjzX6Pt0+k4KUD/TxEqUpEhcW4eaxU
         KkAzZ3N/vcjDqDQ0/GR+SSsMjuUGrCgWECeU2ejCkXg2QLHBK2HbtJuRnpOCNmN3OPuT
         ZUrKFf7fgFkJb/N5bUBxYME2vm/OQ7qob0ZGJsA7vhFQ1ZN5/zGV8EbV7Q9KhzjTDxme
         H4Kzmy49W5WSb/X3XgmupRkjQx2aebWCltffERhVdNX12OJ5owkeFBcTPHwj409ikYEB
         M5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=64NMGncGc4dQIt5Leaf0R0POzyFMalZ8W2AQ9RuBqpw=;
        b=qCe0KGibMXYbiVkVjm59LwzGcYnNtXxhhXZWvCZR1+GIhIZfcOb6qek/PxhrnKjFhK
         78ODK8F1mnLUd6UMWE6L22HtTUW0HTagYeTtqtkq5DmQ4SwzyN/pD3aKurciBTrCz3BP
         7Vrcl2Z+WgqRXIIjPqYkK6cEKmLlhVg3qPIWi+uFT5KXKL5/yXA+D/oqq61uqj/ogS28
         gqlm5bUxe2MRwiaRjMo781W4FVf8bjgvbRhlnPEKn0DHRo4oEJWnv45ZP0Mcis8G7TiS
         NgZnUfeJ73v+acx5GehzIGYcNE0mvh7XG7LonVOGK12nZwn0EI1+/u+jyOqzOPic6rOJ
         ZUSg==
X-Gm-Message-State: AOAM531tksntSx7XRISU7iK/VacMWCnXxrF1z3N78KKxFPQraZ4kg9jY
        mUSt/NUvfe9oINd7MCnDOBSQbT9Ec2syWeMg
X-Google-Smtp-Source: ABdhPJyKwsQc9n524d0ddGbCaI7AGcYFjPFTLIPbJdUKswiT6YneYKbsiJgqCJdV8DMmbD49GMPO1Q==
X-Received: by 2002:a17:902:ba07:b029:e3:5f39:6ed9 with SMTP id j7-20020a170902ba07b02900e35f396ed9mr6123148pls.25.1613461033412;
        Mon, 15 Feb 2021 23:37:13 -0800 (PST)
Received: from localhost.localdomain (p926243-ipngn9601hodogaya.kanagawa.ocn.ne.jp. [114.164.25.243])
        by smtp.gmail.com with ESMTPSA id x190sm20695145pfx.166.2021.02.15.23.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 23:37:13 -0800 (PST)
From:   Nitin Joshi <nitjoshi@gmail.com>
X-Google-Original-From: Nitin Joshi <njoshi1@lenovo.com>
To:     hdegoede@redhat.com
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH v2 1/2] platorm/x86: thinkpad_acpi: sysfs interface to reduce wlan tx power
Date:   Tue, 16 Feb 2021 16:36:38 +0900
Message-Id: <20210216073639.687703-1-njoshi1@lenovo.com>
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
 drivers/platform/x86/thinkpad_acpi.c          | 130 ++++++++++++++++++
 2 files changed, 148 insertions(+)

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
index f3e8eca8d86d..af90251d79d7 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9983,6 +9983,132 @@ static struct ibm_struct proxsensor_driver_data = {
 	.exit = proxsensor_exit,
 };
 
+/*************************************************************************
+ * DPRC(Dynamic Power Reduction Control) subdriver, for the Lenovo WWAN
+ * and WLAN feature.
+ */
+#define DPRC_GET_WLAN_STATE             0x20000
+#define DPRC_SET_WLAN_POWER_REDUCE      0x00030010
+#define DPRC_SET_WLAN_POWER_FULL        0x00030100
+#define DPRC_WLAN_POWER_REDUCE_BIT      BIT(4)
+#define DPRC_WLAN_POWER_FULL_BIT        BIT(8)
+static bool has_wlantxreduce;
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
+static int get_wlan_state(int *wlan_txreduce)
+{
+	int output, err;
+
+	/* Get current WLAN Power Transmission state */
+	err = dprc_command(DPRC_GET_WLAN_STATE, &output);
+	if (err)
+		return err;
+
+	if (output & DPRC_WLAN_POWER_REDUCE_BIT)
+		*wlan_txreduce = 1;
+	else if (output & DPRC_WLAN_POWER_FULL_BIT)
+		*wlan_txreduce = 0;
+	else
+		return -ENODATA;
+
+	return 0;
+}
+
+/* sysfs wlan entry */
+static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	int err;
+
+	err = get_wlan_state(&wlan_txreduce);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", wlan_txreduce);
+}
+
+static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
+						struct device_attribute *attr,
+						const char *buf, size_t count)
+{
+	int output, err, ret;
+	bool state;
+
+	ret = kstrtobool(buf, &state);
+	if (ret)
+		return ret;
+
+	if (state)
+		err = dprc_command(DPRC_SET_WLAN_POWER_REDUCE, &output);
+	else
+		err = dprc_command(DPRC_SET_WLAN_POWER_FULL, &output);
+
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "wlan_tx_strength_reduce");
+
+	return count;
+}
+static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
+
+static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
+{
+	int wlantx_err, err;
+
+	wlantx_err = get_wlan_state(&wlan_txreduce);
+	/*
+	 * If support isn't available (ENODEV) for both devices then quit, but
+	 * don't return an error.
+	 */
+	if ((wlantx_err == -ENODEV) || (wlantx_err == -ENODATA))
+		return 0;
+	/* Otherwise, if there was an error return it */
+	if (wlantx_err && (wlantx_err != -ENODEV) && (wlantx_err != -ENODATA))
+		return wlantx_err;
+	else if (!wlantx_err)
+		has_wlantxreduce = true;
+
+	if (has_wlantxreduce) {
+		err = sysfs_create_file(&tpacpi_pdev->dev.kobj,
+					&dev_attr_wlan_tx_strength_reduce.attr);
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
@@ -10475,6 +10601,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D67C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 02:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E412264F45
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 02:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhCQCsl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Mar 2021 22:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhCQCsK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Mar 2021 22:48:10 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F77C06174A
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Mar 2021 19:47:59 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so539723pjv.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Mar 2021 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yj/M2hXgloEKBBDvnxW3cLo2EPq18nd9HxjUvpB+wQg=;
        b=ulib14rK2o/SiJurOriHqwWlm+YfKdJ1PYJPSAG1IX0VNlWbSTz5lk5Cv1dsdZvguH
         iIy70AH8ldA8C48zt8wk/L/yxu3EwIMI2dfmbNxuZUgRy16dJiUxJDgZtGWrvb3tLnsK
         tl6GkrgVNx+PljlP1jfsIDqlK2zShscn6eZD2Oz4ynjgxG7gfEMK2uFYkXybCrZ7R2DJ
         6RENRKwQarX2aA/Ec8nbxyeSNb/oTcbvvVkA9qDxuSRxYL2HPMlYEtCEwDVgPB/n9oii
         UsH3Ago4zr4g6tnqLfei3mNduJjbgkdU88bH5jtWFv0wwbM5HXMxoyJQD8p0iA1cMdlR
         dSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yj/M2hXgloEKBBDvnxW3cLo2EPq18nd9HxjUvpB+wQg=;
        b=iiWclC9PSioHsLBZUjd8GqZYTNvQfNTe6NmP1NwjVqYqbMpPN0Ptq45bR17oy4nhM0
         MMPk3Fe30yAl14Vt3RMupiMKUlxYDKHo3GfRSY1TNyxixuKRGp8YiyH/qcB+S4dPpWaR
         2H78eW3nztPz9Usp+Zqm9zHvzCfukxui2aAjc9GwvNZPG9rxXyReuYG34C0DAQVPiX6w
         bCaxNjoHiAgU5mfMuiFd3EfBXTsJBqbuMoPhAVO1Yc+sdmjMaw9TO1DrOrowRjVugdP5
         WFrwo64WirA4twFURhw4SU1knG/PQiXfHvc5OgutD8EFMowC9Q3fZ8rSW7KXW41vom/b
         xFrw==
X-Gm-Message-State: AOAM532QBkndX3OO0kOQeBQOnT/JKtuVKSLdNmCSHy/whvP8Aa//bMQh
        FNZG2VH2d0BxrHGtNFACYuxZARm3GQvwDD2w
X-Google-Smtp-Source: ABdhPJyhcHxdE3407ZLIg/EhfM9HsKT8Hl+LGzHKEIPrh7pT4MvrPMla/QgS6LTMPDhRP1JjfNMtuA==
X-Received: by 2002:a17:902:b68c:b029:e6:bb9f:7577 with SMTP id c12-20020a170902b68cb02900e6bb9f7577mr2215301pls.0.1615949278590;
        Tue, 16 Mar 2021 19:47:58 -0700 (PDT)
Received: from localhost.localdomain (p926243-ipngn9601hodogaya.kanagawa.ocn.ne.jp. [114.164.25.243])
        by smtp.googlemail.com with ESMTPSA id y8sm646269pjb.11.2021.03.16.19.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 19:47:58 -0700 (PDT)
From:   Nitin Joshi <nitjoshi@gmail.com>
X-Google-Original-From: Nitin Joshi <njoshi1@lenovo.com>
To:     hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: sysfs interface to get wwan antenna type
Date:   Wed, 17 Mar 2021 11:46:36 +0900
Message-Id: <20210317024636.356175-1-njoshi1@lenovo.com>
X-Mailer: git-send-email 2.27.0
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
 .../admin-guide/laptops/thinkpad-acpi.rst     |  20 ++++
 drivers/platform/x86/thinkpad_acpi.c          | 109 ++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 91fd6846ce17..6721a80a2d4f 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -52,6 +52,7 @@ detailed description):
 	- LCD Shadow (PrivacyGuard) enable and disable
 	- Lap mode sensor
 	- Setting keyboard language
+	- WWAN Antenna type
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1490,6 +1491,25 @@ fr(French), fr-ch(French(Switzerland)), hu(Hungarian), it(Italy), jp (Japan),
 nl(Dutch), nn(Norway), pl(Polish), pt(portugese), sl(Slovenian), sv(Sweden),
 tr(Turkey)
 
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
 
 Adaptive keyboard
 -----------------
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b881044b31b0..7bc9868be578 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10423,6 +10423,111 @@ static struct ibm_struct kbdlang_driver_data = {
 	.exit = kbdlang_exit,
 };
 
+/*************************************************************************
+ * DPRC(Dynamic Power Reduction Control) subdriver, for the Lenovo WWAN
+ * and WLAN feature.
+ */
+#define DPRC_GET_WWAN_ANTENNA_TYPE      0x40000
+#define DPRC_WWAN_ANTENNA_TYPE_A_BIT    BIT(4)
+#define DPRC_WWAN_ANTENNA_TYPE_B_BIT    BIT(8)
+static bool has_antennatype;
+static int wwan_antennatype;
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
+	 * for example command to get WWAN Antenna type command is not supported on
+	 * some devices.
+	 */
+	if (*output & METHOD_ERR)
+		return -ENODEV;
+
+	return 0;
+}
+
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
+		return -ENODEV;
+
+	return 0;
+}
+
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
+static DEVICE_ATTR_RO(wwan_antenna_type);
+
+static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
+{
+	int wwanantenna_err, err;
+
+	wwanantenna_err = get_wwan_antenna(&wwan_antennatype);
+	/*
+	 * If support isn't available (ENODEV) then quit, but don't
+	 * return an error.
+	 */
+	if (wwanantenna_err == -ENODEV)
+		return 0;
+
+	/* if there was an error return it */
+	if (wwanantenna_err && (wwanantenna_err != -ENODEV))
+		return wwanantenna_err;
+	else if (!wwanantenna_err)
+		has_antennatype = true;
+
+	if (has_antennatype) {
+		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_antenna_type.attr);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
+static void dprc_exit(void)
+{
+	if (has_antennatype)
+		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_antenna_type.attr);
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
@@ -10927,6 +11032,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_kbdlang_init,
 		.data = &kbdlang_driver_data,
 	},
+	{
+		.init = tpacpi_dprc_init,
+		.data = &dprc_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.27.0


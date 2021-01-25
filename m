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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E0DC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 03:01:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00C60224B1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 03:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbhAYDAx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 24 Jan 2021 22:00:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbhAYDAk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 24 Jan 2021 22:00:40 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840FBC061573
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 Jan 2021 18:59:38 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d4so6713715plh.5
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 Jan 2021 18:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1uIF1G9ITzEMQkxHp3VleNEhpiaBBhnlUXW4sohcEs=;
        b=eIFN7YtQLKThMUBtoVZN4aFLxAcBGvslj8FrlHSjfzC649yRWQ8aoxj4egTAgyxBO7
         J5kM+YMs1xFp4HFJnsI4bXCQI5j1immmrM4UHS9XLpCAOBg5Noz/rw22WQt8p8Mtkr9a
         VvFN9pxzmNweDpjDw7dwZ0Jd6vUKRic2ruNP7j8xDxI9WUeMy7HjQmCTW3HJpVEzav/i
         //XiUqrdN5mzXWMLwFFboTJMwBHWVD2VKTxDk/nZsHktMIzEhWTiSw8yXshzXGvAfx5T
         uKzZkfpteCatTRKf/lLcmP2uKERmwfExP6RgjbcbefsEb5AnUtvS+/dXkURqjWQgaDhg
         052g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1uIF1G9ITzEMQkxHp3VleNEhpiaBBhnlUXW4sohcEs=;
        b=H/N1APP7qsSOWnEvteaM8VNXmMRLIYI0wCewNX+RZmpWrDh2zSjPjYEYptK3SRe3i2
         4/b7FPu9p4WqDmIpiQ4wJ24U2MlyLIiyR9lgPQPzV2+03dEaZKTuOEVmaY3ZczjCLsKE
         BYfYa6hUws8nSjSvMvd3wJyylXq5cVLORb/hg8YefofAjOhEU+E75kSTaK+5G8cBziRj
         ePjGPVIT7xclEyibFeLPsw5EwrueLAisAeJgl0QMcAmqDQ1FKWO4sxkgNlF08Bcs6uyE
         Ixu4qw3EIVtVnIJQtfoAttz8Mp8ny2D+uQE+9HMShuCR+1+BjKqo2iG3hH+ffVkpfUsv
         He0w==
X-Gm-Message-State: AOAM530BVMxMxc19/oyRyzyDZSi7KBx6xA7gxOKXsMvBj4qo6q9BNxBF
        o2iEEs+nqNcJXZ/fKSnNvLR7eJs5JZlsPes+
X-Google-Smtp-Source: ABdhPJyOepGYbCCIp10Ih9fIKL4hnfzwrvkEQxMN+3NG7s4V6IRAujf7bKr2Gs24iAlSucAcW9Ywww==
X-Received: by 2002:a17:902:a5c5:b029:de:30b0:f1d with SMTP id t5-20020a170902a5c5b02900de30b00f1dmr3138417plq.1.1611543577776;
        Sun, 24 Jan 2021 18:59:37 -0800 (PST)
Received: from localhost.localdomain (p926243-ipngn9601hodogaya.kanagawa.ocn.ne.jp. [114.164.25.243])
        by smtp.gmail.com with ESMTPSA id 5sm16413766pjz.23.2021.01.24.18.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 18:59:36 -0800 (PST)
From:   Nitin Joshi <nitjoshi@gmail.com>
To:     hdegoede@redhat.com
Cc:     bberg@redhat.com, peter.hutterer@redhat.com, maruichit@lenovo.com,
        mpearson@lenovo.com, platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>
Subject: [PATCH] [v2] platform/x86: thinkpad_acpi: set keyboard language
Date:   Mon, 25 Jan 2021 11:59:16 +0900
Message-Id: <20210125025916.180831-1-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Nitin Joshi <njoshi1@lenovo.com>

This patch is to create sysfs entry for setting keyboard language
using ASL method. Some thinkpads models like T580 , T590 , T15 Gen 1
etc. has "=", "(',")" numeric keys, which are not displaying correctly,
when keyboard language is other than "english".
This patch fixes this issue by setting keyboard language to ECFW.

Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
---
Changes in v2:
 - used sysfs_streq() API instead of strcmp
 - used ARRAY_SIZE() API instead of strlen
 - addressed typo
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  24 +++
 drivers/platform/x86/thinkpad_acpi.c          | 182 ++++++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 5fe1ade88c17..b1188f05a99a 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -51,6 +51,7 @@ detailed description):
 	- UWB enable and disable
 	- LCD Shadow (PrivacyGuard) enable and disable
 	- Lap mode sensor
+	- Setting keyboard language
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1466,6 +1467,29 @@ Sysfs notes
 	rfkill controller switch "tpacpi_uwb_sw": refer to
 	Documentation/driver-api/rfkill.rst for details.
 
+
+Setting keyboard language
+-------------------
+
+sysfs: keyboard_lang
+
+This feature is used to set keyboard language to ECFW using ASL interface.
+Fewer thinkpads models like T580 , T590 , T15 Gen 1 etc.. has "=", "(',
+")" numeric keys, which are not displaying correctly, when keyboard language
+is other than "english". This is because of default keyboard language in ECFW
+is set as "english". Hence using this sysfs, user can set correct keyboard
+language to ECFW and then these key's will work correctly .
+
+Example of command to set keyboard language is mentioned below::
+
+        echo jp > /sys/devices/platform/thinkpad_acpi/keyboard_lang
+
+Text corresponding to keyboard layout to be set in sysfs are : jp (Japan), be(Belgian),
+cz(Czech), en(English), da(Danish), de(German), es(Spain) , et(Estonian),
+fr(French) , fr-ch (French(Switzerland)), pl(Polish), sl(Slovenian), hu
+(Hungarian), nl(Dutch), tr(Turkey), it(Italy), sv(Sweden), pt(portugese)
+
+
 Adaptive keyboard
 -----------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e03df2881dc6..3cfc4a872c2d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9982,6 +9982,183 @@ static struct ibm_struct proxsensor_driver_data = {
 	.exit = proxsensor_exit,
 };
 
+/*************************************************************************
+ * Keyboard language interface
+ */
+
+struct keyboard_lang_data {
+	const char *lang_str;
+	int lang_code;
+};
+
+/*
+ * When adding new entries to keyboard_lang_data, please check that
+ * the select_lang[] buffer in keyboard_lang_show() is still large enough.
+ */
+struct keyboard_lang_data keyboard_lang_data[] = {
+	{"en", 0},
+	{"be", 0x080c},
+	{"cz", 0x0405},
+	{"da", 0x0406},
+	{"de", 0x0c07},
+	{"es", 0x2c0a},
+	{"et", 0x0425},
+	{"fr", 0x040c},
+	{"fr-ch", 0x100c},
+	{"hu", 0x040e},
+	{"it", 0x0410},
+	{"jp", 0x0411},
+	{"nl", 0x0413},
+	{"nn", 0x0414},
+	{"pl", 0x0415},
+	{"pt", 0x0816},
+	{"sl", 0x041b},
+	{"sv", 0x081d},
+	{"tr", 0x041f},
+};
+
+static int set_keyboard_lang_command(int command)
+{
+	acpi_handle sskl_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "SSKL", &sskl_handle))) {
+		/* Platform doesn't support SSKL */
+		return -ENODEV;
+	}
+
+	if (!acpi_evalf(sskl_handle, &output, NULL, "dd", command))
+		return -EIO;
+
+	return 0;
+}
+
+static int get_keyboard_lang(int *output)
+{
+	acpi_handle gskl_handle;
+	int kbd_lang;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GSKL", &gskl_handle))) {
+		/* Platform doesn't support GSKL */
+		return -ENODEV;
+	}
+
+	if (!acpi_evalf(gskl_handle, &kbd_lang, NULL, "dd", 0x02000000))
+		return -EIO;
+
+	*output = kbd_lang;
+
+	return 0;
+}
+
+/* sysfs keyboard language entry */
+static ssize_t keyboard_lang_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	int output, err, i;
+	char select_lang[80] = "";
+	char lang[8] = "";
+
+	err = get_keyboard_lang(&output);
+	if (err)
+		return err;
+
+	for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
+		if (i)
+			strcat(select_lang, " ");
+
+		if (output == keyboard_lang_data[i].lang_code) {
+			strcat(lang, "[");
+			strcat(lang, keyboard_lang_data[i].lang_str);
+			strcat(lang, "]");
+			strcat(select_lang, lang);
+		} else {
+			strcat(select_lang, keyboard_lang_data[i].lang_str);
+		}
+	}
+
+	return sysfs_emit(buf, "%s\n", select_lang);
+}
+
+static ssize_t keyboard_lang_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int err, i;
+	bool lang_found = false;
+	int lang_code = 0;
+
+	for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
+		if (sysfs_streq(buf, keyboard_lang_data[i].lang_str)) {
+			lang_code = keyboard_lang_data[i].lang_code;
+			lang_found = true;
+			break;
+		}
+	}
+
+	if (lang_found) {
+		lang_code = lang_code | 1 << 24;
+
+		/* Set language code */
+		err = set_keyboard_lang_command(lang_code);
+		if (err)
+			return err;
+	} else {
+		pr_err("Unknown Keyboard language. Ignoring\n");
+		return -EINVAL;
+	}
+
+	tpacpi_disclose_usertask(attr->attr.name,
+			"keyboard language is set to  %s\n", buf);
+
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "keyboard_lang");
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(keyboard_lang);
+
+static struct attribute *kbdlang_attributes[] = {
+	&dev_attr_keyboard_lang.attr,
+	NULL
+};
+
+static const struct attribute_group kbdlang_attr_group = {
+	.attrs = kbdlang_attributes,
+};
+
+static int tpacpi_kbdlang_init(struct ibm_init_struct *iibm)
+{
+	int err, output;
+
+	err = get_keyboard_lang(&output);
+	/*
+	 * If support isn't available (ENODEV) then don't return an error
+	 * just don't create the sysfs group
+	 */
+	if (err == -ENODEV)
+		return 0;
+
+	if (err)
+		return err;
+
+	/* Platform supports this feature - create the sysfs file */
+	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
+
+	return err;
+}
+
+static void kbdlang_exit(void)
+{
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
+}
+
+static struct ibm_struct kbdlang_driver_data = {
+	.name = "kbdlang",
+	.exit = kbdlang_exit,
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -10474,6 +10651,11 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_proxsensor_init,
 		.data = &proxsensor_driver_data,
 	},
+	{
+		.init = tpacpi_kbdlang_init,
+		.data = &kbdlang_driver_data,
+	},
+
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.25.1


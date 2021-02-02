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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1649C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 00:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 800DC64E7B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 00:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhBBAdI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Feb 2021 19:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbhBBAdH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Feb 2021 19:33:07 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1ADC061573
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Feb 2021 16:32:27 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id b21so13657892pgk.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Feb 2021 16:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmk6HAK83O+MhR4+V3Y1PpAJKJP4w23SY8NeXqf50B4=;
        b=g554xwH7uDl4MBp1uR6cyYI/a1DJvC8R9p+ojE9VX4AInef3NbENIuO/b+NYXIObQy
         BopvboAyys2NHi+zhN5WE0sYk+P6BdNKphXl5JEaLo1VxqVHDLwOFEH2LBsHW1ym+9Nd
         rjqBDKFwalNgzBo+MN+Pj1JrA6AXRddn2rhjCoUtE2IdK4ABD+4wJO6WDcJBLPtVqESR
         mMj61jG1NFw5uOZIttL2wpacI5P2EMphf/sVHsXLR+yco2fo0TL/NwxnzVLp5bAWrbng
         skMcPHdPrfgLxAxkoEzJ7la+cNigBn2gCphUB4u+6HMBqJ+uYwQVvTIriMDm+WKOwkV6
         vBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmk6HAK83O+MhR4+V3Y1PpAJKJP4w23SY8NeXqf50B4=;
        b=GcCGzLKvzfaNCo7Jll68JBVm0QsZ/Vo2oEEH8ru0Npswn2KfWO/RaXoJPVk38IqnQW
         Dn0GvuWYheMmFPFlxUpidlFQOp/ufiPaGELQao9UaRW8jjZF0lq/0Z00gP76cvGY62cC
         OYsTox5v2o/wKzhtE6fAp44FPNie1Yyc+FoGYz1twNUSl2nQ9rq6Pp0dP/M3JYpLmPUQ
         Y0Y4EWoxpaY89vjlXmUJP1+1uNJbS8SjQN7uU6CHEEBub/ifPOMa6otVX5BTWGnuiYk5
         P7KSj1UPbsHfMNjTdwjiMUPfqNhBsMOoNufXWwbixJLm6CdMRRjJR+tRyr3dcydWbIoN
         /Jsg==
X-Gm-Message-State: AOAM533aAqY4q94opNE5InTIG22xcZ/0uYEiVqFeRcnhKXPYRzy+iG68
        uBkLzrApcr/Pd4W7A2WoUp8=
X-Google-Smtp-Source: ABdhPJyPhEbgzI72P9opAOACRTJUE4H6m2gaUO+pslnHCDxmKXEazCSYGjZNLppQW6KhS2l5cVPqtQ==
X-Received: by 2002:a62:f943:0:b029:1a5:43f9:9023 with SMTP id g3-20020a62f9430000b02901a543f99023mr18930233pfm.75.1612225947134;
        Mon, 01 Feb 2021 16:32:27 -0800 (PST)
Received: from localhost.localdomain (p926243-ipngn9601hodogaya.kanagawa.ocn.ne.jp. [114.164.25.243])
        by smtp.gmail.com with ESMTPSA id ds10sm613200pjb.1.2021.02.01.16.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 16:32:26 -0800 (PST)
From:   Nitin Joshi <nitjoshi@gmail.com>
X-Google-Original-From: Nitin Joshi <njoshi1@lenovo.com>
To:     hdegoede@redhat.com
Cc:     andy.shevchenko@gmail.com, mpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: fixed warning and incorporated review comments
Date:   Tue,  2 Feb 2021 09:32:10 +0900
Message-Id: <20210202003210.91773-1-njoshi1@lenovo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The previous commit adding new sysfs for keyboard language has warning and
few code correction has to be done as per new review comments.

Below changes has been addressed in this version:
 - corrected warning. Many thanks to kernel test robot <lkp@intel.com> for
   reporting and determining this warning.
 - used sysfs_emit_at() API instead of strcat.
 - sorted keyboard language array.
 - removed unwanted space and corrected sentences.

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 15 ++++----
 drivers/platform/x86/thinkpad_acpi.c          | 34 +++++++------------
 2 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index b1188f05a99a..3b225ae47f1a 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1476,18 +1476,19 @@ sysfs: keyboard_lang
 This feature is used to set keyboard language to ECFW using ASL interface.
 Fewer thinkpads models like T580 , T590 , T15 Gen 1 etc.. has "=", "(',
 ")" numeric keys, which are not displaying correctly, when keyboard language
-is other than "english". This is because of default keyboard language in ECFW
-is set as "english". Hence using this sysfs, user can set correct keyboard
-language to ECFW and then these key's will work correctly .
+is other than "english". This is because the default keyboard language in ECFW
+is set as "english". Hence using this sysfs, user can set the correct keyboard
+language to ECFW and then these key's will work correctly.
 
 Example of command to set keyboard language is mentioned below::
 
         echo jp > /sys/devices/platform/thinkpad_acpi/keyboard_lang
 
-Text corresponding to keyboard layout to be set in sysfs are : jp (Japan), be(Belgian),
-cz(Czech), en(English), da(Danish), de(German), es(Spain) , et(Estonian),
-fr(French) , fr-ch (French(Switzerland)), pl(Polish), sl(Slovenian), hu
-(Hungarian), nl(Dutch), tr(Turkey), it(Italy), sv(Sweden), pt(portugese)
+Text corresponding to keyboard layout to be set in sysfs are: be(Belgian),
+cz(Czech), da(Danish), de(German), en(English), es(Spain), et(Estonian),
+fr(French), fr-ch(French(Switzerland)), hu(Hungarian), it(Italy), jp (Japan),
+nl(Dutch), nn(Norway), pl(Polish), pt(portugese), sl(Slovenian), sv(Sweden),
+tr(Turkey)
 
 
 Adaptive keyboard
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 3cfc4a872c2d..a7f1b4ee5457 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9991,16 +9991,12 @@ struct keyboard_lang_data {
 	int lang_code;
 };
 
-/*
- * When adding new entries to keyboard_lang_data, please check that
- * the select_lang[] buffer in keyboard_lang_show() is still large enough.
- */
-struct keyboard_lang_data keyboard_lang_data[] = {
-	{"en", 0},
+static const struct keyboard_lang_data keyboard_lang_data[] = {
 	{"be", 0x080c},
 	{"cz", 0x0405},
 	{"da", 0x0406},
 	{"de", 0x0c07},
+	{"en", 0x0000},
 	{"es", 0x2c0a},
 	{"et", 0x0425},
 	{"fr", 0x040c},
@@ -10056,9 +10052,7 @@ static ssize_t keyboard_lang_show(struct device *dev,
 				struct device_attribute *attr,
 				char *buf)
 {
-	int output, err, i;
-	char select_lang[80] = "";
-	char lang[8] = "";
+	int output, err, i, len = 0;
 
 	err = get_keyboard_lang(&output);
 	if (err)
@@ -10066,19 +10060,18 @@ static ssize_t keyboard_lang_show(struct device *dev,
 
 	for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
 		if (i)
-			strcat(select_lang, " ");
+			len += sysfs_emit_at(buf, len, "%s", " ");
 
 		if (output == keyboard_lang_data[i].lang_code) {
-			strcat(lang, "[");
-			strcat(lang, keyboard_lang_data[i].lang_str);
-			strcat(lang, "]");
-			strcat(select_lang, lang);
+			len += sysfs_emit_at(buf, len, "%s%s%s", "[",
+					keyboard_lang_data[i].lang_str, "]");
 		} else {
-			strcat(select_lang, keyboard_lang_data[i].lang_str);
+			len += sysfs_emit_at(buf, len, "%s", keyboard_lang_data[i].lang_str);
 		}
 	}
+	len += sysfs_emit_at(buf, len, "\n");
 
-	return sysfs_emit(buf, "%s\n", select_lang);
+	return len;
 }
 
 static ssize_t keyboard_lang_store(struct device *dev,
@@ -10105,7 +10098,7 @@ static ssize_t keyboard_lang_store(struct device *dev,
 		if (err)
 			return err;
 	} else {
-		pr_err("Unknown Keyboard language. Ignoring\n");
+		dev_err(&tpacpi_pdev->dev, "Unknown Keyboard language. Ignoring\n");
 		return -EINVAL;
 	}
 
@@ -10116,7 +10109,6 @@ static ssize_t keyboard_lang_store(struct device *dev,
 
 	return count;
 }
-
 static DEVICE_ATTR_RW(keyboard_lang);
 
 static struct attribute *kbdlang_attributes[] = {
@@ -10135,7 +10127,7 @@ static int tpacpi_kbdlang_init(struct ibm_init_struct *iibm)
 	err = get_keyboard_lang(&output);
 	/*
 	 * If support isn't available (ENODEV) then don't return an error
-	 * just don't create the sysfs group
+	 * just don't create the sysfs group.
 	 */
 	if (err == -ENODEV)
 		return 0;
@@ -10144,9 +10136,7 @@ static int tpacpi_kbdlang_init(struct ibm_init_struct *iibm)
 		return err;
 
 	/* Platform supports this feature - create the sysfs file */
-	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
-
-	return err;
+	return sysfs_create_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
 }
 
 static void kbdlang_exit(void)
-- 
2.25.1


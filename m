Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCD6C00140
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Aug 2022 01:32:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbiHKBcK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Aug 2022 21:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbiHKBcJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Aug 2022 21:32:09 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB48A844EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 18:32:08 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id c24so11030139pgg.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 18:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=EtdTk/pSm9fy7p3GeAyhP376teZ1FETJ+RMWAFF66Dk=;
        b=h22lEBdacTWkUHcVnyi3JevWq/kaqoGkVT8thpksGlkrXxJ5DjahL9KOr6lCV+OigQ
         zkZJgORC/WVJpi5lv/xrQyTaiRMw3AycUOygq661BViTc58QlBK8kB6k6zcsgZs7jYOZ
         z9gcwZ+h1secFtSGc055AYWTJ6skZ/PeBoeav3TZCVvcHQY96R+HtZKNvW2iKlSrom8/
         Mlb5OSXEvGpu8QI6JX1/g80tFp0k7t0Da5oGy9EgIdDh/zs/2MVyJy8uRsMIRBjXvKde
         /cCFNwaErJnpAzoXvQNBzF88suuXDryZwt6eyr3+L6ldbmuVSdPTto+ZBNlrWVh/Bbdm
         y+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=EtdTk/pSm9fy7p3GeAyhP376teZ1FETJ+RMWAFF66Dk=;
        b=pqinEt6NOWxrur6qYKt+M0S316ETDoI7OWRI0T5a5fbQFy/K3+Z/W2mbOYIqgNcVVU
         a7wUpBLeig1QQWEz6Oa9qFmwVCPk1wFXUwJ49y7OPfaPiEKLxO24HhSLuZkvpmnPlzlq
         210IJC0Lg0dtgiLB5KGeWptcI/4XhaxBA0Ha1/HRin/qjMwEg6Rrk6vkLsR7TPS7bl0P
         dvMT7LXqLIpFOQ9BMj8xF4un9q0T3pLadCjT+YOThRrQiT8tbYr1nk8r+OgPxdPIimYj
         MLin6PKknYnHsvLc0pbUuykxKLXB7e+ZRu5kk1SJ4gUFj+7k8xTuOlM82gDJ2lblvqeJ
         /bBQ==
X-Gm-Message-State: ACgBeo3244cCW0RY7NRpij3btyHZddYWhecuMscLe1CDGufpOzlbBNWz
        gMDwpD2kkJGeU69b+CIZBfc=
X-Google-Smtp-Source: AA6agR5M47jN+jf6IJ2MqPEo1aolwGXM5PCmU8Yhf7mclaBwjp73wC6CSyaOgrcN1hSWgmuL0b2/YQ==
X-Received: by 2002:a65:498b:0:b0:412:8e4:2842 with SMTP id r11-20020a65498b000000b0041208e42842mr25003051pgs.71.1660181527956;
        Wed, 10 Aug 2022 18:32:07 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id f206-20020a6238d7000000b0052d50e14f1dsm2695359pfa.78.2022.08.10.18.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 18:32:07 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To:     hdegoede@redhat.com
Cc:     corentin.chary@gmail.com, markgross@kernel.org,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] platform/x86: asus-wmi:Use the function kobj_to_dev()
Date:   Thu, 11 Aug 2022 01:32:03 +0000
Message-Id: <20220811013203.16010-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Use kobj_to_dev() instead of open-coding it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/platform/x86/asus-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 89b604e04d7f..afb33a084f44 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2006,7 +2006,7 @@ static struct attribute *hwmon_attributes[] = {
 static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 					  struct attribute *attr, int idx)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct asus_wmi *asus = dev_get_drvdata(dev->parent);
 	u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
 
@@ -3294,7 +3294,7 @@ static struct attribute *platform_attributes[] = {
 static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 				    struct attribute *attr, int idx)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 	bool ok = true;
 	int devid = -1;
-- 
2.25.1

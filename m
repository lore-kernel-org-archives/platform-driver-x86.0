Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F15CD8CA9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 17:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbjJJRWx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 13:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbjJJRWw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 13:22:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BBBA7
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:22:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50567477b29so7715184e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696958567; x=1697563367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuMZiwnPxp//oSdJI92Jz/jQPOBiUUP6G7MFH1mH3QM=;
        b=FfwqX2ZFSLngUaWn4p8zFnnITnYIwJ8C733cB5EzvX4Uz2klEZvzs31ybo2rnhV2Pj
         u2isbIh5vyXz1OMzUDt8gJNpnfJyac9IdOzn1MF2OUe8FiBX4bGO4CZGKNRFQX13ar2J
         fBnQ3BjMl1/GYSPtnbvsmvbKVBgMdufpBPYOP4d3RlXf3T3RoeU93qPYj35yUoP2WKtO
         0qKRy84lLmTKTalbjTm/2vb/ftU/cNBokrFwr/4sSxU5Yddz+VWddK7AmqKGT2H3dmwX
         x4rT5vljDg+xaLiG2gdYVnkBsA1hyDztUAK5bkCj0RojbZiWurfVFwPpN/PLTxmZJ8RG
         kK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696958567; x=1697563367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuMZiwnPxp//oSdJI92Jz/jQPOBiUUP6G7MFH1mH3QM=;
        b=bhVPBYi3hJGMQQjhYsyi/QoelDOfMjl1WSe239M8yW22pDuEPDWXvuvJi2FH/wriWZ
         wdSxgCuEFoKFPXQecBnEYLFrCBK5QmUlOFx2XG9oPXH+HeU0nJ/dVIVlpsTwP6ood1vU
         ux/HZ/pKfcZHqMJN87ZUS3m8KVVXY0tnFgW9C18wRL1GKu8Zf1YwVjhCPCEWKbi3RYE0
         sOojoXIOXOPwnI3J4BpkATM9DwzSPIJODrlk4nY3boipg1AsHlamNJv/jmd8dadLU2cE
         wEJXNJCc5Dr1dqv8HFPnRuyz4KJ0bR1aPj6WWd0UCpGBdxzo7yaJhvv+PFgoDw1w8+D8
         pDBg==
X-Gm-Message-State: AOJu0Ywj7mAKZlvu4AYqdJq9Jll6RxmYkMZ+AbTCZwcXlqJcPh6mCFJS
        G57bI6PzNFoak9lZbI8MvMB5VzRXqGI=
X-Google-Smtp-Source: AGHT+IFwXIt8qa0lJxl4yYlAMPAoWLuauGqXebD7FLb/Gf0mrg5F4cASjRo1So30JdPHLUhNX/Swlw==
X-Received: by 2002:a05:6512:475:b0:503:3b6:597d with SMTP id x21-20020a056512047500b0050303b6597dmr13414182lfd.3.1696958567190;
        Tue, 10 Oct 2023 10:22:47 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.138])
        by smtp.gmail.com with ESMTPSA id y2-20020a197502000000b005041f004d33sm1881636lfe.90.2023.10.10.10.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:22:46 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 3/5] platform/x86: msi-ec: Filter out unsupported attributes
Date:   Tue, 10 Oct 2023 20:20:40 +0300
Message-ID: <20231010172037.611063-9-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010172037.611063-3-teackot@gmail.com>
References: <20231010172037.611063-3-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Filter the attributes and only create those which are supported by the
currently loaded configuration. The filtered attributes are saved in an
attribute group to be easily created and removed.
root_attrs_support is an array of all attributes and their support
conditions. fw_version and fw_release_date are supported on all models
so their condition is always true.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 40 +++++++++++++++++++++++++++--------
 drivers/platform/x86/msi-ec.h |  5 +++++
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 772b230fb47e..09472b21e093 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -872,22 +872,44 @@ static ssize_t fw_release_date_show(struct device *device,
 static DEVICE_ATTR_RO(fw_version);
 static DEVICE_ATTR_RO(fw_release_date);
 
-static struct attribute *msi_root_attrs[] = {
-	&dev_attr_fw_version.attr,
-	&dev_attr_fw_release_date.attr,
-	NULL
-};
-
-static struct attribute_group msi_root_group = {
-	.attrs = msi_root_attrs,
-};
+static struct attribute_group msi_root_group;
 
 /*
  * Sysfs platform driver
  */
 
+/*
+ * Copies supported attributes from `attributes` to `filtered`
+ */
+static void filter_attributes(struct attribute_support *attributes,
+			      struct attribute **filtered,
+			      size_t size)
+{
+	for (int i = 0, j = 0; i < size; i++) {
+		if (attributes[i].supported)
+			filtered[j++] = attributes[i].attribute;
+	}
+}
+
 static int msi_platform_probe(struct platform_device *pdev)
 {
+	struct attribute_support root_attrs_support[] = {
+		{
+			&dev_attr_fw_version.attr,
+			true,
+		},
+		{
+			&dev_attr_fw_release_date.attr,
+			true,
+		},
+	};
+
+	/* +1 to null-terminate the array */
+	static struct attribute *root_attrs[ARRAY_SIZE(root_attrs_support) + 1] = {0};
+
+	filter_attributes(root_attrs_support, root_attrs, ARRAY_SIZE(root_attrs_support));
+	msi_root_group.attrs = root_attrs;
+
 	return sysfs_create_group(&pdev->dev.kobj, &msi_root_group);
 }
 
diff --git a/drivers/platform/x86/msi-ec.h b/drivers/platform/x86/msi-ec.h
index be3533dc9cc6..f4198f0df5d9 100644
--- a/drivers/platform/x86/msi-ec.h
+++ b/drivers/platform/x86/msi-ec.h
@@ -119,4 +119,9 @@ struct msi_ec_conf {
 	struct msi_ec_kbd_bl_conf         kbd_bl;
 };
 
+struct attribute_support {
+	struct attribute *attribute;
+	bool supported;
+};
+
 #endif // _MSI_EC_H_
-- 
2.42.0


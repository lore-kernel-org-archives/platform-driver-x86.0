Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786A9CD8CA9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 17:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbjJJRWZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 13:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbjJJRWY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 13:22:24 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D34E94
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:22:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c124adf469so68250031fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696958540; x=1697563340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LttAJoa3Sxh6ubGT0mh0natp5cd6jUzXflX3YVOLyz8=;
        b=gUraeNb7TZ7lMZIhzKT0uKExzlPWKW7okcgB7lEno16hLO2fWBde5Dl0dqTlWcfoBe
         NHfzn5/9Xz27LyZ8Q9tV4rMshy5i9MlU+3/puxMqv04sUyWm3UEVWtvj1G7zUcUllaRC
         pdkGuTJNotnrIhNLvlLzPm65e9FYSwf1rA9jiFFA5GajhaPhA56Nq/HR5hQtDgdH2a9N
         lc/0MMXKnyn9c6ndzx0S+HRk9zd8hKi/tBYpmgl5wSq6CgDZ6YcFID4pFqOShqFVKcxA
         +Fwpw8gdT4yt6nkqXujbx4N3xXtj/guCTLzjcl0JF7oEbvgztet7yS2xtQWy/rUSA8yl
         m48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696958540; x=1697563340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LttAJoa3Sxh6ubGT0mh0natp5cd6jUzXflX3YVOLyz8=;
        b=Z+xtv5/TFbUX+L5dgbh8hjc57BswZHaBT2aRRmaEtMmuwm50ahI5KS/mi3g4uBxeuV
         7icvraTqs/hXxBj1TjJx5yzZ2g4KeN4tISdM71dgGYeoYHMn/Dvp6r8TDJKpgLVcXF+f
         k/cLAbtDrhjCGPbVkftUDZfGuQ3Tsg8hOzQCVEjpPYzBiEhBVu6xN1UomYjkh5zIw1a7
         x2QF42c0ktTP364tHIMZIgQx3+olcDOQre+5VfAA8IV00+D7qRSLG2DlMbMUICTDqwwl
         xsWKMMmlk0BDkas7v+p+7jRPKAGqSp3XdXuO/a7JcE5lLo0sjbzUirLD0wcCIDq4tCK8
         bOXg==
X-Gm-Message-State: AOJu0YxvvceokiBu6xSVNXJHa4448CvJ1PkA3biV/Nu9MhWQqDm6HtLd
        hXbIsE5JCKyQMcE1lrZ9RBvWjvKLdkc=
X-Google-Smtp-Source: AGHT+IHUiu6vwPjIIHrTriasMGGNJZz7ipN7DVW+19L7taw4Ue2gIU9/3uYwq8CGnpB46WIt1ecokg==
X-Received: by 2002:a19:9153:0:b0:503:2089:d3b8 with SMTP id y19-20020a199153000000b005032089d3b8mr14539932lfj.8.1696958540375;
        Tue, 10 Oct 2023 10:22:20 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.138])
        by smtp.gmail.com with ESMTPSA id y2-20020a197502000000b005041f004d33sm1881636lfe.90.2023.10.10.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:22:19 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 2/5] platform/x86: msi-ec: Add fw version and release date attributes
Date:   Tue, 10 Oct 2023 20:20:38 +0300
Message-ID: <20231010172037.611063-7-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010172037.611063-3-teackot@gmail.com>
References: <20231010172037.611063-3-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Create a root attribute group and add the first platform device
attributes: firmware version and firmware release date. Firmware
version attribute uses an already present ec_get_firmware_version()
function. Both features are present on all supported laptops.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 67 ++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 12c559c9eac4..772b230fb47e 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -818,17 +818,82 @@ static struct acpi_battery_hook battery_hook = {
 	.name = MSI_EC_DRIVER_NAME,
 };
 
+/*
+ * Sysfs platform device attributes
+ */
+
+static ssize_t fw_version_show(struct device *device,
+			       struct device_attribute *attr, char *buf)
+{
+	u8 rdata[MSI_EC_FW_VERSION_LENGTH + 1];
+	int result;
+
+	result = ec_get_firmware_version(rdata);
+	if (result < 0)
+		return result;
+
+	return sysfs_emit(buf, "%s\n", rdata);
+}
+
+static ssize_t fw_release_date_show(struct device *device,
+				    struct device_attribute *attr, char *buf)
+{
+	u8 rdate[MSI_EC_FW_DATE_LENGTH + 1];
+	u8 rtime[MSI_EC_FW_TIME_LENGTH + 1];
+	int result;
+	int year, month, day, hour, minute, second;
+
+	memset(rdate, 0, MSI_EC_FW_DATE_LENGTH + 1);
+	result = ec_read_seq(MSI_EC_FW_DATE_ADDRESS,
+			     rdate,
+			     MSI_EC_FW_DATE_LENGTH);
+	if (result < 0)
+		return result;
+
+	result = sscanf(rdate, "%02d%02d%04d", &month, &day, &year);
+	if (result != 3)
+		return -EINVAL;
+
+	memset(rtime, 0, MSI_EC_FW_TIME_LENGTH + 1);
+	result = ec_read_seq(MSI_EC_FW_TIME_ADDRESS,
+			     rtime,
+			     MSI_EC_FW_TIME_LENGTH);
+	if (result < 0)
+		return result;
+
+	result = sscanf(rtime, "%02d:%02d:%02d", &hour, &minute, &second);
+	if (result != 3)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%04d/%02d/%02d %02d:%02d:%02d\n", year, month, day,
+			  hour, minute, second);
+}
+
+static DEVICE_ATTR_RO(fw_version);
+static DEVICE_ATTR_RO(fw_release_date);
+
+static struct attribute *msi_root_attrs[] = {
+	&dev_attr_fw_version.attr,
+	&dev_attr_fw_release_date.attr,
+	NULL
+};
+
+static struct attribute_group msi_root_group = {
+	.attrs = msi_root_attrs,
+};
+
 /*
  * Sysfs platform driver
  */
 
 static int msi_platform_probe(struct platform_device *pdev)
 {
-	return 0;
+	return sysfs_create_group(&pdev->dev.kobj, &msi_root_group);
 }
 
 static int msi_platform_remove(struct platform_device *pdev)
 {
+	sysfs_remove_group(&pdev->dev.kobj, &msi_root_group);
 	return 0;
 }
 
-- 
2.42.0


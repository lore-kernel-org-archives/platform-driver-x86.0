Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AFFCD8CAC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 17:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbjJJRXX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 13:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233897AbjJJRXW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 13:23:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CCFBA
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:23:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50337b43ee6so7747957e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696958599; x=1697563399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNctNVZCiah3eV9bvV6uMypTAlFhP6WeVV7YkTNVnY=;
        b=YM+O1fsTDRdGW55YlyUgUp4lm4cpBjyeS1eEM7of01EX2rsDrN0XGoqYFSFXSJpqa7
         R8zlExsVFAYU+PJdFB720Ag0XDkmxkHw2ky834RssbLshe9QFjjoDP0lsPn0O45FUQMe
         KWifV5KbnIobfJ4l0C6lNYLRpbY039zjPr3OqMGd7jIjJ3w7THlUmKRarpeo8VC/GYuR
         CQOD36HI7i0kYIjiKxGcSGibMqUrB2P83KHQu5RlS5R4qtkGDs0em1A8k3vjt9TAruKK
         6XZ4zCv4jEj4/QfwXlQ+SXQBojXyjeBJ6GAICguYi3/yupiwTlBnjvw3xlFf9RaXua0L
         SqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696958599; x=1697563399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecNctNVZCiah3eV9bvV6uMypTAlFhP6WeVV7YkTNVnY=;
        b=RJ3TuBYp/WVydQKWUUngx9Az/Gjc2mmY3xIHHIIiASaIDpTwW/TIWZ3jC2vavX3QAx
         l28fZyFBbiZyYIKLgIKygGCN9XoK4CtgJMQ5uLJjK16fNEoxF4mJJyliyFUGyNpQbUop
         SgJiT2lxF3q4HzdWtIC/wZsjdX849f/aU33bEt1QUpEcpWjbxbz9A4qNR6IyI3M5B8ba
         R5jhyDTp1WFJR6HQDK5RorcouElj2CuBGCfqN45vYDsifiZjq70uOo7jkRDVvwKin6Io
         Ojq91DSm0izShT/DijsFJVHX87tCFsoj3k3iTnZPWzGPx5IzNZZS87PGxx8nK9a+2z1W
         9pgw==
X-Gm-Message-State: AOJu0YzAaodo2yuMJ/GM/n/SRitc0dlG+tQ4m3g7Y+wanHeYFTv8KfXj
        Uxc0V78MN/Z45sBadyjYMOEIlMIVegI=
X-Google-Smtp-Source: AGHT+IHEe3fjbXwp9nAI9IJN8LljBIPy23qzo+ZP9izCEKZsM15G2XDsOZLN9j4qIUZSiePxkmO0Bw==
X-Received: by 2002:a19:7b03:0:b0:503:b65:5d95 with SMTP id w3-20020a197b03000000b005030b655d95mr15048332lfc.6.1696958598876;
        Tue, 10 Oct 2023 10:23:18 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.138])
        by smtp.gmail.com with ESMTPSA id y2-20020a197502000000b005041f004d33sm1881636lfe.90.2023.10.10.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:23:18 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 5/5] platform/x86: msi-ec: Add a cooler boost attribute
Date:   Tue, 10 Oct 2023 20:20:44 +0300
Message-ID: <20231010172037.611063-13-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010172037.611063-3-teackot@gmail.com>
References: <20231010172037.611063-3-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Cooler boost increases the fan speed to improve the laptop cooling.
This is a simple on/off feature that is easy to test: if it works
you'll hear the fans spinning much faster. So far all supported models
have this feature represented by a single bit at the 0x98 EC address.
The attribute makes use of the previously added bit operation functions.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index ae73dcf01d09..f4e770b3dda1 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -26,6 +26,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/string.h>
+#include <linux/kstrtox.h>
 
 #define SM_ECO_NAME		"eco"
 #define SM_COMFORT_NAME		"comfort"
@@ -850,6 +851,35 @@ static struct acpi_battery_hook battery_hook = {
  * Sysfs platform device attributes
  */
 
+static ssize_t cooler_boost_show(struct device *device,
+				 struct device_attribute *attr, char *buf)
+{
+	int result;
+	bool value;
+
+	result = ec_check_bit(conf.cooler_boost.address, conf.cooler_boost.bit, &value);
+
+	return sysfs_emit(buf, "%s\n", value ? "on" : "off");
+}
+
+static ssize_t cooler_boost_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	int result;
+	bool value;
+
+	result = kstrtobool(buf, &value);
+	if (result)
+		return result;
+
+	result = ec_set_bit(conf.cooler_boost.address, conf.cooler_boost.bit, value);
+	if (result < 0)
+		return result;
+
+	return count;
+}
+
 static ssize_t fw_version_show(struct device *device,
 			       struct device_attribute *attr, char *buf)
 {
@@ -897,6 +927,7 @@ static ssize_t fw_release_date_show(struct device *device,
 			  hour, minute, second);
 }
 
+static DEVICE_ATTR_RW(cooler_boost);
 static DEVICE_ATTR_RO(fw_version);
 static DEVICE_ATTR_RO(fw_release_date);
 
@@ -922,6 +953,10 @@ static void filter_attributes(struct attribute_support *attributes,
 static int msi_platform_probe(struct platform_device *pdev)
 {
 	struct attribute_support root_attrs_support[] = {
+		{
+			&dev_attr_cooler_boost.attr,
+			conf.cooler_boost.address != MSI_EC_ADDR_UNSUPP,
+		},
 		{
 			&dev_attr_fw_version.attr,
 			true,
-- 
2.42.0


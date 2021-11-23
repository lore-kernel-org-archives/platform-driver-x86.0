Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ED6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbhKWVHy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:07:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51730 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233885AbhKWVHx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LUZr7jp45aZyrdIRnHK+uTl5Zdb/dMyJiUFI6DVh3jc=;
        b=MD9Fwy/e3i1DA05ZdjsanMFh0o8/S4c9zfvpoYzRxQYsmS+fp6Y4BoODfdXGJjtdgy0WiI
        1NELEB483Yku3M0zd9Hn5HVt5T+M1EeNLi0A2lZNBSyTNHXX7S0lI95ZEiIDyEk2DMLM6p
        QoswYlYYU9kFYZTRnAALCxiom9JpgRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-sTDgUbzjPT2o4kvvyf6O7A-1; Tue, 23 Nov 2021 16:04:41 -0500
X-MC-Unique: sTDgUbzjPT2o4kvvyf6O7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CCE68799ED;
        Tue, 23 Nov 2021 21:04:40 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3E62F79448;
        Tue, 23 Nov 2021 21:04:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Baker <len.baker@gmx.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/6] platform/x86: thinkpad_acpi: tpacpi_attr_group contains driver attributes not device attrs
Date:   Tue, 23 Nov 2021 22:04:21 +0100
Message-Id: <20211123210424.266607-4-hdegoede@redhat.com>
In-Reply-To: <20211123210424.266607-1-hdegoede@redhat.com>
References: <20211123210424.266607-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit 79f960e29cfc ("platform/x86: thinkpad_acpi: Convert platform driver
to use dev_groups") put the debug_level, interface_version, version and the
THINKPAD_ACPI_DEBUGFACILITIES attributes in a new tpacpi_attr_group and
added those to the tpacpi_groups groups-array which is used to initialize
the driver.dev_groups member.

But before this commit these attributes were registered with
driver_create_file(), so they should be part of the groups-array which is
used to initialize the driver.groups member instead.

And also make the same change for the fan_watchdog hwmon driver attribute.

Fixes: 79f960e29cfc ("platform/x86: thinkpad_acpi: Convert platform driver to use dev_groups")
Cc: Len Baker <len.baker@gmx.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 30 +++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ecec5351daed..7680bb0ee2d5 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8646,7 +8646,6 @@ static struct attribute *fan_attributes[] = {
 	&dev_attr_pwm1.attr,
 	&dev_attr_fan1_input.attr,
 	&dev_attr_fan2_input.attr,
-	&driver_attr_fan_watchdog.attr,
 	NULL
 };
 
@@ -8670,6 +8669,16 @@ static const struct attribute_group fan_attr_group = {
 	.attrs = fan_attributes,
 };
 
+static struct attribute *fan_driver_attributes[] = {
+	&driver_attr_fan_watchdog.attr,
+	NULL
+};
+
+static const struct attribute_group fan_driver_attr_group = {
+	.is_visible = fan_attr_is_visible,
+	.attrs = fan_driver_attributes,
+};
+
 #define TPACPI_FAN_Q1	0x0001		/* Unitialized HFSP */
 #define TPACPI_FAN_2FAN	0x0002		/* EC 0x31 bit 0 selects fan2 */
 #define TPACPI_FAN_2CTL	0x0004		/* selects fan2 control */
@@ -10435,7 +10444,7 @@ static struct ibm_struct dprc_driver_data = {
 
 /* --------------------------------------------------------------------- */
 
-static struct attribute *tpacpi_attributes[] = {
+static struct attribute *tpacpi_driver_attributes[] = {
 	&driver_attr_debug_level.attr,
 	&driver_attr_version.attr,
 	&driver_attr_interface_version.attr,
@@ -10470,11 +10479,16 @@ static umode_t tpacpi_attr_is_visible(struct kobject *kobj,
 }
 #endif
 
-static const struct attribute_group tpacpi_attr_group = {
+static const struct attribute_group tpacpi_driver_attr_group = {
 #ifdef CONFIG_THINKPAD_ACPI_DEBUGFACILITIES
 	.is_visible = tpacpi_attr_is_visible,
 #endif
-	.attrs = tpacpi_attributes,
+	.attrs = tpacpi_driver_attributes,
+};
+
+static const struct attribute_group *tpacpi_driver_groups[] = {
+	&tpacpi_driver_attr_group,
+	NULL,
 };
 
 static const struct attribute_group *tpacpi_groups[] = {
@@ -10486,7 +10500,6 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&proxsensor_attr_group,
 	&kbdlang_attr_group,
 	&dprc_attr_group,
-	&tpacpi_attr_group,
 	NULL,
 };
 
@@ -10497,6 +10510,11 @@ static const struct attribute_group *tpacpi_hwmon_groups[] = {
 	NULL,
 };
 
+static const struct attribute_group *tpacpi_hwmon_driver_groups[] = {
+	&fan_driver_attr_group,
+	NULL,
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -10509,6 +10527,7 @@ static struct platform_driver tpacpi_pdriver = {
 	.driver = {
 		.name = TPACPI_DRVR_NAME,
 		.pm = &tpacpi_pm,
+		.groups = tpacpi_driver_groups,
 		.dev_groups = tpacpi_groups,
 	},
 	.shutdown = tpacpi_shutdown_handler,
@@ -10517,6 +10536,7 @@ static struct platform_driver tpacpi_pdriver = {
 static struct platform_driver tpacpi_hwmon_pdriver = {
 	.driver = {
 		.name = TPACPI_HWMON_DRVR_NAME,
+		.groups = tpacpi_hwmon_driver_groups,
 		.dev_groups = tpacpi_hwmon_groups,
 	},
 };
-- 
2.33.1


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5AEC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 07:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DFDB613B2
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 07:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238311AbhDMHVi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Apr 2021 03:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58423 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229580AbhDMHVh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Apr 2021 03:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618298477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=xfhWD4LuEvr6SvSP1VhSazKaMKiGs/S9uH0lW7bV7MY=;
        b=cXujy8U17EJQNChjg8jSltYLYLfBxWBKwmpF1qyEs+7MfzN0f+hOyKkPupBeO/5gia8dF/
        eR2zbL76osQJDqR4B/jiRRBRTsnBdfN7vRhPUekX3V7K1jK/cnZ2Sak/KtuQhTxUxBKP3h
        9Fmt9tzlMXj5sDt7aRTJ+O6/qsbugaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-s6SGmjrjP_iSN4t8xIkbjQ-1; Tue, 13 Apr 2021 03:21:16 -0400
X-MC-Unique: s6SGmjrjP_iSN4t8xIkbjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14CAC1006C87;
        Tue, 13 Apr 2021 07:21:15 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CBA731724D;
        Tue, 13 Apr 2021 07:21:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Add labels to the first 2 temperature sensors
Date:   Tue, 13 Apr 2021 09:21:12 +0200
Message-Id: <20210413072112.183550-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On EC version 3, the first 2 temperature sensors are always CPU and GPU
add labels for these.

This changes e.g. the "sensors" command output on a X1C8 from:

thinkpad-isa-0000
Adapter: ISA adapter
fan1:        2694 RPM
temp1:        +42.0°C
temp2:            N/A
temp3:        +33.0°C
temp4:         +0.0°C
temp5:        +35.0°C
temp6:        +42.0°C
temp7:        +42.0°C
temp8:            N/A

into:

thinkpad-isa-0000
Adapter: ISA adapter
fan1:        2694 RPM
CPU:          +42.0°C
GPU:              N/A
temp3:        +33.0°C
temp4:         +0.0°C
temp5:        +35.0°C
temp6:        +42.0°C
temp7:        +42.0°C
temp8:            N/A

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 72 ++++++++++++++++++----------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ec98089d98c9..dd60c9397d35 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6296,6 +6296,8 @@ struct ibm_thermal_sensors_struct {
 };
 
 static enum thermal_access_mode thermal_read_mode;
+static const struct attribute_group *thermal_attr_group;
+static bool thermal_use_labels;
 
 /* idx is zero-based */
 static int thermal_get_sensor(int idx, s32 *value)
@@ -6478,6 +6480,28 @@ static const struct attribute_group thermal_temp_input8_group = {
 #undef THERMAL_SENSOR_ATTR_TEMP
 #undef THERMAL_ATTRS
 
+static ssize_t temp1_label_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "CPU\n");
+}
+static DEVICE_ATTR_RO(temp1_label);
+
+static ssize_t temp2_label_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "GPU\n");
+}
+static DEVICE_ATTR_RO(temp2_label);
+
+static struct attribute *temp_label_attributes[] = {
+	&dev_attr_temp1_label.attr,
+	&dev_attr_temp2_label.attr,
+	NULL
+};
+
+static const struct attribute_group temp_label_attr_group = {
+	.attrs = temp_label_attributes,
+};
+
 /* --------------------------------------------------------------------- */
 
 static int __init thermal_init(struct ibm_init_struct *iibm)
@@ -6533,12 +6557,14 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 				thermal_read_mode = TPACPI_THERMAL_NONE;
 			}
 		} else {
-			if (ver >= 3)
+			if (ver >= 3) {
 				thermal_read_mode = TPACPI_THERMAL_TPEC_8;
-			else
+				thermal_use_labels = true;
+			} else {
 				thermal_read_mode =
 					(ta2 != 0) ?
 					TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
+			}
 		}
 	} else if (acpi_tmp7) {
 		if (tpacpi_is_ibm() &&
@@ -6560,44 +6586,40 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 
 	switch (thermal_read_mode) {
 	case TPACPI_THERMAL_TPEC_16:
-		res = sysfs_create_group(&tpacpi_hwmon->kobj,
-				&thermal_temp_input16_group);
-		if (res)
-			return res;
+		thermal_attr_group = &thermal_temp_input16_group;
 		break;
 	case TPACPI_THERMAL_TPEC_8:
 	case TPACPI_THERMAL_ACPI_TMP07:
 	case TPACPI_THERMAL_ACPI_UPDT:
-		res = sysfs_create_group(&tpacpi_hwmon->kobj,
-				&thermal_temp_input8_group);
-		if (res)
-			return res;
+		thermal_attr_group = &thermal_temp_input8_group;
 		break;
 	case TPACPI_THERMAL_NONE:
 	default:
 		return 1;
 	}
 
+	res = sysfs_create_group(&tpacpi_hwmon->kobj, thermal_attr_group);
+	if (res)
+		return res;
+
+	if (thermal_use_labels) {
+		res = sysfs_create_group(&tpacpi_hwmon->kobj, &temp_label_attr_group);
+		if (res) {
+			sysfs_remove_group(&tpacpi_hwmon->kobj, thermal_attr_group);
+			return res;
+		}
+	}
+
 	return 0;
 }
 
 static void thermal_exit(void)
 {
-	switch (thermal_read_mode) {
-	case TPACPI_THERMAL_TPEC_16:
-		sysfs_remove_group(&tpacpi_hwmon->kobj,
-				   &thermal_temp_input16_group);
-		break;
-	case TPACPI_THERMAL_TPEC_8:
-	case TPACPI_THERMAL_ACPI_TMP07:
-	case TPACPI_THERMAL_ACPI_UPDT:
-		sysfs_remove_group(&tpacpi_hwmon->kobj,
-				   &thermal_temp_input8_group);
-		break;
-	case TPACPI_THERMAL_NONE:
-	default:
-		break;
-	}
+	if (thermal_attr_group)
+		sysfs_remove_group(&tpacpi_hwmon->kobj, thermal_attr_group);
+
+	if (thermal_use_labels)
+		sysfs_remove_group(&tpacpi_hwmon->kobj, &temp_label_attr_group);
 }
 
 static int thermal_read(struct seq_file *m)
-- 
2.31.1


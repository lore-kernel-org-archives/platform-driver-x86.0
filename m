Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC90C7618E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 15:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241266AbjDZPWC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 11:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjDZPWB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 11:22:01 -0400
Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F783C0C
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 08:22:00 -0700 (PDT)
Received: from pps.filterd (m0142700.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QELYKK007109
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding;
 s=20180315; bh=46uaDVI/vjAed/Jo7dasO6gcqG5kQWhMiXb9NF3YQys=;
 b=eBOy+KF2NheiFSkIbLIitr15ZhcuLGdCObb+nr/nb43O6t68leG2tF8TxjxSWznHQf3W
 tIVjbcSTNTncyjuT24wUgsaafXZaniMeEj/LJr2E8gWuINnppQnq9GxTsyE/2AzdsCj1
 RnJdTJhclJ2FUxSi/4woKnTwRR2RF2K7ozxENtquySFgV9YRwQAbakR/YwCSO5n10GiY
 MWUr6XFMuE9H2IT3+vZxvVFSeT96+wYknsxkXAlwBXEkLw73i+XObK77SuYB4S402WbT
 gBDFB9jB7HanAjqgt1BZCNGGtWNE6zDuXu4vfuqShgKA3wQWu37CRKBoGyQllBf54w5u sQ== 
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
        by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 3q60k84uxu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:21:59 -0400
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-772cb16f779so2256636241.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 08:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682522518; x=1685114518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46uaDVI/vjAed/Jo7dasO6gcqG5kQWhMiXb9NF3YQys=;
        b=RuKhj72A8SlNbzFhnyDGTt90CRvRsrkONAP4UEaSZO4z417iwZrW4jQE+NiYVy7fp3
         QAe2bX8vIeFjDoGB9V1S2UDFNq/cgrQNfIWL+AI9XtglpkBPB1W+aDOU09iJ0ei3iwcK
         ebb9rLRMmlrR64winoZNguekawndbDWxbW2sP6eg1+NU6ZUogELzasUbrK0yNOkiLx/H
         mxOi5mdBUGZKLZ6lY5xhmTdcidsqlA5yCC/jvJOYbzt0uYf0ATho9oR+n7F/U6cJaP2s
         zJkZHz7Cx+1xc17iftB31w8R1f3BYpxkYmr/VGGrdN7MLkRpy6bCNmAFHGVYqadLdu+i
         gs0g==
X-Gm-Message-State: AAQBX9dOWn8xEV6aIwrlipdy5qPtA16yLkOk6kUF6GGuiO3EuSTmu0SL
        DNqkR/hy+yB6beP1l/jWl2yCPhyk3O2hIh9DlH5maiVcXEB5xhjoNqZZDquvAdBBkwIHrxxiVI3
        7NX0z/lgBpMjrJxQSs6wqVfnzfxW8IWVY
X-Received: by 2002:a67:fe52:0:b0:42e:4cc0:7810 with SMTP id m18-20020a67fe52000000b0042e4cc07810mr8882533vsr.26.1682522518579;
        Wed, 26 Apr 2023 08:21:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZwFxpT7N4ZAH0c8xFK5bKg14Uf5sDfb5IJAWuzdwGScmzYUyKQzgzEJieSOekJIB+5mkDeEQ==
X-Received: by 2002:a67:fe52:0:b0:42e:4cc0:7810 with SMTP id m18-20020a67fe52000000b0042e4cc07810mr8882478vsr.26.1682522517770;
        Wed, 26 Apr 2023 08:21:57 -0700 (PDT)
Received: from enviable.nyu.edu (216-165-95-134.natpool.nyu.edu. [216.165.95.134])
        by smtp.gmail.com with ESMTPSA id i12-20020a05620a27cc00b0074e020ff0e9sm5149169qkp.50.2023.04.26.08.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 08:21:57 -0700 (PDT)
From:   Jonathan Singer <jes965@nyu.edu>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Jorge Lopez <jorge.lopez2@hp.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jonathan Singer <jes965@nyu.edu>
Subject: [PATCH v2 1/2] platform/x86: hp-wmi: Add HP WMI camera switch
Date:   Wed, 26 Apr 2023 11:21:38 -0400
Message-Id: <20230426152139.1692-1-jes965@nyu.edu>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WeoA9Wt3gwZfxJgT-ClplNOzlXbKHSCz
X-Proofpoint-GUID: WeoA9Wt3gwZfxJgT-ClplNOzlXbKHSCz
X-Orig-IP: 209.85.222.69
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0 mlxscore=0 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260136
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Previously, when the camera toggle switch was hit, the hp-wmi driver
would report an invalid event code. By adding a case for that in the
event handling switch statement we can eliminate that error code and
enable a framework for potential further kernel handling of that key.
This change was tested on my HP Envy x360 15-ey0023dx laptop, but it
would likely work for any HP laptop with a camera toggle button. Now
we emit an SW_CAMERA_LENS_COVER event, on a device that gets created
on the first such event so as to not report incorrectly the state of
the camera shutter before we can know its state.

Signed-off-by: Jonathan Singer <jes965@nyu.edu>
---
 drivers/platform/x86/hp/hp-wmi.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 873f59c3e280..a7fb33ac49b8 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -90,6 +90,7 @@ enum hp_wmi_event_ids {
 	HPWMI_PEAKSHIFT_PERIOD		= 0x0F,
 	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
 	HPWMI_SANITIZATION_MODE		= 0x17,
+	HPWMI_CAMERA_TOGGLE		= 0x1A,
 	HPWMI_OMEN_KEY			= 0x1D,
 	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
 };
@@ -228,6 +229,7 @@ static const struct key_entry hp_wmi_keymap[] = {
 };
 
 static struct input_dev *hp_wmi_input_dev;
+static struct input_dev *camera_shutter_input_dev;
 static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
 static bool platform_profile_support;
@@ -739,6 +741,36 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static int camera_shutter_input_setup(void)
+{
+	int err;
+
+	camera_shutter_input_dev = input_allocate_device();
+	if (!camera_shutter_input_dev)
+		return -ENOMEM;
+
+	camera_shutter_input_dev->name = "HP WMI camera shutter";
+	camera_shutter_input_dev->phys = "wmi/input1";
+	camera_shutter_input_dev->id.bustype = BUS_HOST;
+
+	__set_bit(EV_SW, camera_shutter_input_dev->evbit);
+	__set_bit(SW_CAMERA_LENS_COVER, camera_shutter_input_dev->swbit);
+
+	/* Set initial hardware state */
+	input_sync(camera_shutter_input_dev);
+
+	err = input_register_device(camera_shutter_input_dev);
+	if (err)
+		goto err_free_dev;
+
+	return 0;
+
+ err_free_dev:
+	input_free_device(camera_shutter_input_dev);
+	camera_shutter_input_dev = NULL;
+	return err;
+}
+
 static DEVICE_ATTR_RO(display);
 static DEVICE_ATTR_RO(hddtemp);
 static DEVICE_ATTR_RW(als);
@@ -866,6 +898,20 @@ static void hp_wmi_notify(u32 value, void *context)
 		break;
 	case HPWMI_SANITIZATION_MODE:
 		break;
+	case HPWMI_CAMERA_TOGGLE:
+		if (!camera_shutter_input_dev)
+			if (camera_shutter_input_setup()) {
+				pr_info("Failed to setup camera shutter input device\n");
+				break;
+			}
+		if (event_data == 0xff)
+			input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 1);
+		else if (event_data == 0xfe)
+			input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 0);
+		else
+			pr_info("Unknown camera shutter state - 0x%x\n", event_data);
+		input_sync(camera_shutter_input_dev);
+		break;
 	case HPWMI_SMART_EXPERIENCE_APP:
 		break;
 	default:
@@ -1564,9 +1610,13 @@ static void __exit hp_wmi_exit(void)
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
+	if (camera_shutter_input_dev)
+		input_unregister_device(camera_shutter_input_dev);
+
 	if (hp_wmi_platform_dev) {
 		platform_device_unregister(hp_wmi_platform_dev);
 		platform_driver_unregister(&hp_wmi_driver);
 	}
+
 }
 module_exit(hp_wmi_exit);
-- 
2.40.0


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D463BC7618E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 18:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbjDZSuV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 14:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjDZSuU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 14:50:20 -0400
Received: from mx0a-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB13F7D9E
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:50:19 -0700 (PDT)
Received: from pps.filterd (m0355795.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QIQeNt021645
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 14:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding;
 s=20180315; bh=XV2wqMr3rLVla/Q1+jvkjZWpSpctS4mVbTncMGH1DqY=;
 b=bHSqJg7ez/I4TuVMByJuyx/BtBmqshlst/hFGwZ8/kD6uD5D58B6zSRZUaByNfkSTSxA
 2HbVLTEWh32RLdzG6eWh76D+lPmpjxMmJWwVoUnsYI0Rcmhr4wz0Gn9r4jglyekqqnf5
 cR1YgwBmpp86YNHL3meL9uKDjbLmFCFDFbzV38k8sP4zcYAaDkY2qN6Tb8I+JLmVPgV6
 xKKFFxVPQNh42TxmH74+aNHiHSH9fcJvnlkAa5EnBW2Yr4Ttm2ujruYQTYhIYzFQ2wop
 /BaO5AnLeXXBE+E3kCsOf5MdeIyixLTBpaELJTr078maMPVLyP66Sy3q02tSAdWgllV7 iA== 
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 3q486pdnp6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 14:50:19 -0400
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-3ef33ed8843so46874691cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682535018; x=1685127018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XV2wqMr3rLVla/Q1+jvkjZWpSpctS4mVbTncMGH1DqY=;
        b=l9fi7075NGt/wo1AV4Y5S0rsfaAHuXGTl0tqWIV8ig42lrgPy/mNiSWx0b3C/tqnCU
         JSwLLJQDZl/6DoWL6mh2tZr7VXsxupL1L3KsQ+KrcF31SDO9S8He+JvyZg0INDeLwrZS
         oZBg0HC2NfVw0A3+fR/4fiQ292iQWduC2gTH+ygYJJG2cglOjrjjeaqN4WCk7s2bl8iZ
         NZRwlXSyjeweAEMODHwhIltj8Ftl7fWWcOQiK/nIm9gh6tkwwfpi+wOx6Vg4ojccWK9R
         JD685IthKYvJdv+Ee/3F29r50Vb5hvbTqyfDmK8o7JYluXBy7cYa41ZS931r8WW+uJia
         Bu6w==
X-Gm-Message-State: AAQBX9cAolArE3gCEmOlErEA8PwpmKPPs51D1azy2YiIyVykGkVdWQqZ
        ZJqykSh+nZLsGW3gdsh2Uf4hNp7aocxqhcLt5bQza0ELO88DPxLjBZG9Ib25fRzP1VWDO6BzlWX
        mDqMu4UN8WgAmXCApbwc39cCThV/HnvWC
X-Received: by 2002:ac8:4e4c:0:b0:3e1:59e8:744c with SMTP id e12-20020ac84e4c000000b003e159e8744cmr36267940qtw.13.1682535017878;
        Wed, 26 Apr 2023 11:50:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bpUAwWS6FzTmvw/jZeyQJ4yw19CgN2t92yeJFla8/OubC04yb0TWI3d1ER5r21rPsJ9tzcMA==
X-Received: by 2002:ac8:4e4c:0:b0:3e1:59e8:744c with SMTP id e12-20020ac84e4c000000b003e159e8744cmr36267918qtw.13.1682535017633;
        Wed, 26 Apr 2023 11:50:17 -0700 (PDT)
Received: from enviable.nyu.edu (216-165-95-156.natpool.nyu.edu. [216.165.95.156])
        by smtp.gmail.com with ESMTPSA id 206-20020a3705d7000000b007469b5bc2c4sm5373476qkf.13.2023.04.26.11.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:50:17 -0700 (PDT)
From:   Jonathan Singer <jes965@nyu.edu>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Jorge Lopez <jorge.lopez2@hp.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jonathan Singer <jes965@nyu.edu>
Subject: [PATCH v3 1/2] platform/x86: hp-wmi: Add HP WMI camera switch
Date:   Wed, 26 Apr 2023 14:48:52 -0400
Message-Id: <20230426184852.2100-1-jes965@nyu.edu>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jhJhwE_ihnwl7kL7KpHCUZ6AI1pINU4K
X-Proofpoint-GUID: jhJhwE_ihnwl7kL7KpHCUZ6AI1pINU4K
X-Orig-IP: 209.85.160.199
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0 clxscore=1015
 malwarescore=0 bulkscore=0 mlxlogscore=944 adultscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260167
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
V2 changes: Added SW_CAMERA_LENS_COVER switch event
V3 changes: removed input dev sync, changed pr_info to pr_err/pr_warn

 drivers/platform/x86/hp/hp-wmi.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 873f59c3e280..18d40270aa0d 100644
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
@@ -739,6 +741,33 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
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
@@ -866,6 +895,20 @@ static void hp_wmi_notify(u32 value, void *context)
 		break;
 	case HPWMI_SANITIZATION_MODE:
 		break;
+	case HPWMI_CAMERA_TOGGLE:
+		if (!camera_shutter_input_dev)
+			if (camera_shutter_input_setup()) {
+				pr_err("Failed to setup camera shutter input device\n");
+				break;
+			}
+		if (event_data == 0xff)
+			input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 1);
+		else if (event_data == 0xfe)
+			input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 0);
+		else
+			pr_warn("Unknown camera shutter state - 0x%x\n", event_data);
+		input_sync(camera_shutter_input_dev);
+		break;
 	case HPWMI_SMART_EXPERIENCE_APP:
 		break;
 	default:
@@ -1564,6 +1607,9 @@ static void __exit hp_wmi_exit(void)
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
+	if (camera_shutter_input_dev)
+		input_unregister_device(camera_shutter_input_dev);
+
 	if (hp_wmi_platform_dev) {
 		platform_device_unregister(hp_wmi_platform_dev);
 		platform_driver_unregister(&hp_wmi_driver);
-- 
2.40.0


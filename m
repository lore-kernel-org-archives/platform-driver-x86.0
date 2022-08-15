Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74CEC00140
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Aug 2022 15:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbiHOPF6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiHOPFp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Aug 2022 11:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 914EA62ED
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660575943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vp9L10hFdGZDfD/jyC7LozOLpQF/iDyQkMJrWxFBQW8=;
        b=ezgdNUEDQsR+C2heRL5t+F8pNGeEyRwhXZanG+DCvQ5YrZpeA0V2okthAixlqor8g8eOeo
        UkHIlCXivQDkQKceV8Uo/cL3uuRI3Xw0r3H4463bferqP+46Ti8UOqlXRT8AKaBxAtgQgY
        AVcdp3c/lcnBsPXcV5IXTVmqGiBMR6s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-hMJ5gqzXP5Cw1fVGs4598A-1; Mon, 15 Aug 2022 11:05:41 -0400
X-MC-Unique: hMJ5gqzXP5Cw1fVGs4598A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C84E85A587;
        Mon, 15 Aug 2022 15:05:41 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.109])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 201362026D64;
        Mon, 15 Aug 2022 15:05:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        "Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH] platform/x86: asus-wmi: Simplify some of the *_check_present() helpers
Date:   Mon, 15 Aug 2022 17:05:38 +0200
Message-Id: <20220815150538.474306-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

After the recent cleanup patches, some of the *_check_present() helpers
just propagate the result of asus_wmi_dev_is_present().

Replace these with direct asus_wmi_dev_is_present() calls as a further
cleanup.

Cc: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 47 +++------------------------------
 1 file changed, 3 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 2d9d709aa59f..d72491fb218b 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -557,16 +557,6 @@ static void lid_flip_tablet_mode_get_state(struct asus_wmi *asus)
 }
 
 /* dGPU ********************************************************************/
-static int dgpu_disable_check_present(struct asus_wmi *asus)
-{
-	asus->dgpu_disable_available = false;
-
-	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU))
-		asus->dgpu_disable_available = true;
-
-	return 0;
-}
-
 static ssize_t dgpu_disable_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -620,16 +610,6 @@ static ssize_t dgpu_disable_store(struct device *dev,
 static DEVICE_ATTR_RW(dgpu_disable);
 
 /* eGPU ********************************************************************/
-static int egpu_enable_check_present(struct asus_wmi *asus)
-{
-	asus->egpu_enable_available = false;
-
-	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU))
-		asus->egpu_enable_available = true;
-
-	return 0;
-}
-
 static ssize_t egpu_enable_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -1497,16 +1477,6 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
 }
 
 /* Panel Overdrive ************************************************************/
-static int panel_od_check_present(struct asus_wmi *asus)
-{
-	asus->panel_overdrive_available = false;
-
-	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD))
-		asus->panel_overdrive_available = true;
-
-	return 0;
-}
-
 static ssize_t panel_od_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -3493,13 +3463,9 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_platform;
 
-	err = egpu_enable_check_present(asus);
-	if (err)
-		goto fail_egpu_enable;
-
-	err = dgpu_disable_check_present(asus);
-	if (err)
-		goto fail_dgpu_disable;
+	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
+	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
+	asus->panel_overdrive_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD);
 
 	err = fan_boost_mode_check_present(asus);
 	if (err)
@@ -3515,10 +3481,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_platform_profile_setup;
 
-	err = panel_od_check_present(asus);
-	if (err)
-		goto fail_panel_od;
-
 	err = asus_wmi_sysfs_init(asus->platform_device);
 	if (err)
 		goto fail_sysfs;
@@ -3613,10 +3575,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->platform_profile_support)
 		platform_profile_remove();
 fail_fan_boost_mode:
-fail_egpu_enable:
-fail_dgpu_disable:
 fail_platform:
-fail_panel_od:
 	kfree(asus);
 	return err;
 }
-- 
2.36.1


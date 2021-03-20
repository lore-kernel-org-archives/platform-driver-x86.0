Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08016C433E2
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2F826196E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhCTOfJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 10:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33113 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229756AbhCTOek (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 10:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616250880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AGTpNJCRw56lL/F6yA4HPksAQ5DsMGHhUW/x+UCP7d0=;
        b=KXbZWgSa/7DgqSKGYKacX4601BlWFPTTQRdcO/bV3SQGkeeNCRtdMYUzbOKk/m4j0O1Qyq
        6tU7ru6R02T5dPfBiRCJY0epb23DiUBeD18wWdE6+nDri4n5XXa/9ZszRCb6hR+p+aDz2A
        v7kF65ZnfDgWP1Sy0rSlkOuz3pcF0Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-LmBJSjIrPQORrcS1HKDajg-1; Sat, 20 Mar 2021 10:34:38 -0400
X-MC-Unique: LmBJSjIrPQORrcS1HKDajg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 047401007467;
        Sat, 20 Mar 2021 14:34:37 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-22.ams2.redhat.com [10.36.112.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AEBE160C04;
        Sat, 20 Mar 2021 14:34:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/7] platform/x86: dell-wmi-sysman: Fix possible NULL pointer deref on exit
Date:   Sat, 20 Mar 2021 15:34:23 +0100
Message-Id: <20210320143429.76047-2-hdegoede@redhat.com>
In-Reply-To: <20210320143429.76047-1-hdegoede@redhat.com>
References: <20210320143429.76047-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It is possible for release_attributes_data() to get called when the
main_dir_kset has not been created yet, move the removal of the bios-reset
sysfs attr to under a if (main_dir_kset) check to avoid a NULL pointer
deref.

Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Reported-by: Alexander Naumann <alexandernaumann@gmx.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index cb81010ba1a2..a058dd7fccea 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -225,12 +225,6 @@ static int create_attributes_level_sysfs_files(void)
 	return ret;
 }
 
-static void release_reset_bios_data(void)
-{
-	sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
-	sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &pending_reboot.attr);
-}
-
 static ssize_t wmi_sysman_attr_show(struct kobject *kobj, struct attribute *attr,
 				    char *buf)
 {
@@ -373,8 +367,6 @@ static void destroy_attribute_objs(struct kset *kset)
  */
 static void release_attributes_data(void)
 {
-	release_reset_bios_data();
-
 	mutex_lock(&wmi_priv.mutex);
 	exit_enum_attributes();
 	exit_int_attributes();
@@ -386,11 +378,12 @@ static void release_attributes_data(void)
 		wmi_priv.authentication_dir_kset = NULL;
 	}
 	if (wmi_priv.main_dir_kset) {
+		sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
+		sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &pending_reboot.attr);
 		destroy_attribute_objs(wmi_priv.main_dir_kset);
 		kset_unregister(wmi_priv.main_dir_kset);
 	}
 	mutex_unlock(&wmi_priv.mutex);
-
 }
 
 /**
-- 
2.30.2


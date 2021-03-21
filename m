Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC25C433E6
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8884E61937
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCUL7f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 07:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39321 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229870AbhCUL7N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 07:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616327952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AGSvq0yR/Ms8bgmtnP0KxQ528QkzvFZdQ/ArKdgeozU=;
        b=OLhOByeP1VfHTKuV9wo6xVcPrWMhsF9sGUA/QgLru7nWuc+CQOmy91XHeZCat+/bPcqvBT
        X4GMVw2Zos91CFVuTXIgieESKYnFJBEFDJQqQ6PhEKr5LLHfefzblvX1hB0oRamGgxVthq
        SjzmVy+AfZFbXJFQMDR4yc9j9gzDOgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-c_Se9PTzPca9f6O3MibwcA-1; Sun, 21 Mar 2021 07:59:11 -0400
X-MC-Unique: c_Se9PTzPca9f6O3MibwcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7664B814256;
        Sun, 21 Mar 2021 11:59:09 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9B7BE5DAA5;
        Sun, 21 Mar 2021 11:59:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/7] platform/x86: dell-wmi-sysman: Fix possible NULL pointer deref on exit
Date:   Sun, 21 Mar 2021 12:58:56 +0100
Message-Id: <20210321115901.35072-3-hdegoede@redhat.com>
In-Reply-To: <20210321115901.35072-1-hdegoede@redhat.com>
References: <20210321115901.35072-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It is possible for release_attributes_data() to get called when the
main_dir_kset has not been created yet, move the removal of the bios-reset
sysfs attr to under a if (main_dir_kset) check to avoid a NULL pointer
deref.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Reported-by: Alexander Naumann <alexandernaumann@gmx.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index c1997db74cca..8b251b2c37a2 100644
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
@@ -386,12 +378,13 @@ static void release_attributes_data(void)
 		wmi_priv.authentication_dir_kset = NULL;
 	}
 	if (wmi_priv.main_dir_kset) {
+		sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
+		sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &pending_reboot.attr);
 		destroy_attribute_objs(wmi_priv.main_dir_kset);
 		kset_unregister(wmi_priv.main_dir_kset);
 		wmi_priv.main_dir_kset = NULL;
 	}
 	mutex_unlock(&wmi_priv.mutex);
-
 }
 
 /**
-- 
2.30.2


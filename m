Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6836EC433E3
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 469C461937
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCUL7g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 07:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29230 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229893AbhCUL7Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 07:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616327963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tmRWGyT8RuOjSaI6RE278vAQW9mMmjCaYbECWCdGdok=;
        b=EskmiTKYuh3ZFd2tndLpS8AeOSrrIv9eDI9O73XvXF80GLZduFHK5nU8MWvobKFdA+tTtJ
        0bykLH4DM5TauFsdx3KehQWQ2YwhtO6iNO0NUo+QLCC90dj3iZJUDplvCg5XkuuK/9dEJI
        Ry54PzvwuSChXLFgKuUDIpbn6w5CLfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-rQKVK3E0NmKIaJqcVWDM-Q-1; Sun, 21 Mar 2021 07:59:19 -0400
X-MC-Unique: rQKVK3E0NmKIaJqcVWDM-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C005593A1;
        Sun, 21 Mar 2021 11:59:18 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 86CE95DAA5;
        Sun, 21 Mar 2021 11:59:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 5/7] platform/x86: dell-wmi-sysman: Cleanup sysman_init() error-exit handling
Date:   Sun, 21 Mar 2021 12:58:59 +0100
Message-Id: <20210321115901.35072-6-hdegoede@redhat.com>
In-Reply-To: <20210321115901.35072-1-hdegoede@redhat.com>
References: <20210321115901.35072-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Cleanup sysman_init() error-exit handling:

1. There is no need for the fail_reset_bios and fail_authentication_kset
   eror-exit cases, these can be handled by release_attributes_data()

2. Rename all the labels from fail_what_failed, to err_what_to_cleanup
   this is the usual way to name these and avoids the need to rename
   them when extra steps are added.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/dell/dell-wmi-sysman/sysman.c         | 45 +++++++------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 58dc4571f987..99dc2f3bdf49 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -508,100 +508,87 @@ static int __init sysman_init(void)
 	ret = init_bios_attr_set_interface();
 	if (ret || !wmi_priv.bios_attr_wdev) {
 		pr_debug("failed to initialize set interface\n");
-		goto fail_set_interface;
+		return ret;
 	}
 
 	ret = init_bios_attr_pass_interface();
 	if (ret || !wmi_priv.password_attr_wdev) {
 		pr_debug("failed to initialize pass interface\n");
-		goto fail_pass_interface;
+		goto err_exit_bios_attr_set_interface;
 	}
 
 	ret = class_register(&firmware_attributes_class);
 	if (ret)
-		goto fail_class;
+		goto err_exit_bios_attr_pass_interface;
 
 	wmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
 				  NULL, "%s", DRIVER_NAME);
 	if (IS_ERR(wmi_priv.class_dev)) {
 		ret = PTR_ERR(wmi_priv.class_dev);
-		goto fail_classdev;
+		goto err_unregister_class;
 	}
 
 	wmi_priv.main_dir_kset = kset_create_and_add("attributes", NULL,
 						     &wmi_priv.class_dev->kobj);
 	if (!wmi_priv.main_dir_kset) {
 		ret = -ENOMEM;
-		goto fail_main_kset;
+		goto err_destroy_classdev;
 	}
 
 	wmi_priv.authentication_dir_kset = kset_create_and_add("authentication", NULL,
 								&wmi_priv.class_dev->kobj);
 	if (!wmi_priv.authentication_dir_kset) {
 		ret = -ENOMEM;
-		goto fail_authentication_kset;
+		goto err_release_attributes_data;
 	}
 
 	ret = create_attributes_level_sysfs_files();
 	if (ret) {
 		pr_debug("could not create reset BIOS attribute\n");
-		goto fail_reset_bios;
+		goto err_release_attributes_data;
 	}
 
 	ret = init_bios_attributes(ENUM, DELL_WMI_BIOS_ENUMERATION_ATTRIBUTE_GUID);
 	if (ret) {
 		pr_debug("failed to populate enumeration type attributes\n");
-		goto fail_create_group;
+		goto err_release_attributes_data;
 	}
 
 	ret = init_bios_attributes(INT, DELL_WMI_BIOS_INTEGER_ATTRIBUTE_GUID);
 	if (ret) {
 		pr_debug("failed to populate integer type attributes\n");
-		goto fail_create_group;
+		goto err_release_attributes_data;
 	}
 
 	ret = init_bios_attributes(STR, DELL_WMI_BIOS_STRING_ATTRIBUTE_GUID);
 	if (ret) {
 		pr_debug("failed to populate string type attributes\n");
-		goto fail_create_group;
+		goto err_release_attributes_data;
 	}
 
 	ret = init_bios_attributes(PO, DELL_WMI_BIOS_PASSOBJ_ATTRIBUTE_GUID);
 	if (ret) {
 		pr_debug("failed to populate pass object type attributes\n");
-		goto fail_create_group;
+		goto err_release_attributes_data;
 	}
 
 	return 0;
 
-fail_create_group:
+err_release_attributes_data:
 	release_attributes_data();
 
-fail_reset_bios:
-	if (wmi_priv.authentication_dir_kset) {
-		kset_unregister(wmi_priv.authentication_dir_kset);
-		wmi_priv.authentication_dir_kset = NULL;
-	}
-
-fail_authentication_kset:
-	if (wmi_priv.main_dir_kset) {
-		kset_unregister(wmi_priv.main_dir_kset);
-		wmi_priv.main_dir_kset = NULL;
-	}
-
-fail_main_kset:
+err_destroy_classdev:
 	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
 
-fail_classdev:
+err_unregister_class:
 	class_unregister(&firmware_attributes_class);
 
-fail_class:
+err_exit_bios_attr_pass_interface:
 	exit_bios_attr_pass_interface();
 
-fail_pass_interface:
+err_exit_bios_attr_set_interface:
 	exit_bios_attr_set_interface();
 
-fail_set_interface:
 	return ret;
 }
 
-- 
2.30.2


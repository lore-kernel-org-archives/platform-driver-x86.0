Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4801DC433E5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 221886196E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhCTOfL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 10:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50056 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229870AbhCTOex (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 10:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616250893;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RWyw53w9hC91BP51KCwXBoTCn5XukvLP+bSgOG6Jpy0=;
        b=DPzeZ80ghuF76jwL1VZI2Fw8N0de3n9Tt26ZCJ3VuX7IBrIstH2MI+vyy4NQgk/epoN32z
        pG6jgSkTBIlgLRhQK0XIRpqJreqDuGSPkLHjc2tEBO6ixkw1odSBVgR+2ADA/EsTyhLJ7Y
        Q0bs2TiZTqg0DGOLe9+REXsEw+zLcGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-JFgoBuNKM1ORHwWeVzXhxA-1; Sat, 20 Mar 2021 10:34:51 -0400
X-MC-Unique: JFgoBuNKM1ORHwWeVzXhxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 393D35B362;
        Sat, 20 Mar 2021 14:34:50 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-22.ams2.redhat.com [10.36.112.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA0AD60C04;
        Sat, 20 Mar 2021 14:34:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 7/7] platform/x86: dell-wmi-sysman: Cleanup create_attributes_level_sysfs_files()
Date:   Sat, 20 Mar 2021 15:34:29 +0100
Message-Id: <20210320143429.76047-8-hdegoede@redhat.com>
In-Reply-To: <20210320143429.76047-1-hdegoede@redhat.com>
References: <20210320143429.76047-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Cleanup create_attributes_level_sysfs_files():

1. There is no need to call sysfs_remove_file() on error, sysman_init()
will already call release_attributes_data() on failure which already does
this.

2. There is no need for the pr_debug calls() sysfs_create_file() should
never fail and if it does it will already complain about the problem
itself.

Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/dell/dell-wmi-sysman/sysman.c   | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index c2ccf86f4037..d061ddd0c72e 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -210,19 +210,17 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
  */
 static int create_attributes_level_sysfs_files(void)
 {
-	int ret = sysfs_create_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
+	int ret;
 
-	if (ret) {
-		pr_debug("could not create reset_bios file\n");
+	ret = sysfs_create_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
+	if (ret)
 		return ret;
-	}
 
 	ret = sysfs_create_file(&wmi_priv.main_dir_kset->kobj, &pending_reboot.attr);
-	if (ret) {
-		pr_debug("could not create changing_pending_reboot file\n");
-		sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
-	}
-	return ret;
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static ssize_t wmi_sysman_attr_show(struct kobject *kobj, struct attribute *attr,
-- 
2.30.2


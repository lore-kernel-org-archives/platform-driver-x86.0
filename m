Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53132C433C1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26A4D61931
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhCUL7g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 07:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54578 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229894AbhCUL7Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 07:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616327965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cRfdSmMIVIEghVWnlpIRNcK9lXp/FqFDHotU5NzqGb0=;
        b=E5K7IBHHb7dL4+rM8Jr2Z670y1b8P8Kr0l1TziMHEvYzp7U4aw4UpB4M/Kr8r+cVCgAfpQ
        x7d5PgxTj1sMjj8Nr9UVE75iOq5QZgskM1tR4AMTUa1wGTYTUiW21CMWsdJTXRDuQTCfaV
        EK3DxOEE5dhcQE4b6PdAkbPDDuwsgSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-sPwElr3KMBizUD6z_-eQdw-1; Sun, 21 Mar 2021 07:59:23 -0400
X-MC-Unique: sPwElr3KMBizUD6z_-eQdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F58D85EE8B;
        Sun, 21 Mar 2021 11:59:22 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9DA985DAA5;
        Sun, 21 Mar 2021 11:59:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 7/7] platform/x86: dell-wmi-sysman: Cleanup create_attributes_level_sysfs_files()
Date:   Sun, 21 Mar 2021 12:59:01 +0100
Message-Id: <20210321115901.35072-8-hdegoede@redhat.com>
In-Reply-To: <20210321115901.35072-1-hdegoede@redhat.com>
References: <20210321115901.35072-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Cleanup create_attributes_level_sysfs_files():

1. There is no need to call sysfs_remove_file() on error, sysman_init()
will already call release_attributes_data() on failure which already does
this.

2. There is no need for the pr_debug() calls sysfs_create_file() should
never fail and if it does it will already complain about the problem
itself.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/dell/dell-wmi-sysman/sysman.c   | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 5dd9b29d939c..7410ccae650c 100644
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


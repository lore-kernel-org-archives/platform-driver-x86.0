Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2DFC4320E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 12:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B59A60FC2
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 12:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhHBMHu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 Aug 2021 08:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48968 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233592AbhHBMHt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Aug 2021 08:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627906059;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zzz8ibdvkqs10R+08acnamfXgefUiXy0t7p13Q5nlA0=;
        b=EuDmSMOct8VFJagaV8c5oqcsps9ULzvEpM7Hdk+D2pNSyYNZmgQ88DEj/GSaK0SiSopz6q
        daP5ovmr8RhDJN/tCedZB9QkRs8hFf8UJFBSxYl+fuUdFOgvPqrTAGZbmKQm0ablF0IjTI
        sxV8PdhfvCL5YzqDEIT2TQco/f4sdC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-eQzVH5TmOg29oH6jZ4Sg2A-1; Mon, 02 Aug 2021 08:07:38 -0400
X-MC-Unique: eQzVH5TmOg29oH6jZ4Sg2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEF421084F53;
        Mon,  2 Aug 2021 12:07:36 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 567876788C;
        Mon,  2 Aug 2021 12:07:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@outlook.com>
Subject: [PATCH] platform/x86: dell-smbios: Remove unused dmi_system_id table
Date:   Mon,  2 Aug 2021 14:07:34 +0200
Message-Id: <20210802120734.36732-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

dell-smbios is depended on by dell-laptop and that has this same table +
some extra entries for chassis-type 30, 31 and 32.

Since dell-laptop will already auto-load based on the DMI table in there
(which also is more complete) and since dell-laptop will then bring in
the dell-smbios module, the only scenario I can think of where this DMI
table inside dell-smbios-smm.c is useful is if users have the dell-laptop
module disabled and they want to use the sysfs interface offered by
dell-smbios-smm.c. But that is such a corner case, even requiring a custom
kernel build, that it does not weigh up against having this duplicate
table, which as the current state already shows can only grow stale.

Users who do hit this corner-case can always explicitly modprobe /
insmod the module.

Cc: Mario Limonciello <mario.limonciello@outlook.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smbios-smm.c | 31 ---------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/x86/dell/dell-smbios-smm.c
index 97c52a839a3e..320c032418ac 100644
--- a/drivers/platform/x86/dell/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell/dell-smbios-smm.c
@@ -24,37 +24,6 @@ static struct calling_interface_buffer *buffer;
 static struct platform_device *platform_device;
 static DEFINE_MUTEX(smm_mutex);
 
-static const struct dmi_system_id dell_device_table[] __initconst = {
-	{
-		.ident = "Dell laptop",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_CHASSIS_TYPE, "8"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_CHASSIS_TYPE, "9"), /*Laptop*/
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /*Notebook*/
-		},
-	},
-	{
-		.ident = "Dell Computer Corporation",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-			DMI_MATCH(DMI_CHASSIS_TYPE, "8"),
-		},
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(dmi, dell_device_table);
-
 static void parse_da_table(const struct dmi_header *dm)
 {
 	struct calling_interface_structure *table =
-- 
2.31.1


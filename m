Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6790C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 May 2021 12:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86D71611AD
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 May 2021 12:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349139AbhERMv6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 May 2021 08:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54126 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244334AbhERMvv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 May 2021 08:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621342233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Zhr4dTBbOAnv6O714zwyOc/9P5nJ1yhuoL6JxIvjVak=;
        b=LZ4od4IKTjF0eMyBkqs3DtX6AlBbiV4XZtxA8/VvSNLm/LUJb7LWmG79HFoEY1iNszeOhN
        yXjeGZ8r3V5WPtNmPci9nc3zfM3iSYHDiu11H3CWWgblZ2KCyydYnl6ttLXrj3uDIDOR13
        oWL2KjVC02xKJCDdi+DvAkjBAxvUDfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-NLQAAK3sNlq5Pp9huup0BA-1; Tue, 18 May 2021 08:50:31 -0400
X-MC-Unique: NLQAAK3sNlq5Pp9huup0BA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59CA5100747C;
        Tue, 18 May 2021 12:50:30 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-219.ams2.redhat.com [10.36.115.219])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E9067BA6D;
        Tue, 18 May 2021 12:50:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@outlook.com>
Subject: [PATCH] platform/x86: dell-smbios-wmi: Fix oops on rmmod dell_smbios
Date:   Tue, 18 May 2021 14:50:27 +0200
Message-Id: <20210518125027.21824-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

init_dell_smbios_wmi() only registers the dell_smbios_wmi_driver on systems
where the Dell WMI interface is support. While exit_dell_smbios_wmi()
unregisters it unconditionally, this leads to the following oops:

[  175.722921] ------------[ cut here ]------------
[  175.722925] Unexpected driver unregister!
[  175.722939] WARNING: CPU: 1 PID: 3630 at drivers/base/driver.c:194 driver_unregister+0x38/0x40
...
[  175.723089] Call Trace:
[  175.723094]  cleanup_module+0x5/0xedd [dell_smbios]
...
[  175.723148] ---[ end trace 064c34e1ad49509d ]---

Make the unregister happen on the same condition the register happens
to fix this.

Cc: Mario Limonciello <mario.limonciello@outlook.com>
Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smbios-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
index a1753485159c..33f823772733 100644
--- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -270,7 +270,8 @@ int init_dell_smbios_wmi(void)
 
 void exit_dell_smbios_wmi(void)
 {
-	wmi_driver_unregister(&dell_smbios_wmi_driver);
+	if (wmi_supported)
+		wmi_driver_unregister(&dell_smbios_wmi_driver);
 }
 
 MODULE_DEVICE_TABLE(wmi, dell_smbios_wmi_id_table);
-- 
2.31.1


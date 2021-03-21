Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43229C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16D0861939
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhCUL7f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 07:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36695 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229840AbhCUL7J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 07:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616327948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FqYwviL8gXWeaQXsYYhQ/VJly2I8vjlvL/lhP0JnQXM=;
        b=bKSIsGG+JW0Z7EXwiHJqryJKxQjbFRIkGz2aA0a7lR4D2g896Zos2leKMLlc8IIm5GqlVn
        sYPPB5TUnIK/c8U4SGZNgXinX+vVXtsOBXnjTQ3Shn9r0g9ngWcabqTXUGpknhuKGCcK6Z
        IVxlq4UUWefy69Ce7CfDkGTvks/jSus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-RuEAdxDfObWupfarIwDQNA-1; Sun, 21 Mar 2021 07:59:06 -0400
X-MC-Unique: RuEAdxDfObWupfarIwDQNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D3A801817;
        Sun, 21 Mar 2021 11:59:05 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E7177607CB;
        Sun, 21 Mar 2021 11:59:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/7] platform/x86: dell-wmi-sysman: Fix crash caused by calling kset_unregister twice
Date:   Sun, 21 Mar 2021 12:58:55 +0100
Message-Id: <20210321115901.35072-2-hdegoede@redhat.com>
In-Reply-To: <20210321115901.35072-1-hdegoede@redhat.com>
References: <20210321115901.35072-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On some system the WMI GUIDs used by dell-wmi-sysman are present but there
are no enum type attributes, this causes init_bios_attributes() to return
-ENODEV, after which sysman_init() does a "goto fail_create_group" and then
calls release_attributes_data().

release_attributes_data() calls kset_unregister(wmi_priv.main_dir_kset);
but before this commit it was missing a "wmi_priv.main_dir_kset = NULL;"
statement; and after calling release_attributes_data() the sysman_init()
error handling does this:

        if (wmi_priv.main_dir_kset) {
                kset_unregister(wmi_priv.main_dir_kset);
                wmi_priv.main_dir_kset = NULL;
        }

Which causes a second kset_unregister(wmi_priv.main_dir_kset), leading to
a double-free, which causes a crash.

Add the missing "wmi_priv.main_dir_kset = NULL;" statement to
release_attributes_data() to fix this double-free crash.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index cb81010ba1a2..c1997db74cca 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -388,6 +388,7 @@ static void release_attributes_data(void)
 	if (wmi_priv.main_dir_kset) {
 		destroy_attribute_objs(wmi_priv.main_dir_kset);
 		kset_unregister(wmi_priv.main_dir_kset);
+		wmi_priv.main_dir_kset = NULL;
 	}
 	mutex_unlock(&wmi_priv.mutex);
 
-- 
2.30.2


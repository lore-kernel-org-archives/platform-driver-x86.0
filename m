Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA236C636C9
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 14:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91E93613C4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 14:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbhGQOjM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 10:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58887 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234191AbhGQOjL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 10:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626532575;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IxRzuGFPm3Q6oiENShXcBRo+AjWUWqt8/tzKA6+IWQI=;
        b=HCjCWGwqxIlBUaiywHA6xLhrwY3m8H4YAjpsMvtYe4n6nss8ma8KFfm48RpLaVGTLSfoTa
        hos0x9Y1LLMEb6ogNMmw78NhcY4YrdtEREJVp9HMP43QIPBP+wUksVKjVlUu+pIllBuoVP
        pSFv9mLDwgjXcNltVaMCrGP6HjTkflE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-OenJNMOpO9egBlDpiD-D2A-1; Sat, 17 Jul 2021 10:36:10 -0400
X-MC-Unique: OenJNMOpO9egBlDpiD-D2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7671362F8;
        Sat, 17 Jul 2021 14:36:09 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-16.ams2.redhat.com [10.36.112.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA5C5D719;
        Sat, 17 Jul 2021 14:36:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: think-lmi: Move pending_reboot_attr to the attributes sysfs dir
Date:   Sat, 17 Jul 2021 16:36:05 +0200
Message-Id: <20210717143607.3580-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mark Pearson <markpearson@lenovo.com>

Move the pending_reboot node under attributes dir where it should live, as
documented in: Documentation/ABI/testing/sysfs-class-firmware-attributes.

Also move the create / remove code to be together with the other code
populating / cleaning the attributes sysfs dir. In the removal path this
is necessary so that the remove is done before the
kset_unregister(tlmi_priv.attribute_kset) call.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 64dcec53a7a0..989a8221dcd8 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -672,6 +672,7 @@ static void tlmi_release_attr(void)
 			kobject_put(&tlmi_priv.setting[i]->kobj);
 		}
 	}
+	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
 	kset_unregister(tlmi_priv.attribute_kset);
 
 	/* Authentication structures */
@@ -680,7 +681,6 @@ static void tlmi_release_attr(void)
 	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
 	kobject_put(&tlmi_priv.pwd_power->kobj);
 	kset_unregister(tlmi_priv.authentication_kset);
-	sysfs_remove_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
 }
 
 static int tlmi_sysfs_init(void)
@@ -733,6 +733,10 @@ static int tlmi_sysfs_init(void)
 			goto fail_create_attr;
 	}
 
+	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
+	if (ret)
+		goto fail_create_attr;
+
 	/* Create authentication entries */
 	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
 								&tlmi_priv.class_dev->kobj);
@@ -760,11 +764,6 @@ static int tlmi_sysfs_init(void)
 	if (ret)
 		goto fail_create_attr;
 
-	/* Create global sysfs files */
-	ret = sysfs_create_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
-	if (ret)
-		goto fail_create_attr;
-
 	return ret;
 
 fail_create_attr:
-- 
2.31.1


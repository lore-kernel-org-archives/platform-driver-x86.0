Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B79C636CA
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 14:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DCBA61380
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 14:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhGQOjL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 10:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31219 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230003AbhGQOjL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 10:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626532574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZMO1ZAc47H4tQsXnlpZ1uW5118rK/KCzAUfIvZ8iXwo=;
        b=H7xGLYano3Qbm+uONb0MRAMjfqtXJJT9AC6XBH/YsZ6nE5zfJiDHInzs8Ec8VatywRb+Qy
        Z+Mj42GHFS5vqni6A4ZCy6G/DkvgMMwZ2RSnIMmFWedSi1E6eFkYWhDlqVL48Qagioz7mp
        KoXMDRQ6YOrk944O23yMx/1OACaBjLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-TJGXDzpGORKi0nBPqWCCfg-1; Sat, 17 Jul 2021 10:36:12 -0400
X-MC-Unique: TJGXDzpGORKi0nBPqWCCfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5967A1800D41;
        Sat, 17 Jul 2021 14:36:11 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-16.ams2.redhat.com [10.36.112.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 40BF25D6D7;
        Sat, 17 Jul 2021 14:36:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: think-lmi: Split kobject_init() and kobject_add() calls
Date:   Sat, 17 Jul 2021 16:36:06 +0200
Message-Id: <20210717143607.3580-2-hdegoede@redhat.com>
In-Reply-To: <20210717143607.3580-1-hdegoede@redhat.com>
References: <20210717143607.3580-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tlmi_sysfs_init() calls tlmi_release_attr() on errors which calls
kobject_put() for attributes created by tlmi_analyze(), but if we
bail early because of an error, then this means that some of the
kobjects will not have been initialized yet; and we should thus not
call kobject_put() on them.

Switch from using kobject_init_and_add() inside tlmi_sysfs_init() to
initializing all the created kobjects directly in tlmi_analyze() and
only adding them from tlmi_sysfs_init(). This way all kobjects will
always be initialized when tlmi_release_attr() gets called.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 989a8221dcd8..c22edcf26aaa 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -723,8 +723,8 @@ static int tlmi_sysfs_init(void)
 
 		/* Build attribute */
 		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
-		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
-				NULL, "%s", tlmi_priv.setting[i]->display_name);
+		ret = kobject_add(&tlmi_priv.setting[i]->kobj, NULL,
+				  "%s", tlmi_priv.setting[i]->display_name);
 		if (ret)
 			goto fail_create_attr;
 
@@ -745,8 +745,7 @@ static int tlmi_sysfs_init(void)
 		goto fail_create_attr;
 	}
 	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
-	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype,
-			NULL, "%s", "Admin");
+	ret = kobject_add(&tlmi_priv.pwd_admin->kobj, NULL, "%s", "Admin");
 	if (ret)
 		goto fail_create_attr;
 
@@ -755,8 +754,7 @@ static int tlmi_sysfs_init(void)
 		goto fail_create_attr;
 
 	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
-	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
-			NULL, "%s", "System");
+	ret = kobject_add(&tlmi_priv.pwd_power->kobj, NULL, "%s", "System");
 	if (ret)
 		goto fail_create_attr;
 
@@ -836,6 +834,7 @@ static int tlmi_analyze(void)
 				pr_info("Error retrieving possible values for %d : %s\n",
 						i, setting->display_name);
 		}
+		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
 		tlmi_priv.setting[i] = setting;
 		tlmi_priv.settings_count++;
 		kfree(item);
@@ -862,6 +861,8 @@ static int tlmi_analyze(void)
 	if (pwdcfg.password_state & TLMI_PAP_PWD)
 		tlmi_priv.pwd_admin->valid = true;
 
+	kobject_init(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype);
+
 	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
 	if (!tlmi_priv.pwd_power) {
 		ret = -ENOMEM;
@@ -877,6 +878,8 @@ static int tlmi_analyze(void)
 	if (pwdcfg.password_state & TLMI_POP_PWD)
 		tlmi_priv.pwd_power->valid = true;
 
+	kobject_init(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype);
+
 	return 0;
 
 fail_clear_attr:
-- 
2.31.1


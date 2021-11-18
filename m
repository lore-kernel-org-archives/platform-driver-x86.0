Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CAAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 11:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 343E8610D0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 11:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344263AbhKRLqx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Nov 2021 06:46:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45076 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344091AbhKRLo6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Nov 2021 06:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637235717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=hwDG1KN5RvGH6mD4vXlhYxeyY+Mva6G9EWwgjVc/19U=;
        b=T8rhFj6kP1KQsGJFBz0O55ZYt7QCNlr2zALKik9/yxYCbPKAx5IVYMOHbcOJ3UB3gXX6hU
        oO4+zRuBUJTng1DpmPDdm/AWeTmQkWOCqO/Wrv/7H/l+3LvQhNEWsbFWawS1mJdWvXvzkq
        mQ/vnvLo+rSXZlvHD6Iev07wyo4Ivsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-qOPU1ZK8OzKG6GywDiz__w-1; Thu, 18 Nov 2021 06:41:54 -0500
X-MC-Unique: qOPU1ZK8OzKG6GywDiz__w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB9A8799ED;
        Thu, 18 Nov 2021 11:41:53 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.190])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 114BB102AE42;
        Thu, 18 Nov 2021 11:41:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: think-lmi: Move kobject_init() call into tlmi_create_auth()
Date:   Thu, 18 Nov 2021 12:41:49 +0100
Message-Id: <20211118114150.271274-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

All callers of tlmi_create_auth() also call
kobject_init(&pwd_setting->kobj, &tlmi_pwd_setting_ktype) on the returned
tlmi_pwd_setting struct. Move this into tlmi_create_auth().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index fee9e004161f..6eba69334fa6 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1057,6 +1057,9 @@ static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
 	new_pwd->minlen = tlmi_priv.pwdcfg.core.min_length;
 	new_pwd->maxlen = tlmi_priv.pwdcfg.core.max_length;
 	new_pwd->index = 0;
+
+	kobject_init(&new_pwd->kobj, &tlmi_pwd_setting_ktype);
+
 	return new_pwd;
 }
 
@@ -1146,8 +1149,6 @@ static int tlmi_analyze(void)
 	if (tlmi_priv.pwdcfg.core.password_state & TLMI_PAP_PWD)
 		tlmi_priv.pwd_admin->valid = true;
 
-	kobject_init(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype);
-
 	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
 	if (!tlmi_priv.pwd_power) {
 		ret = -ENOMEM;
@@ -1156,8 +1157,6 @@ static int tlmi_analyze(void)
 	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
 		tlmi_priv.pwd_power->valid = true;
 
-	kobject_init(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype);
-
 	if (tlmi_priv.opcode_support) {
 		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
 		if (!tlmi_priv.pwd_system) {
@@ -1167,21 +1166,17 @@ static int tlmi_analyze(void)
 		if (tlmi_priv.pwdcfg.core.password_state & TLMI_SYS_PWD)
 			tlmi_priv.pwd_system->valid = true;
 
-		kobject_init(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype);
-
 		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
 		if (!tlmi_priv.pwd_hdd) {
 			ret = -ENOMEM;
 			goto fail_clear_attr;
 		}
-		kobject_init(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype);
 
 		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
 		if (!tlmi_priv.pwd_nvme) {
 			ret = -ENOMEM;
 			goto fail_clear_attr;
 		}
-		kobject_init(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype);
 
 		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
 			/* Check if PWD is configured and set index to first drive found */
-- 
2.31.1


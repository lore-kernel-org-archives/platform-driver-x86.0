Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E8AC48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0A2B611CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239378AbhFIPUm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59723 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239489AbhFIPTy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623251879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KUST322CzDTAbB7jpCGcSO3LYymcwysCo7e2GMTsrTQ=;
        b=clhU5XezJcyJesnceN2SB4FASLEJ0I5EstvmCUR3VOc5Rnozdgmz+NFSQ1rfp2ruFXs5ft
        Jr5jAMgNODGKevvF28yOUiaAWggADWKjQCBTkpU6oxbK9ti/phYnXciCZsUX8ijbCKon+5
        wkCR6a/JOdM7mKMvb3wrhhgKZz2tiqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-rZkJSGYYOByonCqfVXSqWQ-1; Wed, 09 Jun 2021 11:17:56 -0400
X-MC-Unique: rZkJSGYYOByonCqfVXSqWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E06F8049CC;
        Wed,  9 Jun 2021 15:17:55 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-55.ams2.redhat.com [10.36.113.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D88A460BD8;
        Wed,  9 Jun 2021 15:17:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        coverity-bot <keescook+coverity-bot@chromium.org>
Subject: [PATCH 1/2] platform/x86: think-lmi: Fix check for admin password being set
Date:   Wed,  9 Jun 2021 17:17:51 +0200
Message-Id: <20210609151752.156902-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tlmi_priv.pwd_admin->password is an array (not a pointer), so the correct
way to check for the password being set is to check for
tlmi_priv.pwd_admin->password[0] != 0.

For the second check, replace the check with checking that auth_str is
set instead.

Cc: Mark Pearson <markpearson@lenovo.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505158 ("NO_EFFECT")
Fixes: a7314b3b1d8a ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index c6413b906e4a..4881de4e669d 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -537,7 +537,7 @@ static ssize_t current_value_store(struct kobject *kobj,
 	p = strchrnul(new_setting, '\n');
 	*p = '\0';
 
-	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
+	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
 		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
 				tlmi_priv.pwd_admin->password,
 				encoding_options[tlmi_priv.pwd_admin->encoding],
@@ -563,7 +563,7 @@ static ssize_t current_value_store(struct kobject *kobj,
 	if (ret)
 		goto out;
 
-	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
+	if (auth_str)
 		ret = tlmi_save_bios_settings(auth_str);
 	else
 		ret = tlmi_save_bios_settings("");
-- 
2.31.1


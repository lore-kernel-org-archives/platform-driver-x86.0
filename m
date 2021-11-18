Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED90C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 11:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C45E660EFD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 11:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344168AbhKRLrH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Nov 2021 06:47:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35057 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344349AbhKRLpG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Nov 2021 06:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637235721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hnnk9z0JsmKo/8TcvTlIsyBN7lLHb5z0hR9xAu+Ky9c=;
        b=Zn0R6Qa0fMLegSmzLG67oW0VzAF43HeuPkRAnxwqznaECnJybHBEPlSZRzhIFcTBnHDHrw
        m5HHpLOunZRqQ7l6WFalOqZLbGbf17JDfNxvNMQ8R+gcbld2d83dkO9oRiniXzNNNbBN1O
        9bQeWncapBBnmzaDrxf48JEcncP+WgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-vlJOsrWLOjifnZ8CKmljKA-1; Thu, 18 Nov 2021 06:41:59 -0500
X-MC-Unique: vlJOsrWLOjifnZ8CKmljKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9771F1006AA2;
        Thu, 18 Nov 2021 11:41:58 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.190])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 952B110016F4;
        Thu, 18 Nov 2021 11:41:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: think-lmi: Simplify tlmi_analyze() error handling a bit
Date:   Thu, 18 Nov 2021 12:41:50 +0100
Message-Id: <20211118114150.271274-2-hdegoede@redhat.com>
In-Reply-To: <20211118114150.271274-1-hdegoede@redhat.com>
References: <20211118114150.271274-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Creating the tlmi_pwd_setting structs can only fail with -ENOMEM, set
ret to this once and simplify the error handling a bit.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 6eba69334fa6..27ab8e4e5b83 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1141,42 +1141,38 @@ static int tlmi_analyze(void)
 	if (ret)
 		goto fail_clear_attr;
 
+	/* All failures below boil down to kmalloc failures */
+	ret = -ENOMEM;
+
 	tlmi_priv.pwd_admin = tlmi_create_auth("pap", "bios-admin");
-	if (!tlmi_priv.pwd_admin) {
-		ret = -ENOMEM;
+	if (!tlmi_priv.pwd_admin)
 		goto fail_clear_attr;
-	}
+
 	if (tlmi_priv.pwdcfg.core.password_state & TLMI_PAP_PWD)
 		tlmi_priv.pwd_admin->valid = true;
 
 	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
-	if (!tlmi_priv.pwd_power) {
-		ret = -ENOMEM;
+	if (!tlmi_priv.pwd_power)
 		goto fail_clear_attr;
-	}
+
 	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
 		tlmi_priv.pwd_power->valid = true;
 
 	if (tlmi_priv.opcode_support) {
 		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
-		if (!tlmi_priv.pwd_system) {
-			ret = -ENOMEM;
+		if (!tlmi_priv.pwd_system)
 			goto fail_clear_attr;
-		}
+
 		if (tlmi_priv.pwdcfg.core.password_state & TLMI_SYS_PWD)
 			tlmi_priv.pwd_system->valid = true;
 
 		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
-		if (!tlmi_priv.pwd_hdd) {
-			ret = -ENOMEM;
+		if (!tlmi_priv.pwd_hdd)
 			goto fail_clear_attr;
-		}
 
 		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
-		if (!tlmi_priv.pwd_nvme) {
-			ret = -ENOMEM;
+		if (!tlmi_priv.pwd_nvme)
 			goto fail_clear_attr;
-		}
 
 		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
 			/* Check if PWD is configured and set index to first drive found */
-- 
2.31.1


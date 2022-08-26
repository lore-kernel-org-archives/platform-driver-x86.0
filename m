Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258B6ECAAD6
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 09:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343896AbiHZJ3h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 05:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343828AbiHZJ30 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 05:29:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3A3B5A44
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661506165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=veoKzPrgUiFcfr6+6VQn4D3klUeoZiBvawAgjMGVc6I=;
        b=KSUc6mFPfHteLlWJk6rRQhgVPeliym5xekoBQEH7oU66VWO3+7r7OZPX2Pj/mhHQtf4xb/
        n9H6QCEpGftMVJGtK6Dq/Pz2lOCXFyNqcVSpBn2uvpTbMPFTZjaYVrp116pj0rQCeivulU
        kgnAqR5cgui0F+1eijOrSsPgWhlV5Kw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-zsz6BMsBOX2d4I_6eixo6A-1; Fri, 26 Aug 2022 05:29:23 -0400
X-MC-Unique: zsz6BMsBOX2d4I_6eixo6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56B191C051A7;
        Fri, 26 Aug 2022 09:29:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.76])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D89840C141D;
        Fri, 26 Aug 2022 09:29:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Luke D . Jones" <luke@ljones.dev>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Update tablet_mode_sw module-param help text
Date:   Fri, 26 Aug 2022 11:29:21 +0200
Message-Id: <20220826092921.8907-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Document how to select asus_wmi_lid_flip_rog_devid as tablet_switch_mode
by adding "3:lid-flip-rog" to the tablet_mode_sw module-param help text.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index bbfed85051ee..222aef762a6c 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -43,7 +43,7 @@ MODULE_PARM_DESC(wapf, "WAPF value");
 
 static int tablet_mode_sw = -1;
 module_param(tablet_mode_sw, uint, 0444);
-MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1:auto 0:disable 1:kbd-dock 2:lid-flip");
+MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1:auto 0:disable 1:kbd-dock 2:lid-flip 3:lid-flip-rog");
 
 static struct quirk_entry *quirks;
 
-- 
2.37.2


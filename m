Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9F2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 17:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbiCIRMi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:12:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236883AbiCIRML (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 12:12:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED25810F21F
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 09:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646845549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WVCFpFm/Z6jnzxA9K62tkKBtZ62yjTboxi0b/CjH1Cs=;
        b=gy97Ko1EXm+gRQL8AB1ZSn92tF7EwJOL7fVAVExqABDHwwXnFi05q0YguEypDLjgsntDcA
        kWJQNCfi+sM+7TEnfeGR/gECZxLibYC4kdte/vw+Doi1N0hwryzEFIrB/fTR0Dv3YTMdsu
        J2XV+qx/03VzV4cDY3Dh71LdcXMfGwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-9wOTmtMHOC2i3FkIAdFBbw-1; Wed, 09 Mar 2022 12:05:47 -0500
X-MC-Unique: 9wOTmtMHOC2i3FkIAdFBbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 895B41006AA7;
        Wed,  9 Mar 2022 17:05:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 31602380B;
        Wed,  9 Mar 2022 17:05:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 2/2] platform/x86: thinkpad_acpi: Don't use test_bit on an integer
Date:   Wed,  9 Mar 2022 18:05:32 +0100
Message-Id: <20220309170532.343384-2-hdegoede@redhat.com>
In-Reply-To: <20220309170532.343384-1-hdegoede@redhat.com>
References: <20220309170532.343384-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

test_bit can only be used on longs not on ints, fix this.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
p.s. Mark, the need for the (void *) case in the code this replaces
should have been a hint that something was not right; and I should
have spotted that during review...
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7016c7fc3440..c476a78599d6 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10399,7 +10399,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (err)
 		return err;
 
-	if (test_bit(DYTC_FC_MMC, (void *)&output)) { /* MMC MODE */
+	if (output & BIT(DYTC_FC_MMC)) { /* MMC MODE */
 		dytc_profile_available = DYTC_FUNCMODE_MMC;
 
 		/*
@@ -10412,7 +10412,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
 				dytc_mmc_get_available = true;
 		}
-	} else if (test_bit(DYTC_FC_PSC, (void *)&output)) { /*PSC MODE */
+	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */
 		dytc_profile_available = DYTC_FUNCMODE_PSC;
 	} else {
 		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
-- 
2.35.1


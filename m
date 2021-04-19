Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEC1C433B4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Apr 2021 14:31:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC6CC61246
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Apr 2021 14:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239855AbhDSObs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Apr 2021 10:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57930 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232302AbhDSObr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Apr 2021 10:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618842677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=A0IIc0M+RZaZjDIx74SepYYkwsfjD6QPhhXp1UtJm0E=;
        b=itGwIR2lotgCYHzS4JakBrlgbCfjOU3+TsL84aag0qSZU5mH0I1/eBKiLt5WmCLACJWsI8
        eBGH+dwa3cGiSC20SNWtygkVcNpW2YJXZffsNP1UStvHCXmFZQtQMYgMi1fjUQF9wq58e4
        TAL6G9oCo/2m39UQEMLkHgU5FhwGoUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-CYz3XE91OYK7eOFE02gIDA-1; Mon, 19 Apr 2021 10:31:13 -0400
X-MC-Unique: CYz3XE91OYK7eOFE02gIDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 585B519253DA;
        Mon, 19 Apr 2021 14:31:12 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-152.ams2.redhat.com [10.36.114.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1340660BF1;
        Mon, 19 Apr 2021 14:31:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        "David E . Box" <david.e.box@linux.intel.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: intel_pmc_core: Fix "unsigned 'ret' is never less than zero" smatch warning
Date:   Mon, 19 Apr 2021 16:31:09 +0200
Message-Id: <20210419143109.30612-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Change the type of ret form a size_t to a ssize_t, matching the prototype
of simple_write_to_buffer(), fixing this warning reported by smatch:

drivers/platform/x86/intel_pmc_core.c:1369 pmc_core_lpm_latch_mode_write() warn: unsigned 'ret' is never less than zero.

Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
Cc: David E. Box <david.e.box@linux.intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 3ae00ac85c75..d174aeb492e0 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1360,7 +1360,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	struct pmc_dev *pmcdev = s->private;
 	bool clear = false, c10 = false;
 	unsigned char buf[8];
-	size_t ret;
+	ssize_t ret;
 	int idx, m, mode;
 	u32 reg;
 
-- 
2.31.1


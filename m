Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBDCC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 May 2022 15:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236598AbiECPjo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 May 2022 11:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238637AbiECPit (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 May 2022 11:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 417DFBF57
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651592115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yd6RJcnms3QbLeEWL2yZbs+FnmnChaDBoTejX3QF348=;
        b=Zk0aBWimB2WLsoSVYqT8LqCXBO3mKts2Xj30GjZezD4k50GUn8FXAyBqrwB9iV/0zRuBgN
        DHhTTZbQRYRAB5dGSJUgI/fYznkvTcFik/wdqUxtLnsRx46VxEXtJzgTxc9sXhekLD9ZH3
        UZdtGdC8M61T78jq1cupupGwB+Uug8Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-R_rvmrqbMSKbDCDz-hTQMQ-1; Tue, 03 May 2022 11:35:11 -0400
X-MC-Unique: R_rvmrqbMSKbDCDz-hTQMQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9B3628009A4;
        Tue,  3 May 2022 11:46:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 66250402182;
        Tue,  3 May 2022 11:46:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/1] platform/x86: Drop the PMC_ATOM Kconfig option
Date:   Tue,  3 May 2022 13:46:06 +0200
Message-Id: <20220503114607.98844-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Here is a patch resulting from an earlier series from Paul Gortmaker to
allow disabling building the PMC_ATOM bits on platforms which don't
need them:
https://lore.kernel.org/platform-driver-x86/20220428062430.31010-1-paul.gortmaker@windriver.com/

This is a simpler way to achieve the result, while actually simplifying
things / removing some code.

Stephen, if you are ok with this change can you give your Acked-by for
merging this through the pdx86 tree ?

Regards,

Hans


Hans de Goede (1):
  platform/x86: Drop the PMC_ATOM Kconfig option

 drivers/clk/x86/Makefile      | 4 +---
 drivers/platform/x86/Kconfig  | 5 -----
 drivers/platform/x86/Makefile | 2 +-
 3 files changed, 2 insertions(+), 9 deletions(-)

-- 
2.36.0


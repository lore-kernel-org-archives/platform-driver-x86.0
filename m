Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01610C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 May 2022 14:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237460AbiECOyP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 May 2022 10:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237449AbiECOyP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 May 2022 10:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2EED71A3BC
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651589441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yd6RJcnms3QbLeEWL2yZbs+FnmnChaDBoTejX3QF348=;
        b=HvR3jSxIqV38uDMYwbecNQPdhoDB+Fkko92TZGF68pL1izz/99lOvM3LWY/V7sJCNR6KN5
        LOqYnmj55YAMAcjd7lCdKQz+Fj3n3aTdbxHDZBRUUhxFC4WWwJTCjxvLJq9WJAoDqMSSOB
        BuEYJ6Yw1NzSyw0WFwpdTYUHDqOJm80=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-ANR3Y98UPEGRM2lIRHUutw-1; Tue, 03 May 2022 10:44:00 -0400
X-MC-Unique: ANR3Y98UPEGRM2lIRHUutw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE71FCCAFAA;
        Tue,  3 May 2022 14:02:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9E9839E6F;
        Tue,  3 May 2022 14:02:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/1] platform/x86: Drop the PMC_ATOM Kconfig option
Date:   Tue,  3 May 2022 16:02:06 +0200
Message-Id: <20220503140207.101218-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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


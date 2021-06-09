Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE83BC48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:35:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF9A860FF0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhFIPhe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51758 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232861AbhFIPhe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623252939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VxgDk7cTkJTNNC5ZMrS1yGyqdCe9V2Gyf+MzVfrw8ec=;
        b=e7CgiIiIhjSq+vn+Qawe4fKFoJbm64cyLTEkgUlqRoRN7AGToM526z6yJ04nKb3YHNHk1U
        1qCF299Hg0+FjwRUhhQ+FU5/YpGm9HthlmbFANcJhTRlT1/PY3Un48T2PT2YpTEIatQuP2
        v43h8xJEWKmnhD8UYhuY1fEGF4Ig1rU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-dt5LQ0tcOaK4Lidh_MijKA-1; Wed, 09 Jun 2021 11:35:37 -0400
X-MC-Unique: dt5LQ0tcOaK4Lidh_MijKA-1
Received: by mail-ot1-f70.google.com with SMTP id o26-20020a9d6d1a0000b02903e61e3de711so8936703otp.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 08:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VxgDk7cTkJTNNC5ZMrS1yGyqdCe9V2Gyf+MzVfrw8ec=;
        b=igR6eLfvBsRuWEk0oA0jTDcFgWHbQVSeUDJBjl/JjxjytXT+D1LOy0eER3qpxpyHib
         58Qyoe1C3hq5XYFuoQWLleOOm56tDRTa4rm2ofuOp8m+MO3ELfAEs3/S5bSMAfRFUJuu
         vS0gz7h6zT5zJ3k1RQpDaE6rvwfMO/ue/lYt6B6iEXvDWgJcAINBtrVDDKRh0n9bR2Wd
         uZa06nHD/S1S0jtOwJLgmvjTQPuZPfEj0ebpzxFm2eB6VuQep6tMFrzpqUqlcWfJg6Zg
         wvH+xDaUan0AEvEqKoRlFdF8dddY8hMG2eGvFnLZnIFKrFBE39o5qLle1lj0BWWWvbMr
         zSvA==
X-Gm-Message-State: AOAM530EUmEeGrG2r4qwnVavGAS7RxbP5imesDPl041Oy+m1b0XUMxy0
        VAYtjHXqiABZt9pWpJGosf4959XwL2Wks9/Q1GmRsEEgM55mdf2GJBYp2erga6tfQW3Ui7aeaak
        CKdI9lmHl3oxZ0sEe3zsBda/lcUQ3ehIF3Q==
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr10714otq.73.1623252936862;
        Wed, 09 Jun 2021 08:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7Daq8mDoBGGCaF1d0sj1xDGnnYrzi8QqE4yRaTjbZ2kHSKW8poNukRLJ4rCoORV1axGN9fw==
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr10682otq.73.1623252936325;
        Wed, 09 Jun 2021 08:35:36 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id l28sm52583otd.66.2021.06.09.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 08:35:36 -0700 (PDT)
From:   trix@redhat.com
To:     markpearson@lenovo.com, hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86: thinkpad-lmi: set fw_attr_class storage-class to static
Date:   Wed,  9 Jun 2021 08:35:32 -0700
Message-Id: <20210609153532.3090201-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Tom Rix <trix@redhat.com>

An allyesconfig has this linking error
drivers/platform/x86/think-lmi.o:
  multiple definition of `fw_attr_class'
drivers/platform/x86/dell/dell-wmi-sysman/sysman.o:
  first defined here

fw_attr_class is only used locally, so change to static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 782d8e3fe7a1e..c6413b906e4a3 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -134,7 +134,7 @@ static const char * const encoding_options[] = {
 	[TLMI_ENCODING_SCANCODE] = "scancode",
 };
 static struct think_lmi tlmi_priv;
-struct class *fw_attr_class;
+static struct class *fw_attr_class;
 
 /* ------ Utility functions ------------*/
 /* Convert BIOS WMI error string to suitable error code */
-- 
2.26.3


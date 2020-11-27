Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9374DC3E8C5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 18:10:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 443A52224B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 18:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GmYhur2x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgK0SKd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Nov 2020 13:10:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34628 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732038AbgK0SKd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Nov 2020 13:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606500632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=ClSEA+oHo66dgHnrI/FfViP9bxY+tUBfKOzJZRbRpDw=;
        b=GmYhur2xRZhN5LghyloXmeAdXsprHCRsJUG+UAzuqJ25QLDoq5VLYqRA3qRQt/ohwD20HJ
        hb+TDTb7Hj8Jm9bXiLU/NiJtg9zSa6y7OmbS5RIA4aNwnSTBmZjN8zb0kAYtfihee0FLs6
        FG5sxisTWJEFGvkg+NDlil3KsQK1Mjg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-kLOL0dOBNQCmQ68TuuM3Rg-1; Fri, 27 Nov 2020 13:10:30 -0500
X-MC-Unique: kLOL0dOBNQCmQ68TuuM3Rg-1
Received: by mail-qk1-f199.google.com with SMTP id z129so4149634qkb.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2020 10:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ClSEA+oHo66dgHnrI/FfViP9bxY+tUBfKOzJZRbRpDw=;
        b=k6V1+QwuE9saXYDZBVLfniTkkePOJNx40/lEq3l6jazrMSYgutm09GD8Ofn/ysVJ7H
         Q2mefCc5n5mf9XRL4QCtdgs1dy5OM89kH+kIWXjuOyi/lShB4bw7znsc2oDoKZeodpvE
         /V+4i4H5uGxq4gHuXU+OuXbQxIjk4rJHxwBypHVptUBB/afYDAtXB/++gSr4srJdpmMS
         kt/WwqWgyOngVJCjjTjPetIdcrylHT+ZQoLGPX20VLU64j6t9prG1gf92Lj2r8/KKU2e
         sRq4AhUkLYHF+AZJc/P+C82x/H2JO1zZTpprsSfLEB9WgefOK8WM9ongMsaz1NF4GdfV
         zwnA==
X-Gm-Message-State: AOAM5307e+ScO0usqFTJj0Y7mIbGQuaYgjJeocwcPdFIgUr+iWVVt5mF
        sde1vzoQ2EWc4rc9S/l7CXk4AUaOW+cjMq7fxjyd9XPa0nQOfEGzqKL3k50eaAkLxyLmiaWOL0o
        q6jOBxJKN/yEi3Rn5FDPaSIuElQGU0g08CA==
X-Received: by 2002:ad4:42a7:: with SMTP id e7mr9345591qvr.45.1606500629890;
        Fri, 27 Nov 2020 10:10:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHlAuYcSOipUdB/xqu5jZZbBOTsmuzbrp24uGjZ7nun8E4njIwLiGIDZUNLb/aa/WA1qAH1w==
X-Received: by 2002:ad4:42a7:: with SMTP id e7mr9345579qvr.45.1606500629762;
        Fri, 27 Nov 2020 10:10:29 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id h4sm7119708qkh.93.2020.11.27.10.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 10:10:29 -0800 (PST)
From:   trix@redhat.com
To:     ibm-acpi@hmh.eng.br, hdegoede@redhat.com, mgross@linux.intel.com
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: remove trailing semicolon in macro definition
Date:   Fri, 27 Nov 2020 10:10:24 -0800
Message-Id: <20201127181024.2771890-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 36d9594bca7f..5bbb378d1a37 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1025,7 +1025,7 @@ static struct attribute_set *create_attr_set(unsigned int max_members,
 }
 
 #define destroy_attr_set(_set) \
-	kfree(_set);
+	kfree(_set)
 
 /* not multi-threaded safe, use it in a single thread per set */
 static int add_to_attr_set(struct attribute_set *s, struct attribute *attr)
-- 
2.18.4


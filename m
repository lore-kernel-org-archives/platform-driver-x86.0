Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02A0C433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 May 2021 15:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BEEE611AB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 May 2021 15:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbhEMPjw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 13 May 2021 11:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234980AbhEMPjs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 May 2021 11:39:48 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21847C061574
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 May 2021 08:38:36 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id j19so20020379qtp.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 May 2021 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d4ZQOZeGe3EXF7fffoOcvNZdw5onCMB34qpY3tlGdRM=;
        b=CYdrHSDlh6HMQzySYCOOUq1Jiw0iKG8rJhSyBrzfrMvk/MXp5dylryVV0wvHbimBvy
         oTmkhL9AFEVeBMcUFu6Z7NcPF2GhNoAYuAHrlXSUajUUMCGZrz6wWCX4nFP8ej/YIzzF
         5hw1AeA4iI4rp05PaVzDdBtrRm+YZY23gEn/iqMo++OkkDgz5gw7cH9rj5HbGdS4bVyf
         fSovggX34GroWAUsg69wpYTak0UZZ/XThK4gL/RmrhPGdg3om1Z10rxxumYYF6wjf+Ga
         gtKZzeuq7GtMD6pSMCeinkWc3HHnrOXmZy4TdOoOqumP2zWZDJe6p/Z9/KKnEmKQ27S1
         94Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d4ZQOZeGe3EXF7fffoOcvNZdw5onCMB34qpY3tlGdRM=;
        b=DVDsOtSSoRdBeWsj4cFm0tY2O+qFAh4U7JKiOqKv2o5TacbK7bSGFDP8aQhaDIM+Yq
         1OX4J5YrkhdXcYlZ1RiFBvmvSTi+Dn2Lfr1sNz8Ctwe9MB9xT56x0lUBLp6NK/MHb74J
         Ls90iXAK/Vie9Eo8Oh/LTAEK1Zfs8S3lucBHbTGumHxS26DxrXLVj1cu52K3Y9Fz4FV4
         n8JSEMP1ecSpbz8vZYFNHjfGtPpk2Ly/HCWMyyZhausG7jH/YSybt7DX7uQeMe9Q8xM+
         dbVRdBhoSsMjqQuxhitBN0DYXzhICjFyndY6H4AcN+I5lRN3aHmiDlD7cQzVFToPi1/S
         yDng==
X-Gm-Message-State: AOAM530U8SS+/zvO8StwoUVxX3B8Sr/4MtZsG1xZtJnaIU7uZBsfBBSU
        BIz9qvWqSYfZwuE8BZBTL4k=
X-Google-Smtp-Source: ABdhPJyhCnOhWCavkV/9rgtO+BA3rNNdOehCl8lxT8UPbpb3vo9UkzmHKXCJddBfy75AzBbjbbpeYg==
X-Received: by 2002:ac8:5e0b:: with SMTP id h11mr39109204qtx.194.1620920315351;
        Thu, 13 May 2021 08:38:35 -0700 (PDT)
Received: from localhost.localdomain (bras-base-toroon4216w-grc-03-184-148-68-141.dsl.bell.ca. [184.148.68.141])
        by smtp.gmail.com with ESMTPSA id c26sm2433411qtj.92.2021.05.13.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 08:38:34 -0700 (PDT)
From:   Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
To:     rajneesh.bhardwaj@amd.com, platform-driver-x86@vger.kernel.org,
        david.e.box@linux.intel.com
Cc:     dave.hansen@intel.com,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Subject: [PATCH] MAINTAINERS: Update info for telemetry
Date:   Thu, 13 May 2021 11:38:25 -0400
Message-Id: <20210513153825.77214-1-irenic.rajneesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

 - My linux.intel.com email is no longer valid, update it to my gmail id.

Signed-off-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fdc513392f4..dd21a6e56e17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9209,7 +9209,7 @@ F:	include/linux/firmware/intel/stratix10-smc.h
 F:	include/linux/firmware/intel/stratix10-svc-client.h
 
 INTEL TELEMETRY DRIVER
-M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
+M:	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
 M:	"David E. Box" <david.e.box@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-- 
2.25.1


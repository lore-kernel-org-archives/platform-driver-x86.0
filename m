Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F3BC4345E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Mar 2021 22:22:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85EF9619B5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Mar 2021 22:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbhC2WWb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 29 Mar 2021 18:22:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:46128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231962AbhC2WWI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Mar 2021 18:22:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08B6D6198F;
        Mon, 29 Mar 2021 22:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617056527;
        bh=tQJoCxpovS4upu8UjYSn8Ty5bw8x9UQbHWn+lFOYW7I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J5AhQ3n0veD19VksB1sV0pfnOZX2qiknGVGF2auOG9tRHhQfQWouoAwz7LQSlzBcx
         uHBYNSNQUD+dAYcc34TUZLhZtv0v/HiduO6FbXYwkuhOtXAKinQz6CGz0PR/cFjzqd
         DBcnVBMcSSPRFrOTlE66vXkDXoV3SHm5M1OyZqyft0SsgSVNh+TVyYaK7CbPen5bv/
         5KW9rZJ4/IDSapqYNGuN7LOz2MmGViJs0aJTfmvwZoCTC1VErJY+WaMIdc1IpHktVv
         BzBFzJIXx9fouo0trtgriM49S7o7Y0OYNygFYldmaoX144DaUi8JPJBeUhb9QzmF9A
         IPJNkJqbj9sHw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 27/38] platform/x86: intel_pmt_class: Initial resource to 0
Date:   Mon, 29 Mar 2021 18:21:22 -0400
Message-Id: <20210329222133.2382393-27-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329222133.2382393-1-sashal@kernel.org>
References: <20210329222133.2382393-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: "David E. Box" <david.e.box@linux.intel.com>

[ Upstream commit 7547deff8a221e6bf1e563cf1b636844a8e5378a ]

Initialize the struct resource in intel_pmt_dev_register to zero to avoid a
fault should the char *name field be non-zero.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Link: https://lore.kernel.org/r/20210317024455.3071477-1-david.e.box@linux.intel.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel_pmt_class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmt_class.c b/drivers/platform/x86/intel_pmt_class.c
index c8939fba4509..ee2b3bbeb83d 100644
--- a/drivers/platform/x86/intel_pmt_class.c
+++ b/drivers/platform/x86/intel_pmt_class.c
@@ -173,7 +173,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 				  struct intel_pmt_namespace *ns,
 				  struct device *parent)
 {
-	struct resource res;
+	struct resource res = {0};
 	struct device *dev;
 	int ret;
 
-- 
2.30.1


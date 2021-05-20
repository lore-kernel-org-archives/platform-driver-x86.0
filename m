Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F37C433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 16:47:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11017610CC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 16:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235358AbhETQs6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 May 2021 12:48:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:43106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233372AbhETQs6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 May 2021 12:48:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 850EC6101E;
        Thu, 20 May 2021 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621529256;
        bh=6GF42znOzBycwTENQxGHhQFFBMgkNekSpq67/mc+CRU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=RFKdyAgIsgCdw4Tr8cD2qiRZ8XlNgVfKDfPfs7nfObP1YlKzdx8tXD3rCE973cRcY
         LWIySIvM6T2fdXavWfFzmDc7SbMzDxtATCqXPg5G7fuYgOBlGhxgGTx8n58WwzoAzv
         rjHUsagJUvRldS/0dBIv9AZNnAb02GozXGIcjAiWdjgaz49+anThJn0CfpwxhlSGJl
         7UvjtrWVIGOIgsZzFSiaGQVxLotD3PWmQt7vmhuK78ctQquSK3JKvqsw5Wln7d0ZVD
         slc9ChO87IvCLNe+vHYsfKBBTU5K4HG5NkTroruJZCK5Xr0cF1TNop5QPe8PrF4iML
         TPngQow8juWzw==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.13-2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ca5ce35d-c5d5-1803-cbb7-b47a5f44e535@redhat.com>
References: <ca5ce35d-c5d5-1803-cbb7-b47a5f44e535@redhat.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <ca5ce35d-c5d5-1803-cbb7-b47a5f44e535@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.13-2
X-PR-Tracked-Commit-Id: e68671e9e1275dfdda333c3e83b6d28963af16b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ebd8118162b220d616d7e29b505dd64a90f75b6
Message-Id: <162152925651.27581.6288650863828850372.pr-tracker-bot@kernel.org>
Date:   Thu, 20 May 2021 16:47:36 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Thu, 20 May 2021 14:39:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ebd8118162b220d616d7e29b505dd64a90f75b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

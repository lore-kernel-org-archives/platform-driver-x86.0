Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F38CC83018
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42644221FD
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7PmY1Wj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730134AbgK1Vtq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:34466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730429AbgK0TvY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Nov 2020 14:51:24 -0500
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.10-2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606504790;
        bh=0u6dzuCy8RdkeghSH+mQFIgJD1+cmgXtfu+0AW9hmps=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=g7PmY1WjrrAcVO4IZIH14Ngs9MNw9Q8VOkNislXUffTy4kCmks3FDWBS0yiEdKkHg
         LoiT6djszF1X01gMkH3lJImTxpV+5a7lMwey7NvEostxV3w6viDz1sDZmC/CC99Um4
         j2BX9zUOBAI1+X88e1Orz8Km+LS4cz7aXO1PTKLw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <7fadb4fc-4e7f-e335-4c90-c09ee6aafeac@redhat.com>
References: <7fadb4fc-4e7f-e335-4c90-c09ee6aafeac@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7fadb4fc-4e7f-e335-4c90-c09ee6aafeac@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.10-2
X-PR-Tracked-Commit-Id: c9aa128080cbce92f8715a9328f88d8ca3134279
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 99c710c46dfc413b9c8a1a40b463ae1eaca539e5
Message-Id: <160650479083.7570.5729692527875373240.pr-tracker-bot@kernel.org>
Date:   Fri, 27 Nov 2020 19:19:50 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Fri, 27 Nov 2020 10:41:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/99c710c46dfc413b9c8a1a40b463ae1eaca539e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDB9C433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 19:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B9AE64FC2
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 19:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbhBCTj0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 14:39:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:43786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231336AbhBCTjX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 14:39:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6D67E64F92;
        Wed,  3 Feb 2021 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612381122;
        bh=cIizPYfPKPRhVKZCcw6ZGwAIiFHD/9rKEfu2UP3a150=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=f1+SVm01PvU7KGmA09zJaA6zPFn/ocQiSdvxK41QIV3hAtZr12Nhx3uca4IX+qkgT
         HVbfUJUQSLK1E1HkJQGtL3h90cokf+dTUv3dUsDaUi+BAx7JNfuFvMTMpR4Nnz5vwf
         19WGdz6Qwb37JqGR+DRczR5OJeHpmD+ZQu9JJjYRmKyYUMRY3ND+j/iy5GFgqw5FgL
         ndg5r07aA9VPT5z1uZh3LgaE++PTBo0MkMi5+GyfZpaLJs8vFyqHY/0rqnpLefQx+P
         Xrmc9gkxjYn9FOD0MkI8jF5orJKotw9+WQan4l5vqIZ7T3Cjc/NEfpYxaM+uOcYcpZ
         kt1leNkX27DJQ==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.11-3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <368c6b64-1e5b-743d-e255-7e9bade23238@redhat.com>
References: <368c6b64-1e5b-743d-e255-7e9bade23238@redhat.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <368c6b64-1e5b-743d-e255-7e9bade23238@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.11-3
X-PR-Tracked-Commit-Id: 215164bfb7144c5890dd8021ff06e486939862d4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4aa2fb4ef799b01dd5d2dcc3970344a9a036c1f2
Message-Id: <161238112242.20071.8703639274817211311.pr-tracker-bot@kernel.org>
Date:   Wed, 03 Feb 2021 19:38:42 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Wed, 3 Feb 2021 11:23:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.11-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4aa2fb4ef799b01dd5d2dcc3970344a9a036c1f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

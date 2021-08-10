Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2B7C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 16:55:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B8E760527
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 16:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhHJQ4K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Aug 2021 12:56:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:56350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229564AbhHJQzD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Aug 2021 12:55:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B88CA60D07;
        Tue, 10 Aug 2021 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628614448;
        bh=LRfdcIQtSwp5Sx42fJjK3f5sRuxS3yzO4dIm1j4u4GE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=N9kiXG4+4vcy65Gvo1Yw5WOdXq+Jd2HPPcKl5E/Y/zxKM9lzer63Osufsq13SJ5wz
         yaX6GG35yq7JZA29J7lhENMyvT0BzXBUvNQJWTSbelcB9vTtpM4UYqT9HP+gF9QDbe
         jP8rzXi1ZVA7TZqdgl2EVD23nYs9oxA1LCKtnGY5ucdA0cboWMmcgdXtxAC6ZyHX/6
         IZz1SFZVYQi+u6TsSe6oM/VjeL6G3X2lBpL6WIqHz+ZosSsuAHfPyNued8117W+c7S
         tKQMHP/qoJz3sKFGd1KaLosnnt2PlDmsMjeDdj5e2/h4YCkN1C0GY7oc90csbMKfPT
         gI0pL9zBz6W+A==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.14-3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <22dd7348-7f62-a99c-9f3b-3fdd00bb3772@redhat.com>
References: <22dd7348-7f62-a99c-9f3b-3fdd00bb3772@redhat.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <22dd7348-7f62-a99c-9f3b-3fdd00bb3772@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-3
X-PR-Tracked-Commit-Id: 9d7b132e62e41b7d49bf157aeaf9147c27492e0f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e723c5380c6e14fb91a8b6950563d040674afdb
Message-Id: <162861444872.12822.6958452574285755967.pr-tracker-bot@kernel.org>
Date:   Tue, 10 Aug 2021 16:54:08 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Tue, 10 Aug 2021 17:52:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e723c5380c6e14fb91a8b6950563d040674afdb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

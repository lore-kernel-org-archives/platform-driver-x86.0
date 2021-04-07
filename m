Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE4AC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 18:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C78316124C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 18:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355295AbhDGS2V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 14:28:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355292AbhDGS2U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 14:28:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7DE40611BD;
        Wed,  7 Apr 2021 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617820090;
        bh=t0Oj283Ns63qN1NyD+uI+cibuIMIIH/kyvkM9YIThxM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=upqD5DV5RT0ISGMjtIAfW6NlCnqcVFSCRWPur5L+sFyEyBVDnTcmPTYVUwAoBl3Zt
         8uKIk80BLNyxkg14NBt0XmlDh7Gy2Prlo2VPBKZYUhQFqegetE8r9wTuTzxRkC6OPT
         mraz6MBnsvUUC1zkKE5gz63/dXgA1NPfLIO9SYSar/so3MHLzt17gVg6y5+MBFy7V4
         hcIxq/Pr3KpQgIhLqu8Rra/SDEQuEKCl376vj3JRqN9YRYF/1dWOs/edq+gvc1v+61
         xfjXMxnvotbmGqlywJE1sf0Cgd3aKQDKMiKhwUcayP2m3t3QBRvlwp/BZD13gb++Bv
         3y+Z4aaWV0G+w==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.12-3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <5dd4526e-b5c2-4071-0f82-6ecbffe085a5@redhat.com>
References: <5dd4526e-b5c2-4071-0f82-6ecbffe085a5@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <5dd4526e-b5c2-4071-0f82-6ecbffe085a5@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.12-3
X-PR-Tracked-Commit-Id: a3790a8a94fc0234c5d38013b48e74ef221ec84c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5ba091db9386e6f50f32e660253bcc250cdbbca8
Message-Id: <161782009049.7121.11575887688893335814.pr-tracker-bot@kernel.org>
Date:   Wed, 07 Apr 2021 18:28:10 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Wed, 7 Apr 2021 12:07:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.12-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5ba091db9386e6f50f32e660253bcc250cdbbca8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

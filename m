Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996FEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Sep 2021 16:31:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FB3960F3A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Sep 2021 16:31:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236568AbhIVQdH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Sep 2021 12:33:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:58980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236628AbhIVQdG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Sep 2021 12:33:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0E63A611B0;
        Wed, 22 Sep 2021 16:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632328296;
        bh=Aa5tfeKSQT7wdEHxHLHokNl8n6PqodEsiECSutpnnco=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=nDEeRLZsBvvAvRbpKWBuE1XFVkBmHpurSRNIgez30nV2sk2jyJr9tbrrJIn3icu0v
         z0fCdQDxnMsYoQIRJnDRXdouHdCUWv7iuQFQAWk6o/BvS7AAdbP+EMmg6nMdgID8b6
         wB3RVdhjJhVRJ+NRBW23ZmhQ6ZuurRxR4tc6fVI9K/b7u2C1AAYSiplNJ6i2NcT3wG
         7kHx95aZ3KyT0wJGxxy/tbMKDVNwBq3sECsfJdkLuCi5922514J9MV1GwvzG1jDtag
         Mxaqe8eLFNFX/rWiv/382zKJGYBviIN6IV2s/c39L1IdoVqmTrpapalsF+PfY+A8pa
         SB0qW8/LilZ9Q==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.15-2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <d7f081b7-275a-4f1c-ed27-9016ed5b2b46@redhat.com>
References: <d7f081b7-275a-4f1c-ed27-9016ed5b2b46@redhat.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <d7f081b7-275a-4f1c-ed27-9016ed5b2b46@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.15-2
X-PR-Tracked-Commit-Id: 6f6aab1caf6c7fef46852aaab03f4e8250779e52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bee42512c4a0e6253d6b196445f9091438b264b5
Message-Id: <163232829602.9122.11986880933771269081.pr-tracker-bot@kernel.org>
Date:   Wed, 22 Sep 2021 16:31:36 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Tue, 21 Sep 2021 16:10:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bee42512c4a0e6253d6b196445f9091438b264b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

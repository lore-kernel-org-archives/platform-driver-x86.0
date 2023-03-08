Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B938C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Mar 2023 20:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjCHUSA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 15:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjCHUR6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 15:17:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277B83ABE;
        Wed,  8 Mar 2023 12:17:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ADF2D61733;
        Wed,  8 Mar 2023 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 220C6C433EF;
        Wed,  8 Mar 2023 20:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678306674;
        bh=BY8Izeqd+mURyqB814FGlcrEUTYwirZSyPip5WwOnVE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Olqm+rDXnsEIhJfSaKwO1Yz4GnN5kKAKpfyY1zQW9fpJAe/Zi2aNSTjHJRMyHzWbN
         oPdcr+bzoBkrBebsB5NmkFvbZFlrYZjEjHpMGzLfE0152pUoaSeJojeo6Ad9AMVsCX
         0y5a6wIfiKIWaIw3kmiKw1QkHhoUfv0vN3x6T5MsRhDq4Vp6msqXyF5HvWU29yqKe4
         pyBrOxThYkFFVaQdgnuKXKFNC0I4PNPi8ilYZacD3KShGHS7qPCzUSiMNSaRh68zx6
         cn70n5mAKmao1RZpmeIuPC1da4p8UFjHB+Y2yd7YKwlo4FM6ezI1bSLxFcmroyhcOi
         8aOnVL8/BFarg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1167CE61B64;
        Wed,  8 Mar 2023 20:17:54 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.3-2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <7cbefa41-8c79-8280-3d87-3b0b13857aba@redhat.com>
References: <7cbefa41-8c79-8280-3d87-3b0b13857aba@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7cbefa41-8c79-8280-3d87-3b0b13857aba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.3-2
X-PR-Tracked-Commit-Id: 1a0009abfa7893b9cfcd3884658af1cbee6b26ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55ee6646b6ba86574d1411af275c61a82fdfe10e
Message-Id: <167830667405.31327.6530095545614055894.pr-tracker-bot@kernel.org>
Date:   Wed, 08 Mar 2023 20:17:54 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Wed, 8 Mar 2023 15:56:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55ee6646b6ba86574d1411af275c61a82fdfe10e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

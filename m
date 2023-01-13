Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE68CC61DB3
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Jan 2023 14:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241591AbjAMOCC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Jan 2023 09:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241622AbjAMOBX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2023 09:01:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4837E10FDF;
        Fri, 13 Jan 2023 05:58:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D890461DD3;
        Fri, 13 Jan 2023 13:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 485B4C433D2;
        Fri, 13 Jan 2023 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673618308;
        bh=9x0uUpVVYoI0r99eTM71l1XwqIGcddwEwKLzauh1dzk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=kKwXz2Cp+u92VCiIq6wXxDWfYHKsBpt7cjmgy+MI5fa5VXiYMQCTu/WAILAA2VEGh
         iUcr6BUTYoyeg4fKdrfA8esuL4uy6mfGKtpC47esG2tNUflwh1cJxVCEPk8ALtUY2B
         dQwPpcQv1Bm7uD4cD4eJDihV60CvmM8RrGPYz841AHNTreyJxbg07QHL9AosWxByCc
         NH+PkPXLiKwhw+w/ElRtsceI9V/VHiibCCxTw0id6RkF6TUC9NSgYdgnJSslDrdvPF
         bhoGpmIdJBspU9G2qvrt/TgAXYxKbJ07/Ald3y5Ziss4qfusvGzgc9EoSy1zhs4m7A
         ejXOvmfrlgvJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3449BE21EE0;
        Fri, 13 Jan 2023 13:58:28 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.2-2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <2d040d2d-4f4d-f106-49ba-317142e0ce74@redhat.com>
References: <2d040d2d-4f4d-f106-49ba-317142e0ce74@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2d040d2d-4f4d-f106-49ba-317142e0ce74@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-2
X-PR-Tracked-Commit-Id: fde5f74ccfc771941b018b5415fa9664426e10ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d0833e0399efecf3d75b54c3bc277660166d9a4
Message-Id: <167361830821.16011.5654691306196291892.pr-tracker-bot@kernel.org>
Date:   Fri, 13 Jan 2023 13:58:28 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Fri, 13 Jan 2023 12:07:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d0833e0399efecf3d75b54c3bc277660166d9a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

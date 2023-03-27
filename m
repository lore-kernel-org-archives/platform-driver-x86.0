Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46260C76195
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 16:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjC0QtT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 12:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbjC0QtS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 12:49:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1075A2D50;
        Mon, 27 Mar 2023 09:49:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 34DFB613F9;
        Mon, 27 Mar 2023 16:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98E81C433EF;
        Mon, 27 Mar 2023 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679935754;
        bh=Z5G4zBQAfu8UsonVpLl7BFpKgAAeuVH84G2KBt4EmP0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=LL6H3WsLHsDd1i7eZpwghYs5fTOVRoStb3djXeFvnm8vydEfizn4+R7v6Xgzkhk9z
         9eWtP/k4HcTHoMbd2sjvzxk2cPlz46pwzs/LV/ewz3KmVDeYV6/QNs5m/eyMlG/Imu
         MMm8jRXy9MK2onvkb4YzdvpjW7QRdd4HJp7jlheioPkYsM9oZzEcf6V0fM+hWo8SjU
         Dal4fd09kCNX7oWVXLFbKwbksXBCyCnMsEtO+yqfGtZRSgVVmBDG2jr8tsqG/LMvZ0
         1OYcfo0T7sPxeWIo4PB5EpaPnYOmCH2cuqB1XVxBxgepW30x+93k8H93t2Z23f3UZg
         FlDX45d9LKxIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 87235C41612;
        Mon, 27 Mar 2023 16:49:14 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.3-3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <faa15528-9143-7f60-f534-c59f2f6c1ebe@redhat.com>
References: <faa15528-9143-7f60-f534-c59f2f6c1ebe@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <faa15528-9143-7f60-f534-c59f2f6c1ebe@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.3-3
X-PR-Tracked-Commit-Id: acd0acb802b90f88d19ad4337183e44fd0f77c50
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91fe204578ba3183cc32984a613bd539b3670507
Message-Id: <167993575454.25802.8029967231918742728.pr-tracker-bot@kernel.org>
Date:   Mon, 27 Mar 2023 16:49:14 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Mon, 27 Mar 2023 13:28:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91fe204578ba3183cc32984a613bd539b3670507

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

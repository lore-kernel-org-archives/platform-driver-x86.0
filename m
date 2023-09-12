Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD9EEE3F0D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Sep 2023 18:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236494AbjILS7S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Sep 2023 14:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237510AbjILS7R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Sep 2023 14:59:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9EF12E;
        Tue, 12 Sep 2023 11:59:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 071CDC433C8;
        Tue, 12 Sep 2023 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694545153;
        bh=46+8mud3tuYhL6Ai1UkoeYqRFGVX+zodAlJDH9AulEM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=DdzL8EKBCEenxFCNHpHXWFExO22DF75JP08mlRab1yOBHcyd1rmdAvarEF//cuTvz
         giEekbRNDOhv0QVBe+v9wciZ0AyXkWoOTj/W/qqC4TGPjjhjgXsJa5a2IPajklSemM
         qWI7LJkYmpVahoEwRahdrwTWLr5XaTBK00ZltZ0s3wG7b1Awx1wYZnUGEJFQYq40xd
         N+kNDWzKGvYXrWe0U/vhTzoGgxMzUeL1eG0YlRX4teUe/obSHolIVgntWfj6ELBdSP
         LH37dSMPqYuRPnJ3s8T/T91v7/UgmBLNQUVwblQBHaHnnNWBjwu/9FOEUrh1xr5gRa
         h3qQmbsi7ByUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7A1FC04DD9;
        Tue, 12 Sep 2023 18:59:12 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.6-2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <8474aa33-e3aa-1729-2a66-715c9f883c04@redhat.com>
References: <8474aa33-e3aa-1729-2a66-715c9f883c04@redhat.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <8474aa33-e3aa-1729-2a66-715c9f883c04@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.6-2
X-PR-Tracked-Commit-Id: 4106a70ddad57ee6d8f98b81d6f036740c72762b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c758cef66865310b59959679dbd5d450174d15d
Message-Id: <169454515294.18467.6387816807987219839.pr-tracker-bot@kernel.org>
Date:   Tue, 12 Sep 2023 18:59:12 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Tue, 12 Sep 2023 10:14:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.6-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c758cef66865310b59959679dbd5d450174d15d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

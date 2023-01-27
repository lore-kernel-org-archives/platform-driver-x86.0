Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC03C38142
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Jan 2023 20:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbjA0UmP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Jan 2023 15:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233413AbjA0UmA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Jan 2023 15:42:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD9A7E6BB;
        Fri, 27 Jan 2023 12:41:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 473C9B821F1;
        Fri, 27 Jan 2023 20:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5075C433D2;
        Fri, 27 Jan 2023 20:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674852047;
        bh=gTQLS4ReNgKhHMUFilDECgdSGDa9JjxO1ZWH9JirkTY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=YSL2QMlApTiH8BpA0RVgqPLQ+cdnmAPr4sOpn8sjcOPEAeNngX3UCbYXdETi3Cw+K
         gA4gO24t2uaBJn7K8iDBaYiZsfr5Bsph2cTT5zhe2DEvcP6CEDBXy1g9BNsN8yBFFF
         HWz6plWFmzmJph+OehwfP1XAS4VffxY5xPNALji/gaFXmma5H4FQYbq2PyloNlbBNx
         8BMAcwruPPt0Z1EGFml71uKB5S3Qg/upLoEhxLO4ofQte360jQUF3mUvwkV5D2E87F
         THI6KTHPdJP+H1FcQ7mg8i3leLwi7pXn51LYAobwgI9WY3ky0lVFC6fkrdmsZk7oGl
         2TC3ZQDZnNR7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C866FE52504;
        Fri, 27 Jan 2023 20:40:47 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.2-3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <4d44b351-d4bf-56dd-952b-97a70687fb68@redhat.com>
References: <4d44b351-d4bf-56dd-952b-97a70687fb68@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <4d44b351-d4bf-56dd-952b-97a70687fb68@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-3
X-PR-Tracked-Commit-Id: 1bc5d819f0b9784043ea08570e1b21107aa35739
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 83abd4d4c4be8984ba5a3a813ccfedba79c7d6ad
Message-Id: <167485204781.30356.12505576700828372422.pr-tracker-bot@kernel.org>
Date:   Fri, 27 Jan 2023 20:40:47 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Thu, 26 Jan 2023 14:59:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/83abd4d4c4be8984ba5a3a813ccfedba79c7d6ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

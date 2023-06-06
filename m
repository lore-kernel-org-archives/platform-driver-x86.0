Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACE5C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jun 2023 13:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238179AbjFFNWq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jun 2023 09:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238202AbjFFNWj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jun 2023 09:22:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D690012F;
        Tue,  6 Jun 2023 06:22:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68D4563328;
        Tue,  6 Jun 2023 13:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA450C433EF;
        Tue,  6 Jun 2023 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686057756;
        bh=f/B8iHr2mSa6qgim0GrC6uteqpM87+oCSmgtHaNNIO0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=bsWSudUrnqvO8u66DUdRjwQ6NeAbsefnCx8mKxmH9uWML8kDdE3RmNJHHgr7Uaws9
         GPbxlbRR2AsyINdx9bOqCZR7lIHCLVxQG1V5SOphHa2bbRa+ASC3jyj70aaXydqxfF
         ilKp21DpkQzKFLlpao8oPivoOVanm+AwHyHR3m/azJnUMK3yibd4N1EWbtHf21srNy
         pZm8T7zvX777DlLBxVvRLZu0mZIDHbEu3hWBx04hdNpkOSmfnB8rFruvZc1ZPBrz+8
         Wc5JSHzx4W9KOakYm6qaxOSOmNsZIqUuLNVoOo16IoMEAqxoE9BFOAGOSjCAkqPoA+
         fawyAZ5GNsqEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6EC5C4166F;
        Tue,  6 Jun 2023 13:22:36 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.4-3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <0614c271-1786-c032-a888-26c9f9ae5a70@redhat.com>
References: <0614c271-1786-c032-a888-26c9f9ae5a70@redhat.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <0614c271-1786-c032-a888-26c9f9ae5a70@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.4-4
X-PR-Tracked-Commit-Id: fb109fba728407fa4a84d659b5cb87cd8399d7b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 846b065da6460a4ac9d927e5511ce24901bf43ad
Message-Id: <168605775674.13551.4954484838932493292.pr-tracker-bot@kernel.org>
Date:   Tue, 06 Jun 2023 13:22:36 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Tue, 6 Jun 2023 10:41:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.4-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/846b065da6460a4ac9d927e5511ce24901bf43ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43039C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 17:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A12D6104F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 17:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhG1RsG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 13:48:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229603AbhG1RsF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 13:48:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1101C60BD3;
        Wed, 28 Jul 2021 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627494484;
        bh=zJNVgN+xahnnWGgOOWDc5c7Gu7lpHDGbq3pJpEEs838=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=lfI5iu+2wBXJcaThViLxr7hsM2098jam8AzzdmEYynoFOxp8HZo5+e6dCRpHe45TB
         WOv+yNw3ij9a8uSWiXq4DmkeuGNL5w0IxKblWFoliYQBMc05qT81hZPami/B7bULAe
         idXd07XtQTtFJnkksK//diIXlWBK7bE247wiX6KC7lxu3Wu5Z7zR//B9ChR8dntMhu
         eZblUM9hMuo86EZhI9sphKYRaGTsCj8Bo+H8RrlaWuj7wnnW0Hk9vrktV479Q32NAT
         XfSRvnD2yVWVwtKm36WYjZtt40mLDKhK/9uPHjS6qnYds5zJka+34vUjKQ9GlK8E/Z
         J784ebuXhtjIQ==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.14-2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <093f84b2-d058-40f1-e888-1cafe1846b12@redhat.com>
References: <093f84b2-d058-40f1-e888-1cafe1846b12@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <093f84b2-d058-40f1-e888-1cafe1846b12@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-2
X-PR-Tracked-Commit-Id: 2b2c66f607d00d17f879c0d946d44340bfbdc501
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dfe495362c9b27e48a2b2ca81aed0ea754762b23
Message-Id: <162749448394.17712.17332927825584892402.pr-tracker-bot@kernel.org>
Date:   Wed, 28 Jul 2021 17:48:03 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Wed, 28 Jul 2021 12:34:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dfe495362c9b27e48a2b2ca81aed0ea754762b23

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

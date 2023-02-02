Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0BEC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Feb 2023 21:04:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbjBBVEw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Feb 2023 16:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjBBVEv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Feb 2023 16:04:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2808F244AD;
        Thu,  2 Feb 2023 13:04:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B644761CB0;
        Thu,  2 Feb 2023 21:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 270F9C433EF;
        Thu,  2 Feb 2023 21:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675371890;
        bh=kSwZ2DyV687SPcNZ46S0CjZ3eD9kTFUvo4ylxlnr5NM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=E/Kn2qOs6Ww6HK12BRyQ4GIxYDxGhW92c9yBlh5d0dMhgP0xOviY7oWtXfCQ5A2YL
         L1y5cAWjEyy6ioTPI9EjGrIskA3LeSdweO+Tw4C8YFnj+SLNuh6iLVEOy818bvkj05
         XdsjtigGdbHMR3U3rHZS6LxYSgEizSAx02YIHrkvqqInGmRL0vf/Prmy0inrC7iJhU
         3hIyP9Vy9D8T+EgbvTepDMe6QQgu3dNOiZAEmPP16o6i8l2uhs+uYodeYNl0r7HQPE
         yMdO/vGUoi2p84eZI7UCandoveVN428ZK2ONm9c1JrIeSKNyvAfsnrXbexIWGsz9iG
         0Jev6xWYowoaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 157D7C0C40E;
        Thu,  2 Feb 2023 21:04:50 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.2-4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <21c96b2f-92bb-5ba8-c08f-e6df1db4a4df@redhat.com>
References: <21c96b2f-92bb-5ba8-c08f-e6df1db4a4df@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <21c96b2f-92bb-5ba8-c08f-e6df1db4a4df@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-4
X-PR-Tracked-Commit-Id: eecf2acd4a580e9364e5087daf0effca60a240b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 870bb7656ab247c000e9627e0da0db7ef8e9cf0c
Message-Id: <167537189008.3773.1462899791079245373.pr-tracker-bot@kernel.org>
Date:   Thu, 02 Feb 2023 21:04:50 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Thu, 2 Feb 2023 11:41:38 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/870bb7656ab247c000e9627e0da0db7ef8e9cf0c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

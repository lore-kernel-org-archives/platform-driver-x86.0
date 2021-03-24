Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5980AC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Mar 2021 18:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17CA161A17
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Mar 2021 18:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237628AbhCXSiY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Mar 2021 14:38:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:48064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237391AbhCXSiC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Mar 2021 14:38:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9AE3961A10;
        Wed, 24 Mar 2021 18:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616611082;
        bh=jVO1YJhcVrdYWOSRQz7KcFSHD28gMoItaW4VMT/MIRM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=J5JIktUZe1uNaLhpu7wA/Olr3lEjAur67mR9s2jEgrhWv3RU26HfNVelcGtYMNSFB
         Y4CELFUBTsvRY2QJLYeTxt15HZJGE1kcNMfScHLybEW25WiABPWJRoYL3RAfRn1UFo
         xUH/kOJrRzP4PsDjfTOAvcvmdMOSUlXUiYIw7vCxPFpnychc43kQ/FjG9YstPNXBsL
         AMlCf6D59EezUdDC0oOPFqefxwpntvHSAg1IohfJIiaAwEgYPXJTLUeVKclNRuGp0t
         ENeW47g0TTW4mlAHMqcsq46AlL5a2YhrFAoZ0olH3qqkf0w53lTKtv8FLbQmCHxkhJ
         l9J2A9RKLGYIA==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.12-2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <a741efb3-a20e-1ed7-91eb-b2a710a87d72@redhat.com>
References: <a741efb3-a20e-1ed7-91eb-b2a710a87d72@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <a741efb3-a20e-1ed7-91eb-b2a710a87d72@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.12-2
X-PR-Tracked-Commit-Id: d1635448f1105e549b4041aab930dbc6945fc635
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a0a4df6a9e406939b3d3218ebd30c8862343d199
Message-Id: <161661108261.26767.1421516303028846181.pr-tracker-bot@kernel.org>
Date:   Wed, 24 Mar 2021 18:38:02 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Wed, 24 Mar 2021 17:52:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a0a4df6a9e406939b3d3218ebd30c8862343d199

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B64C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 22:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21A33613C8
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 22:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhFIWc0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 18:32:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230321AbhFIWcS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 18:32:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 42EC8613C8;
        Wed,  9 Jun 2021 22:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623277823;
        bh=d4wl5oy5glkmCERcc9C0gNbaVsqxZJ8npPGIBx5vpMw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ZeifUONOMkZ/pDttPmBo7y8pSCZ61P9sKU34w+mfsvGnv0AN68SD5yq3gFp+ndHR0
         //PvF8kj6Is22pDxhyBBZwUuz6dgXKyXPj2wqJ/jPuXuFM0L4Fa2XLSK1CXbzMD+cv
         Hta0fl/GycmCRdvJkCBlZFeg36JF2WO/Ra+cHWmBgTrDntR3TH6WH9KzkHKTWiMPGC
         6oQ+dpEMrQvB9nX81neWaq5z7NyUp5hVkaqSdytQeuJcGZswc90ceIsBj4YANKiCbZ
         SCdnw1JZT5h9KFE79oojpUaC0rK6/njSBdQsponRKjXRUgG3yBWEzUcOSmHhal7D5r
         oHNoZEJJTgIYQ==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.13-3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <f389f824-2a3f-e0fb-2120-7bfa0baf7bb1@redhat.com>
References: <f389f824-2a3f-e0fb-2120-7bfa0baf7bb1@redhat.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <f389f824-2a3f-e0fb-2120-7bfa0baf7bb1@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.13-3
X-PR-Tracked-Commit-Id: 701b54bcb7d0d72ee3f032afc900608708409be0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd1245d75ce93b8fd206f4b34eb58bcfe156d5e9
Message-Id: <162327782322.21155.6326148661175011879.pr-tracker-bot@kernel.org>
Date:   Wed, 09 Jun 2021 22:30:23 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Wed, 9 Jun 2021 19:23:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.13-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd1245d75ce93b8fd206f4b34eb58bcfe156d5e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AFFC4320A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 21:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 126AD60E76
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 21:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235628AbhHSVCg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Aug 2021 17:02:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235429AbhHSVCf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 17:02:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D67A36108E;
        Thu, 19 Aug 2021 21:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629406918;
        bh=x0x/4H/rYRswW9kt5kIosil99IC/TVKjXM+G9KmjS98=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=rjQ7u+trZ8IL26wIkye64nKZj3YRMSty6y7qU6HiEOpxfhjuOQ8XPGxVgZf9ziNEo
         9EwNkEw9BBCQ5Csx1U0EoI88OflWv3803hgMzMlt7rftG1+AzOelScZqI0soUcmh6F
         pw39Qxy7GKR5dK06nalsdvEbULn5qpc1f1kb8R4Qw7lBZh5InAH/4MC7NZstaCF/Tf
         WSipxpd1V6BvlXLlw6AQz1ca9ktzfRg7zqCgSd5GNIM0zoSXH6c4T1GEs7oYTOykGU
         DOM+ElnvSPywa/Hrxy2l7kCNEruDR43dldMYdES7k4SvCZ2kEe4+urQiStVoAkhPvv
         k3dYgQgMRMaJA==
Subject: Re: [GIT PULL] platform-drivers-x86 for 5.14-4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <2c41a5a1-f773-06c5-71ab-05537cb276b0@redhat.com>
References: <2c41a5a1-f773-06c5-71ab-05537cb276b0@redhat.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <2c41a5a1-f773-06c5-71ab-05537cb276b0@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-4
X-PR-Tracked-Commit-Id: 1e35b8a7780a0c043cc5389420f069b69343f5d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e649e4c806b4ee41120bc51ee6698e87b3edc1fc
Message-Id: <162940691884.11714.12956903838959578715.pr-tracker-bot@kernel.org>
Date:   Thu, 19 Aug 2021 21:01:58 +0000
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pull request you sent on Thu, 19 Aug 2021 09:36:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e649e4c806b4ee41120bc51ee6698e87b3edc1fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4736F8F1;
	Fri, 22 May 2026 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779493449; cv=none; b=iRpFW11NOpHRlXoArNsaIPaV/R7BTx6WHeJrOaYvm1CvMDm2bdJReNNtfUUKx/u5EAkJf5IwmZCA0ZYgUAwapdG3DHZ5xiYKXsOOZatrzTKdi98fkSB/YYm+EL/L42YQL8+z9qyaFKfpzkyQmuWC+Bq98lxjB2t4hLMENnQv+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779493449; c=relaxed/simple;
	bh=gMRbZn5YkOfUX9WiHxsg2FvoNFAg0DQ5Zvr1vBHSwIs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bYZJI994bJYUcADoBp2Wde3cy8Lzcv0uwNZserA8w1Q/Sp6VNuoZl5shMeewDdl6dlRohvSEMvYZEF1guI5WJIduNIIqKoNb9r/FCWPmnbM92wlxKkiyeAm4exCPhGwBHUO1QnAjovvBkztJPmNmf1y5KOM+woVGxTk5iNUGPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVbfEKlj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVbfEKlj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371B61F000E9;
	Fri, 22 May 2026 23:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779493448;
	bh=jP5/pBWNqzsPu89+rlYiKGEGCDCznhrplVXEfyh85dw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bVbfEKlj3HGNqood5THEGejHy83H700Us4Yerr/ghNJJrCoDehrbsEnDTYhRntMku
	 f1/ada/z3nTfyFuTfKUychxSGxZhcJoMaM1BvDHEoqwBHUEJStnGVYWelhJsPHoTKj
	 BeFF/5D93dgRHXpmHdVgSVROkYjSmSxrljtCjEKa9VIw6tY9Pyou/v/0dKcfX1phpt
	 /NB86gEpOjRC3n3tBAVnca3IDjO6LRY5YKULF2EKRLpux9TfsTo8eWUwgAgQkqvT3g
	 H8BhaMDC5N97AqiuZ6sLg5l5X0OdNHC3dsqfUBysKCHJ6ffwj/kSBAQnKfspJ1uKa0
	 FrhRtMbf+ASCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BB4393100F;
	Fri, 22 May 2026 23:44:18 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.1-4
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260522155600-202866129@linux.intel.com>
References: <pdx86-pr-20260522155600-202866129@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260522155600-202866129@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-4
X-PR-Tracked-Commit-Id: 654ddf855bebd8d45a6e707f5dc2344921f5e0cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59825bc9ce06281224c15c51ec535bf339112d8c
Message-Id: <177949345683.1408813.13200399583149146675.pr-tracker-bot@kernel.org>
Date: Fri, 22 May 2026 23:44:16 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 22 May 2026 15:56:00 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59825bc9ce06281224c15c51ec535bf339112d8c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

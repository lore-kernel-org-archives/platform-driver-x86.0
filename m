Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C442FB97D;
	Tue, 23 Jun 2026 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229252; cv=none; b=elcdDzCNTyEiSCZJMbs/mIcw+eHzs4wJYxM226IScDhPPpHlXLANNhgdNgcTx/U2owgSeXOpS/ab2wbG9SLjBdbkl/cHFkRacSaJ0G9AD7X6hWWYeLqjYfDXpg9Mi8YsqNTRLlg2jADq37xVLrIPwgJAktFu2BHM9yst5T41yhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229252; c=relaxed/simple;
	bh=GkEqm1hUpFjy7RURXKWok3egrCegaJ7FcQnyVUhhRvk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pDRkkS1LTBRW4BQs3hiKGKvXSrDR65LRbCokrZAw7JvOudI8agbj21j5iCCWOrpBHn+2ACr0bxM7T9ZKrlEUldkfu8u6dk1RlCfMLinpo9lLDmiLpmRPA7a4r+v8hZAC2UAaOU4ZpTHytN2ERTCTnbxCHZE8WUsHFetk6vLoL9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLBZJUFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLBZJUFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFFF1F00A3A;
	Tue, 23 Jun 2026 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782229251;
	bh=E6GULu612+S7kcZlQXegSdut98ZWUbn+xLHAW8gnVgc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KLBZJUFFNR5WP8ztzAbNG0BXFlprwR1C3FsYFzdNtYj+hCDshD4Sf6s8+pFFTgqGc
	 U5NDiwTDqk9+MudPwWdibgGlkPuJjcQLJbaRnua8FIcE4wTbLBUHHXl5nhbXh7ILsi
	 GvtZotKxbQToCi37CQtPRc+6ZwUv+ISYaO1tkDt21mxJeOnPj4kyNbdARdYiEvFkA2
	 iY50NuLyJxygJCOcOd08kd2ywnGWkm6iMXscBb6nmH3yoLxyg7IgrygJYB/I+R84MV
	 qUM4GEKzqwV2QpzcH2xjGw0InMq9X/Lj01CQsjxCbE6GZaU3nGY96za6mq2SiKeWmb
	 r1hP6KtowLMlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D169D3930E58;
	Tue, 23 Jun 2026 15:40:41 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.2-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260622211510-2801419545@linux.intel.com>
References: <pdx86-pr-20260622211510-2801419545@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260622211510-2801419545@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-1
X-PR-Tracked-Commit-Id: 50022e56dc89fbf1ec22826edf03dc2e5b9076cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f31c00c377ccf07c85442712f7c940a855cb3371
Message-Id: <178222924043.2291728.17549640606782711798.pr-tracker-bot@kernel.org>
Date: Tue, 23 Jun 2026 15:40:40 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 22 Jun 2026 21:15:10 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f31c00c377ccf07c85442712f7c940a855cb3371

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

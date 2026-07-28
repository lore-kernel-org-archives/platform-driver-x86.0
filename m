Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8731C3F074A;
	Tue, 28 Jul 2026 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272209; cv=none; b=VA4BtCMGBniIgE2/3ebLri/+Pu5b9n4fBkdB9/5B0/BJew7eDNrkJBqor8EmShJo+rXxG47h3taSISFdWWtC6hyd7esSEZhBHcSrckAdDJl/1L6GV43Uk+gZ4l3SCWbgYrlVZbMElmMGHSaU+GDM/hPoiRlXNEqwixzyakiE7/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272209; c=relaxed/simple;
	bh=Nr5z73Ogk90B1OkfAMm+RKN6buS52ipUwwYTg3eXha4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=A3Zzx+9l00NtJZgSlMEfIioL2URDLuCS8/MvUiyR5RyF5d+1m3C0ZanLJSm9+s+g2pA/L+K6rHa4dcSgUznuiivK/EbOXCvHehPDyGo9rH0Nbqtiz5xjOlAapMBp25D9UZRspXEZmlEl5vTcbWJULhNHFvlP6/H6Nv7LJ/ER65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h221HYpy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h221HYpy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7A51F000E9;
	Tue, 28 Jul 2026 20:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785272208;
	bh=D6RbfDo1IWrlu1+YnHkzYsnNGqaFE5Fk4i2RV6OFeC8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h221HYpy/if2F1sCOUudIDogZkB/KhDQk3Q2bpSMOcnxuLH3Kwvh/YrvK5pOhoCqI
	 f1Kj7sPFoshqZj3cbADVxYmrpIt+h5s1AzCZjwmKN489UpArx5BnUSeyj4pdPuRvyk
	 wF2ZLy+i7QtHz513geYYJsqiXgOhJi7Y/tO/WQ7oiSxkQ8Fg2UkkMz/htg1cgWOGFz
	 /67yvyNj1FBbsAJ7pcoTv5HsXzkPlQGdjvIVsT+oLzF+eIZMGjtCJEPvp4O7R6jPRq
	 QiUXdSuucBwtuUm2+epJf26axt6ZjZCaq2YrKUu8KwfOOsKc4RBADeyMaKHxGa8SxV
	 L2PsolQ9sSO9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568FC3924A45;
	Tue, 28 Jul 2026 20:56:14 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.2-4
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260728232515-162813849@linux.intel.com>
References: <pdx86-pr-20260728232515-162813849@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260728232515-162813849@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-4
X-PR-Tracked-Commit-Id: 39490ec6063d9dc3d995b7b48fc5106cd361a547
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
Message-Id: <178527217278.2323928.2120920224807542257.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jul 2026 20:56:12 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 28 Jul 2026 23:25:15 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc02acf6ac0ccde0c805c2daa9148683cdd01ba8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

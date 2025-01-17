Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93941DEFE2;
	Fri, 17 Jan 2025 23:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157517; cv=none; b=HEsA4zxodFGlNmgbY7rslqzmwdg+/RFRHtWPXOjxnEosiEYD9LGunYzFtLCzkSCTRSIpdoSV2YDMwW9uuD1ccfHS+HbNMmTmL8prLQfJrTkYHKeY94klVcTkzCGU9/zILcbF6kdd+CuOTZR6HR1Xn04L/n3U7gRHsjeqvavGuic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157517; c=relaxed/simple;
	bh=SMydXEKiZj2hF7xaOPmhacz9w3RQX27zKrRHy3zkGHI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lOinmeGtYvhrekIYqS2Y9f2s+nRZa+k0kS08bcmK9OFco1cz4KPcIUgXXNYcm4jKAWXuL3O9cw3KMeEpljfJL0ydoGEZ6IAldWSLX7KEHIeN7weikhPTG2Jcw/uJZfW2HbOVFMNqkWpomdWX0IUHCy24w2VdIvFs/EK6mqRfzWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9XlLJ5o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9XlLJ5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EDAC4CEDD;
	Fri, 17 Jan 2025 23:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737157517;
	bh=SMydXEKiZj2hF7xaOPmhacz9w3RQX27zKrRHy3zkGHI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=X9XlLJ5o5G6+p6JNyUlU3Rj1zw08LEwN86KKjfsnIeW32SYwSRUCNskgNRoewn+CD
	 E5UJEP9n+1IMUJ2QCh5ozW0AZV0Wo3S6Z+o4wSShWnQGqeNyqoVSvHjEUFNybptCi6
	 dyxJ54WZM5jF3djPQl45zv2hzuthOw7s8wUeXt5i7u56aXZv6mddHZXvLdgZpfjhIh
	 OKSSM7RS1za10V4PHVLtOVtXch9Eddab6tMCx4dFNHmYRBU0QbB51vhJHCK96mRChC
	 +kiiuH0ExYtpY+BiD2QcMgamgjOpNBUAx4kNn3x/1YFCRRn4Y+7UnVVE2g5GEr7Zph
	 EA5Og14O+CDVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3435F380AA62;
	Fri, 17 Jan 2025 23:45:42 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.13-6
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250117173824-132461248@linux.intel.com>
References: <pdx86-pr-20250117173824-132461248@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250117173824-132461248@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-6
X-PR-Tracked-Commit-Id: 59616a91e5e74833b2008b56c66879857c616006
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 775a15eaf71d8624024ad91b719ba47d4b04cd2b
Message-Id: <173715754081.2291664.16427638512696248183.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 23:45:40 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 Jan 2025 17:38:24 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/775a15eaf71d8624024ad91b719ba47d4b04cd2b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

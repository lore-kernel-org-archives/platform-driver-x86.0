Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D3246764;
	Sat,  4 Oct 2025 23:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759621332; cv=none; b=cZ5hLja8TmE3tB6jmQkXg1/BdvHA+1Zm8WBekoY0XriyvOPEgxp2796UiwF4ZrdiWi6LWFSXNP8n9oPXeO5bYsLyBYNLAB/9kheuS1CJsvy5ZOIJdR69/5BtcjrEwvWpy/A9xv0QrFI9tamEHefsnbIEXYzWPRVbkeb75XCA/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759621332; c=relaxed/simple;
	bh=DKXJRpkJwtQaczG9ytNFI6DdRBzBLVui0x0fi+jR//g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SvvscX8duulovMs0B1B+B9hlihHdQEN/wmkzQTbs2NGQPi2GW4viKb7PHlLD7U8aOtl7xsN3LB4/keSwpk7cMTmQVMVyGeZBJx5EiGT6PxT2AAdfuI1V/X+L20AyswHyKDOuuPG27unZqXYfS/xQKZQhg3l4UtIcq77nId0+UNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxouoU1l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxouoU1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156BCC4CEF1;
	Sat,  4 Oct 2025 23:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759621332;
	bh=DKXJRpkJwtQaczG9ytNFI6DdRBzBLVui0x0fi+jR//g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VxouoU1l0BiF0X4YTIHOByUCRk/T+TmD1YlgsCEWlUNzFIqa3tgEeB243sfULkcOO
	 7/W65koFO7sa50CbIPCi/exY3QG3fJSLvfXZD/t8tJ80XddnaKdkCJ7KQWn7De7WUS
	 htRQ0lYz8tkcPcm/mAKdlUCsd2T1BzIZlKAgdRLmVVtJb+rZxPg9ELO8zHVBwPO9Is
	 tpdhd82LnCINBijy3mp2ZGdc6XG/vg/cp+2k/tgAy95YNtyKLZoeOM2b8t012GZ3av
	 wPM6bxgVF8wMGhVhf6+PPAfWnPBXAxoy7OEMYZtgK7SmVLsmZu57rCcqIji4eo3npv
	 0Z/Y9RU/jtHbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C4E1839D0C1B;
	Sat,  4 Oct 2025 23:42:03 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.18-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250930141325-34954370@linux.intel.com>
References: <pdx86-pr-20250930141325-34954370@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250930141325-34954370@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.18-1
X-PR-Tracked-Commit-Id: b8754092dfed4fc2fcdb0de32a029ba8f9b464b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b66451723c45b791fd2824d1b8f62fe498989e23
Message-Id: <175962132258.472872.11163387307604053057.pr-tracker-bot@kernel.org>
Date: Sat, 04 Oct 2025 23:42:02 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 30 Sep 2025 14:13:25 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b66451723c45b791fd2824d1b8f62fe498989e23

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

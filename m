Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68DA5A5132;
	Fri, 11 Sep 2026 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158357; cv=none; b=BIU4JQUUdpK2bw4mcPihbqekl/9KetxzO+ZEMSqZc+gaiqAwAgmbO5wCk0Qgg5xG+KFcgD+epPFoIKxKIOBIm1AN42M1be0kSXDFVjboL6tr9SQfUIrKKaC6IxCt6aZVHja3gjD6H+UGYsOqmNcfugzMJzRLOvkxwL99N8t9Jg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158357; c=relaxed/simple;
	bh=6TwWv2XO8LyJXmGntkz0wNUrSJPv+7uE+G5a8NWsOVw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hSsxGZU4muL+bUTqlS9+DGrd3nIgTs7BrLlM1+foWioRGPwEKEsjGxXdJHMvAv66PSxKl7FRFUw3EeW7KGaqO2bWc4LaU/ms8yfTMrvTNJgBWrFKLLpXh52EVy6PHyMTGHLNLjtp8ZIRo+dmTMnzB7RK83UalFqj7bAsjLQ2BqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgagxFJL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgagxFJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D0E1F000FF;
	Fri, 11 Sep 2026 20:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789158347;
	bh=3faQ76qNn7O6GnDutYwY3kYS1Pky1nKc9G2sWj2jD1o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dgagxFJLZqxniMLswUHC5IQtF+CtSA8H0ragCIgSzEKRH3MuZ2X6+D7RMRpWaZ+1l
	 hTWXTthzWUB6p7FIEad2h5N7WonFsF8dAChZ/gnYiM+ZvsgPMFxgWCf1RJLJGlKPVo
	 cuLpSoBzvGzfqiL9olg4N3HXbL7xedjwMtTuxMzjF9/UryQqfPdq3E9hY7kMO+CaNY
	 ftYFXS+395p1sZ8QMx6Z/0xy44aQuRNG1s/RwVyyFyMKpzAhzvJhtRIybf9seG0H0m
	 kLbo4k6o/416vtcJWWWX9y3Ch8b8XUPhR88b6EOnJSpCawxmqArS5c1B1SAJOlahRR
	 /BldhG9epNDuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C4C3924451;
	Fri, 11 Sep 2026 20:24:45 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.3-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260911130248-2488210644@linux.intel.com>
References: <pdx86-pr-20260911130248-2488210644@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260911130248-2488210644@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.3-2
X-PR-Tracked-Commit-Id: d144a494d81fcf2d1c5cf58b01c655bb8bafc701
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1235ff329981ecde9ccbf49b83bd4d71e827d541
Message-Id: <178915828442.3095760.14319678150047728174.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 20:24:44 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Sep 2026 13:02:48 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1235ff329981ecde9ccbf49b83bd4d71e827d541

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

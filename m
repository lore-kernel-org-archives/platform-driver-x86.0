Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D32466B6C;
	Thu,  7 May 2026 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170014; cv=none; b=YBQnEUC2iKQ9M+o237M8S93CichykcPsAVEwCzMa4E+0LORhDSVk4Otjd/HP/5brjPgZCnZrDGzjgm/l4xRZPV5XrmSfLw9vhQNzJgm0+lqoKfynoAIOQsvlBI48xPGZ3cHUoAtCQ7qRqIxvdGqYUWjDOfxXYO5R8zCwgRd9bEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170014; c=relaxed/simple;
	bh=g0cJ2o6yc9Cg1jCGA76fiiXh0QksUPYOCRRff59NKo0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=o+dSg5VjTTn5Pdh/Gxt2HNGM/42vgO2bJtoO+W4lz9sd6peRWZ6HEcQIk344jQY6Xa9Vo+zNQjxmsevRhw6ooTluDubRi2SYMuE02CJwLSuisg+TJKuTYPLpfGqsOk+V2OznHui5qzFU6NFk5jWn2yZlAY3kRSwXOSA2I7KICNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUDM5BG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUDM5BG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51984C2BCB2;
	Thu,  7 May 2026 16:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170014;
	bh=g0cJ2o6yc9Cg1jCGA76fiiXh0QksUPYOCRRff59NKo0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jUDM5BG8IyBL7Y7muXh3f7c+z41i5pAsr6N+gxuCSWAMG4exYCJXLF+szqogsyYu/
	 JezKWA7nT35GwaSXFChuW02kmrB+mV1G+tO1xsp3+BGatNSDfOoq67t2aVkqBegR8W
	 5/7KA6Q8oC1H/68BYJPXURvkQzSblp4DJr5O4YBdJPX0jsVJSnC4RRTZXIAK72BeM+
	 ZRrtp22lvQ77d1RmrXeNcelK4n1kEyWkbnhb6XigZHSZLKmtV9DNlgZd4H7oKgf1b7
	 Pmp5/OSuyFHnyvcGW/PZMDPwnL/sEbjVJUpa1z3HwhFye7vspYQnZfnU9z9zoPu5Yj
	 AkI3+NvzHGC2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EF13930909;
	Thu,  7 May 2026 16:06:04 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.1-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260507143343-184358751@linux.intel.com>
References: <pdx86-pr-20260507143343-184358751@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260507143343-184358751@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-2
X-PR-Tracked-Commit-Id: 863810d4985ad214f70c1623f24384ccc850f2a2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e38f888f9f070591e54c690e78f2ff8affa8881
Message-Id: <177816996336.4057089.10701367943196495306.pr-tracker-bot@kernel.org>
Date: Thu, 07 May 2026 16:06:03 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Krishna Chomal <krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 07 May 2026 14:33:43 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e38f888f9f070591e54c690e78f2ff8affa8881

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

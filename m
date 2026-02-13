Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AF03EBF2A;
	Fri, 13 Feb 2026 23:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771026778; cv=none; b=MS2GAf5ufWz4G0cVx49Oylfeh30jOZL/ni3TU4dQWnF7nfAkNxMQqRf/9FTHcuyMiAWxCbD3qsckQUiEoq/3GeNPaOKgG7rTJXaR/iGjH09u1pUxPvS5uVDOn2AXe2A/0LaBzwu2qD+Be+LxjMEF4OnRa7hWDhncIMgY5jkYN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771026778; c=relaxed/simple;
	bh=Hw5kz/SDbs8TQBhvNl+a+86FvWKcJfGNwjkk9pp6g+U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lH6NY0vjyU+XlbRIhsdvURVbSBqWT8qF3xCv1HgJivRkJN1gngYZq9kaNEcom3W/wJHXJ5dxWXtKp4cmRRA8Q1mjhjt/RB75f9jmjCg6JMou2U6g4IktN6qnsNJZgAcpBT7T6dcp5LMZh3A/cdLMtRwyZ/LQlRwT9y0X0bJfSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaSMcnrQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaSMcnrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB59C116C6;
	Fri, 13 Feb 2026 23:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771026778;
	bh=Hw5kz/SDbs8TQBhvNl+a+86FvWKcJfGNwjkk9pp6g+U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oaSMcnrQu2qtX7rNfQUiFPeBI80vg+FV+ban+SvCwbWyAHreb6dtFg1W7tQQlWANN
	 dYXmDZBbZK1YM2SL38nCdztsK6FVTasXwIzBGn6ekBTkXXBPKOtf9YXE8qQkiFO+ke
	 l9mjL9NERpJwqHFM8Tj2da/gzIGiV6iAOt+sloabJmajJMkpx/79IynQQ5z23qD87m
	 81fJHyNrc5a9tTo8iTds0j2e1zF3Zq15xh95rdC4PeCsyo0E0cDcoWcFQmgxUxvPOl
	 x9ey6J1IaBiYhf6XugHroERu+QQ3wbhEe+YWFF2PtiTcmKzQy9IVLDZPfZCW8KVliS
	 KP8IDUSzMkvNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B5213811A44;
	Fri, 13 Feb 2026 23:52:53 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.0-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260213202427-653022255@linux.intel.com>
References: <pdx86-pr-20260213202427-653022255@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260213202427-653022255@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-1
X-PR-Tracked-Commit-Id: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f50822fd8675c68d294e89bd102f7b487ca3acd3
Message-Id: <177102677171.2616894.2762748014357167760.pr-tracker-bot@kernel.org>
Date: Fri, 13 Feb 2026 23:52:51 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 13 Feb 2026 20:24:27 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f50822fd8675c68d294e89bd102f7b487ca3acd3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

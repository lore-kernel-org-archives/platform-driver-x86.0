Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A557D3BED31;
	Mon, 20 Apr 2026 19:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776712427; cv=none; b=OZRqaNTw3FMmwrGFzwnLHLpeIbXQvYaW/fc4XHpN82gP4bWOUu/8WYE1JHLGTkkc6JVQ2LUEtYFmepXiUxrHzfrhYPzzFd91qPRO9jmKTqC2HNMgjVjr8d4HJ2g5JooxSiMj5yF3reHDKkiyTmRyrU81rRjT/VlsPJmX6EXQYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776712427; c=relaxed/simple;
	bh=In6+L8LPD0K0SmNfSkrgLEEA2vpiGtN+TlhHbvP0IU4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YqwfWbwUlMlQ9GosjVIvxPxixLmr2N/CaAiZTa41J5kStyD8B1nKxpqiKdPJ7LEhs8+wFtcDqMjN875AgAYaDS0yoD8vZ2J/RFZctivJm0G0bK3E0hLhqKjpNLiGtibzMfRf8bvRmFs2EK0PySVVmNK+j3d6zArM2sue2pT2obk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crFpfACj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crFpfACj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD65C19425;
	Mon, 20 Apr 2026 19:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776712427;
	bh=In6+L8LPD0K0SmNfSkrgLEEA2vpiGtN+TlhHbvP0IU4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=crFpfACjQnlqOw++YorW6TiGdTfrSGmZW1AZHEP6Oo9PffR8XfTo2BaxqeeKg++ya
	 EXdskAl5+44Ybbye8KamG1LJ6L0PFf4KAS0SNdtHJ6aVtr+xgdsgk5cfo7ORCOzSbR
	 NIVwz3bMknrak1t9wT9ptijasYsUPOP9DJV2iJsQs11w6OxstLt1MkaAxUG/ROB35t
	 rKZKAtLQBSw+E4Ao38Cvuk9zV/HxKW3Grvxbzojgh3p7a4PKjpZx1qek2V8YcCt6v3
	 xkV4V4IXtCDauABoKk5XKV+BzXWAOl/VyRG61yoIvqayB5O6tXBZH0nXLkSK43JgHW
	 4jYsyFjzHVNvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FFF53809A22;
	Mon, 20 Apr 2026 19:13:13 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.1-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260420165856-1561211278@linux.intel.com>
References: <pdx86-pr-20260420165856-1561211278@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260420165856-1561211278@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-1
X-PR-Tracked-Commit-Id: 344bf523d441d44c75c429ea6cdcfa8f12efde4d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: da6b5aae84beb0917ecb0c9fbc71169d145397ff
Message-Id: <177671239181.1954049.2010660390080587078.pr-tracker-bot@kernel.org>
Date: Mon, 20 Apr 2026 19:13:11 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 Apr 2026 16:58:56 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/da6b5aae84beb0917ecb0c9fbc71169d145397ff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

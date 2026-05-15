Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60CF39EF2B;
	Fri, 15 May 2026 20:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875793; cv=none; b=a0D95npvPu0vVE+Sk2Iymcy4l4fFmfbt1p7fSxNI3ojjrKFIbiwfzq2Vmh8YjKx6Ua/BlrzIzTU8mnu0I9F241rtaX/87DYV51zUYur550hFOFnyDWFBxBc6TRcnLmBSZP3KLxT8l/Tve2j7eGWSsUITS6HXJHIrWZt/vekWNXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875793; c=relaxed/simple;
	bh=IYHoViSECxZmV+zlz4PhMqVaDMxjwy8lr+u/NEXQfjM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M53w3gZkQGxO1sPX0RY5bhVnBAOvIaQ/hY+uTAXzyw4u7TxMSHUr42ZUfDho01dxH5dbf7j9VWR8KgiR/ltjdjX3BWG9POJlTy4+xe3+d7MJ69rHlwKvpI67/HIPlR0ObJwtTlqJ9fSH9FV8UzVIPPWYZkLI9Qi0NgDUZeim/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ut9p7cXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ut9p7cXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9C9C2BCF5;
	Fri, 15 May 2026 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778875792;
	bh=IYHoViSECxZmV+zlz4PhMqVaDMxjwy8lr+u/NEXQfjM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ut9p7cXf/69OJDamxf/DeU9e5yIrDx11dRdn75sp2sHc6Dofri1qKRjo4vVFyZQZL
	 9tmtBlNe0kjytmkpeKMq3B7TAdl19Jm0u/Onfqn0g1S1eL5NMGoOmWFtmCd/Mvdd+W
	 Gr+JvW/DpBLyWSh+XpLIJA9jvGd4+IFgEBBAJwnBNZZ3MpdrSKY9s7NugXc+sq9LYJ
	 i6u3lG7cF39DOrgdsRMHZvl1FfEpdNN3bf4JTrWJPsF8ZLEkxwnyhgnGumuMfXPv6q
	 wJs9FoTSOWurCO0BJKf9deCQT/8ZU6SbZIKGi9hK5qOKYdp/6gA+OQWBUVqsvjFjvs
	 hkmfmzQ8MXTAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198BC3930A09;
	Fri, 15 May 2026 20:10:07 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.1-3
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260515144750-2668315946@linux.intel.com>
References: <pdx86-pr-20260515144750-2668315946@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260515144750-2668315946@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-3
X-PR-Tracked-Commit-Id: 2997606dd17729404cef9821ce66dd037b6019eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4c2cd91bff6371b58e672e8791c3bfa70c1b821f
Message-Id: <177887580608.138500.9254103831442558086.pr-tracker-bot@kernel.org>
Date: Fri, 15 May 2026 20:10:06 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 15 May 2026 14:47:50 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4c2cd91bff6371b58e672e8791c3bfa70c1b821f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

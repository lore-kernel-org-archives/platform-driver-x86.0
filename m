Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CDF3C73F6;
	Thu,  9 Apr 2026 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749179; cv=none; b=ibdhKi7hh+XmcYM5+BYDEGS6hO4eMTDqcmDaH+gk1hKOO18AcBSoUCvDqSJzW1G2Tpkz77ZpVgdoSh1ff6ap88b8OdwRXWkxpoKfKFnxYZAhiBae++i6RCRdZ45CIgdXpI8aoKuleihyD8SK7q/Mq3uWqnjJPrdQVh5PXT45rmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749179; c=relaxed/simple;
	bh=ocOiepQM0ru3PXWetk622DbEv5dQZXUA/GhjA4WQoIc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=maAIxydMO5uZNhStyTjjypQE5rg4GiZC0o930BdPIXR5D8PtJg8F3ToBScALyXYIErlXfkzrzsjQUSXDn4ADyDtFCdGodnzmImnGQ2tVOwRe9NalNe+By3yw/VOP7rK4KTxaCdmjGaj9kZXZYIsMlR56BNcwfoFDxS4BxEEd9SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWTRN5v1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWTRN5v1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582F4C4CEF7;
	Thu,  9 Apr 2026 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775749179;
	bh=ocOiepQM0ru3PXWetk622DbEv5dQZXUA/GhjA4WQoIc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EWTRN5v1f6iEF5VBVWFkEM96+ZThVkyjJ0kwcHc5b0SAt/JmgD1IC0YDk/+bwBvIp
	 a+NSbFh7NOep3PgIz8LG2BXvlcw2BKmjk3jPiSn5WjAAY2mopSasf/eUzObaVqkUhw
	 kOxGPZ5YOR6PHuWCzlQicNJMV5bjvEZG2LX9H6Oe+4fMZAG6dqljhtLgqPhNDH9WW6
	 3dswpB3RRzo5QjNLDPi+FK+nA8ar197Q0jqjoBYXezouoK3j4I//F7cqAvaAeo4UF/
	 8WYFr3CumQrrE67q7ZsUr/XamAT1hemTYiqD4d/Zs2+kMfmyvsTlmofujUL55bD21B
	 /OHMcCfqt3FFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF223930899;
	Thu,  9 Apr 2026 15:39:16 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.0-4
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260409144417-2403128410@linux.intel.com>
References: <pdx86-pr-20260409144417-2403128410@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260409144417-2403128410@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-4
X-PR-Tracked-Commit-Id: 5d486669b3db11ccc2d1b9f4e42c11c2766f35ba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: acfa7a35442571e316e1b3f391f481e2f92ac076
Message-Id: <177574915483.1617900.11257871979364338057.pr-tracker-bot@kernel.org>
Date: Thu, 09 Apr 2026 15:39:14 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 09 Apr 2026 14:44:17 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/acfa7a35442571e316e1b3f391f481e2f92ac076

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

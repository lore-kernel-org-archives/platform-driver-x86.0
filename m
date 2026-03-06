Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC711D5CFE;
	Fri,  6 Mar 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772822327; cv=none; b=B46w0548pY4VwI8CBRu2E6TczGDqkVO8mS5zmzWbcOclC+gehuPkvJPP6j1HL3UIBZdzO/nvH4/hIsTHUxyokKR6/FWLRxtpRO9XjGQbJCyFPD5U51eAWeYB7LcYzPdtbRklyvk4zuJJLm6m9tqHtx17QKehvXauqHuKH2iHRUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772822327; c=relaxed/simple;
	bh=8WBTX+TlOIyJSLAN4sLhukhQLZvjLR7wUntpALxTRrk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ltJjk0WEdW5DOkjQeLPCYN/iqgIRUVcDXWryHh0nZfknZPom0mCvoHtksEr+J5jTtKRXXWTlqoClgX3qgLGYDVKD9bMaDLs9oBIaUg3XQDvD1au76uI0j+TXVcl4i1gJ1q6DeoiCfYNtQGNZFOeBjytaxWL4f/beXO9mbH5a1rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdsshFC1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdsshFC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00647C19425;
	Fri,  6 Mar 2026 18:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772822327;
	bh=8WBTX+TlOIyJSLAN4sLhukhQLZvjLR7wUntpALxTRrk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CdsshFC1rQM65Z0osauAgbFj9WJJ4w1lpH+cg1iIixPasEsKcpMIenXPv8bYJ71o8
	 M3JDyTtgKzxrTEKGe+yMsd3FJefycJ+WJoboQMpXVFubLuwfOHhteV/vbgVqXRdM7D
	 Mu4u3OsbB90MGMkTZKPd/TaOUIOXiK9wvsg9SpTNHVM3Jh0303dmtKZHEPgWSRSdZj
	 AiZlYoOjcLFYnWUzp/noKwYQDgLUZQqTQvCoRMY5FzrKfar1HzeqVRaV3ICPbJwJnY
	 iD4n2B3nPtw5qQfNrdKiaaJQ9Fj0NfhoQw0HBucy9ESBgFesZuboWrhXx+81nlInxe
	 uE7UIKHl83ogg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D16D3808200;
	Fri,  6 Mar 2026 18:38:47 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.0-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260306143254-1591623620@linux.intel.com>
References: <pdx86-pr-20260306143254-1591623620@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260306143254-1591623620@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-2
X-PR-Tracked-Commit-Id: d1a196e0a6dcddd03748468a0e9e3100790fc85c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 54de8b835b5d3f78081ad17c964ffc7fcf771716
Message-Id: <177282232615.7628.9634011391400882873.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2026 18:38:46 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 06 Mar 2026 14:32:54 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/54de8b835b5d3f78081ad17c964ffc7fcf771716

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

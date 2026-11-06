Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932578;
	b=JcHF9x2m5cW8kSiFQ5YXMQbN86DPSJvOuVnW4PItqKtSaXlZSYcH/9ViTDnAbBVmLSyV
	 xCIWFzrJ7sAjRsTQlQJ+uApgU2jFSMAv5tYGZ3IfQFhgudUfgL3ZBha8f8IHUuDwo9VOJ
	 NH9UUPYkkGUWhQ9/okw9tX0/EEtGqlY/9Dlkdg79AsQYyCyZyL62eYUGfL0lMaUHbQNgN
	 iF3K5/5c8BAW8wjViCv5SrvxBzsfo3hAU5a9dN7KetuCjhqIn1MdeQ2r8z3Tk0qYA9xoL
	 5mJ5eKcdZtgxdqknNLf4hcK4o2hZKxFl85iWz02yDWrVUTyD3wj9D1vqAdzZNCU9UdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932578;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=jcBgtAR46gl2jf+vlHNoNjru3qa8PUHZcruVZJublq0=;
	b=x0zocHmeqazPc9grnH5TpJhy8HJkTCXKhgXP8lnqLUU8nFtc4ZGWEIAvzCa0HSySaBp2
	 iUJIbWKtrv8fzBynehA/opBDqhSFgAkpXayBCkgHvCi31iafozxOwtZiC+B67JKU4vw4d
	 ooezlsPCM79BtsWeiuLiqeiA0E6RDvr04gnPKbLLhU8HX4ty8sQi1rQsg7tMoBWNODrZV
	 zEYXUEsXbHE1yGhS6gpRrRcVKRE3hgkOhTOvf/nUXRX5n+etyrkokhxgEe+EPB1uwzejo
	 7Te14PBQYkpWI89bGpX5c2E7kYO+74pemlXJnggQZ+iLmm1SdHWUCrx/h60x9efLahg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYo8OIHr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9E1606A326;
	Fri,  6 Nov 2026 02:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYo8OIHr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE41F0089F;
	Fri,  6 Nov 2026 02:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793932578;
	bh=jcBgtAR46gl2jf+vlHNoNjru3qa8PUHZcruVZJublq0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SYo8OIHrOcSd66XbUb9pzZUWJZ9DqK0Eyip3IEV84BOSDr3OCiOFlWKC3M3vRy62R
	 1I88um9Uxi61uXz6XyVcOgeKFQmvlMcGB8+o2ujebyEEPFhVJxtFO+S6R42Kndxsp4
	 Ey6XBe8srdGLqDItXS9I4sOP6eVgzgXq2CGdoIJV/9dfcKrAONJ+CyaWjSpaC4svEK
	 NZXdYEU2/FCEMdG6nWfxGXoopq02k7nupDSC825CzDbhabFNfPb94Ql/h5Gm5gqvLn
	 3izFMuUo+JUJLUHcc8ln3ya7jfAoCAr2RRbVURlCs/xpblG3xLVxsJtNCMP8WR+utU
	 XLveo85b6kuVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5E2CC391B1BA;
	Fri,  6 Nov 2026 02:36:18 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.4-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20261105113441-239427279@linux.intel.com>
References: <pdx86-pr-20261105113441-239427279@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20261105113441-239427279@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.4-2
X-PR-Tracked-Commit-Id: 086aeca907789bd2604f16f07bfc073b19015015
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d2200551ccc3b9e444aecb59c4b53287e169266
Message-Id: <179393257693.304043.468858539573566158.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2026 02:36:16 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 05 Nov 2026 11:34:41 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d2200551ccc3b9e444aecb59c4b53287e169266

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

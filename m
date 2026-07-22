Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267042E8F8;
	Wed, 22 Jul 2026 20:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753651; cv=none; b=V+wNebQ9F4hVu0DXYnRjSO/kDCO6YrZr6hOliTnONzxpTu40mLpgKOVY2cDSpkvYXJ7HTekMwLcrkRVd1OOdyYtMs5OhNEJ2utFmlkgbO918r4cQeOgb6cac/NFmnwoRe7+RNNpPaeOy9P1+EDBkN/MU9gck1JGJgRMqP1jo2Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753651; c=relaxed/simple;
	bh=XiGB6LGU5zErqTGUawUNpmsL0g264xtBw6z5vMG5r2A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZtwzOL6xMz/UOJTciTYHGp4ZNCKel25Gc75vOqfMfIQ+QuVdzDm3jCO67S7yzXDneIlN+56IeLeOUbOnfhuekB86H7Q8g3+JDmLuehF8tlABv0zAOSvY6eBQhEJ475TrqnBkwYCo1ecxflrOrZ2AbJzlUbqqVidbvZjiHJ044Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZo0LIdZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZo0LIdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690351F000E9;
	Wed, 22 Jul 2026 20:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784753650;
	bh=KKxLqadOtpNxG8t4YOLrSeFB5OLrRtieRaXA79jj5yw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HZo0LIdZOfMolgXHS1c9mA5RUsZlWyJOZYlxohYEZcy1fiSUviPleUc1CwLGHWiPJ
	 EXMTu3P2ZduJix07CgLzEJy/XPWrlNDXdV5hGFYGrgLJ9/+M6pEuf194jN6PgZkDDC
	 OPFtqrMoYpWHck85pvZNIGygVvUlgg2UPFSNHnBi+tmYF5BxZGJqRiJKglDRPm9h7V
	 IXw05Ogq5IxeL5pLEZ92BdZBqNDWNfeKqpODxBEA94qryvrum0y2ywaTq6rutH5ZzG
	 gj0bG7B56F53G2tsQmw3eN96S6rCDW3q836TNjMZ3atoPlhIq7LgNMYqqUehUAAzkI
	 46miGCIS6K9Ow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569F8380CED4;
	Wed, 22 Jul 2026 20:53:40 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.2-3
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260722152307-1841517800@linux.intel.com>
References: <pdx86-pr-20260722152307-1841517800@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260722152307-1841517800@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-3
X-PR-Tracked-Commit-Id: 78bf392ba77dd8b2a25656e489449d2f91cfd1eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0ec222d416230e08f31c5c0042b316ef5f7e66e
Message-Id: <178475361908.2020310.14815132106046907297.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jul 2026 20:53:39 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 22 Jul 2026 15:23:07 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0ec222d416230e08f31c5c0042b316ef5f7e66e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

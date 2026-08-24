Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CA03876C6;
	Mon, 24 Aug 2026 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787599132; cv=none; b=Yi54Bs8gotZYMJiLcwSA133k2YJCSFUfGzb/MccAH1vxU9vBTuo1kqihuSQBkDoVfdAkhbsqlg9df1ibaNfFjbCRVk8M4z8tgW2WeD+UjMqy9m9Wg4KwEesKmzgzyGXQCMoZiWebHtqkRin7rBciW0K/0JT4yadiqo/QAYmSgqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787599132; c=relaxed/simple;
	bh=FDjfBKDB5b1LVkXnuFhuIpg3k5uQT4/lKASFFmK79bQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dDORxGtgaRM34aUGLv+JjNjo51Av6HYWxiSMza8kYTbSKIVUg3mCwfsoDqBmhlRA9V9M4rC9H7rQDmKFN/KM18UpwyMno8z85f5LkjiWgoSsoM+eGtSvg3GzlB+OTQUU9LXH21BLnXvuRXNa+Coo4ljuY+ZPIJ60FSYUUiinIaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0vGLP5O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0vGLP5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8031F000E9;
	Mon, 24 Aug 2026 19:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787599131;
	bh=GXG3Gx8rPfETCWrwci58bezjOCeQ6FVBb3FEjuqymP0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=K0vGLP5OWVsYxlptvp2btKNXFemTpX3HhHXVKG4E0n84Ykv2uFlG5OZ1Y/yn93pKt
	 7rYNcc6jUha6mkDDsaUT96xJJ2+Tsj0w+uApvYB4zK16LvNqSdfZesr+6NwQTXtvgR
	 6EeOqR7z8iSCMMuWU/SFLJVLuLNhVhbZFqBiezPQ+ppbWImTrpYhvv6qP+puqoVrJU
	 HDW+eCAvVRA+DTRkn+tD9sL71KAU2FwvY9tVhVT9QbvBxpzAOeh5F7O5vfkOclUuh2
	 qy9cv3B6K/1wSq/EGnOMccg2cJRF3hsfmS3DVfRKlMNNU+iHlY7X+/xQp/MXPWRmdl
	 /Uxi5AwLX/iGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0ADB3924A4C;
	Mon, 24 Aug 2026 19:17:59 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.3-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260824150636-1750022160@linux.intel.com>
References: <pdx86-pr-20260824150636-1750022160@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260824150636-1750022160@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.3-1
X-PR-Tracked-Commit-Id: 54745d563114b74f6fecebce68cd020d06c1772b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a
Message-Id: <178759907840.3075085.11456672596982798716.pr-tracker-bot@kernel.org>
Date: Mon, 24 Aug 2026 19:17:58 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Aug 2026 15:06:36 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b05bb3f6c5716fab6911e12d60dd1f43ad9806a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

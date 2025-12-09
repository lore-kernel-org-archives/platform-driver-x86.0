Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE11D27B6;
	Tue,  9 Dec 2025 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765317215; cv=none; b=IsOtzGLN1MNaizrWH8pZRjgYGo1lFZxNiSSZp6cEWYH2vjsFzFwN7l70y01PmTQWrOtbx+qbGFqolUevDt3hW2ke7m7sG+eTBIDWntABwwz3tDiHHcx8m+/HEoMLbkRtqEUrg5HHUIPA/iH4Ayq6DodyMaGIHKy0FyEtsNEhpEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765317215; c=relaxed/simple;
	bh=XOhK8m/5/+fKE4w4eOYzsvALrarXojM0EldvaJpCVeQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bwIjTrFQt2ENWtURC5eotYAfVQJ9h4RS1E7aGDUsNzGJwKjQiju6KCPbs+WM38AaBJVFhPB0Oqnk/rn0bUfgPqQdAxoDGz6uwu9FJKDtRNio62gM7Hl+nSVynYyi6c3hIEI0Gd22fdzKpHVpkSQR7OQ6vT2uqJwSHPV6vqsJEf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEys6lGR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEys6lGR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF0AC4CEF5;
	Tue,  9 Dec 2025 21:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765317215;
	bh=XOhK8m/5/+fKE4w4eOYzsvALrarXojM0EldvaJpCVeQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZEys6lGR8hjUR+7aHz2F7F3RJUfSCD/fFYketEuliRhtTDx2hB0/j+SllqwndHgVB
	 4VF1FPXgGrS9jCn5dtysbPrKlmaIqtNAJCy6Vl0xX+vfsHWNQ9YVpxvXwuFgjrTZFU
	 iuifp0DZQpIih9087YwiBPnFoLcqe2rBmThZyanhAd7mVZlLe+3x/UZ+bxpP2E3CUK
	 8Eh8UuQQiNfp+gulFErUMe8Vo4ngbydvcYTAgtTeB6pxmn8JL+RKK9KwJWG1UbFrK1
	 VDU59bGMn9BtANd8H1XBi1BlZH0V9bKK9rkoOhwPSkqIfCDf8XDf8gKuZJ0cZT7QII
	 7ErXbWplNaGMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5EA13808201;
	Tue,  9 Dec 2025 21:50:31 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.19-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20251209153503-201216621@linux.intel.com>
References: <pdx86-pr-20251209153503-201216621@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20251209153503-201216621@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-1
X-PR-Tracked-Commit-Id: 4df66a74d2a54e265c0b0dda81b7a00e4d5140f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d588a1140b9ae211581a7a154d0b806d8cd8238
Message-Id: <176531703018.4145059.13401659817108755608.pr-tracker-bot@kernel.org>
Date: Tue, 09 Dec 2025 21:50:30 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 09 Dec 2025 15:35:03 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d588a1140b9ae211581a7a154d0b806d8cd8238

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

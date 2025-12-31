Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0792046BA;
	Wed, 31 Dec 2025 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767214421; cv=none; b=sXo7t7ktv3B3ypjiHS/kxk67a2qRuFiRW6cbrSYGcsnyocA2f++maHQqWzPadslYQ2TFaE5SgDxavbQ5pH2O3sZXbNvwwX6BKn5mbjMdR7LEp2JzqajHqjyvaaT7EpubpJsy85omoszG9EUcrfk5OW6xhXb4lzOZNZWF1k2pCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767214421; c=relaxed/simple;
	bh=OjH10GFBdJYJ060j5OR8aevNGbEOcJ0GzFlzI4LsftQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JH+4FhFi6cxHhPRjByyuWh8Fm3LTmGJNcAchSwezloFtkgPxEmt4MN0No0/ho80sooDrr9Y+xYLEGBvNhdYpk1IYBt4xkJsp0M8xwT6DIPgfMTamlKn1mRybLKWJ+L0j6cpNXGrR416g1JkWoYiW/G1RQOnXv7IgCdFnpjDjbtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSsRZCJt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSsRZCJt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD10C113D0;
	Wed, 31 Dec 2025 20:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767214421;
	bh=OjH10GFBdJYJ060j5OR8aevNGbEOcJ0GzFlzI4LsftQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZSsRZCJtjJ5eP7LUAes3FmoyKFdgPtat7j47tOWlTta57FIryhZsAXkWIOhb4fdQT
	 SBqhjiPk6LiqG5iOvE9mULhr/ce5etnxVu0EXEGXr6McCcBvOqTKRJsO/KCQHOo59A
	 DGk1enP4tLwrCRwdRyOIUhZGgrFuYvFs3QxpikXtW2ZVn3CNJkTkPaqONlwOIzQn3k
	 rqt50DRSTvWjq45+GfwA0tJPnnO41YZJy7hIMb5PNnz3c2w9UoSq/umJYMzJj+nfpJ
	 2EUXSA2myWg5I2bLSyVlVizWn5Is1+9BMehvxwXC+IOjAekp71+RBXijSrEq2gTCL9
	 LQR/OBW3p+ygw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5D613809A83;
	Wed, 31 Dec 2025 20:50:23 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.19-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20251231121842-433127174@linux.intel.com>
References: <pdx86-pr-20251231121842-433127174@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20251231121842-433127174@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-2
X-PR-Tracked-Commit-Id: c6703f10c8cc36f53b867bdbdd5bacaaa47ce799
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9528d5c091c59b408a754a1823cf0942069867cc
Message-Id: <176721422221.3597167.16139310834002364952.pr-tracker-bot@kernel.org>
Date: Wed, 31 Dec 2025 20:50:22 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 31 Dec 2025 12:18:42 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9528d5c091c59b408a754a1823cf0942069867cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

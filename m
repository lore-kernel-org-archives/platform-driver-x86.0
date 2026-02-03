Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F431B812;
	Tue,  3 Feb 2026 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770143334; cv=none; b=n7u+X65RbhetZtajDs5qNF+IreAgTTVcdbAzryDbfl2Y4ckdX7fbHDzRUfg7mebLJofyftfW01MNsjAc+SBw6y6oRH1cAeRYm+fM8Uj0T6e1ImVWdjOGGHi/3hKPnI5VDOBMcfltrQoRDGW+dvOUS4IgQIQtuenZryx5iLWJCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770143334; c=relaxed/simple;
	bh=TForE/FICZwo6Wg0y8YS0c3jwCJur0BSIk7zmDY3buY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=a34feM6pyDBqqGXSTqOap/hE7EZ0ExBiLKF9fLd+j3bQvouEmIgp4smYayo9uOjSVQ3jitchEC+neIhiAuf6HZ/AtySfm1k/6zJ1JtAg71T7RGqiPBwRXM6GD3A9OReKxTsj9wqbPzvuSt0WhjSN2tsL03J7MPJY4BKb/AbtmYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCGm6nKK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCGm6nKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E685BC116D0;
	Tue,  3 Feb 2026 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770143333;
	bh=TForE/FICZwo6Wg0y8YS0c3jwCJur0BSIk7zmDY3buY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SCGm6nKKVXPeoEdMnXaMP+fkFmidzYMdJE/w1WrSqRm8qQe/WpR774k9RzrE0qyb6
	 TDQ7KoyqFSTfONE+KCYXVrlQDEyHmB38f6WYM61r4gXObuTd4K6P4yb0/0HDgw5eMx
	 4W6lE3gLwbb2APnAbX5hlVqEhDG3JcfJU9a6Yq08eVd9Gkf9lz5blu9NOi5fwhLtIl
	 BkvCc1LOUXzrxazSAK6E6dUaSZU4ZfH+GVRro/31wS/jrKzlR/iICoylqX+C33RSoa
	 OyXuOEuz0+gF4jrH2MRB58fZb1ymbJxUE9tL97gx7YedxJPKy3OCA8SH8aEp3lWIbl
	 w2zV5mdB5d4Qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9116E3808200;
	Tue,  3 Feb 2026 18:28:51 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.19-4
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260203185652-16333416@linux.intel.com>
References: <pdx86-pr-20260203185652-16333416@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260203185652-16333416@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-4
X-PR-Tracked-Commit-Id: 008bec8ffe6e7746588d1e12c5b3865fa478fc91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0452e3ea094e1fd4959fb3fd67f8827a4c04743
Message-Id: <177014333008.1592914.3976400575850928863.pr-tracker-bot@kernel.org>
Date: Tue, 03 Feb 2026 18:28:50 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 03 Feb 2026 18:56:52 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0452e3ea094e1fd4959fb3fd67f8827a4c04743

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

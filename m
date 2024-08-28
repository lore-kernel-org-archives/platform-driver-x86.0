Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30881ABEB8;
	Wed, 28 Aug 2024 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724872710; cv=none; b=vALLtTDXu2L9qHcGpSnP75WRJdc5BKHHK/lMGVORELEqQGUbn7GpUPcrfQevbMdTKKDTO5BgRAVIQWTBA20edSck2oFGXLKiScrmXojQFe2E8x7Be6lPU8W3FGwFiIRD3CJoDk2wRNU0tB0YJVRnrPGtPaz3Cj03WOkESUpsnRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724872710; c=relaxed/simple;
	bh=5h5lm2o4Eb2NXlZiHly17Bc8UpiFwXASo7sZJzQib9c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=em52EczKbghgxX1DcTfzyFYAf73kom7EzIOXeP3wY54EfNX7DgSjhMwxz7NTBeeZq0xpnachPDA8E3ZVBs4goA4Mes1166k22HHMEJFreevDpoUYPbru1YImFLpI+tYI3grNIDaWvu/eCNotFxKqir1qoYhK9Gmi9rBs8SU7TCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeaZVAeK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeaZVAeK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DB9C4CEC1;
	Wed, 28 Aug 2024 19:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724872709;
	bh=5h5lm2o4Eb2NXlZiHly17Bc8UpiFwXASo7sZJzQib9c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AeaZVAeKUk+Adp3dai5SAsOJaydmKWQvyfAvPzN4KPVBeNazWjL6eTx/TG/75WkYf
	 N2jVZI95A8KralMG4TAP+0Kp4ymVRp4ty0VVJwgmG0t2s2zF7qIqWjTWMmV9ayf6lK
	 fZlfCeyHq685JAxFO4rfvbKETMUKY7FaqA0jiSGOrdB+u3Py+050kqpiQQ44Wyf4O2
	 QRDW4rgaOrUjJojV4jdJOK4Xze7RQo6Yq2v6K878Wqo/BDs5ZeySdaTrHKlVP1fYSS
	 SEt9+FYN4fBnOkNfCZJSXwVBeyiS1Jju7YiHZ2JaC2LbtRbgXUKCe+jI0YggwVPJyC
	 /PUqGNZPF6r3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E293809A80;
	Wed, 28 Aug 2024 19:18:31 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.11-5
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20240828125237-2776213950@linux.intel.com>
References: <pdx86-pr-20240828125237-2776213950@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20240828125237-2776213950@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.11-5
X-PR-Tracked-Commit-Id: a3379eca24a7da5118a7d090da6f8eb8611acac8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f9a59dd09749c6303821e5d6cdff1affdb5917dd
Message-Id: <172487270986.1401757.2012532953917323184.pr-tracker-bot@kernel.org>
Date: Wed, 28 Aug 2024 19:18:29 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 28 Aug 2024 12:52:37 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.11-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f9a59dd09749c6303821e5d6cdff1affdb5917dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

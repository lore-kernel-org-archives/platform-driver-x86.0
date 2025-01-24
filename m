Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1A148FF0;
	Fri, 24 Jan 2025 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737733667; cv=none; b=WDljtCFl8dHk63jiAC1EbD/Kk/yUvMhV+NToaR6MGwer3OOtmSd9v3uNJXc4XI6tUEndmyTwTvTvsIHJFnUQAZYeymB/2VfLtALTlAE+fcQ7MVb8mPbmL/ucaK+zy3c0IRLQoNBIQRuaQRdEPRILGw0IHMA+/kaw7kNTGuEl4ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737733667; c=relaxed/simple;
	bh=+Pt+zVwL4c72Vvmz4SWUMeInUwAxCNObBCpP1mWmsNg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ALiEUnthiNXH99YOFbYd3KjV56+g1CvpQ+bWloAtAQLQ/D8JVkZI14eNrU0ZK58vkRO/t4S+wEeFzWs0e4WPNF6Xl7ib/euNmjMEfsqMhiJIaG96Pphv2DdYJ3JjTuWZUdf+AOcf2hCEo7IoT4nT3mRRiu2JTaF5FJ/1YxW/w5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw20mJ40; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw20mJ40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3637AC4CED2;
	Fri, 24 Jan 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737733666;
	bh=+Pt+zVwL4c72Vvmz4SWUMeInUwAxCNObBCpP1mWmsNg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qw20mJ40/NKjp5QJhRPMpylWrzG5+b+ewibly0ksdmgkrD66BpelMfkiIUYvb4aWt
	 +z71bzdRyeIwFsJ4P74VHXxuLihUn2LMvtCGhdqQH46yacFrh8JRZQJYXQqyxbXtlP
	 D1oWukZfuptZtRyz1wFlznRm/bJFhStS+cMiQiBKawo9fmPJScYYufXqpbG6Lx4u0Z
	 7vnY7mg9KCBd/YZCbbIhDAjWvS5223728Af6HE5XUItcOllEJcbR7X76FD/yafESLV
	 /9yeUkipH8IbfAQ8x60K0rjS2SXvW+Fwt88LaSG+sFt3xooXAY09zJR0cRcTuzD1kV
	 rG30i7Ggb70dw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D01380AA79;
	Fri, 24 Jan 2025 15:48:12 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.14-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250123152454-321957424@linux.intel.com>
References: <pdx86-pr-20250123152454-321957424@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250123152454-321957424@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.14-1
X-PR-Tracked-Commit-Id: 0da9a3f9ac8ada83fa79579455871ec59f11db72
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c9c0543b52d8cfe3a3b15d1e39ab9dbc91be6df4
Message-Id: <173773369079.2077644.13313897940077899236.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 15:48:10 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 23 Jan 2025 15:24:54 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c9c0543b52d8cfe3a3b15d1e39ab9dbc91be6df4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

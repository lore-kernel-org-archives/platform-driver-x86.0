Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937C5227;
	Wed, 23 Jul 2025 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753286471; cv=none; b=lL3JX+DqIIDNGVcAJp+I9jhGmyt9xkp4JY4ymmgJCuHdXVoj6pb3ZlYWzFcQKvEsbhTksZqgWNkyImmB6sfBSn9HI9oxz/aays30R39sjDGZSNOAtGsOzJvOJc7w4vB6c0oejCvR9k061+y3zce0o0fT20hd6td9c7mwi3GV04c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753286471; c=relaxed/simple;
	bh=uY8+sFeAzuY4dbL50MnUo2+f9uhwyMBoC1JcKKk2BQc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WPwH+kYuMtNj+OXhfMolHELT/IhaKyw/affS2i4mmLrkHa0vey+R4uUQhG8eY7VMR40LCjYMHFNAqekRnhQWG6FolS6wtIczbDHCc0iVPhJvJO8ZeynTq4pZDK1Hi3RRBwz1DafFsIY5TJO5i55hFNNWi1k648/spjtNr9l+sis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFTG4DEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFTG4DEA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9A3C4CEE7;
	Wed, 23 Jul 2025 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753286471;
	bh=uY8+sFeAzuY4dbL50MnUo2+f9uhwyMBoC1JcKKk2BQc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FFTG4DEA6NWkisNNu6ttso5qHpAYJWLw1wWEv/lftDDuV1dvzEUSu1TBsDIbZUvkl
	 KFfYquYsw52aJ5h7IrIlcpPx/wFfJvkSbekQIXiyvihNmZdGYY5qOtbnSFVssMVju0
	 SpwKCG4+JnaHVl7E8pbQggNV8BGPQIEdStHMtZ0GaTFD283KM4GVcrbXv8CoUi8d3R
	 Er2Fl8AivDCyRDCbS58suc+yLPoMGwv07mAY/fbuKP45AhpqcKsJMCMOtia6AqmJPT
	 NlTfZ709kwjSZTWCIftloLPdTH9epWMFywprZix7NliBEPRHaTPoK4SSke1kpJ7Bmx
	 neKzs7OIPZHhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EEE383BF4E;
	Wed, 23 Jul 2025 16:01:30 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-4
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250721153807-334719879@linux.intel.com>
References: <pdx86-pr-20250721153807-334719879@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250721153807-334719879@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-4
X-PR-Tracked-Commit-Id: e2967b50b709970547b5cdfa1b42526835327f36
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 964ebc07c546c76b78aea5b6dff0d02c602d4793
Message-Id: <175328648898.1670556.11892028700700164053.pr-tracker-bot@kernel.org>
Date: Wed, 23 Jul 2025 16:01:28 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 21 Jul 2025 15:38:07 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/964ebc07c546c76b78aea5b6dff0d02c602d4793

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

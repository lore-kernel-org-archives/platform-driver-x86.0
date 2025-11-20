Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B031B640;
	Thu, 20 Nov 2025 19:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763665253; cv=none; b=NvE/EVPzt0It7XXSor/i0DW0DdN+m8BiudXOzZFnoH5GmAS1OSOYGFzLc6yvFCmwy6ZR//klMcK2h7OzIPGzXGYD4U3t6hn9IISKJRTXdpnGqCYT0sCUYmZ+DAUutxaLVuToH/3Pe3018t1U95XDFeOLT3Z87rVORuiaUDTgVPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763665253; c=relaxed/simple;
	bh=Q/xqPoE2H7ESEVxPrrRYpROYOt9P1sSqRIZnERmZvP0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WNatKISL6860HLp3Xf7IScTPDS2pUkRcYiNk/sDJewPiZkB2ZAEo91vxVAlEr04GISlgZFIpryJlmjOmvocrbCOt43I1IjtdGtRDO73LZO2qPABGiynHJYMeghQj05hvzytGyfZ30fvCV9xjnY2930g+2kR7ugWvNksPAlf1+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGivoRCW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGivoRCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C54C4CEF1;
	Thu, 20 Nov 2025 19:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763665253;
	bh=Q/xqPoE2H7ESEVxPrrRYpROYOt9P1sSqRIZnERmZvP0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SGivoRCWwaxxkflDh3sBQgfJjzCr3nH75j2X3t0MwES7y0thh1bv0a+2gXs1EC2So
	 dId1ZFdR5iE70M0zNSchRoLELF5hyCm1o0F7NBZkQASH81/yVE0F8f0PfBwVNwwnfe
	 CmXo/h1hXUsIN6f79uUGJRODRf2+ekPhAlKtepJVHDOUOGxksXkvzByyzlME3N+hKv
	 LUony7JF3TM/ZFOG6xiV+gzatMZmBxs0SBcHYOgoTJOMy6gj91VZ6/ARcShi3w0alA
	 9RsMHBv5q1nXl8G8vfwF1APKSRsM5GKB5R+h9JaTGBzMmdtrpnTAPfJkhxwCGSPRD0
	 ADDuANIfjHsBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 347693A40FE6;
	Thu, 20 Nov 2025 19:00:19 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.18-4
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20251120184942-68786761@linux.intel.com>
References: <pdx86-pr-20251120184942-68786761@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20251120184942-68786761@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.18-4
X-PR-Tracked-Commit-Id: db30233361f94e1a84450c607989bdb671100fb6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6ba3bb334835eeca7e2bd2db4c9dbb0343ebff4f
Message-Id: <176366521876.1750999.16037940181284726782.pr-tracker-bot@kernel.org>
Date: Thu, 20 Nov 2025 19:00:18 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 20 Nov 2025 18:49:42 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.18-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6ba3bb334835eeca7e2bd2db4c9dbb0343ebff4f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

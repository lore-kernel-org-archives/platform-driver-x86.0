Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2F92135A9;
	Fri, 10 Jan 2025 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526464; cv=none; b=iVh1wMph+vnr0DpSP4B8C+gqTZ4wzDNHcm/KQWzNBFa8oGWwaWrm3qP4H2lPe2gYitUQlKoF+B/kEo3pNimBglu//3fLM63YfQnwAQOdKbV8KRbdQCnC5T5dYX2lbVxLoIODncw9DlO7wrWXXIOydphaxNfcRmMjcs3c6d7xY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526464; c=relaxed/simple;
	bh=HSBfVLMP9cxaK6zH5SPD6wrHgpTz65XEvc+/sEgbxss=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=o3RraFOiCW+aLYTQIZ52KS92OL/CYyRets+nG2jYygZCZaL+jqmTHaJQsNrBHMdodOIYiWOxNL0fQBQfQu8qyE/g9kCVTKDFAZFKqYnSk2qRlgJaguWOel3M5hXffoV/uNwyxgkVmxaFRRzmrgeJPCgPs1RpGS2rS55BFl91Ea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ml6kZX1P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ml6kZX1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502DFC4CEE0;
	Fri, 10 Jan 2025 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526464;
	bh=HSBfVLMP9cxaK6zH5SPD6wrHgpTz65XEvc+/sEgbxss=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ml6kZX1Pq40nIUJREv+MDUljhKxaDJ+tEHa80tm8kMo0lCsPQjPB0DrSr94IfDTmc
	 L6JhnYfpKQftqLyXSp3GECm0aDpY/Ly13BT9I1GKp0fCKaPykdefXzoA42I12ePAC8
	 LVee3CQr/tnmLhL6uj+AjgSZxQJNCEmeMLNVP5h25lpYoSJidwvET2/ZLTS7Ag2M90
	 +3pmYvxOj38hIK1DQc61cGrfEY2MqLyeoOQeAOlopnofOGp4VjgekzU43SoA+xWcaP
	 WknIn/hFJbQxBc+GYWezRd8wKATO+cNNJ6ahTIysZZIYYhZmA6Xqi1/D54elAtC81D
	 tjd3G7YeWwgxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E66380AA50;
	Fri, 10 Jan 2025 16:28:07 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.13-5
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250110162313-1507428@linux.intel.com>
References: <pdx86-pr-20250110162313-1507428@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250110162313-1507428@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-5
X-PR-Tracked-Commit-Id: 1d7461d0c8330689117286169106af6531a747ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8c8d54116fa289e4d559c0a8fb27d11de9a3a8bc
Message-Id: <173652648588.2125399.4305157237781714788.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jan 2025 16:28:05 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 10 Jan 2025 16:23:13 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8c8d54116fa289e4d559c0a8fb27d11de9a3a8bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

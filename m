Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A76530C60A;
	Thu, 27 Nov 2025 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764273942; cv=none; b=G8ccRAH6Fxmkit6hRhPgZGXmzQYufAmjQJTIyYx8u1Mc22mFZBQTN05B5nU9A2RGk0Yjdhe9UgtyyEfiDVt72tVJXt/LPd5xdF6WOTpTAgj8isrI57uj/yiICiqC4A8pn+r03s0iCpcSxdyruBq5corfR7yfVdvuUL27/Ic0GKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764273942; c=relaxed/simple;
	bh=U0RCOI8rkRxtPKEwfj5GSDtiR+GTESRUtaqG3AqHsHM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mi+GSCxKPasPg7Ej9oUyeACB3BvNpP9sZSHZYQgGvhEpvdamAJbLYblC3Z2uJSxQAfmF/OjvCQ5+u6m0WSUMKtQC4LhhQi315KkCJDZMMXzp0lEkgFyyNhtUIR1b4HUypiYnAzxeAWtuag8lutOAdUsKiewLsIXlleo6osjEgWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rz7D+oTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rz7D+oTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BE4C4CEF8;
	Thu, 27 Nov 2025 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764273941;
	bh=U0RCOI8rkRxtPKEwfj5GSDtiR+GTESRUtaqG3AqHsHM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Rz7D+oTTDly90dhXJ4NC1OkMWpugeBK5WcIc9rWcEv90R9AktBWV8U5wC7zRIDQdG
	 xSaGziBso6l/oE23st1QOElSDSriKD3oHcWYKxFrbtvhZ0Su4UMPsd70t2YKt2aROn
	 3K46kFsFJU4Uq4uqhYjfKMI+VzaOMGkTKYEYfGI6ryy1TQPONKhly42hFthBtUUSfa
	 l9yNDFuY7UGbb4HkeV9FEzUHIuBpW0IfW+CHn+RJzqSfnk4ht7r8Y++wMNB8RRkWC7
	 /hl6QB6GQBs+b0UE97o6oAoOc/s0vSUOMREv/4r5kyXEFsQ/GwXHyBEeCXNMuc/PpD
	 CVe4v0d2i0s9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 786993808204;
	Thu, 27 Nov 2025 20:02:45 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.18-5
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20251127113520-199883@linux.intel.com>
References: <pdx86-pr-20251127113520-199883@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20251127113520-199883@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.18-5
X-PR-Tracked-Commit-Id: 9b9c0adbc3f8a524d291baccc9d0c04097fb4869
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a76dce0e54091556c0981375859d6cb60d2f7bfa
Message-Id: <176427376400.20489.10986725260668520936.pr-tracker-bot@kernel.org>
Date: Thu, 27 Nov 2025 20:02:44 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Nov 2025 11:35:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.18-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a76dce0e54091556c0981375859d6cb60d2f7bfa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

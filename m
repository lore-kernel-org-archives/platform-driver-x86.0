Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36119EAD0;
	Mon, 30 Dec 2024 19:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735586712; cv=none; b=BCLX8WYZ5BLo5cFJpIPRJFbkGyBkR/f9klVvY52Gs95C+UnEgyYJJZtTVm3nskv8jr10IFrRMrd0RtGbgcO3CARWr3Qyekktj5T+ZOivZcZPv82+NVX31N4yXs+86oKfqSf1Dp4+cGUqZJikOws9XAYcfzAAjJIfqbyDg7XdpQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735586712; c=relaxed/simple;
	bh=d7k7lZ6jm/CZ/flqe+sw8n27WnAp1r+N6nB1StFnmhk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oLrxnNYh5PstC45nReu6Q4nHvQt830JkWagjcDKsccnBMbNlBMxontVp++b36O6HvgiDcaDncp2UcCXWG28q3kP2OGDZPdz64uVPmxeJnnbK1zclgmyXzHikw5uG2bYQr74iDL6WWqBynGPNiBThphdKY/zfB1T3ojGkGWCZ3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+3nf9pN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+3nf9pN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07853C4CED0;
	Mon, 30 Dec 2024 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735586712;
	bh=d7k7lZ6jm/CZ/flqe+sw8n27WnAp1r+N6nB1StFnmhk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=E+3nf9pNnXDNmmeWoU2DWY6cQt0aNezMITZhvG8qsnNrc7Yz2oIHvTjSimwXuA0rj
	 t0g1Lta+xZO/tfjSUP+nSbYzTi1ZV6Ujw6EPlRXmVGCGDFHJoMSLOegO5HOx/d40wT
	 L0iwio1s3Xac6I9kWc7fK89d8thJ2SOALgA+953nirCvjZ7M+Thx/LgScQmgDgSpH2
	 ldG4/f2sBfSCuY2h5tk6Bq+HJ4MRT9eU0bg2tMQF3jmidQDbnxkJ17kh8MgZ+nd2IN
	 HwfKg0m3SkqKzd61kr/WamKYX5n2UHqjG2QuvTA/T+rey5hjuOlDc+EleUHSXCZRVz
	 +vdzRZmrMrwTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB19F380A964;
	Mon, 30 Dec 2024 19:25:32 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.13-4
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20241230201839-1256110449@linux.intel.com>
References: <pdx86-pr-20241230201839-1256110449@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20241230201839-1256110449@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-4
X-PR-Tracked-Commit-Id: 7e16ae558a87ac9099b6a93a43f19b42d809fd78
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
Message-Id: <173558673146.1432005.2237269601730589661.pr-tracker-bot@kernel.org>
Date: Mon, 30 Dec 2024 19:25:31 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 30 Dec 2024 20:18:39 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.13-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ccb98ccef0e543c2bd4ef1a72270461957f3d8d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

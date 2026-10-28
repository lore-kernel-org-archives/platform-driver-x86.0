Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211035;
	b=hSyCucvPTwThdpSWSMNvEPNr9iV70DMw7SaZsDdl5fKc7Iej4o36IIq+iBsQ1gHg1DwL
	 3SkSAFUQgvJimYasZgCLlBFGHmnyucixIcwlvO/W8WT7h+e5uSNXIAjtV/vGNrrvaP4Vh
	 vxiIKw+2b0ONyTWxuMObEhQXZUJoR0WsOEoVriyd6rqybHEvOiy8Cdv2xE+WFybtuRzMH
	 S3GndNOtl3gzMeohwBEeoAxj1T2RkRRxPWQ1ODw6JUKVmzdx9QioO05+6ZR7fDwk8/YPE
	 NHm2QnENVU85qoiNRVVprs0Zq2SQlJ6WA6yqJ+CoYkvNIxMgpFZSl5tSGMz7E2qQrMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211035;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=qXGNn3P+JUzzeztZNURy9+tDWKqpt7vu++LwCeYbECc=;
	b=N//XzlSLei1Ysen/qkyn5/AkywC9m9lIexg8b07ARrHvTj14rSbBEw09OZqYtrKIjSv/
	 ov3nZkpXxjcSbYqkQ7LQdIgZL6MX8tdO8ZR7uXaCOKdMh6L8rtrsv31b8HohNGMimEjUS
	 LkFAPzK1hVP1qqFga/SMQGVOYugfjb5T95J77PTZvzbLAEYW0E24jOPnAM5adkW3bVH7C
	 tljct9RwNZBLETPa4u05wxD1LwnBYmH01+lptNGKDHmQ00Gt/dLOzfpvUNivIjf1Bd9TB
	 RTP08U+Gh1ERbjcq3ThNCkKOsMUF1j+0lL6XBkl4z58ANksLqyRCeWvC51xGQk+vaOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgTCRE5T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055760A2608;
	Wed, 28 Oct 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgTCRE5T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE601F01829;
	Wed, 28 Oct 2026 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211035;
	bh=qXGNn3P+JUzzeztZNURy9+tDWKqpt7vu++LwCeYbECc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QgTCRE5TZ2Wb4y8G159hxg4b6G0irppnFDJIQD9kvpYotLumJrfC9tH7sKrGnpnhZ
	 i4V2sLLAhhW6CiT2Y24y65LLxiMZvgq+dTL9vcw9nJTEhfa+g9RMzRlDMUqrPngjmf
	 jPUPvnnMVg0lGdSiIQ3l97nzqVkm4DzmqynK3zzynoYayRsTgmORc09nP5p+8aYWk8
	 cqd2ILu8iUHrxeKtCSIXf7k02y82tJ1hllFlsuV9tvl7rYEq373pC53n5cCconfGKT
	 Gi6mJHXgX2gskyZn8BdMlbavp5jpB7d6SQgd91TyLsAI3PaswDiVrHRnJHQ/I1NIb5
	 KeGJKNk4TSl7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4445B3AA9F6C;
	Wed, 28 Oct 2026 18:10:35 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.4-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20261028113441-148823082@linux.intel.com>
References: <pdx86-pr-20261028113441-148823082@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20261028113441-148823082@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.4-1
X-PR-Tracked-Commit-Id: 9d3475065167197742b0882aff21cf8e78393277
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c339f4010dea8b0d754f84ace70cd1b089878ef8
Message-Id: <179321103388.1342141.16510581153413448839.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:33 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, Armin Wolf <W_Armin@gmx.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 11:34:41 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c339f4010dea8b0d754f84ace70cd1b089878ef8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

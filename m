Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1717271464;
	Fri, 23 Jan 2026 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203508; cv=none; b=fCL/eaQQN/36o5M1mFkq1wfUPFjbSfweDU8bwtEfKcNQ07NFfH27sA+HK2knk3JBYbil2cv57Hkt7fokPXKQqBLCa0wDoH80E3QIYIFEEityH41JB84w+qepafBufyizj9Pj5AzCngvnyyKgh0PIJeoEUfkI8ZwM8fPrUZWHjF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203508; c=relaxed/simple;
	bh=0KyaTOHWefq6hc9KzpSD4BO51vp1jQqA1Tiv51plmtc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IPsr3ve73y676BVnZxWKHDoNO39No08cD9otyd+vsZA/6i9MOrkqH/tebT4Rn0dI7As/tYGtSdM+6o/nERPZA9WTY2d8Cg9jC8gQcU1YCzLLhZ93hfW8/cW02+pLaTqJF+lj3SfCDQDX4QGIoD29TrtVHMX91Jcv6ivCICbrE2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h62QdiQa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h62QdiQa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D29C4CEF1;
	Fri, 23 Jan 2026 21:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769203507;
	bh=0KyaTOHWefq6hc9KzpSD4BO51vp1jQqA1Tiv51plmtc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h62QdiQa3C3qQFFM+XWpI9dCn+TntaQZbZrwKY1y9wgqZdx0lmgQs6vxBCCiw6iTN
	 g8x61IP1mGUEU3Bkf+3j7kEakTqm002NNGzWraw/jXw8XbEkVm4yv57EEiBSTb6KiC
	 Z8EVhLnsmRX39irh51L8z25xRqzlfH8smHIJsRjuDHXcYnZ2XBGFIOpCJJSda4nPy2
	 aY3ET9dZCvcWcscR9/4/psl4AVRJcj+voAv6mM8bPI9oWapHvhbOmCJZbkiltu+TRc
	 FbZXkTGxiN8Y0NY7h3H8zjYDAS9KEPyy0LI+lc+nwftsXQR9tiYLBO1GN9fPaHbfUx
	 Y6Gg4GvHOxf8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C88F23808200;
	Fri, 23 Jan 2026 21:25:04 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.19-3
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260123175454-900019998@linux.intel.com>
References: <pdx86-pr-20260123175454-900019998@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260123175454-900019998@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-3
X-PR-Tracked-Commit-Id: 4b11f2336e23d5c55b76591bd8ac39b059f68ad0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a4d91142e538ff5580c6bf48b5e668d8131fd9a
Message-Id: <176920350343.2720183.6341369129954301013.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jan 2026 21:25:03 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 Jan 2026 17:54:54 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a4d91142e538ff5580c6bf48b5e668d8131fd9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

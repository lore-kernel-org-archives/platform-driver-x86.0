Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808743A7F5F;
	Wed, 25 Mar 2026 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774475373; cv=none; b=ibzsUqgMLz2mgfNI6wWnjXyBvO6eInDayQmyTc66N3LErbChAoHDKTbq2cQRc9A0gTynBn9R5emK6j8rtzzgunpJUxJC914BHCorTwMr3rJZQxEKkkvcNO0NhQ5NH4PVu05gBHyLPFZvd346seVYlThvAz1NnR9vmT8XnBIOZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774475373; c=relaxed/simple;
	bh=9FKk5Jnw9xg/vXShGG+FfKLsMSWKZhOZPflOydDdxPw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=raY49zbbY0QnkUOBdUs7YNnLdaXvWghNtjsnx/111t6v26uc5uzorEBXO/3GioeVnnSGIrhSAVnqa/0unJ0Xv29wFVtMqqu2xRS1bUcQPOO+dnuxgH6PKcOb3e/y+ZwJHd56Qhqto+Ijxcmmf5yIe8eCTISpXaNFExnr8r+apZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7TiQfbn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7TiQfbn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAF1C4CEF7;
	Wed, 25 Mar 2026 21:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774475373;
	bh=9FKk5Jnw9xg/vXShGG+FfKLsMSWKZhOZPflOydDdxPw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=U7TiQfbn5y/zzR3paTl/EdHZw2jbO0zu5yxw2q0pdi8bwuGRSqRuwxKXkF0j6SWv/
	 8BJIdGjUX54Jk1P+ozkMWtOgyAXiZrmXW5g1w8+gcOxYuLhuunB7hX+XM8eDQ/x5BC
	 fW00TazBfwMZ9MqUKroqeg1zkVqNqGT1tjnTQzBR2mOdIpWAfYa/7uk51pTxdXd7Xi
	 YroOjkZNEP/CZ4M/POjVyPqACM1bjAdrdShmXAtI7ZV6zf/50j+U4caS4GiTsDvWF7
	 itYKvUOIEk8eakd1joL4qJtjrwbiw5ymEGn4xndZQLvnVCJyhfAYi+nQsFtaI/b2Q4
	 mBQjKRMjqtW7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D18C3809A06;
	Wed, 25 Mar 2026 21:49:21 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.0-3
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260325145345-1794521387@linux.intel.com>
References: <pdx86-pr-20260325145345-1794521387@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260325145345-1794521387@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-3
X-PR-Tracked-Commit-Id: fbddf68d7b4e1e6da7a78dd7fbd8ec376536584a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51088b9d5f62cf234d1a5008f65c4dd712919551
Message-Id: <177447536009.2220883.5896833510426285016.pr-tracker-bot@kernel.org>
Date: Wed, 25 Mar 2026 21:49:20 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 25 Mar 2026 14:53:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51088b9d5f62cf234d1a5008f65c4dd712919551

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D52B43D500;
	Fri, 10 Jul 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703130; cv=none; b=kwkaenySV5j+q2yq9Kc+9yleHs6U6bpQqCHFkbuDAPsIYP0stqA6t3WerUQqJ1b+uCA5x96Wgm252h0hGdPJRLzABS3mmQB6ay7Vo3RVtH62GxMZvuASdJMjMD3rlj+zEgFTpayJ6HCjmL6Ogbs8pWonQIqbU63ks5y8rxnKdfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703130; c=relaxed/simple;
	bh=byUzLLRrmUfFQNdNkWkNcKNeBs2DrgCaBJikdGgdHhM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WJcb/5uBAIhdcAtOdjPqblFdo+KrXM5/JMP0K7nVu1jeOCGUy1R4I3hA2FfKkelm2kpQkNDzF/P/4TZj6zYpgLCbwrbZOb7OC/bugRTkmwliY5h9OwQ3sL4kwb8PjZB+HAidM/6G+l5rqI0pLgJMUa5s5PwRac7QS3KVyoiEOBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIFkP1jh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIFkP1jh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248341F000E9;
	Fri, 10 Jul 2026 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783703129;
	bh=P1+a4YmItzVKBNBWFo6ZQgB9w+BzCkzMTnq9vJgl93I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AIFkP1jh4uiSC/FQBmiHXUmsUpvdg/d2w2LgwbEhnNTnhHx/vTJLYLZk0KknWZ/4s
	 Mfl4AgwVDRaqP7Z94qWFWLn1zXJlRbQNsQefC7SYWiML2pxJ4yhQD69tkCPG+NGI0e
	 4ZsmTCAb7+KWhhaYzma/wiJvpn3aI0dsipUW9ETuiqhr1qG2VW7VJThioVssOpclPn
	 LI06yTLAOfpRokXGqBfM8hKzDzB0O9jX48aM+oJdJKw98HwzccQcX3fwgVqd+qQUg4
	 STW/S+LH7RXu0UkE4SVOuhfUh72ayy19nDk+lR7Kpc403Ve3ULw2KnCw69fRfMp+43
	 tYIDN2hu6Wyag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199693924FB2;
	Fri, 10 Jul 2026 17:05:08 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.2-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20260710142357-1409422743@linux.intel.com>
References: <pdx86-pr-20260710142357-1409422743@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20260710142357-1409422743@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-2
X-PR-Tracked-Commit-Id: 2726b5758f80a546a4ddeec5019e72035a7fa166
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f0fe3220fcfe0b71793b84ef78f0c6d9a1f2e08
Message-Id: <178370310671.779204.12833353647964531251.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jul 2026 17:05:06 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 10 Jul 2026 14:23:57 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f0fe3220fcfe0b71793b84ef78f0c6d9a1f2e08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

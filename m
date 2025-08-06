Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A320E6E2
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754471022; cv=none; b=tREgMrybtVmNzNnFM1jdzy85R1+EbKAx4CLfD8O/5fY0roOGJ8KvERUw0AO6XZIJVSJTm+05mkmuM9ZOmmmLlAW2Xxm2mpqhc4LlFDWwz1uxn6Z5+eey5zNvGV6CjSaRqm97/QcDVUDqNyFhF1LCchgzBsODV88/8MrKa3tnIS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754471022; c=relaxed/simple;
	bh=pAy3pAzBVtwaxddOo3Zx5S4K2YgpiZtJjShHaXA6giI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BuXJ9/mrTccNFeAK/ASmIVuxXWXvZJTlWWdUBjbV5B3SQgD80ciVqYt50XOeOQ9d+V9DBq0D6hNJgHV3x3xEo9Fp53/SCWfQjZ4orNFN1QpPWZEYCQJSYMOImq+rd85mtMgq3cMAtw8ZgDuUOxVPTPuwgIyDEfTGezbjkoN6I1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvsbtWcf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvsbtWcf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89868C4CEF9
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754471021;
	bh=pAy3pAzBVtwaxddOo3Zx5S4K2YgpiZtJjShHaXA6giI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SvsbtWcfuOJmx1zrdgAa8wYfSanbzT4csCh7v7nEve9KvkUdP1vHctQaPyzGV/GFd
	 g2lmsxMD14tuarDv4/atVe9Vw/FicqYIatpE1w/O/rCF0NlFOJlvEOO9yndDN6yqf0
	 lUV1Rm1bOEj8aKIQWRu8KzDDlKBo6HkFz8TNookmpMa947BzkHaSYmjBtKrAOsBwch
	 12hgRvSAR/kFTqQKO4GOCfFHrE8rRB577C9oKfVeDxPpfpCji1H4CazxPaWEy3jSem
	 UEJQB3YGWtpXamv5UtCA5NbkAUvddqQaPrHmuu09r+UYTwbPxgR37TYT3pRPQfyAa3
	 FJhIxmQVAMcAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 778E1C41616; Wed,  6 Aug 2025 09:03:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220421] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU
 telem endpoint -6
Date: Wed, 06 Aug 2025 09:03:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mapengyu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220421-215701-bsp8Nk6SCq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220421-215701@https.bugzilla.kernel.org/>
References: <bug-220421-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220421

--- Comment #1 from Pengyu Ma (mapengyu@gmail.com) ---
# cat /sys/kernel/debug/pmc_core/package_cstate_show=20
Package C2 : 60519086
Package C3 : 51104
Package C6 : 24033407
Package C7 : 0
Package C8 : 17088008
Package C9 : 0
Package C10 : 1737082331
# cat /sys/kernel/debug/pmc_core/slp_s0_residency_usec
0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

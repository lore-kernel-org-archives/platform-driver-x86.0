Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6066242A87
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064364; cv=none; b=kD0gjo7t38o802wQduEqNS+h5yoeVbr3o4Y3wCUb7hctYSz9TgrOt8MCK8wEiRZs2LWQ8ixgjf3+Vqtnm7LywHlNTLNtM18OXHEDdJwMcjX0WEXSNAh6gzlhOsXdg/DDZ/ERAEPckOle/i6U7EhLSUWCJFAmBAzKSDzG4cVH+08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064364; c=relaxed/simple;
	bh=Z2MiE6p62VF4OKVSZpf1kDy23AwUa+PBtymHH0KOnzI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C0tkA5X2DfLO+SMV0DXJJlrkiTGLPG3YCn1qNPW8oEx3l6+jFnjz/fUmzS8x1ZSaXR0w480wQvWSVCtgGojEUdM0/j1bAU6ipxDQKd/eIVaF9BVseqA+nhzODaV6xXqmKNoDAHZ1eL1LqSEF/EOl/vjkQ8P95YkkQk75nj9RsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKuxAuyZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKuxAuyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1650C4CEF2
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 19:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749064363;
	bh=Z2MiE6p62VF4OKVSZpf1kDy23AwUa+PBtymHH0KOnzI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qKuxAuyZX1D7fYD1MUJMnAOIVVO+GAva65ATnX05BuZGP8pphbGyMTpr5y6z8VbCt
	 1oiuKunM+tuS11H/Ru6Ed0GW6f4EAdroQGgWnennmTwEVtVJSTqJRB1LcIHPR9A5YZ
	 VvL6pdPbpXmmC+KJBA5VdWxOBi0Atavub9J9JChneMnXFfhhcbTA3ooNXyE4S5FksB
	 BsNRulT4TV/w6RppD/1TbfYYAaBc7UsGYWlozUyq+asNN6mkPmZzfiG3X2iZCnc1bV
	 IPF7wnX7Xxh5M05IBxL320A0Th0aNSi9lMGirmKUCdJdxW0+nf4DtE2Lx+XJa7v3k0
	 zgf5Lgr4xkQPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC844C4160E; Wed,  4 Jun 2025 19:12:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 19:12:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-Dk58eiB7z0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #19 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Everything looks solid for hardware sleep now.

Did you rmmod i8042 or did you disable wakeup?  It /looks/ like you might h=
ave
done rmmod.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

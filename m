Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D715573A
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713207713; cv=none; b=Gt8HJGbdAFmUW3HaOa8/9UgVeKcaZRnt3h7F1ll4dbJf5a+3mfWJnPhXD4bYEOIX6AyMaBmXEbnYsYS68lkr3Ofr+znXUIFx3rnnsfQ5d51d+Q+xlH5C315e6RB70bT5MNIEc03c1mN1qYmIh98p+v3bna5Z6WTOin1MWGibQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713207713; c=relaxed/simple;
	bh=19E++uiSGy5FnxbftTqPd+vTq2Vpuq9IckWE/4CMctw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NT0xfI0Xzylg7xbnGlBN1z1SqTuEWYm2oZ3Z3LHBgEbve4UdD/M1gPHKl/pOoJkelyCssXWgpwQEKJ/Ahn3caKws0Tmq0qcU9Z3OXVw5d8g+/14u+fVa2ZtW9rF/uypzdXJBDCiE2wA52N/VQcUX7busCOTiRYJc7AYAsEnOnnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7hQznJs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7hQznJs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D40F6C32781
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 19:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713207712;
	bh=19E++uiSGy5FnxbftTqPd+vTq2Vpuq9IckWE/4CMctw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X7hQznJsGYBBOCA8roVymD8MyeN6F3QOIX9EiN9HRM1PToxIfHsQ6wpP1Fm0xW67R
	 LDIM+lySWF0aaxHz8WMx1ovJe0Yp1Ekk6pQws+aIBAcHWJ6L0r2Z8K/fBZ78MWgWyV
	 FjX0TMiWbzGRlt0k43iRAh99LXjVcYjD5PklmzMLgijBRppOAggo0RCldzCzoyC3F/
	 htGmXTs/AimdP4z3OhW1lcimjMmojEc2l6hpQ35i5dYotN3rjyhgeUaHckNrsCYkQV
	 kc/3m9f/7IZTPcrk5CpDR/Bg9tM/DkLJ6I1pTYZSp4mWs49JXYsMxUp1Ssu3yz41iI
	 Dgev6pmVS+VnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9426C53B50; Mon, 15 Apr 2024 19:01:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Apr 2024 19:01:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-rOaGjkVMBd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #51 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Please let's stick to upstream kernels. It will just confuse the issue with=
 the
distro kernel, ESPECIALLY a kernel that is EOL upstream. We had other fixes
that have landed in amd-pstate that are definitely missing from a 6.5 kernel
that could very well be a similar or same issue.

So please reproduce with 6.9-rc4 or 6.8.7. If you can still reproduce it th=
en
please open a new issue and collect all possible information. If it's indeed
the same issue we can mark as a duplicate at that time.

This issue is looking like a thermal throttling issue where the APU didn't
properly ack a request from the EC while in suspend. I posted a patch that
gives the APU more time to ack it during suspend but it needs to be tested
still in a case that it can be reproduced reliably.

If it doesn't help, I would like to see if extending the time duration in
between cycles helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

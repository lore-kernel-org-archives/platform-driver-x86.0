Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14429CB4D
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 04:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757478814; cv=none; b=DOhsDQ/BHgb+ZcnmyPPKDLhaRrhXVPRdRuNg//xngfq9celmgm2aUy97dlDMG4Z0PM/9qZPijyQMOYC7mrjk2MyoNZusLZYTZBuqnVzsStuG/HsgvqhD1DMI45gofkILJ+6RBLVo5dKYp2r1SXVgafLiU9rp7qQwRTT5ZT4Bnu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757478814; c=relaxed/simple;
	bh=pqNXur84srgJJO8MxwN3o4NEDheZe7nESDnPPptlWi0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IMTj6aYbgwGyXGHMs44WEJ/lzpxCn/1juakIDwzMEzyiQ2ftcxIleUrXFKQ167Zs53MDnBCTIKnupzgqzmy7FsSCY1soMkBP7FYFRmAG3emGUEMqtVzdBCPaK4YyWgthSN21egGaVm9cYV9yT+co+CL/Y1eT7gKMLl/GuemBi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVmfuhpj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVmfuhpj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0327C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 04:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757478812;
	bh=pqNXur84srgJJO8MxwN3o4NEDheZe7nESDnPPptlWi0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NVmfuhpj51nFhauSq4Iesmd+Sz+erFn4270wjMryeSNgvu0OfHPuIk7YbwcQWHudw
	 PB05tcFKSOW7SuDa15GDDH5AvcZrx40m+7yku3U7tRFUTju8CotBojTQCf4pnW3y20
	 n1Cg+NWz8Etctf3oMwGgC4rMMbRBprHiqT6j0BtCwlAu4q5ehtBVptVcARSC4TvXXu
	 mOKoU2iwjGNAN5wuSFe2MGOdsy5ekgJOaroPCXJZIHtEmAcBWCf8elbJ/qlhjLSwYI
	 FITMr9Gj84oLa8vAy1/TG1bSwM4Z1iHP8XLBxbvnH+jf31vBSI8YILBnenhTHk1L1o
	 lRleuub7jOAGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B834FC53BBF; Wed, 10 Sep 2025 04:33:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 10 Sep 2025 04:33:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-c4sRB7NYxa@https.bugzilla.kernel.org/>
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

--- Comment #106 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
I notice that pretty much the EC is stuck in a GPE status bit loop.

> No notify handler for Notify, ignoring (PMF_, 81) node 00000000be324725

Can you try with blacklisting the PMF driver (modprobe.blacklist=3Damd_pmf)?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

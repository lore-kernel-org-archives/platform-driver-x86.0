Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7A39C013
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774480715; cv=none; b=i3Jxvt0pRTfkhfIk/jalrh9/sjRXMcQqBBuWY0Va5DzG/WfoMFQdg7y1j3+YkO5kGcZda+BGmhot7fWikm6hlSoE+41ecyzES89NfYeEg/D7eN9kkPq6AQmKkVk0ydV0JVg8CROlb9eBXD/dZbr8fO2gHjwAko8nEVnqF9/GFpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774480715; c=relaxed/simple;
	bh=BEN3TDFGAfMFTty+bLvik4i8qLqHX8MWTcPAoSrpM2k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DKbcC4zeVfec3MXjLcTH0w9ZulwFdlTb4mCGggYQF8c8Pd0oiN2jD/AiVWF24IbKIn1N3ydLqMv/S3+uPTxVZRVuyglQ9XsEb4vBliW7eNy+fDfRICjoJ9JTxwfg1oGcerIKrFV5ijkSAmc2PhqwsSA4tdq5FPN83JcryVSw1CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ev62Hp+O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ev62Hp+O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C370C116C6
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 23:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774480715;
	bh=BEN3TDFGAfMFTty+bLvik4i8qLqHX8MWTcPAoSrpM2k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ev62Hp+OE/KwRMjiUD9N/9dHC1wQgrv4jsyFNRyJ3YhoMy863IvOJk6f3OB85G/Gd
	 L2WFP010dKs2yTZYKehP+UtXWFxP9adVDe180FNVcYHWEl71XxyzulAvTRHEkMpQxc
	 9YuVxC4Qm/5tJuRVBty2sdZwIBYpWhEIVa+WdJCs8NtHvq5DGrLoL1Sos+qLoA8c4g
	 qZ1NlMglWM1V2XyZSPWMLDmCTHeNTgrUQXN6HyRNpe5DYS3q4tnfohfouxgKmySwfL
	 jUdU+BL/bPzNKECW578EuleUHtlm7bi9j3XL12NyRp8aaJh8+etbTkLxsxwxf6wmes
	 TieyM3TCh+bzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A4FDC3279F; Wed, 25 Mar 2026 23:18:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Wed, 25 Mar 2026 23:18:35 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221238-215701-BIoyOOJuAd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221238-215701@https.bugzilla.kernel.org/>
References: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

--- Comment #8 from Armin Wolf (W_Armin@gmx.de) ---
Can you test this with kernel 6.19?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58301C8E0
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712727930; cv=none; b=DShlTHLTgl159eNSt49Hl2urkIpw7SNW0JTKVdOcLn1o+XxP5pYvlPPLLWtkjkqhX2Q7IIWAi3U7lOw2rsRWRFeECNhbwX8vWCzWwE4whIVex4HyuH1T7tIIapMDI5iv78OGlHx2qcL93b0HRt4oxB7VozhWISNqyeHsU77+Pl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712727930; c=relaxed/simple;
	bh=8zXU0nWSOmwHDBhcXIvWVyRHo19EW8vcbchpfCKHFjU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eKyAtv5/tMjT4NDTC+bwLB/DSEB0rUUCgv89RzWO7jM2e0YMg+bLyDdcgBJ8RywmMalCmgF/e8isWJG/8XL5jDj9zazeoAlchUs3EXgGFfG052vzYtsP7tcn43DkJDILiVU+6oIBHGWWiQgW3lmyVRHPWBXAPYQEjToboLhRpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MU6jnJ+L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MU6jnJ+L"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB277C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712727930;
	bh=8zXU0nWSOmwHDBhcXIvWVyRHo19EW8vcbchpfCKHFjU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MU6jnJ+LUIJy6yaIA2FcCKrG1KhZPgOsfboZjae1rXCDh7DWjaZCWd5V3zcL5KGiA
	 J8Uwj8f/MC/+Mo5Z23gsMwU3/fnrV79oZeLQFV/XV/jYJEtIVfNCgXtt6u/yVk73fb
	 PRh3CgWvdov2bvib2R0tIayFCX1SAHuVS1Krqk00QVsX5PjqUx8ZXUP2Sz33zlFHhV
	 TblpVagJAk4w2arQ70HN2mBYm4OurfCOiPinA+pcjM/M5sWrTQ3tbz/v+oWM1qUXq0
	 FcrVWPA4smiOQmfpLrzGiIUWvPydRXqdb4G7II4FXCs5ngF8SEqF89OqjL1JcOSJ5U
	 oxdWprh/SuG+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D776BC4332E; Wed, 10 Apr 2024 05:45:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 05:45:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-Y5EsmeGokI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #19 from al0uette@outlook.com ---
Oh sorry for that, here's the new result(amd-pmf)

[low-power]
sudo cat /sys/kernel/debug/amd_pmf/current_power_limits=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0

[balanced]
sudo cat /sys/kernel/debug/amd_pmf/current_power_limits=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0

[performance]
sudo cat /sys/kernel/debug/amd_pmf/current_power_limits=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

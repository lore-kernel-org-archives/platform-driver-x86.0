Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D924E3A1E6C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772194481; cv=none; b=W4u5AtNDYwBcfYMP+3UOIYMuNrqsKb2y/LysUhis2EpJWRx4AXPBC1g+ARI9hsNFdigbmZkkRXdv0sCl4rIZplOTD6gZ8W6fxWrzooqMjGVQ81RoX7RdPPeAzSmHED0eDukv8NbyIB1zWIuMChbuWsUmu5ld5RwdSw6p0mSgLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772194481; c=relaxed/simple;
	bh=Yx33czid6bp142YSy3Jhv4oozeOyIbUltoUtm+WYXO0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wm6DAtg8xdt8yA6pgeyi2XlD1ecCpBEb4UfI0GnmoSx52Qx2QFecBHKi1azbG0bK5itABE/K1hXhoowyaB0Gh2w6W3CWrcQJ0ZS56YXEnl0a5aSQrvcJYEYbs4OJSxmC/heKZsq00TzcVtEUVqG/cBiqTpNcKMKmNo8EkuFACZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHv8qzTq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHv8qzTq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72ABDC116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772194481;
	bh=Yx33czid6bp142YSy3Jhv4oozeOyIbUltoUtm+WYXO0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qHv8qzTqz6N41aNwzx/Fwcx8x4TpmAYA48Qi7d5426hAMUvma6OvMAbNM59QPHvaI
	 8YgZk1q05ku5tZQ+0Z0ka+pcf09ml2TsyTGrv4u8itvqw6LLVf+QFi1el6fObh1yxH
	 4sg+Bz1RjrvcdBjZhYpgug/2jeh5K9ZXzZMuwSG6a8Fk7Bs0pcBY3HXNbiFQ0WrPh3
	 9dTro+6XxIGM+fdBr55kax1Nogh0JiQqkAx49EKcFNcjUG8i/x1QZGNoylXaulk9iV
	 3jNpVe8vhE/dy8xKxZP2YE6JX3M/6M/5oWRiz6v2ZFjNJKi16/0IJNWhHWdp75ez+v
	 tybMVDcVE2T2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60506C433E1; Fri, 27 Feb 2026 12:14:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 12:14:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jie7172585@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221149-215701-uYt2Hi8HYE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221149-215701@https.bugzilla.kernel.org/>
References: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

Enderlava (Jie7172585@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Jie7172585@gmail.com

--- Comment #2 from Enderlava (Jie7172585@gmail.com) ---
Hi Krishna,

I successfully applied your patch to the 7.0-rc1 source and recompiled the
kernel. Here are the test results for Board 8C76:

1. Registration: success
`dmesg` shows `hp_wmi: Registered as platform profile handler`. The previous
ACPI/WMI errors (error 0x6) are completely gone.

2. Fan Control (Write): success
Writing 0 to `pwm1_enable` successfully ramps the fans to maximum speed, and
writing 2 returns them to auto mode. The physical fan control works perfect=
ly.

3. Thermal Profile / Power Limits: success
Switching to the performance profile successfully raises the PL1 limit to 1=
30W,
unlocking the CPU:
Profile: low-power    ->  PL1: 55 W  |  PL2: 130 W
Profile: balanced     ->  PL1: 55 W  |  PL2: 130 W
Profile: performance  ->  PL1: 130 W |  PL2: 130 W

4. Fan RPM Reading (Read): fails
Although the fans physically spin up and the control works, reading the hwm=
on
nodes (`cat fan1_input`) constantly returns 0 RPM.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

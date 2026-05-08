Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3623AC00
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 20:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271407; cv=none; b=oeMESL2xmxQ6j6LLRN4UdpW78SCiA0kYDEYGdhi0GHKHPIT3SnayPuX1Zyo7dmebiY75nzioug1vgNVsbEdLWW7aNpYQDiNt3Djx5LR3cV9UDgvj7vlQ2RsDQCFP8QmRKtoSo4TwvQypUDOu8ZBhb+rFEFX2u9QLwe24FoGOZ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271407; c=relaxed/simple;
	bh=IYaSE9iFD1OC95WuVxi1RPypVXECibaAG0WX0QHO3a0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D3KCJ+Vu8laryRK1g9COzcBIetxd2ad9EOLicaMqVyfCGW3EIHOAQ9VV2o0jInY3n3EW/5TbHX8QG9/Yx542lbjj5uvK1l8uoAXWVBAE//XXAN3Kj9cBdpkBQma6BIx00W5f8bOgPWAGjkZDLioaMEUos2yJLpJvTkSJlGINFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeAtTokp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeAtTokp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0BCCC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778271407;
	bh=IYaSE9iFD1OC95WuVxi1RPypVXECibaAG0WX0QHO3a0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jeAtTokpq1y+GlWyQyXTgGNIVl8tgqfZ7UR9opg3hmsGlLZ+ivUSqJ8/Rb0ABfvTe
	 KBH52QrgmsN+s+AZcfSdKif+mBmh4U4esXEMJvQ25CRw7H95wJhZNMrFQnLa9uqH99
	 VaIvbAq6HbrmZ8jwR/GPjI1JCCe53uU18vHw93W4WHDyV91Ii137rPJQQ2FrRwFNUC
	 3VIfZ1Swm+VFBzyWcoZ7cSIwAOIfmcx595PY39iVqoiA1+YXcFxLd9V3laZJeaAeNV
	 5Swk8cQxze9MXSEV6dAZAj3mZ5ICBSmreJsuljNtdXdomAMkKD1ipGiLcACxZkLqdh
	 KDEP9H+JROLfw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DE735C433E1; Fri,  8 May 2026 20:16:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221419] ideapad-laptop: brightness keys require continuous VPC
 polling to function on IdeaPad 3 15IIL05 (BIOS EMCN60WW)
Date: Fri, 08 May 2026 20:16:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ladha979@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221419-215701-uvv3lq16XV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221419-215701@https.bugzilla.kernel.org/>
References: <bug-221419-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221419

--- Comment #4 from ladha979@gmail.com ---
Update: the problem suddenly being fixed is not really fixed. 15% cpu usage=
 on
idle.

Have to run echo "mask" | sudo tee /sys/firmware/acpi/interrupts/gpe6E to f=
ix
cpu usage and go back to the workaround fix.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

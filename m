Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1624116A395
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 23:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780185055; cv=none; b=kdCVB/ECv4m5tDbmOTvR5MJJve1vBI31fdAuxPCc6LxWnThgOIAojtc90mdWGMpYL8dnhIrK2dk+lma5LE6evO+B4Sm9kN9eFN/eiCeBAjHgCTWY1u71tmSyh+GC8g73oMX0jkMl4kjMTtOYyoaqSDWDWL9Ky5gLpYQGhx2/1PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780185055; c=relaxed/simple;
	bh=E3hDrkD8XFYdmVj7Q4O3h8iDZ/DTSCwL/k+V6FwncA8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OuNvVLFtoJDrEMmMJoGaGwxFhedCV3kKJ2c7nW4ru4KYgTDtQr3xzI6PIZiQytPQ0CpwlL+Fwz30dAkdDMrH0ngrcMqA1bsYyPA19oN5Uu4A5nEtActN2Iy7UXzql5v5f2Ss+qjtE+n+Lc2I6WKexQL3NQ02k7ba6EoOG4Rr0xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZPDaean; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZPDaean"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9896C19425
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 23:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780185054;
	bh=E3hDrkD8XFYdmVj7Q4O3h8iDZ/DTSCwL/k+V6FwncA8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gZPDaeantf6JDY9o9GPc6geez8X1+hOtmKDBVpzM3G1G3pxnH4MoAeJ8FxhQmo7Sl
	 4UHi93EcBTPX6YNsgj/+8Ex5rTrwfWZD3Q3hE4uHtBs1sviUw8YgitquL1QF2rog06
	 OMOE1U/P7GSpF7vJTzKGRgLAllA+VOVq+J+9lplu6Co3w2xm3zCPPVRqmzT3mcYA/D
	 R7DHOKTcLDlqwa1BDFA26wdXg/MU0emPVAAjj+Wl2Hn9MmLmY4h7z6Ff2E/YHTq97m
	 sc2fTvglhYN6RaL320o3TbXueNK3SrrO6KRZ4t7RqR4RS/JUJkoKbq06O78FaShuLW
	 1NGO8Z0ln806w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88FD1C3279F; Sat, 30 May 2026 23:50:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 30 May 2026 23:50:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-7fT84s0IpC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #58 from Armin Wolf (W_Armin@gmx.de) ---
I think i now understand what is going on:

- older devices report the events using WMI and can be manually
switched over to a ACPI-based native interface by executing the
ACPI control method "OREP(4, 1)".

- newer devices (yours) always use the ACPI-based native interface

The driver currently uses the WMI-based interface and thus does not
receive any events on your device. I think we can fix this by modifying
lg-laptop to always use the ACPI-based interface.

I will try to come up with a patch, give me a couple days.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

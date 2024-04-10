Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874817335F
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712759916; cv=none; b=fOE7NnNrX6H+htETTuePEgNtp8ECniAqs7B4aouH2tkOzhfedg17W5r0j3LagEMhtYPPcmkMF0i7ZMgc9oBRIO2thL0Yr4cdwDbvQmDDLRQVs+weadcZ0Hoooel3DU10xllFs9oNublenOGxiwkykUJeyuLtp4PGKsiDS0yFe+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712759916; c=relaxed/simple;
	bh=BNDyjmuTEQ479K+XseTQec2ttXbldnbQdp5CYC5aRtE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TSRw+OABAJ1zLfZ0IW1SI6K8GmDb+y6VlI8C6SjXN6Q7+SWMUJ4lBQR4oWgp5efxjS9FC4ecAl2e968w5hbhk1PJWn0fiRssRkCNN4fPyGwsh0msRwmRdrLnfkLi3fSvk6t7X433A1vCMPR/c3w0AvG9lyTMO5/57raiV8qnKzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbCcRszm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbCcRszm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B296C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712759916;
	bh=BNDyjmuTEQ479K+XseTQec2ttXbldnbQdp5CYC5aRtE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YbCcRszmzW2ewwfNemLRxHtlv9EhytV9xBZxkaPnIceX0CVhVtgN92PNa2aMIW7WZ
	 Ez7mdAfD8ouSLVRTtfw++RhZB3BK/43987JDfW3Dbjpi74B8EvZk5Rbx2AWPA3qMex
	 wOTBT6o4hc0rNYIZTBsOZ5cLw+h93zSlI9Fa6/nN6kKqHGJ4Dr25n1TQLdAeMi4hMV
	 VP2iOfNouYjOP7XQJuf7Td0jwl3PUHzRidRskyikikuzTa1EwcZO9Dm+QO5+AtiGcv
	 m8aD0bs3cGLxLffBGMvKN9wrF7UOha082L0CFnWLtTMt96EL2j0oVethCp0RDQBEuw
	 wnSOaySCbIr7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E0CB4C4332E; Wed, 10 Apr 2024 14:38:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 14:38:35 +0000
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
Message-ID: <bug-218685-215701-c1hToSzPd8@https.bugzilla.kernel.org/>
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

--- Comment #35 from al0uette@outlook.com ---
(In reply to Mario Limonciello (AMD) from comment #34)
> I've posted a quirk based on what was in your dmesg attached to this bug.
>=20
> https://lore.kernel.org/platform-driver-x86/20240410140956.385-1-mario.
> limonciello@amd.com/T/#me44972a836808229f63a8afa58aee837146f26ad
>=20
> Please have a try with that. If it doesn't work, please get dmidecode
> attached and share the dynamic debug output when amd-pmf is loaded.

OK, thank you, I'll try it. Should I dmidecode before or after applying this
patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

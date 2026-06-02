Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1762E1ADC83
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 04:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374858; cv=none; b=ZerulzfzkFQ+pl28DgguK3+r8OW9ohIGtTz58RnctlKv/sV1gUcuDC7OTSa1FqSsbU3eK3/jz6Uh7ibMdstDH9qXDe31SKng5wP1juHFGq8kOuls7HsIPVSKY4i5k1PTQ3Vgx9I+L/z15QU1+Jac9jxD03pOYraWhU4a6YyIW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374858; c=relaxed/simple;
	bh=F+0ImLhGbX6w7DwoovcXON14gshqp4K1OIczuw7iplc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WjwqvARe3KOckuzCpEcvdgYmq91+9Kt/Bu6dCNiV9tZAjHQ6VNBYQun+QbGQ3kVaFk4kYuQ+SfoaXVJk9RzlXBjN2s3OxA5FKcPbOce/cP0RoFOxsAs/+aIMRfPoBlJv04EvMX7ek1+rQEFfNhNgzPcJL1S36XX2fVWz2yPMjJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2XecBFO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2XecBFO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B42D4C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 04:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780374857;
	bh=F+0ImLhGbX6w7DwoovcXON14gshqp4K1OIczuw7iplc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W2XecBFONq+BrC+g/4rZkoAlnudSvw8w4GSd17ou17MIcPKrqTUUhe3Qh9pYG3x4Q
	 8M1pJ1KCnS4ICjpSAeHoEzCtPAoxn/CyX4Giv/IIDiP3oNJAeLHSKQhoO+zyXfSAwl
	 L6YdiTcjcdODCEY2Q8m5ehTOPzK7U4Pz2IvrYFTVGTmwTnv/XIuV+Rl8YddNPNmASJ
	 kTg0ZyohtCDENincQ7lcgp28jPQ94KKg/VLhtkQNcrhKlDg1gXxOZdrUYK+y56pDY9
	 OYBHyUA/bjRNFwVd+nwFwtAYvUX/Jy2/Y3jqLsPYtCdtZ3aOT6U8EBC55BDilXklDk
	 PDlwpWBOcWhSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 970DFC4160E; Tue,  2 Jun 2026 04:34:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 02 Jun 2026 04:34:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tacodog311@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-LoM1r8Z3RE@https.bugzilla.kernel.org/>
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

--- Comment #62 from tacodog311@gmail.com ---
I added the new driver, but Fn F6-F9 still don't have any effect.  Below is=
 the
dmesg of each button press.

Fn F1:
[  234.298681] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  235.717630] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  235.722288] LG Gram Laptop Support LGEX0820:00: Received event 130
(252116994)
[  235.964304] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F2:
[  296.616380] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  297.040336] LG Gram Laptop Support LGEX0820:00: Received event 128 (0)
[  297.251384] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  297.316138] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F3:
[  325.225102] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  325.723084] LG Gram Laptop Support LGEX0820:00: Received event 128 (0)
[  325.857201] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  326.075831] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F4:

[  344.611414] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  345.024743] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  345.041044] LG Gram Laptop Support LGEX0820:00: Received event 128 (116)
[  345.141209] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F5:
[  371.095864] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  371.624840] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  371.737024] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F6:
[  396.319396] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  396.833509] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  396.834992] LG Gram Laptop Support LGEX0820:00: Received event 128
(268435456)
[  396.988001] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F7:
[  417.595014] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  417.936728] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371985)
[  418.106754] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  418.217023] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F8:
[  454.740476] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  455.211017] LG Gram Laptop Support LGEX0820:00: Received event 130
(1073872897)
[  455.264917] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  455.369903] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F9:
[  470.879991] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  471.576893] LG Gram Laptop Support LGEX0820:00: Received event 130
(1073872896)
[  471.677192] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  471.681958] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F10:
[  488.525493] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  489.053501] LG Gram Laptop Support LGEX0820:00: Received event 128 (120)
[  489.149477] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  489.184508] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F11:
[  503.160266] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  503.631288] LG Gram Laptop Support LGEX0820:00: Received event 128 (0)
[  503.765229] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  503.920250] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F12:
[  520.136252] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[  520.849363] LG Gram Laptop Support LGEX0820:00: Received event 128 (0)
[  521.035001] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[  521.160264] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

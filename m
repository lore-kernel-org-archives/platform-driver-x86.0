Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9069E32AAA8
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794630; cv=none; b=LL0BZxSE1RIPUpD/qklDYW0uwkPHWBVwPnnGHnX7VwTcyRc5apfnqdFlKuubxNxWaU2E5hlukPwYVE/C6idnv7lWdl2AOqqRIFQMa8kponltXG5MQmM7qLIMPnlMYqsNCouL/QztrMcpt7PW1JYuL/pgrEZ80uYzN52tASZsiLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794630; c=relaxed/simple;
	bh=rPbyeGp1r1HfZMoknRxtp+X0iZuHKprrsGiqRepnZm4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fRluJPIojXhWE9BWgXWjgKx0few2t/lVYK+MD7Vp3uj6GZt83VzEYezCJYDpUIjix7W7n2VqUpDMxMEB/u9M5nw7L3NXfOscwtEEunXOquGrztbOcAmU/WbAN/Cwtqk50vv/LVrl68cTBOxKCVluEUW7nitrBhWhWgtW6owGa9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyBQHzav; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyBQHzav"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58333C19425
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794629;
	bh=rPbyeGp1r1HfZMoknRxtp+X0iZuHKprrsGiqRepnZm4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CyBQHzavFAV6yRsdiBiqzvYQgIms/qE4iRxl6BDQhQwUpEa2fiST+pGjBMxu22Gnu
	 ZtsQ/fB/ybQmiGTIz6bw22yNst3ICPYdCOd104twtapRYr0m/oQeLQbTnUUyoXzxJD
	 w3V1cJGBpVgsyxjvYzFilwUykp7KLdVZRfZ4VJIOnyiSxTgFOuc3c/sOc/6DWkwUYf
	 nxcAyL7OkU6AgiVHOX70tpmxtRx73qO2GbQZviWqCV+G3WFw0+ywBHEwHUcR+U9Kbi
	 Cu4vPCXzAKG7gWgAMsipL5vL5ArtOtJ+KmShv9zPIZEYRWl36O7jhi4zahD6SPUvxn
	 vLj99RJzqAcUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 520A3C41616; Wed,  7 Jan 2026 14:03:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 07 Jan 2026 14:03:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: soyer@irl.hu
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-WIFoGp93xP@https.bugzilla.kernel.org/>
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

Gergo K (soyer@irl.hu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |soyer@irl.hu

--- Comment #145 from Gergo K (soyer@irl.hu) ---
Can someone upload an acpidump output? Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

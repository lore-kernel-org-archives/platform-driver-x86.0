Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97D136A
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 May 2024 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715648324; cv=none; b=iU39kXBtPjccgI8oPLRUVNdUFw31HwbsSz3wUmIm+bPFkjFPHXuf2VgKSVCcnUfunPfVMMS3cb76N5O2LGp2htihtbWiTIM04d61BAK+0Lkn1ZgkWC78mPX4Ns5ag1CHTarYdba7QETaGuCHwF6ItjTb5xe60xdhH7L0mnO26Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715648324; c=relaxed/simple;
	bh=SL0/VGJDt/DL3mQL9csiimokyerIGMQGoc0PFDLB9zw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tlRhRqba23XiwO1DE971/CP1+XTzbSrcgD+hJp5eBnLJVx9iHioDUI6IT76lj0bWoAGR1O4gyxt24Z2J4qr3iS9MO8gfA5FR/KbrHGNRCPgi9D3plNxeRjo6l1i8IVJletIdjPLrKAYcyHTtoUmoPVqWxsMrUEtmVOVf24LYWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9FXfPMw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9FXfPMw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69904C32782
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 May 2024 00:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715648324;
	bh=SL0/VGJDt/DL3mQL9csiimokyerIGMQGoc0PFDLB9zw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a9FXfPMwlW1cGo0zKHsvFh+uElyCOyEXU6Il8jsDLdbYTWeIU2eEwURg3u6Lv0HUF
	 iFbACDzhnBRm65wLazkiRxxg4Rw9VrCHTGh+X2BjGc7vTa8mwTAVMY4zVE6wBZIdT1
	 BoIdEHhhh/wwPXxMJZYkqmZc30NloLhmE+p95/bemzYU3fhIlluyahvpQWm66T0Jou
	 B3Ps0wd7C23H2iif5MwiQaS+wYD49lkq6uyVuLebNGiRaq4hEMyGOaVu9UCKVAvoUy
	 9S6sf/X2OYCO2Bt6h83BC0k0p/59n5CvZ3vUSHwSjFGC7FrLphVxQ/C/Lz8daBHxWU
	 NatEkAUMB1gOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 552D4C433DE; Tue, 14 May 2024 00:58:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Tue, 14 May 2024 00:58:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-o7AsMI3Kd9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #9 from Lucas M=C3=BClling (lmulling@proton.me) ---
Under 6.9, from initial testing, it seems that the frequency scaling issue =
was
fixed, possible by a change in amd-pstate? my guess.

I've also tested this:
https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/patch/?=
id=3Dc7e29dcef9ca4a93eed092e6739277a92a64fbe3.
Seems to be the same as 6.9, tho a degree more conservative.

6032 event spam still happens.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

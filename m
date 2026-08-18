Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EEF47255E
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057343; cv=none; b=UY5z5JdeoTsqalAmDpB9549+gUl8Wn4sEZx7dPdOn1zWXGGNckRiy+iz2EnB4OwFGKbvlXfXYmqaQDwB4yNgnrlgPhkmCgK1EyIZCoSlEu3gYUCAQr3tQ+Ho9Ip1n++C3vaxHyta5fgP7YD78YRdazU7sd+YlL6E1wTASUoyPYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057343; c=relaxed/simple;
	bh=Q6mxO7YB3iHXx+mmtPYzSoigNbCGicLLD0nxgeB8kj4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j+O1+5iINdvq7ZJnPAASQle7/2vQ6x8o/9Ca5mK7eM7YWIfCpa9Ekqe4LeRVQZpd+xP5WZJisINmEd9mcGvj/gH1usHWXLJmGstbnXNHhzM5gbEHBKhUlMOpPjVcy4rK++oof9EwM7Wtg6L1LiXM1otqpuKy+Ym+YmBQweSZINk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1ZlZxFZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1ZlZxFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2D67C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787057342;
	bh=Q6mxO7YB3iHXx+mmtPYzSoigNbCGicLLD0nxgeB8kj4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c1ZlZxFZHNXtQIn5L0mitUbQ4TJs2iQ9uHraaSScgkD9sAs3YiaJ3ArC1jk5lxKA6
	 jBXMM5Hj8BljeBJcMoVi3CaTiMQBbVwYL2QEWS2sMrvmskJGvn4bNnUBjX8hlSHUpo
	 yJU8WhNOL3ya3S72t8FF8vYX+Uw/tMyIt3X34dhMOI+5PEfL0KORKW3y+1GebKGMRM
	 0j5D5ZPgTye44T5c3ofx1fKgMB+zCT+6UUqnP0k0GgU7yc35FeUt36Iy7hd49gEtUo
	 hTsbmuzYQD60TC1zxSR4+nDzXKeTuFyb+z6MLvSCys8yLAUnqMGTh0GSVmFnJlTerL
	 G8nOLsVagbH0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88CAFC41614; Tue, 18 Aug 2026 12:49:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Tue, 18 Aug 2026 12:49:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: technosfan14@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220926-215701-Jj9eCOoutU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

Suryansh Singh (technosfan14@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |technosfan14@gmail.com

--- Comment #2 from Suryansh Singh (technosfan14@gmail.com) ---
(In reply to Gibs from comment #1)
> I have the same problem on same platform on kernel 7.1.8.
> Changing profiles does change fan behavior, but RPM reads 0 with hp-wmi.
>=20
> Package power also seems to max at 40W no matter the profile. On Windows I
> have peaks of 115W and then drops at 55W after a short while.
>=20
> I also tried mapping my board ID to Omen or Victus configs but doesn't wo=
rk,
> the ENVY seems to be different.

Hi,

Could you please provide your board ID, or clarify if it is the same as And=
res?


Are you sure you've tried out all Omen or Victus configs? The latest branch=
 for
the platforms/x86 subsystem (pdx86/for-next) has an expanded driver scope
compared to the current upstream version of the kernel you're running, so
consider using the code on that branch for mapping your board ID to specific
driver data in hp_wmi_feature_boards[]


In case none of the existing parameters apply to your ENVY laptop, the EC
behavior and specific quirks required to get it working will have to be rev=
erse
engineered and patched into the code, rather than the regular patch of mapp=
ing
the board ID under predefined parameters.
You may contact me at my mail if that happens to be true, I'll be glad to h=
elp
in the whole process if it gets that complex.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

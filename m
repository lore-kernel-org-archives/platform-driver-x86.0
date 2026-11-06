Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970168;
	b=gEBuYx1HImB5JPfjrWWJYWLNOoeJUVOmr2lTnK4s73yHekQ2Z0Pwu6eNrI3rvDhJQTFe
	 Ik5NliI/5ejYtufq0OXoKTzHmcAx1/DFVwNydWFleL1lbUbYCcMkPgcIKtvfgQfXwrplR
	 9RhfoVip/CiGj9eXSHzKnV2D75deIi98E7hAj4SaP1X41BOqPQXc991xklBH0rBB4S1WN
	 lnliaYz7S00hROEpafe604EWB7vsnhwQZchMhJbrBkMaIqBasUHEO42SwT368ktNUDvYI
	 o7JarVSxYmV2ncsAXe3wV/BGVJ0c05FIeov5WWPncG65rF8Ca0QW+jvEQOH4u75f86Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970168;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=Lpl2ZNGzN7yuXBLYVJI968I4LiPHehi6Y+sD+lzVk5k=;
	b=yl7e44XNnlJiHMi5Dep//cEj9WXBSldVtaS7Ec6b4jo5UEvkDXL+P/rvd7N+NAfrm/EY
	 B+Tw03V9LiVmxZfrwyoUi30P0r/ZniXTd4QljxRxLy8+4QmDjgxIWKBc+PIuUfCM9cZGT
	 NqhnNz26+3SwvLJxpi4Fh09aRokNQHAJGZRXHHC3CbwoxCqy1FYfJIpaW8FO7C31rnpRc
	 fWBzLZqJXnCtOrLSatD+wCvpEhDruvI06gsRYvA8LWlxnwVB27PtgBihjpz4J3wgDN1Q2
	 1uw5ePSBtaLItVA/2HBl7ZXTvr+cO/C+7K7plgd0rQQvwOa3+57zbGJrJYbjRwcnJZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IPwxr7Sc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7C5606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IPwxr7Sc
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B2041F0089F
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970168;
	bh=Lpl2ZNGzN7yuXBLYVJI968I4LiPHehi6Y+sD+lzVk5k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=IPwxr7ScWSIXKX5ZbzH6RPmiFuo6ADW0CPYmXswglWr7wguQpVPGnPM0id8mi6tHW
	 Qa+QBHTy640CMWxCNhR0sYlZf48IvtmfNN0CNBXVAiFyDIu0/en6pGN/II/2P0rIHy
	 uzOw8zqO2WIiXi8K1I5RXIw4QaBL9KqMFB6aMm9+21Fv4Gvg36iJpHJNZAyKKhc2Gz
	 C7diMDTxU38+qCkhfUcGtO8j0JCSHv0VlV8dP62If/WHAPoZLppA4ipRYz6XRJ9v/k
	 Nttkg4VUZtpIKCfsnjrB6UeS5PLVDGlnoqs/CeFGyx+4ATC1u4v5GE8bcpkTjtvezD
	 XE+a0XmU8HErQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1BA4CC41613; Fri,  6 Nov 2026 13:02:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222240] acer_wmi: Nitro ANV15-52 fails platform_profile
 read/write on newer BIOS versions
Date: Fri, 06 Nov 2026 13:02:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nghiant@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222240-215701-RsJCXW1x3v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222240-215701@https.bugzilla.kernel.org/>
References: <bug-222240-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222240

--- Comment #2 from Nguyen Tri Nghia (nghiant@mailbox.org) ---
Related issues:
https://github.com/0x7375646F/Linuwu-Sense/issues/131
https://github.com/CachyOS/linux-cachyos/issues/1088

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792997973;
	b=BisqeOB4H1W3tk8RXdeBRrC2mpZa3SkZ1j2q0N9x0fL55o2gYOtAIGgojZkMeLWnUa8K
	 8jZkPp1CbEEkJAWBVFVCPn53v45DSv1b1ek7wLgBPubhfQ0Qzu/+SsVNjs8iHJnltTPGA
	 +GoxXFiU+P3t5RMZnBZBGxl+A2SrgD2LFgElhdIddvyBcBZKFKCHF++qy9P0yYFTSypcB
	 fcb3tjloDFwO3RwSzStSKodc3hZoZP5MUNJM3NPl+d9rErndRVdyT0JQG5VTXTw5GmigN
	 xw5mxJun/IM6Zp947VB5YPWD95/fnUVKOLDnkeL7uIaxj4lj3reYhv5f4IbYtJXXlKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997973;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=pcrxq9F9Nvxy69Rxbr7D3r7yaFW+JG/5zQ+4hZUEIPM=;
	b=RGQHvVdvcmlC1nIMgLN879+LaXaDaaTaBCaZYDwdlBoFA3EQd8fTG09jw3oLnXIicjXB
	 tHGHi704+cJych6Y7vWXcB3Ron8vNQD3xL6it3dLF8P3IPnHWjIwXRivgHaEOmh5MD82n
	 PH3ex0+EPbedxXfYuIvwvkdsrD2RybzwD9q/5oZY1CrM+7m9NfIqAHj/L0hd3dbm9eLVh
	 dMRm/lpiAeHw2bWPLU2puFTKfyDmEKQnx6h25fU2yV/9pjYsoSM1SmulHFRVE27l/VKPh
	 oPPJj7A6sKTwJZGZ0pVSNm5mY0gYP5tILdYB3SBNwjD7fNWUErJOvyC0BMupSK/H39w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sPoFwxRt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476FA606A31A
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Mon, 26 Oct 2026 06:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sPoFwxRt
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD636513C0
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792997973; cv=none; b=YnHn/fbm4YoIcHSUNZNGXjkGAAaQrfgHl1Exie0yNlcZACXsVdYp32Mx6uebU5n/Q8d57HXc/O48kr0jwO9ydlVkNwaWhNhkAadJZYxW1Rc5SZbLsK8xTuO6dLsYIMZ2bPIbAO4vk0CXxDqMnCO6GibzzzBH9gTqS7AGTi9f7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792997973; c=relaxed/simple;
	bh=BQD+zMttNivgz5KOen48kT4UTbkgsS/z462Jn35BU4Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qRmw8J1AL0IY96iQ7n7zJwHhM5X7PiHCYmtVFfhUH8Ptl4XBXKJFQvj3vQGAWmioJMP5MOe3wRvR9M0PmKNpjmptdi1pRof+b2XMTmtCBbP7jxeC0tEmTRYo802FOUZdudbQ6JsmWNrm+bbRU4sNYkZt6EGokQ84oT+YWqMXXo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPoFwxRt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87372C2BD01
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 06:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792997972;
	bh=BQD+zMttNivgz5KOen48kT4UTbkgsS/z462Jn35BU4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sPoFwxRtVe9DY8w1ITQCLMrri2Y5ru/tyRLhCR4TsOG2kNCHCtH66CNSCwrcmtybm
	 APUx8V75bZa4U+k8FTJv+tm50RZZBVgvu8KedlquKHO2rvYlCekXGct8ERv/KSKdpq
	 gUp85jfNnWE+pEv5XPzqI+VyZDspfLfCeD0p3txM/+x9skA2PJ7Mi0hZskgfoSrfkx
	 1gcqBhsaNN+WzPWasMc/YIr2MUNt+yeBxIKg02ya6M05KJm6i0ZMdsNTKrJ2zbmwPE
	 4aeBeDTMl81d/XvZERy/SxcIduHPVlyJnn8X76aCXQLgr+I0gfIyAaeadWQWd7l8Ym
	 I54rSnmnEIULg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5BF05C41612; Mon, 26 Oct 2026 06:59:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Mon, 26 Oct 2026 06:59:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222161-215701-uwoL9gc6tm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #9 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
> I should i have precised that the bug appear in 7.3.

Just for the record: if Armin can't figure out what's causing this by looki=
ng
at the code or the behaviour, please perform a git bisection
(https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.htm=
l )

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

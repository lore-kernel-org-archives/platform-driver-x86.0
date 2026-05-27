Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD94272801
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 05:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859462; cv=none; b=qDOpA1OMEV6nMhtRZcBloBibRQ4GPCvFJao5toUAEVOE4pLLpxHYvff29kku78PsjjGDjvcKI3WbcA7eNf9hw1StLOkCXUVPqli72kRg8Zrdxa23PDLbWi3g5sL1pmBZeh7u8LQVeaqsJi7aaVriIvdSxRNOsrPjItKCotDpC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859462; c=relaxed/simple;
	bh=VFVSVG+c2IJUDd8GFIzTffVJWForuVFqYosvrzIPYck=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rTtvZpxn20M1wGEKtg432P9Cc7iN2u1mvvcoJgLIS3ajrACHPpjhIFNSnvC2AEOn2pgY5mHWCiZJmY1PMT/CAJulAXoF+hL4rzANwB6TNAGjIJsOkZYChbr+U+XG3zqVGMbBmGM4oJIk8j3/stcjrERd4w5y7XBlqpZSMvxoe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cedyBlzm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cedyBlzm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5CE5C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 05:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779859461;
	bh=VFVSVG+c2IJUDd8GFIzTffVJWForuVFqYosvrzIPYck=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cedyBlzmDFN1nNC+744vaauIuo/9crfoOnp8LiD8YZziUrgZwXh0GHOwW/sm6FuaE
	 QkE1klwUTXTZaMu/jFgfi44JuMadnJXwwsggCGyZ7x8bfreYXk9pG4XrECBCd3DH4C
	 luu+pC7CCkxegpPIxfo3Ru/ptiVdXF56nm5IfTVn4pHMO3MCwnFnXQpC7ZyyYEzAph
	 bLcNGQp7uq6I67R1SNOSDzJ8lL6di/8cLNAM2LJTS/kB4YOPcMFHNjtxw//x9Jl4CS
	 QolLBWYCbeQAc3mQ0werDgFolDPdtI0KXJv7nmoFTjI7o1lgIq1LM16n75YeLtqtD1
	 R0kuA4MObf2pQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB07FC41613; Wed, 27 May 2026 05:24:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Wed, 27 May 2026 05:24:21 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-aMzz6Udav5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #3 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Milan Oravec from comment #2)
> OK, thank you, I'll wait for final 7.1 and then when not fixed I'll do
> bisection. Is it OK?

Well, then a lot more people might run into this (depending on how many
machines this affects), unless somebody else runs into the problem and fixes
it. But I haven't seen any similar reports. So waiting might just delay thi=
ngs
and broaden the impact.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

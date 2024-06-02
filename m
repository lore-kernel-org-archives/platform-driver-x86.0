Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18944C81
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717340648; cv=none; b=CYpQmwAWWCPlDYfNBt01U22GmX5oTILUKXe1ptdm+py2lr0fN/QfFs8xVRAIcXDGpnvaFIQ4PIDqrIL0xToHoznYVQHpI0UwQzOvOkr0wEq7xpv9wT7j4BIuwWq4zHR677rMqAVWDhb8Hx6SX93De/WxlrUviA5vbBH1tGR+pho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717340648; c=relaxed/simple;
	bh=C5OSNQYdYCjArSc6RKzs/AcZiLaSJR8ZshcmYXF9lK0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LX173Z6ZnmQR0aX1ULkH21c9PhHtfmEwIWnkdo1i6IcSLn4oSA1TfesFwVnooY3FT4N+DUFv7tLZ59xjFTmNgTwWfkZ+fNYDvAT0PJgiJ4BdeDWLFiXVeR8Cm/pZhZgOoGg5eEWQQudYXmsqzbFjlVbBSToxPZ2MZ/vNnVXwaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhW/d7B3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhW/d7B3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C0B8C2BBFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717340648;
	bh=C5OSNQYdYCjArSc6RKzs/AcZiLaSJR8ZshcmYXF9lK0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NhW/d7B3nYFOA+5IK0UEaWyx+WpAvzx7s9/webnmdq5cTGviyzl/WDRnJ7vOsJEjq
	 wNFVHWJYmXyJZfCh574fIp48Es7ZAsEAGH1Q1t04owosXULqMCmx9tgmQ4D3xcKgwb
	 dnX4K3hLG2Oszwq9quuE1VCXkBZWo9wIVZhI7kZBUuUWThh8ya1K+vSZf0yrVgL1PW
	 bFzMZZPAltnktKnyy/Ant+pbvBKIu0tCHW/HSWp6btka0/WxEWFjDIskBOu1QUAjzD
	 YpXTwPeAjT7nU9A8nhZT7ph8UkA2DYJswqmgr2HEbD27L+O+PIwJDPnD8l7tXwRcQd
	 dpi7eqJh+/SFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 57CC1C53B73; Sun,  2 Jun 2024 15:04:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 15:04:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-RGgojzrGZN@https.bugzilla.kernel.org/>
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

--- Comment #15 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #12)
> Did you unload the old module first?

yes

> Or does dmesg show any ACPI errors?

There is one that was already present before that I didn't mention because
after a little research it seemed to be unrelated, I'll post it here just in
case:

[   10.843998] ACPI Error: No handler for Region [XIN1] (00000000f9e347f6)
[UserDefinedRegion] (20240322/evregion-130)
[   10.844003] ACPI Error: Region UserDefinedRegion (ID=3D143) has no handl=
er
(20240322/exfldio-261)
[   10.844007] ACPI Error: Aborting method \_SB.PC00.LPCB.H_EC.DPTF.SNRD du=
e to
previous error (AE_NOT_EXIST) (20240322/psparse-529)
[   10.844010] ACPI Error: Aborting method \_SB.IETM.SEN2._TMP due to previ=
ous
error (AE_NOT_EXIST) (20240322/psparse-529)


> I made a mistake when calling the ACPI methods, can you try again?

It works!
(I think, I now longer have an input output error on battery care limit and=
 I
have been able to set it to 80% and it seems to stop properly charging if I
believe what the power management service included with Manjaro is saying)
The other files are also correctly readable.
The 3 FN keys FN-F1, FN-F6, FN-F9 don't seem to do anything but strangely F=
N-F5
works (which it did before) maybe it's handled differently by the driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

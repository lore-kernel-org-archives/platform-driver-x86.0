Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D92F547F
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321880; cv=none; b=CoCQee4dvOV8STAVGUDO81GsrhrPcfvLldBUn2Uf1l6wW/qQujMY2zSVlobzj9DlJWWVL9DvBDiQjFDNRAiFz7zNkgKcGXssh/dpJMrGqhYuTeQbd67jDfNafcY1YMxzH5yWBMApfREaB4XVlM70I2Qkyiz2Vgf9kZFVmp/W1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321880; c=relaxed/simple;
	bh=ZsBgCaR4o/552wwF4DbqH8BL1tbLl7GH4VuCXv9golM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IxDk3jPeVCZMMDmk6YRfaTP98h+SWrQdZcpzrU2FQ8s1x+ZtdGJ5fNoPBp6b0LXIvSfTmrzsk3FQOiF3GXXP+Wun9R9DPG6PSsgwb/katIbMYcniAlaovUF/XajaQk+arWziyBarE2pS4YvYBIxv32w70x4Z8bF5/nozSNxPX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGusfMcd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGusfMcd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA579C2BCB5
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321879;
	bh=ZsBgCaR4o/552wwF4DbqH8BL1tbLl7GH4VuCXv9golM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bGusfMcdYbfZDnqXE8rG3gmsgMO8smavcF1uXqOjepdhqNMwYwVecwUdUK1sDcEGX
	 DW9oLn2CfjX7COwPli5lsmx+W9RToSVj+rawX877QDo59jY98FF4B9MFgk+ZPHfP+f
	 LlEvUqKjtRNzRSgAVFt3BzTCW5neB2MTdU5eosc/J+sRjSc8uy43vujXFKnPX6mgAG
	 9RPbjh2y/NQbjHdyv7kM9gv90RQFR3iqZpZ+5TJJ6g07E7wuacgpyiCsyua/zH3jBN
	 R2gO4APgF3KP6ES7TV+7Ltz7l81Adb+dscWGx0qYlfm00bJEbmfHrmbrNLXt37s8q+
	 S0xhhtSs0Tsdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C94A7C433E1; Mon, 27 Apr 2026 20:31:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Mon, 27 Apr 2026 20:31:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-dmAAj8pnxY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #45 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
As a general statement - it is probably too broad to cover all 'Ideapad Sli=
m 3'
DMI matches.

If they fix the issue in next year's model, then it would still penalize ne=
xt
year's model with the 2.5s delay on sleep entry.

So if possible it would be better to follow the approach all the other DMI
matches do for Lenovo.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

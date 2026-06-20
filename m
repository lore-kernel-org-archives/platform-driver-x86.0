Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CA1345CC9
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781956112; cv=none; b=DnsOqvvMlo0NTxY6RW/s63pTgrVjMnFEUmtSM56Jc4J/R3GsEybG1yRMQMLwFFx6v0zdwZbVR/muUVugEEb4Uyx9t+dTsXWBzf0vOLhPMhykG9VsYBgidAaT5Gegc55KK3I7FjiBRA+5GABiU+g05/9W8sWc6M4IldPO3exK8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781956112; c=relaxed/simple;
	bh=PNT9Mvm3TsmbboPvelNaMUeldCAI9+CskauhsTzO3tw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P48NpXQ0Lph1fp/V0mxj6uAO10C8MHlkwNMSxLeyN2t0mb0PLBRCSHfkXyINobV7ZLqxK6Vogc7tPeBzqLdu9V9N0E8ftgs+oonx5UWcZqksPzPwHU7kxKHc8FUZxd+VpQAXV4DQmvdF8hqvkLa8NfIT0XjbE4+ed/UjMPxZxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+GRKSHu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+GRKSHu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47B9FC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781956112;
	bh=PNT9Mvm3TsmbboPvelNaMUeldCAI9+CskauhsTzO3tw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o+GRKSHusq3aN8ZPYoI6lDT5W1b1+V6z1xNqYqfsghBtFBgfYVwayydq3oHPa5zHi
	 1iDI8jp0qtXeA7MVfa/PlNQgK0ROtr3QQ+xTOhpmUOgJXiwcF//kK67P41un+u8uTw
	 Is1DRRJA+pxt6kTv/nB62kwc5qOxgwjFDpk/M4FXIT5kTFlj7tIWUDyja/mXmhbrZI
	 a/20R7Yv+JUCe2bFHunK9UGZhK69YIW7NCQWHrRNKhrI6GROujz9uQHCSYZhuelb1b
	 k6Lgk3qeRKK9elyuXcY1aHvndWZ/Og3GhQ92/idXLvrvSZj8TYwIabVao0DQLxvr2A
	 O4zkHwEesY84Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 268F5C41612; Sat, 20 Jun 2026 11:48:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 11:48:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-t4k0taFprH@https.bugzilla.kernel.org/>
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

--- Comment #38 from Marco Scardovi (scardracs@disroot.org) ---
Please check if ALPM is enabled or disabled under LnkCtl

> sudo lspci -vv -s 62:00.0 | grep -i aspm

Note: 62:00.0 is the PCI address of your mt7925 card.

BTW disabling the WiFi with rfkill is only meant as a temporary 5-minute te=
st
just to verify this theory. If the temperature drops to <50=C2=B0C and the =
fan turns
off after blocking it, we know for sure where the problem lies.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

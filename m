Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8D334846A
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303434; cv=none; b=OQTG1QdwRMJuL0Q1Yo3l644130i5GnLsL4pJeT1Ebt6+FM33nq0tk1KUHSb7PUiE2PW0Xx/RR9TcfkKMVurjCPBGfVgcEBp1Cw0yMkQQgyZjrm4Go0+s3M/h+neaVi/K3Tu+cHQBNqUbO3g7TeV3aYddpoWa0H+qUKUmLR6km2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303434; c=relaxed/simple;
	bh=JuoGHGDBDQ6UTD3up7mRMLM5o2/eoApMK3w4l35vlkY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nfhPl7tX3BfQOgpvG+8ibf0ko5dJ2wDoeX8ktQcMpi/4XPWKxevsJITSR4s5Y0DeoTTn05vV/Omsw/tZR0yFvescBFT6OZga66c1F95d3UUVY6n7pKSVgm0NdSrAUY83NdSBclszFAOff0anoP/Fv0nFuon+m+tmu8M6ACFrfqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0i9eugF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0i9eugF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29867C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780303434;
	bh=JuoGHGDBDQ6UTD3up7mRMLM5o2/eoApMK3w4l35vlkY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S0i9eugF8QtZP7L2JWk4nSPG07Z9xWIJbAOhRx+Lq7SmfyyO4f6kYxP5APwLx5hD8
	 iJSeO80Mx5lsmsbydllfX20vTuPpWN3qoHysOBRVVvw+3VsUBGRO/KAy7WTZCJEbvQ
	 Zw3NqM0fwju6uP3IX5EcXZdIVMuwUb600wLrtMurURrQ5PdG5lriKU1txNFE7H3Epg
	 JfNqjw+lsKXfTqlMhIIH38cRH8R68xctqsmCcsbm1KXklVpX8/+19B6MkQWnEoo28S
	 GfYEZI5qCkzTDzuvkP8SH352g6bPfd9GEWUOUs6kNDgg391ojt0YmpHNLUlHM/p8rt
	 z6seS1vFC/X/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08BF3C3279F; Mon,  1 Jun 2026 08:43:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 08:43:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221569-215701-weDwB9qkx5@https.bugzilla.kernel.org/>
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

--- Comment #14 from Milan Oravec (moravec@ukf.sk) ---
Created attachment 310228
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310228&action=3Dedit
here is output of the Powerop.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

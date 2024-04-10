Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619731598EB
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748914; cv=none; b=aa8hodAkMWqk6r1tsNLtOKNLIdIrZ99N2vXabdZiievSPh3S7qwbBBxRDoaN7CEA+wxZE91Nom+oDcpt+vPGceXK0JaGQbEzxt8DdOPyka0uVhzo8o8UzvPpVIzcYEVtTlY8mL/Whhr+bmqvJdIE3QbhTAyV8JliT90sAlbzcts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748914; c=relaxed/simple;
	bh=mBKaFE7ZidpQiF8dRBcaFxBXPutCzJL2wib8QwSyjfU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MTmbK0GhMF5AOKEOi6mnj3i8nXLN8mFi/uA+GWkI6qR4odCb3pOb1flq4iECcWZyhMaH7K9R9F6BW9jGoYAIe+CpgWOyVrbKFTcBhm1yS3jGoBO8fVVyArFVemwyYLpq5SsnC71/x7gjJFB3YZ2gKN7tYm//XTyLxsD/7ZM7WPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff2iZbnh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff2iZbnh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D421FC43390
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712748913;
	bh=mBKaFE7ZidpQiF8dRBcaFxBXPutCzJL2wib8QwSyjfU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ff2iZbnhfdYzaujP1SSghMbJ6UVGtQngIVPtOahAzWYA43Ho3uEOOTySHGKZyDrJZ
	 9C75gypxxGhHWThhg2JivSD7B2TR/sgadL+B9GhaIvqq9eXsryPJ6SItZfbOKDKi7Q
	 Isz12MgByQEjh7m3YKT4thNMrlnLz5Bv/Ed+QPGP7hCljklM8zzJav7Zo2ERY+b+In
	 BcpJmWAg3vunqXYV41YFmRk4xc9NhRfIVrTUpmhH/pTOcAXZxyuew/w7V2boBFJPVI
	 wdQ1Ob4Cw/qiQ9Uer/K48IKbHN0KkayYLerR75aP9S7zM3E1AmRGohGEs+6lnBWLK3
	 mV4pwwHGyq0cA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1558C4332E; Wed, 10 Apr 2024 11:35:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:35:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-xzAe4xd3aT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #28 from al0uette@outlook.com ---
(In reply to Mario Limonciello (AMD) from comment #23)
> It looks like the BIOS has a bug that it's advertisement of that bit even
> though it doesn't work.
> I guess in Windows this is a no-op.
>=20
> Hans - there's a few ways to handle this I can think of.
> 1. Quirk against this system and BIOS to ignore that bit in AMD PMF.
> 2. Allow multiple drivers to register for platform profile.
> 3. Do nothing, let Asus fix in BIOS.
>=20
> What do you want to do?

I really doubt whether ASUS will fix this BIOS bug. I contacted ASUS consum=
er
support today for the CPPC problem and they seem unwilling to provide Linux
support

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

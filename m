Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594D188733
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734978844; cv=none; b=kQTPzGZ4sbyR5RVuPiTMlFiWPEFAG3frcgt7VCrPTCMzXujbLFko4bRE4D4wamJAn0QGwnQex/GnY734xAe6NfsDiVGtfx4EW2p+bk7nqbpNiv630Att0MvP9GgDgqU00Ep5w///fSoN7a2C0Yteyd7/1gElO9+1Gki2CK8HEIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734978844; c=relaxed/simple;
	bh=vz/5bS1ebTOWETZ6jZF+ODtCI8TqLvqpRZZnzUeo5Ck=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRm2AScLLV42otyuVuWreFAVqg3LELC0Y1j3ZZt0xmwW8DK9vZop9BMR+hAxQPkEzjlSAzSCqWAf4iFsCZQEZMK1xLDl0uReIN60Cfy/PxpNL2RjvMuMYHR/UvPA/qKHjh4iVxcX4zruY8haeY/VqnmXC1MhWQoOia/3oADkljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMzxuo8y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMzxuo8y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 012B2C4CED6
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 18:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734978844;
	bh=vz/5bS1ebTOWETZ6jZF+ODtCI8TqLvqpRZZnzUeo5Ck=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BMzxuo8yGevRHP7q6SLJ56M0MnuY9SKyPUb4/amZ3Nr/MlBO6eZp2W8EqZvvA3B8l
	 SUn0WFXSZEnZ2ByCbn6sdBeYDewH8n8Gn6APBUj2wFZtvLEdDTtEwn72z4eqzX09NF
	 UGnzIDqp07lS0Cai5cOOWG7A3FmD+SDiyPveKX8hFltOTAnETohflj5+yT6m93TYCo
	 Yok8DCjzvs9FpiX7vzWp81cv7WUv/87jO2G4Z4BgTDgUb087VxVyHJy/ANYrUJLv5T
	 08G50UrQskmAjHzIeZ+n8ON826KwWwapUZZ/ODVM0/baqzmiQ03bqgZFZCfvVlF2ya
	 rv/ltkqFUQqCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EACA6C41606; Mon, 23 Dec 2024 18:34:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 18:34:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-iY0W2mW03B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #63 from jarkko@kernel.org ---
(In reply to jarkko from comment #62)
> (In reply to jarkko from comment #61)
> > (In reply to andy.liang from comment #59)
> > > The binary dump and kernel log for v2 and v3 patches are uploaded. Th=
ank
> > you.
> >=20
> > Awesome I'll check them later on thanks.
>=20
> So, v3 log looks great.
>=20
> Have you tried to copy /sys/kernel/security/tpm0/binary_measurements?

Oops! Sorry it was there. It looks great too.

Mind if I add Tested-by from you to the patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

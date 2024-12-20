Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B24134AB
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 01:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658978; cv=none; b=WJCYjjRvHAwHw9Jseb+HJDIgnS+jRz2Oy4M++PqYD8QGVq/VlCD1zysgTLj7maSC6ahbr+NZEaSpgFspBO0H8R5IZDayKPqFd6eMUZ4zjzWSlOOogNJIruk9HtxeraondTm8Na+pDifoRuI3VHtrW8freVYhDKP0sdsMSYjYqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658978; c=relaxed/simple;
	bh=hbK3T6qxAWlU4YHQMjPKE5u7KoFgCAEv/IAZloiQpjI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UczESaxejhbj/4VfOwIipXQ6hMc+exgEqOV9B/velZQQeU2JIBN6CDtZXAeoyGrj/UiGVw9bNxWq98YKs5kAM86ogVn5/1hthZokQxpPCd2I6v9fII3XuQlVigBgm1eJ+vYGucWZdIPfpXZtVpja3ndC8VewZXCf+BWMbaOhIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS+PcOnO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS+PcOnO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC5A8C4CED4
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 01:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734658977;
	bh=hbK3T6qxAWlU4YHQMjPKE5u7KoFgCAEv/IAZloiQpjI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cS+PcOnO1v+1dWKsB9e6YC2pEx3Pi3VjyPbzLnH1AgKmElfOFvQ+TTAshIBwvQouz
	 S8fIgweEjf96be5AdgpeMypwF5wd4DhCdsxDhTK+z9Xm6z1Sq91/eKPFpXVpegt8AS
	 53FHhHHFJk1MrcKDssRMHsF23RmOIZxR/RWuQNaoCTqeJ6gDeYwPuJdT2p11LoGK4v
	 RrkOtRaJ63h1Gg6mBcmsJVOBAUOvtMYJhHkRgASAE+F5Nzidm0NGzTtyBLklwaUlKO
	 THe4YtF8vQ/pzDgWKqiEwH8H94iYX1QW9PmuahZ7UNjNbzCE65U7xKCD3Iiub5ath6
	 FGSLiJKfewx/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE403C41612; Fri, 20 Dec 2024 01:42:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 01:42:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-WcrjsQk7U0@https.bugzilla.kernel.org/>
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

--- Comment #28 from andy.liang@hpe.com ---
(In reply to jarkko from comment #27)
> (In reply to andy.liang from comment #26)
> > (In reply to Stefan Berger from comment #23)
> > > I suppose the binary and ascii dumps of the log are still as before.
> >=20
> > The TPM2 DUMP still shows the TPM event log size as 8MB. Thank you.
>=20
> And? We don't and should not change TPM2 table.

(In reply to Stefan Berger from comment #23)
> I suppose the binary and ascii dumps of the log are still as before.

The binary_bios_measurements file only shows when the tpm_tis driver is loa=
ded.
Without the patch, no binary can be generated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

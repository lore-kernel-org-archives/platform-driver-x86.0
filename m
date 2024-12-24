Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F318D
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Dec 2024 01:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004589; cv=none; b=fVokcR18/AF0GF3pyUamWCx/mrxSvLPD+TypnLfb+gLJh4BlaT2bzJL9GF4cVn6SeuNFwG1hgnRSIXu9a7zRsjrKHpnMc/rQsS4DirRXY//J2rUgvXZWkmNYymVDGH7b9mgFoUWacV6VbSEdkFVTUk+SKK47n3YoWj7oonn/YNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004589; c=relaxed/simple;
	bh=5uypzemvMt08XWv2/iXwb33kJCG0jljeK+WRWzHXIlE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pGtsWh+qIUR3L8K9utsSrJukIOXcVE6NigMosf10Os0OllNRItnYKFEO9huB9eJKWgMno3H1CoU5YYjgRLu+tmV+StHyQaus35ADBEGATKHQbcbpj086bDVZEbqwpipLaZfXgdtSIpe2dxK5OUuxe/D/gsqqsMHJ/POhqHL1rDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Or9rrX7A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or9rrX7A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1306FC4CED3
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Dec 2024 01:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735004588;
	bh=5uypzemvMt08XWv2/iXwb33kJCG0jljeK+WRWzHXIlE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Or9rrX7Ami2exMLBw/9yYOWKfbvRCJ5pH9BeI6Uoux2iXziZtRJSVl7YD1ZYEHMh6
	 IgSaN736qFELZtttau6gvg4Ipb3JznoRZVLQVHpXawFDRK+7uM7WmbV5OY9g53CR/F
	 rM/VeqdRe6Mrhw6N228TmdBn0Kd2IjbXayL/KuJeCs1KSPq8qiM7A1iSTv9uv81KTY
	 AKNWWnrGauYZaURQk5xn8Qhf5ZwM8APlIwa6A0CzfZlzlD5jqLFb9GP7TjobUiLiLH
	 z1U9st1xYkfqQVBks2TLz0Yf2xjfGt1Ka7ugmovdMGJR05ffbJM3uPmNm6MSeEbKvl
	 u/9TB4tCoyHVQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 030DEC41613; Tue, 24 Dec 2024 01:43:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Tue, 24 Dec 2024 01:43:07 +0000
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
Message-ID: <bug-219495-215701-rQwDwCg2km@https.bugzilla.kernel.org/>
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

--- Comment #65 from andy.liang@hpe.com ---
(In reply to jarkko from comment #63)
> (In reply to jarkko from comment #62)
> > (In reply to jarkko from comment #61)
> > > (In reply to andy.liang from comment #59)
> > > > The binary dump and kernel log for v2 and v3 patches are uploaded.
> Thank
> > > you.
> > >=20
> > > Awesome I'll check them later on thanks.
> >=20
> > So, v3 log looks great.
> >=20
> > Have you tried to copy /sys/kernel/security/tpm0/binary_measurements?
>=20
> Oops! Sorry it was there. It looks great too.
>=20
> Mind if I add Tested-by from you to the patch?

No problems at all. Thank you for your help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C62C0F6E
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824498; cv=none; b=P2OJsxYEnLmfl/8MdNCphd2AYM6f0oUFOLA8h5ttbDjRe+Aap0g50UmbF+NGwTCZZrXA7K7DZWF1EE5mcZ8LDx2fpaPfYqLkRQ1uMHv00CgP1kcz0P7EEhIpjyctJ/CauD+bvD/CDAyOFVZq48uC4/vnHwioG5iuhjZvOO37gxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824498; c=relaxed/simple;
	bh=zfOGw0sFLhv9n6VG0HXSxVcvemPVP5lXQWDTGLMNTEE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r0DX3tSvegyWuIGwWAaAIGR5DfuALge9Rnjdnp301ybkXIihzld3rJ/EBrKa9+S4Y74KISDA1FR9AKOLNdq0Ao5xvQB3tlgy3867HnODjnWqTMo5VuXjxoOkwPR7PA8FiIlf9sX4rAnK0qIeZmG/RInSZY0gs2ZRaSIE9wgPX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmzNklyO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmzNklyO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C3ABC19424
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770824498;
	bh=zfOGw0sFLhv9n6VG0HXSxVcvemPVP5lXQWDTGLMNTEE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FmzNklyOR5lm2/BzJAWEccBSG0PtRvBR3xJW0tRA8ewyHMe7D8HL5mqa3sVxtGUER
	 y+EioGgVawv+v7wYtmw8Qv3c+NSf3ZixaUw7Wymev7mY+ltEbsVmMvaKV4Q/ti5zzy
	 sH7I4anzwDpdKWA+iMJHcnaXsLCbLX4it7mBASYqu2ZzcK9ts+zD9b3/+zs8sKW976
	 itbJJE6uEfmH3qqlgMts0pWrRb7b6Hpb5oICY1KmgBvG1Keir7gVqxF6HRFsq1LaWJ
	 53wsJyzuwA6nDHI6m8K6Iuq3At1BcreVilVbISFyDOtkfd4E57JVOJCXsJdhbDrnVc
	 OsHrfWtLmY7tA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 66992C4160E; Wed, 11 Feb 2026 15:41:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 15:41:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-2mLeNYjdgI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #28 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Rong Zhang from comment #22)
> +CC Mark Pearson.
>=20
> Thanks for Armin's insight!
>=20
> Yeah, the root cause should lie in the ACPI table. It's super broken as I
> even found more ECMT issues...
>=20
> I've noticed these methods are broken while glancing at all occurrences of
> ECMT in DSDT: WTER, ECCC, _BTP.

Is there anything you notice in there that could potentially cause the syst=
em
to take excessively long (2-6 seconds) to resume from s2idle? That's another
probably ACPI issue that I've always had. This is almost certainly unrelate=
d to
the charger bug and I don't want to go completely off topic, but I figure i=
t's
worth mentioning now that I have contact with the relevant people.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

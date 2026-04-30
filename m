Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A633F59E
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569644; cv=none; b=gA+1SNRFASs9kGmuWIQVvu4IIGwq//n2YPI8HnYGWGMJNVNPFb9+GZR3fJJUBJCwfsAqashIVPhGrlkV8oM9wUIC2yqpi3hqD2VHllhLwXWeIbop9IHkr/mhBCnLDvAC+llg/SuOoErAuuvz+SplOKbBsXPZPAyCf2kByIHo+Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569644; c=relaxed/simple;
	bh=V6IVydtIyxSjAMIGqJFa5UWQyxWcckYVWOuTFLUlikg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tw9u7xT3NSJk3EaZVHZVZXFj6c1eqpUHGBG1QM7ktXRYkMx2u0CfLQq2qjI6ZhZLzIatqbpDPf1zbWL4+TFiOFcstB+QNSLkjKe/tTSZIDLhJxvxzPwyV9wK1SZnjL7+KLhk196OgQv9Asb+qP9Wu65sahRWTP+SQd/jIuxwXnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9qZgDDb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9qZgDDb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D9EAC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777569644;
	bh=V6IVydtIyxSjAMIGqJFa5UWQyxWcckYVWOuTFLUlikg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c9qZgDDbWoukEQxmXOYr84hEIf4t6LJcWqAl40sk9C55tc5SzgwEwHVf5jRkd7REs
	 8KAxCLPWCsoaoSm9J/3MU7moYEA5dIyOsa0O57EQhlDYxcfRg0IOu9LAFPtvuWGyGf
	 CuxSwj0LaesbJXEFvfCS5pMndI4Xj8RhSB+z7TlX5skkYTpH63tIxaJhwvDar+PO+h
	 GYipDXwQnIgGDTFQLvVav4zxJ2jPJAH1QpfJH/VbBwvoZ+r0eOP/55PC5OWCQnDECU
	 PTaDz9zJZVDOEptiTKRTGCr7f6xSS3vEPUwNpyalsLVzGY0LhncISepqUDSfdb6G5b
	 RW6eSg9MteLKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18154C41616; Thu, 30 Apr 2026 17:20:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Thu, 30 Apr 2026 17:20:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-Z2lztEffeY@https.bugzilla.kernel.org/>
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

--- Comment #75 from Rong Zhang (i@rong.moe) ---
(In reply to jeffrey from comment #74)
> (In reply to Rick from comment #60)
> >=20
> > Can someone confirm that this event correlates with a system GUI pause?
>=20
> I can't confirm whether this is the cause, but I also see freezes (most
> noticeable by the shell becoming unresponsive in the terminal), which when
> checking the logs always seems to correlate with one of these errors.
>=20
> (In reply to Hans de Goede from comment #72)
> >=20
> > Or if there are any actual problems when using the laptop?
>=20
> If this is actually the cause, then there are definitely problems using
> affected devices, since these very regular freezes of the whole system are
> more than just a cosmetic issue in the logs.

These logs are symptoms. They are caused by a lot of poorly implemented ACPI
methods competing for the same mutex.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

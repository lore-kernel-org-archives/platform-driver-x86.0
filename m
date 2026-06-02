Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA22218E91
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407886; cv=none; b=jpngCW6n6dkJTtT43ZjYVB+JIKzEcy37d48TGQZ+IhYM7QCrLjDGnzR77zIg1C6JCRSG/EZmT19SxVcDObB3Tt/J+sWZz1AakM8RIulqUeSIiK381GiSUjVRmcuuNnJILgl2YVFxcH2wFWhBDrVZ9a9ZbRwmkVqJOmvKBVRj9eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407886; c=relaxed/simple;
	bh=F/Vjd7DwhsmQc/OBuzcxWiKxsRLdvpiZ/w/DVsHjf/Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rQW5APW8lJ7utdOJwDCad4QHNHDI1B3AEw9wzVjONOddoo2dRqJItQUew604D8VR2TS0/u8HMXKlN3QdUAgBezl68T3NQybiyUmW8SczJZyE2OhKEggfQyWlRbJpeRy807EbySVagSwccerHumsx1sdJG16inpJg5fkeVjNmWKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWgF9tw2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWgF9tw2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88EAAC2BCC4
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780407886;
	bh=F/Vjd7DwhsmQc/OBuzcxWiKxsRLdvpiZ/w/DVsHjf/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OWgF9tw2vJmvusnUZhzh5rGcGajMkfC/1BAKdU01G6MA77fHaDisqyvvG9zAy8fPX
	 H342Tc91N23AmGa4U5cAnte7ONzyhst13xN+60qOcDa7KneOOJqmQ/Z8cNhJH0U8eQ
	 qsUYssmvNtUpI3lkZ325aJpYyZcbULMV7DBKkHVaTv6dkYtzkb9QgHxmtDTijKeNM3
	 SvHxT/PymkvHshUwH3zi4oiCae5lN6qDzWayncpjvAEzolFSFbH54LJsc4eShIX466
	 Jw3jBV0d/36EdRrN9ABTBL4K9A35n9z8T9/Z7E4G28ZFaBKUckvu2ymRMnYmbIbB6D
	 XsWi5bhdA8phg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77774C4160E; Tue,  2 Jun 2026 13:44:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Tue, 02 Jun 2026 13:44:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-CPDMFym9E7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #3 from Rong Zhang (i@rong.moe) ---
(In reply to George from comment #2)
> HALS: 0x0000ca40

Your device reports itself as no keyboard backlight support.

>=20
> I cycled the keyboard backlight through all states using Fn+Space (Off =
=E2=86=92 Low
> =E2=86=92 High =E2=86=92 Off), then compared the contents of both files b=
efore and after:
>=20
> ```text
> $ diff -u ~/cfg-before.txt ~/cfg-after.txt
> $ diff -u ~/status-before.txt ~/status-after.txt
> ```
>=20
> Both commands produced no output.

Sorry, I meant you would need to check for content changes each time Fn+Spa=
ce
is pressed, i.e., Off =E2=86=92 Low, Low =E2=86=92 High, High =E2=86=92 Off.

> I have attached `acpidump.txt.gz`.

The HALS method seems to lack keyboard backlight stuff. But the SALS method=
 can
be used to set a two-level backlight brightness (off, on), interesting. No
other ACPI method for keyboard backlight is found.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

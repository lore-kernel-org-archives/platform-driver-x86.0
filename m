Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8553002CD
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762704673; cv=none; b=L6rdksHyCIszwgi6Qpe39w/0m2rPpCd26tZCEVELx8WAokNPBcf64BnpVF+C7IJjGbk54kwrpuULrXaWwUve2a6yJ6lJbyeBcJTg4wqLVyPy7sXL/Ns9HfWyPDlbAu0gyOADAyB8/EDgmJIgOqLxU5DurNMIh2YpR4V3QZXgj3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762704673; c=relaxed/simple;
	bh=tZIU1q1sb5r/levNFpIMK8ccn6xTGpVhxYOF9Nraohk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hkVQvquFcn0/KjypiKgKkRap0dejWR1zOIe9QKG3jbh5kb48Q9N4P3BEQnu7u5c/Ox9yTdALO3cfpDzxd34OaX6IA1sncN6gULzGcDouaB9o1vuiqlESnN26Z/kQQsWFrCQXaH3zANFoEsSEmUTOJyXE3j3ZjvBJnS+6cJTD6WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2BDlOC+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2BDlOC+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA659C19423
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762704673;
	bh=tZIU1q1sb5r/levNFpIMK8ccn6xTGpVhxYOF9Nraohk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M2BDlOC+ZVa/C76DdUY8Uss5+jb6J4oJVMpBzQclhS7tdDzi88VD3p5UlGvPoYuKN
	 av0IzDqFv7pr6oISrxboTzT2zPArfcekBFB4XauamVIR2LLLoP1berG6sajdY/t8Gz
	 BqJeBnAlN23QjVUkEXnqAEciTaeSzL5zC5jE9LmFZX1yBK0LyA7ZXOo3PhQgoHrXsH
	 WUDSbKPxkMBUcLqkWmskDCcK2yMqxfDh48mQ40Pjqyhp6X9KCgYIwhdVSkDxkkUiuw
	 ZoVV93WjS9Zz+dcRkPUAkcnSrGeb7x2KNKiI+H5ZubJr9eMnzHm/WUs6rrWVEI6Mcp
	 /Ltss6EgVOrvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9FCA1C41613; Sun,  9 Nov 2025 16:11:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 09 Nov 2025 16:11:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-uOTpFuNYz6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #141 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
(In reply to Artem S. Tashkinov from comment #140)
> (In reply to Peter Ries from comment #138)
> > Hello,=20
> >=20
> > I most of the time jsut read/follow this thread as my testing knowledge=
 is
> > limited. For a whilt things seem to have gotten better, but with latest
> > Kernel update on Arch (6.17.2-arch1-1) I now nearly everytime have low =
CPU
> > frueq 5xx MHz or 1.1 GHz as max. After a normal suspend/resume cycle wh=
en
> > plugged!
> >=20
> > Have HP 845 G10 and EndeavourOS (Arch) all most up to date.
> >=20
> > Just curious if anyone else has this.
> >=20
> > I will run my laptop on 6.12 LTS Kernel for a while to see if it gets
> better.
> >=20
> > BR and thanks for al the efforts or Mario and the testers :)
> >=20
> >=20
> > Can we somehow get HP to do "their job"? Write emails, sign letters, ..=
.?
> >=20
> > BR
> > Peter
>=20
> If you're still under warranty, open a support case and provide all the
> details.
>=20
> Even better, call their US business support hotline.

I actually chatted with their regular support about 2-3 weeks ago and they =
were
no help.  I called on the phone and pretty similar experience.  They asked =
for
the link to this ticket, but I haven't heard anything from them in the
meantime.  To talk to their "business" support, I imagine you would need a
business contract/warranty in place.

Mario, do you know anyone at HP who can actually get this fixed?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA601DB34C
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Nov 2025 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762016322; cv=none; b=Oys/mSOJSogShQiBhBlnh5gm4TkCZWRTJpn58z8BcXrigBetwqlIMmhN0ZeWQood2gxLck1d/o36D54GeNc3/kRgenBoNnTd+B/Vy/Oo7Imb77Z0TkRdfGj/4F+E9y5y35v683IxFrP0XUKnGBUdMZ77LZxjxBI8VrIBSaNd8AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762016322; c=relaxed/simple;
	bh=LzEx+WDurZeJRaeRBsBigqz4aY+TJ05EIyynOnImklE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cBGcM4CgNYfj7t4tSfoOXKSTHVBJWkmfNitB+i4KWRQXPBeE9JXUTsNDwaPTmrFnC8tIDMlv8JbP/O1+8wPTyM5CFDNFmhqDGnJ6NYmkw5RMX0b4WHbGycoiSIeC9WJA0qRP1sjvEWHUdrqxqg5WC1YvCnJWtgkpY/e3r3KsOlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aahTLiEd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aahTLiEd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0256C113D0
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Nov 2025 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762016322;
	bh=LzEx+WDurZeJRaeRBsBigqz4aY+TJ05EIyynOnImklE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aahTLiEdMWduZpKxzj4n/axBFuZrLXEosIB1Xl/qr1AQ2+wh93Q6/3Zm54i0dpGBb
	 YEZuYq/asCxgOotTxKBEGUG+c0wNcywsdwbZYVoqdlf1KH8hVS51390EVghkq+SdP/
	 65B5JOCONw92UwpxN2i+3btvvzLTk6tqt4sk+Jz2QK15SrhHwo6XaRlxVMQkhauHpS
	 hgsH84aoD3OXwYF9AQjRpTMfiu6AYwx+PAjzqeGjrbGq/BjaSOKfM0LFHUZ5WWoJIL
	 /yjFmXArpQcm7T1cLt+j1EjS0wIfBYQEjZrLB3bm+ZxloTabQPlPqYYQCu2jeTfeQk
	 hIcqfAwAXeB/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DD382C433E1; Sat,  1 Nov 2025 16:58:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 01 Nov 2025 16:58:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: keyofblues@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-Bco5pBGvIF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #10 from KeyofBlueS (keyofblues@gmail.com) ---
(In reply to popy from comment #9)
> @KeyofBlueS my first ticket to gigabyte #1818413 was just receiving an
> standard answer...
>=20
> Since there is only one comment about the issue on Reddit without any oth=
er
> information, please provide more info(screenshot or video) about the issu=
e.
>=20
> Please also clear CMOS, install latest BIOS, install another SSD with no
> data stored, install OS, APP Center, drivers, and check again.
>=20
> ... had not time to test any further so i went with the workaround (after
> boot trigger standby and wakup in 5 seconds :-) )
>=20
> But after i read your post, i am not giving up on this.
>=20
> Have created an new ticket on gigabyte eSupport platform with link to your
> comment.
>=20
> Hope they take this now serious and just trying to reproduce the issue!
>=20
> Otherwise i will go the ASUS route for my next system (NAS, PC, ...)
>=20
> Will keep you updated.

Hey!

Yeah, that's a pretty standard first-level support reply, but they usually =
need
to collect a minimal set of info before escalating the case to the technical
team.
It's definitely worth following their instructions so the issue doesn't get
stuck at the front line.

Make sure to give them as much detail as possible, for example:

- Confirm you're on the latest BIOS version, with default settings.
- Mention that you've also tested with a fresh OS installation, both Windows
and Linux if possible, to rule out any software involvement.
- Describe the steps to reproduce the problem clearly.
- Provide any other information they ask for, even if it seems unrelated.

Providing all this info helps them check all the boxes they need before the
report can be passed along to the BIOS or chipset engineers.

Once they have a clean, reproducible test case, they'll hopefully take it
seriously, that's exactly how ASUS is handling it.

So yeah, don't give up! Give them what they ask, and it'll maximize the cha=
nces
that Gigabyte's (or any other vendor=E2=80=99s) tech team can reproduce and=
 address it
properly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

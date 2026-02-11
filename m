Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DCB19D8BC
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822129; cv=none; b=XmmF43uoXajIWxQRicKXYFcKgN9cIDKQNXhQV6bkjCsM8ro2KjdfXmdj13NtW86N0C5EXpf61EakeSyAJA0knriygAS09sJmPMNdZYrTfdZ8YOkXnkWbKUXTgDh6hzmheX+MstpIJQ2wyaO6HN3SyrKQXiFiR1RdSubP7bW4B3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822129; c=relaxed/simple;
	bh=cx3iE8p4Uj/tQ3IJsehQ8mpI4W7FNs/h7qAskx1SrVk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QozVsUwuyx518Zh34jt0MGX4L2U6q4egtc9aSZseD4N10DakwB6vvci45mgA0c53EVqbAVGZZEPySO0QH0l7VNa6S6c9nrJo6S7EolYr1OkftxZqeYAB+ERwyOBBLNpEdIeyFNwKemQKhrp08yiMm8svGAsCUFyjqT51JdUOJBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4R9a7WM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4R9a7WM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9376DC19424
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770822128;
	bh=cx3iE8p4Uj/tQ3IJsehQ8mpI4W7FNs/h7qAskx1SrVk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G4R9a7WMHUIDckJLqPT0ZxGIdt2yzJK8wcnJT8SQjSv+CwuhPMZp3Dktka3DZSsV0
	 fw9eyMwwmjWdR3pcQy1KRkJwySe2XUluuYkpaDvb4kuVakgD6iZNqjkiK17F06A1ZC
	 u7I3vv4hsBBXM1ZrwBmrzS0Dq5F/781VcYVfB4VzP8LltYzGFcl2z52boP1P9toQ/E
	 E73ukNA8Z7VXVVzc0Iw8ADPcgGLzXzqlM2sq2h+NUiS6GjcULQQKj3y1GK+N6FBH2L
	 tF1r0rY3TW9BH1hLrI9sirC93xHUh60TJLEPyO2fw/DNFDXedoozsjvdJ6Rll5rtwi
	 WlEurlrXwpFHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7647CC433E1; Wed, 11 Feb 2026 15:02:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 15:02:08 +0000
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
Message-ID: <bug-221065-215701-5ohUkFLyH2@https.bugzilla.kernel.org/>
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

--- Comment #23 from Avraham Hollander (anhollander516@gmail.com) ---
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

Speaking of firmware-related issues, TSC is broken on my laptop, causing
reliance on HPET as clocksource and increased scheduling latency. Unless I =
have
no idea what I'm talking about, I think it's a BIOS issue as well. I made a
post on the Lenovo Linux forum about it that I'll post here for visibility:
https://forums.lenovo.com/t5/Other-Linux-Discussions/1-second-TSC-warp-on-I=
deaPad-5-2-in-1-14AHP9-due-to-bad-initialization-in-BIOS-forces-HPET-fallba=
ck/m-p/10021248

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

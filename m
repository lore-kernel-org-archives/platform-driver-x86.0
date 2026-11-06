Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967613;
	b=RzAnkqV0UCEnZMVZCRUPCm0yiBkADAo1e/U2nUlbfDeV1X7HhH+EFi4fv0F7EfoMYPpg
	 aGugJTbfF+d7BnskMamqnnt1JvCLP2YHE2rHqwujO7ljJoQzFd6hfvOmW8l361XN2F/gF
	 VVYpTJbwcXWFqnKuQmcUPB0p/I8U9rNeJ0xvqrVGb7r446hg8Oka4eIVFBuTjovdAwzQe
	 UX0Q9bIqoVX07yJDOgo1jW4B6nsE7JyMWWGOaQAXMKww95wAOobUHZgHHsivifIqt9cgY
	 4Lj8mjQR+ZHBFFp6pMNk5oZgGuyfmixpTIQqdhOcfLFS8Emy8h751Vm6iqfHWiC2M5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967613;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=sSrqbT9feJNldR+/i/v4Ta0GhXZ5cYa17rpqpHbdf9E=;
	b=rfWjjzU1uBW02H604gn6hJXZt3e0EBt6cWpKszCOx7btRGPbvvr6aHLFNqtBA7jJ7p5v
	 d4ianaHIGe3HjG4lEP4eTtYl1ygprS35HrfERUYJGd+L6Z0f7YuTnADKvx/7FNGrcyi7o
	 fRMd7KPoykYQClzk1Ohri3WlNQk/93HidUTKaL6o0633RVBsnSPCYPJ96gjjtUES/XKYK
	 5Z8t4lgL4zGQpLXFgJdaVvtRM8QGYyviYEL0pdqTvopJ4V+/XQ+KArfhJ1UYijxeAGvc4
	 OTVd3ZLy4J5+yDLAKNbopYFBW3G8CU5TcuCv1g3x9AYOZ2+uij5UqkkGG9KUcTdbkkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFE0slzr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEF7606A329
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFE0slzr
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7347A1F008A4
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967612;
	bh=sSrqbT9feJNldR+/i/v4Ta0GhXZ5cYa17rpqpHbdf9E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OFE0slzrjkkx4a/1A91w/OEaCXytB/pRWrGGZ6hxu4BV1kh6fXotYU5SAD6emEjCO
	 VdZC6mvNpmG5D4HTDjCKuzo3hRRJIpeKonCl48cLl2vJ9nKI5ZhlEccs3AhmuOtfEX
	 xpCYyDMWHKqDqM99KGgMErhsoAUUoVHrHq68r98afwtl1JuDqJgVnj2xr9Hu6q3/Lz
	 PLCdYvc548f9GdQdxpCYThehu4uoko5qJd9RXRuUYkD926lCmrvKpWYDG/EdfAYLVa
	 TASFOg903CHQ+KJCRxJkT1wVaTGh2TNBWEn0ktcGkRko+2FOz+B/B1avpsHyOfc/h4
	 qdjdSHDXvouog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6E243C53BC9; Fri,  6 Nov 2026 12:20:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Fri, 06 Nov 2026 12:20:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: z00nx0@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-y8nH9WCrTq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

z00nx0@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |z00nx0@gmail.com

--- Comment #357 from z00nx0@gmail.com ---
Created attachment 311389
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311389&action=3Dedit
ROG STRIX Z370-E GAMING DSDT

ROG STRIX Z370-E GAMING DSDT

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

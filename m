Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938DE4E433C
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568799; cv=none; b=aQyYtpT3QAVKclwO++JuPXMASCg56nja8D3pShLKd8lf3QftEWySzIUqVMrXeyLV3caqjsSHthnWrN0n0pdM5HjHYcIuexP1l4eEmElZN/KELwheNTAw3sN+HUibAZelBEDIJ6ZvveTvLVzq4mNVG/D6GN6csh+tm90H/U9TNgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568799; c=relaxed/simple;
	bh=8So8hTIhfpz/fd56jt7eRFTdNM4kLsIZBaaOLpchkOE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ncglHxlYGbxATppg5zKPx9m+Zo9jpWFzwCv0q81Vv4osxo9Bt3S+gOu9Kk8dAR33M15j8jpRBm35JeULx943/rco180WoHmtzNTYWzRxxEvBpKYa/0DovAcQsK47Mc4d8JxB3Tz1WItWxycUMjZh67Jcr7M6qLgp6fIaJ+KRLTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2ElnkJv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2ElnkJv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22F0AC2BCF7
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 17:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791568799;
	bh=8So8hTIhfpz/fd56jt7eRFTdNM4kLsIZBaaOLpchkOE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T2ElnkJvlZQZyeIYBrI/OaUCzocmPffjnsQ/9Y+SCoYe2XWgkE8jb9doidz3bJuVR
	 IAPZEFRvq6kGfgBcr+Lg7TEpLnUkrcHf11Qtl2CXTl9TMEbStoZs+rErPborh9sMPW
	 0ui/UTZrwAFp+nIP7G+xJ2tmrbfKpFfI51i+wNUrFefpmyM1ZQg64XDfBGoXfskasH
	 r5iwxivC7pl/tXvu6p3ZT7matoU4PiAlph9J22d9G0DwRlX40nhAHEmXFcrEJjFwjl
	 RyBwoqGz57EAmpQZcgM6XhlVtAd8G5rWW+K6vi3h4rMKYm5fQzlEUcV4NTNZT0G6Aa
	 6BTZQ78k89aaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EEA0EC41612; Fri,  9 Oct 2026 17:59:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Fri, 09 Oct 2026 17:59:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: neonblade018@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-asMk2AVKBJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #9 from Piyush (neonblade018@proton.me) ---
A bit more technical detail on what happened during the test:

In the current tree, `ALC236_FIXUP_HP_DMIC` already had `.chained =3D true`
pointing further down the fixup chain (to `ALC269_FIXUP_THINKPAD_ACPI` /
standard HP fixup defaults). Because of this:
1. Adding `.chained =3D true` and `.chain_id =3D
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO` directly inside `ALC236_FIXUP_HP_DMI=
C`
broke or orphaned the downstream chain that the driver was already followin=
g.
2. In the existing quirk table, our SSID (`103c:8b2f`) was mapped directly =
to
`ALC236_FIXUP_HP_DMIC`. When chaining was redirected, there was a collision
between preserving the DMIC pin configuration (`0x12 -> 0x90a60160`) and
pulling in both the speaker mute COEF and GPIO 0 mic-mute LED handling.

To resolve the conflict cleanly:
Instead of terminating or clobbering the chain at `ALC236_FIXUP_HP_DMIC`, we
linked `ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO` into the chain sequence while
keeping the pin table intact.=20

Once chained through in that order:
- `hda::mute` and `hda::micmute` registered immediately under
`/sys/class/leds/`.
- Both LEDs auto-bound to native kernel triggers (`[audio-mute]` and
`[audio-micmute]`) and respond in hardware.
- The AMD ACP6x internal digital mic array remains fully functional without=
 pin
table regression.

If you are preparing an upstream patch, making
`ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO` part of that sequential chain (or
chaining one into the other rather than replacing the existing tail) is the
exact way to do it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

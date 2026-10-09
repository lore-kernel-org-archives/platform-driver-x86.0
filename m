Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5F027C162
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568906; cv=none; b=rU1mIUij8vrYNfz2cYe35OgzWE/eKcvCXJUg6DKRkRcAWo4AZLPcNfpq1P+12ko0KZVCt2EVSCmbRZIL7MKZ1ius6s7NLpnnwTum8k36W24yQYwaen8myPKzLavVKEi0EVuyUJboLukr9JkhH2eIQ0UDPs0AlL2qo2Xyc9LEcoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568906; c=relaxed/simple;
	bh=fUxfsZ7JP3+VaVBPu1EBAYTaGsV/cBcJLMteu1Bl/5U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hALCqUcV5FP60I4Yov2lziuDe6wTtJkndSCuj3qh5eD6hOKIkHcEg79d3vIlTiY4zTHPkkuezjbFVhIELsoQplqKX2QqHSYovJI1yrIsP8J2AHFvxXq3fmrcGqTuuHS3gmxK/u3ozq0JcvxL+zwz+JxZKUqaSlncV0rX1CsN1UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELUgk1Sp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELUgk1Sp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96CCDC2BCF4
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791568905;
	bh=fUxfsZ7JP3+VaVBPu1EBAYTaGsV/cBcJLMteu1Bl/5U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ELUgk1Sphob1PjSVlwf3iPdbE6GhMH+VgJ6/hAIJYO+0ANcre4QBy/t2yVlDPtR2b
	 WndfCXvtyBxKR+2K/r92JymCPYkuhyLGLtykkKgIP5vrBOnCOiRoEqsLZYum9VouTM
	 7Nop97HlJaLFyr8Ih/sfJxdNuvuvI668pJRlLnrx0lLTVeIdZuNS0vyNjbGldGp608
	 ybX3Zv4Nj4c6SUo5wdLpZ91WU5T0PtjhdIlbC+Wl2c4OyHNm6LuWmdjabMlAZjPB+7
	 vnJINklANvjPN5Qb1g/gcLkZfR1gB6xd2eqO/xqOcWxM3bndtA+jo4OzGmZrM2p52Z
	 KlexQbrqvkQnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7D316C41612; Fri,  9 Oct 2026 18:01:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Fri, 09 Oct 2026 18:01:45 +0000
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
Message-ID: <bug-222044-215701-ixWm1s0cQe@https.bugzilla.kernel.org/>
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

--- Comment #10 from Piyush (neonblade018@proton.me) ---
Adding the exact hardware IDs and technical details from the build:

- Target Machine: HP Laptop 15-fc0xxx (AMD Ryzen 5 7520U / Mendocino)
- Codec: Realtek ALC236
- Subsystem ID: 0x103c8dc9

Regarding the fixup chain details:
In the source tree, `ALC236_FIXUP_HP_DMIC` was already chained downstream (=
to
`ALC269_FIXUP_THINKPAD_ACPI`). Simply replacing `.chain_id` with
`ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO` directly inside `ALC236_FIXUP_HP_DM=
IC`
broke that existing downstream connection.

To prevent any conflict and keep everything intact:
We linked them sequentially so `ALC236_FIXUP_HP_DMIC` chains to
`ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO`, which then preserves the rest of t=
he
downstream path (`ALC269_FIXUP_THINKPAD_ACPI`).

This ensures:
1. The DMIC pin configuration (`0x12 -> 0x90a60160`) is retained.
2. The speaker mute COEF (index 0x20) and GPIO 0 mic-mute LED handlers are
pulled in cleanly.

Verification results on kernel 7.2.9:
- `/sys/class/leds/hda::mute` and `hda::micmute` registered immediately und=
er
sysfs.
- Native kernel triggers `[audio-mute]` and `[audio-micmute]` attached
automatically without requiring any background scripts or hda-verb polling.
- Both physical orange LEDs switch in real time with audio state toggles.
- Digital mic array works properly via the AMD ACP6x driver.

Subsystem ID `0x103c8dc9` is fully verified and ready for an upstream patch
entry.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

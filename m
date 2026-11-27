Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786027;
	b=uWpL/YHONDwXBEK1hH3fHepIICplyn8sgXyo3aGsImBL2yZYuH9gP0IJ3T/O85aV73K/
	 fBswdBo3ecDf0uM45uGJ6r9rZ0HHNfIu0BMgDfxhTC0FeubA+i2pmyfDNhHQBpNgQvwyt
	 0rKa5GF4iBPoFyuaKx3ENRSO4Q3VLy5DTFSLpokxFYq8hvF53QuaCLJuB/I3Yo+KIV8w5
	 Af/fp9KeUzFaDVqlukwbSK9FhtAuM5sVm1tlmEbJHHkLokbADcAne0b55t3WP2UpssI3H
	 FsIFhGr+3hXLToPInpKXc23WjXpOxb1xlpF2BXA8+8rtv9/5tkEWiQBsk4Oo66/c8pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786027;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=VUzOw4hetxj58m44HjWp3qE7X0xafeTEVqT3o2dTaQw=;
	b=xp0fjxY4qNfWiJ8wFrKiYHFDZQ4hljbSK2K6Lf0X+k+Yja3EdMwN3AtjOn3s5m9hWQO2
	 l15WqZSD6z4ZB/Dly6dikPiTGNnP6pDxhXtLSHWRbeT86Yl0FlwLF1AWqZXNpqZa8jUDh
	 VSlZOLTbq2soMCwB7fcbBFzXm+ZGd3OXzZ0F9+fmzQ5Bq7/k+GqgMMbeKB/Tv9TsPgqC4
	 H5a/jYxFxHfLmTsw3XMs6HVB4qZGaSZQEIbK68nB7I3B/mQNOfsf5y20stIb/aIC1y2y4
	 h2tidnLNqyIOR3XUWK63KbXFnNiEXalTlH6yBB+5xGR4qcV4BTVzqSKmapYWBZ9Z/qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foWJwWCJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678BA606A31E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foWJwWCJ
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECA791F00924
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786027;
	bh=VUzOw4hetxj58m44HjWp3qE7X0xafeTEVqT3o2dTaQw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=foWJwWCJc8FmXWL+tooMsO0M2hg0gSleMT6OYGxBp6pHMXMQksyENeJq4/Hv8ngir
	 vkyRkChP3mwQwVMt7Ills1whLpzDY2kzhM33GIriZk580/9i37H5byXkDqsJ7Qp6RA
	 VjGPAgpBALsWHmC49UdrMstfeS3uuL+mTLa3dWBrPPXRhR0psBsj1vq18rKRKfWJa+
	 hRcwZ950Qm1PGtLoz4mFxtrjQC+UMf79WSK2CVOfKcwso/7xEqNAU502kl96w2+xvG
	 o5BwDz+VeGt1+gr7gmeN31Ge/sfnyP3+2HQ+DgGAiB2CIIloglP0vjy7hisWDEl77h
	 U9X7M148u3hpA==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 8D5AA240041D; Fri, 27 Nov 2026 13:27:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Fri, 27 Nov 2026 13:27:06 +0000
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
Message-ID: <bug-222044-215701-mkr8wEXXh1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #14 from Piyush (neonblade018@proton.me) ---
Hi Zhang,

Thanks for submitting the patch. The speaker mute LED works fine with it.

I've been looking into a separate problem with the mic-mute LED, which stay=
s on
at boot. The internal mic on this machine is the AMD ACP6x DMIC, a separate
device from the Realtek codec with no ALSA mute switch. Because of that,
KDE/PipeWire mutes it in software and never touches the codec's Capture Swi=
tch.
The kernel's audio-micmute trigger only follows that switch, which boots as
muted, so the LED stays on no matter what the real mic state is.

So I don't think any kernel fixup can fully sync this LED on platforms like
mine. As far as I can tell it isn't specific to 103c:8dc9 either, since any
laptop with a mic LED and a DMIC on a separate device should behave the sam=
e.

What I'd like to ask is whether, for this subsystem ID, the mic LED could s=
tart
off and not be bound to the Capture Switch by default, so the kernel never
reports a false "muted" state. It would then only change when userspace set=
s it
through /sys/class/leds/. That seems safer than a permanently lit LED.

The actual syncing would have to come from userspace, so I'm going to raise=
 it
with the PipeWire and desktop environment teams separately and ask which la=
yer
should own it.

Does this approach sound reasonable to you, or would you suggest a different
way to handle the default state?

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

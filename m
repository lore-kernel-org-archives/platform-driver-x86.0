Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F89733BBA2
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679682; cv=none; b=U3Xfup3WYg05kfmBi/vk2F7COlmhdZWlRuOT11JLEePuzHERgstreR8uqH0lTtQwFN2XM947oaS05RExPVoJ6wBn9s8nHTu7ElJ+vQbIe6CGXWexEapa4IxwX983+bgsfwMt0na2Q6omx6HTW/lYtibZW3QLTi1UMpn7qxyi3NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679682; c=relaxed/simple;
	bh=R7qF4vFlSS0yHNEpTSi82I0CO+Dm9zAAAL+eWek3R8w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kxkJSshdDWf56xIMpmk0JF3+6qoJXRFa32dxJlUx2pC9R+9PqrWoLeieYE/SUbxe7KZeDQtCBf78efm4G/2m/NFVLPcBp42rDAiuKoAwRI1zEDk0J2iqxwHKhQhHJvqbO3+6lpJkk8uvUGIHR0hePTwdFjc8S2Gutcpi+ynO6ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCW0oJIY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCW0oJIY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7A86C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780679681;
	bh=R7qF4vFlSS0yHNEpTSi82I0CO+Dm9zAAAL+eWek3R8w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rCW0oJIYbWFrv0OrU2pw5Ui1g9elHP/4kAcPvZschss/83X6Gp0RRflGE/xe2MqeM
	 Sn5U0RDd9TvF/6VMySYTYF5aTBXT7vs9sNLQRZMfGPFSkc4k5BWmJuwVwyYbGn8K7C
	 br1SrRBTyuhfEQPQj1DU2hPLL9pehB/kGj0EZBuyzXC3zGSlV/h2DGdpICjzK/aFTC
	 tnusWvE4JjvlA78nFPqlzfS3LCpCtXAPtYPZW/NZr76hX4jMZeUAgmJ2/9wGdxTQcr
	 xE/NP/SJw08xRw1pD202ZQCrkiSPfpk0v+HYy9uqw0Vfu3dOyKpuZFzPUCfy5tAA9/
	 zchNhChpCHGkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94CD7C3279F; Fri,  5 Jun 2026 17:14:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 17:14:41 +0000
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
Message-ID: <bug-221583-215701-3z2QeUvh6Q@https.bugzilla.kernel.org/>
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

--- Comment #14 from Rong Zhang (i@rong.moe) ---
Hi George,

I am afraid you have somewhat overtrusted AI hallucinations...

(In reply to George from comment #12)
> Hi Rong,
> I=E2=80=99ve attached my current dsdt.dsl. With this version, the GNOME Q=
uick
> Settings panel correctly displays all three states (Off, Low, High), but
> clicking any of them has no effect on the physical backlight. Additionall=
y,
> pressing Fn+Space no longer triggers the OSD popup at all.

Having all three states just means that the KBLC method correctly returns 0=
x5
when the first (and the only) argument is 0x1.

Except for that, everything goes wrong and has fundamental divergences from=
 my
patch. The divergences make absolutely no sense to me. I don't believe your
device's keyboard backlight brightness has anything to do with KBLO and KLF=
S. I
will explain why later.

> For context, I previously had a version where Off and Low worked physical=
ly
> and the OSD appeared, but selecting High would instantly reset the state =
to
> Off.

What version? My patch or an AI-generated/modified one? Please attach it.

And please rollback to the version, it's probably a right step toward softw=
are
control. Then, set all three states via software, and dump 0xFE00D42A to see
what happens.

> Through EC memory dumping, I confirmed my laptop uses register 0x8A
> (not 0x2A as in the original patch),=20

You confirmed, or AI confirmed?

Bit 0 of 0x8A is KBLO. AI must have seen the ASL code of other Lenovo lapto=
ps
during the pre-training stage, so it told you that "KBLO" is meant for keyb=
oard
backlight brightness. Unfortunately, it makes no sense for your device. The
KBLO field and the SALS method exist on your device just because Lenovo
engineers produced a lot of dead code by copying and pasting ASL code across
different products and insanely "evolving" them. That's probably also the
reason why KLFS exists.

Meanwhile, these field names look like abbreviations and are very good at
causing AI hallucinations. AI will be easily stuck in its speculations for
absolutely no reason.

Your previous MMIO dumps have already proved that 0x2A is the offset we were
looking for. Your dumps are very similar to the ones on my device. Trust yo=
ur
MMIO dumps, instead of AI.

> and that writing 0x02 to the 2-bit KLEN
> field inadvertently sets the UCHE (USB Charging) bit, which cuts power to
> the backlight or whatever qwant thinks I have no idea.

Completely AI hallucinations. In my patch, KLEN is located at bits 1-2 of 0=
x2A.
There is no chance that it overwrites UCHE at bit 1 of 0x8A. If something e=
ver
inadvertently sets the UCHE bits, it must be an AI hallucination that puts =
KLEN
at bits 0-1 of 0x8A.

> I=E2=80=99m not confident enough in ASL to resolve this safely.

Your replies had too many divergences from my patch, which made me suspect
whether you've really tried my patch yourself instead of simply throwing it=
 to
an AI. I'm not confident enough about the AI-generated answers or agentic
actions, either.

So, let's save each other's time. Ignore the instructions from AI, just ans=
wer
me:

What happened when you manually wrote the values you've found to 0xFE00D42A
through /dev/mem?

Have you ever tried my patch *without* any modifications? What was the exact
result when you applied it as is?

I've asked these questions before, and I am still waiting for your answers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

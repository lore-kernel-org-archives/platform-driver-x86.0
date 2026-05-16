Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616743ED5C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778953075; cv=none; b=tw6P5SjlHmg4hOFXKAMKh0+r5Dneoi2SEecCtQ8O6DgQK/VQ9gadjw14BdasNF8l9/fbt3JZ0fNrfUR45sOktLXT7LvIRq8C4xTMH1eHyKXCEYXFiPPpNoSnhyme8Nac1EDZRVOxuSfQpVKe/XVbDMGqUmtfsSTkY7NoO0c6oQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778953075; c=relaxed/simple;
	bh=wpnQ8vMJ66im2r4lPvFUheM3Jr0ajLwIUHDSkS1EcyQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XBjdZHmyjPH4wr+eGUjI04CkVhhSuPn/Wr1ihQs61w3l/yX3UrypklPD7I7/2gt/lBDVE/fnAqOJudSxElVnzmEiFzcuzILxaz/FKjbYNdgeZfItDbKNu5kgWyqjDZcmIGidREf4gBI4W4H1bG/aFKo9T70X6SK9UmkLtI4Lp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvoDS4PU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvoDS4PU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F00DFC2BCFC
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778953075;
	bh=wpnQ8vMJ66im2r4lPvFUheM3Jr0ajLwIUHDSkS1EcyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VvoDS4PU0zDLyoj4WYSPkdX5M6NtPSg1kFl3rYXs3nrLHWEZYqL5EyqDOtWhUJEeq
	 jLORYLPhACQVzD38NAAcXchD6z5azaMh6QBQF+HqFy+OEgd97eZAkbkBYjDLV+lQFC
	 2MsnRqmegE0zrRuE/JZzz7yvoTfRzT0xzUzmZ9qmb1RzH/x78Bx9+TTn8T/vMs9GfE
	 i1zHrdSzyy0VvLwcc8Za2bU+3gWgurEm9C5VnoLDRv7+V5cDxCCyU3952PTmYY+2Dw
	 vFnjry1szKSoWD94CyuKp//Fm90GetE/Q+xQi8Lc+2DS0WAvQC/OBSa/xq/JIKmSPj
	 oDhjDDApoQYrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E8F94C53BBF; Sat, 16 May 2026 17:37:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sat, 16 May 2026 17:37:54 +0000
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
Message-ID: <bug-221065-215701-sMzqgVJp90@https.bugzilla.kernel.org/>
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

--- Comment #80 from Rong Zhang (i@rong.moe) ---
(In reply to Rick from comment #78)
> (In reply to Rong Zhang from comment #77)
> > (In reply to Rick from comment #76)
> > Hmm, interesting. I assume the pauses had existed before I introduced t=
he
> > warning message (unexpected charge_types...), right?
>=20
> Correct - this pause happens in Kernel 6.17 with no messages, when I load
> Kernel 6.19 I started getting the messages and that lead me to this threa=
d.
> I tried Kernel 6.16 and the pause does not happen - so I believe this
> behavior was introduced in Kernel 6.17

Oh, that was when the charge_types attribute was added to ideapad-laptop.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dda8f2708f9b69707f4efeb432a18395e46b4666f

> > This sounds like a slow SMI handling due to the broken firmware.
> >=20
> > Could you kindly provide more detailed information about the pause? Whe=
n it
> > happened, did you notice a spike in CPU usage? Did you see any dmesg
> message
> > at that time? Did it freeze your system completely or just make things
> laggy?
>=20
> The system appears to freeze solid for about 1 to 2 seconds (hard to tell
> the exact timing - but the pause feels like it is always the same duratio=
n).
> Nothing on screen changes.
>=20
> When running system monitor during the event I see it freeze but when it
> restarts I don't see any spikes or anything interesting on any graph.

Did it have a power consumption graph and a CPU frequency graph? I will talk
more about monitoring later.

>=20
> When I was running the "perf stat" stuff below I did notice that during t=
he
> freeze it stopped updating and when it resumed it looked like it filled in
> all the data that was paused. Normally the perf stat seems to just produc=
e a
> row of data on a periodic basis and when the pause happens it stops but
> after the freeze it looks like it prints a bunch of rows to catch up to
> where it should be.
>=20
> There is no laggy behavior either before or after the freeze. The system
> works perfectly at all times except for the duration of the freeze.=20
>=20
> No message in dmesg under Kernel 6.17 (the default kernel in Mint - my da=
ily
> driver).
>=20
> The dmesg message shows up (Kernel 6.19 used for this) as soon as the fre=
eze
> is finished (here are three consecutive events captured using "dmesg -w" =
so
> you can see the timing between them:
> [ 107.554265] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fas=
t]
> and [Long_Life] are enabled
> [ 501.851737] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fas=
t]
> and [Long_Life] are enabled
> [ 933.076412] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fas=
t]
> and [Long_Life] are enabled

So I speculate that some userspace utilities (probably upower or the desktop
environment?) read charge_types regularly or upon power events. Before v6.1=
7,
ideapad-laptop didn't support it, so nothing could be read. However, since
v6.17, they can actually read it, and reading it triggers ECMT chaos upon p=
ower
events.

>=20
> >=20
> > Could you also monitor the SMI count, i.e.,
> >=20
> >   sudo perf stat -e ls_smi_rx -I 1000
> >=20
> > ..., wait for the pause to occur, and check how many SMIs have occurred
> > during the pause?
>=20
> There number stayed at 0 the entire time I was testing the pause - the pa=
use
> did not make the number increment.

Hmm, that's weird...

> Let me clarify this - After further testing: the mouse cursor continues to
> move on screen during a pause event.

Thanks a lot for the information. It's very helpful.

I suppose it could be a CPU/GPU throttle that delayed some rendering work. =
On
modern desktop environments, the cursor is rendered on a different layer --
that may be why it continues to move.

> For testing I was in a text editor scrolling a long document up and down
> (using mouse wheel) while moving the mouse in a circle.  When the pause
> happens the document stops scrolling and the performance monitor stops
> updating.
>=20
> During the freeze the mouse cursor stayed fully responsive to my movements
> and did not seem laggy or out of the ordinary.
>=20
> For reference I am running Linux Mint 22.3 - Cinnamon 64-bit - Cinnamon 6=
.6.7
>=20
> I was also typing this comment with the ideapad_laptop kernel module enab=
led
> and I think the pause also allows keyboard input to buffer and not be
> ignored. (I was typing when a pause happened and I could have sworn that a
> key didn't register on screen so I hit it again and when the pause ended I
> ended up with two of the characters).

Sounds like rendering delays, too. Such rendering delays usually don't free=
ze
remote shells, e.g., SSH.

Could you try monitoring your laptop using s-tui? You would need to run it =
as
root so that it can read the power consumption. The refresh interval should=
 be
set to 0.5s so that you can see measurements during pause events.

If possible, please SSH to your laptop from another PC and watch s-tui from=
 the
latter so that you can immediately see what's happening during the pause.

It would also be helpful to monitor twice with s-tui: once with its stress
feature on and once with it off.

If you have enough time to mess around with pause event, could you also che=
ck
if it freezes virtual terminals (use the kernel one instead of kmscon)? I g=
uess
it won't.

You may also try to SSH to your laptop from another PC or your smartphone, =
type
`echo l | sudo tee /proc/sysrq-trigger' in the shell, wait for a pause even=
t,
and press Enter immediately. This should reveal what processes are running =
and
what the kernel is doing during the event. `echo w | sudo tee
/proc/sysrq-trigger' would also be helpful, as it reveals what processes are
blocked during the pause.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

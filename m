Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C880405C30
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970063; cv=none; b=L4JS5XfmvpKuNpr2GPZGZh64a8MVecVrR0XlzvApvzUy8/AAc67GR9DVyxfflbyWQUMJFudWuilyuVKII9nesDzNixHL9YF7oNTpwFzDvB3pzudf+nQgnbxZcbdTNl/rgMm5bi+hzWGwJKHK4cZtkmpbnHb6ro2uJEefohnbua8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970063; c=relaxed/simple;
	bh=pkKwfU/HUZ0h2qpbshWjgTh36YylraHBWExAvlPRN3I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c9ew9CdyO3Ft0Wx/LmBWUyRa9DnUokaUHPCMVygRmxPYyqb4q1e8Wbr2g9lDFP1WWrfP8A0nNsfpcAsL0evLE3lyJK+O9gfWsgGNYu/blTw/rxhh//pXHIjWV0HzQIZrIz3Dr7hvO83mLAH9wM3cfnm9Dh4zfwq3Ij2wa/V4suo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gorCtr72; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gorCtr72"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4D75C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778970062;
	bh=pkKwfU/HUZ0h2qpbshWjgTh36YylraHBWExAvlPRN3I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gorCtr72Tu0pEeSHoKbt0EMXihEsHElMTQyGqgAuQkkH32UmqM7MKQzugQL103dnR
	 y/cYfdKIX1CKTUwWPR1ILV3KqHpgRE6PuWi4/Z5HIvlY0G5CXN026+64gWIiBwmfOM
	 6wfe4ygYYckRWYlfaQmuHocy8bR/LDwkJbTYQYzEQdhfgWMGk2aA8WUHSDwEx8rrsl
	 rvhm6up7as7uaO1NX5QHasJOXNlK0yIxlhHFzrJqtgzKokgfLpTuC5Ob7Sw5xR68AN
	 mukkZDIY/PZzeuKJRVbW1ZPtDlmL0SseIfTuIvaceZIXMWzZzujjeJCpgLP93Fns0S
	 PAK+fxSEHaj8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE2ABC53BBF; Sat, 16 May 2026 22:21:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sat, 16 May 2026 22:21:02 +0000
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
Message-ID: <bug-221065-215701-TbB6x4q9di@https.bugzilla.kernel.org/>
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

--- Comment #83 from Rong Zhang (i@rong.moe) ---
(In reply to Rick from comment #82)
> (In reply to Rong Zhang from comment #81)
>=20
> > Anyway, my suggestions on monitoring and testing should reveal more
> > information on this.
>=20
> I do not have SSH setup at all and have never used remote SSH so that see=
med
> like it was going to take more time to setup than I wanted to spend right
> now.  Sorry there was limited testing today and I don't think the below is
> going to add much - but here is what I did get done:
>=20
> Using s-tui:
>=20
> Running in a standard terminal window results in it's graphs stopping dur=
ing
> the pause events but when it comes back it looks like the power usage was
> reduced during the event.  This does not seem surprising as the entire GUI
> stops updating.

Hmm, did it reduce by a little or a lot? And how about CPU frequencies?

>=20
> Running in a virtual terminal (the ones built into Mint using ctrl-alt-F1
> for a terminal and ctrl-alt-F7 to return to the GUI) I did not see any
> variation whatsoever while watching it through enough time for an event to
> happen.  Power was lower than the test in a standard terminal window (I
> suspect because the GUI was not updating).  There were no pauses as you
> suspected.

Just for confirmation, did the "unexpected charge_types" appears when using=
 VT?

>=20
> Running in a virtual terminal and turning stress on I got the same results
> (I did not see any parameter substantially change when an event should ha=
ve
> happened).

That sounds like your desktop environment was somehow blocked when it tried=
 to
read charge_types synchronously, instead of CPU throttling.

GPU throttling may also lead to the same effects, which we can't rule out y=
et.
You can monitor GPU statistics with amdgpu_top's GUI, which provides graphs=
 so
that you can check them after a pause.

>=20
> > So I speculate that some userspace utilities (probably upower or the
> desktop
> > environment?) read charge_types regularly or upon power events. Before
> v6.17,=20
> > ideapad-laptop didn't support it, so nothing could be read. However, si=
nce=20
> > v6.17, they can actually read it, and reading it triggers ECMT chaos up=
on
> > power events.
>=20
> This seems highly likely as there is a tray applet called Power Manager
> which shows battery and charging information.  I know in Mint Cinnamon the
> tray icons do their stuff in the same process as the UI (they warn that
> misbehaved applets can cause system pauses and lockups).  I think it uses
> upower to get it's info.
> Disabling these applets does not make the problem go completely away (upo=
wer
> is still running).

The weird part is that it freezes other applications. It may freeze the DE
itself (desktop, tray, etc), but it really shouldn't prevent other applicat=
ions
from rendering. That's why more information is still helpful.

>=20
> > Oh, that was when the charge_types attribute was added to ideapad-lapto=
p.
>=20
> This makes sense and ties into everything else - and explains the kernel
> versions and why disabling ideapad_laptop removes the pauses.

I guess I will send a patch disabling unreliable features due to the firmwa=
re
bug on corresponding devices.

>=20
> At this point is there really value in me taking the time to get SSH work=
ing
> from  my phone to get the information on processes running or kernel
> information you mentioned above?  Let me know if this would provide value=
 to
> you and I will see what I can do.

Yes, triggering magic sysrq to see stacktraces in dmesg during the pause ev=
ent
is very helpful and reveals what's going on.

The key is that you should use your DE as normal but trigger magic sysrq
immediately when you see a pause. Control variates...

If you can't use remote SSH, you can trigger magic sysrq from keyboards
(Alt+SysRq+l and Alt+SysRq+w). Most laptop lacks a SysRq key so you may nee=
d a
USB keyboard instead. Don't forget to enable all magic sysrq actions from
keyboards by `sudo sysctl kernel.sysrq=3D1'. See
https://docs.kernel.org/admin-guide/sysrq.html for more details.

>=20
> I would think running s-tui from the phone would be the same as running it
> in the virtual terminal (which didn't really show anything interesting
> happening).  Unless you think the pause events just don't happen while I =
am
> watching a virtual terminal?

You don't need to run s-tui from the phone as it's not freezed under DE. Yo=
ur
post-event observations are sufficient for s-tui.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

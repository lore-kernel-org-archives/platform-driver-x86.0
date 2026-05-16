Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB62737475E
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965366; cv=none; b=MjkUD09z3NokALcnQP2coEMZNpY4NHiPpiCmGQaXWG5lYceinxP4l5p0fYgsFYCd39Dm8XveD1ebW0RYZTV3riqcIppDyOP8PgG9xKhx7tLXpoAw+XQhjxc6AlxaOdnZwRo3bXKQKGR/itDxnHuI7/mWrs70ygTMLcW/hdwTc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965366; c=relaxed/simple;
	bh=L2kySP4UBGSw590dOuynA/LpCmEeBvEGQYVpM0uzgYk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m4ocMMzB6XAolr5fqmkqQvsxTg03c/TVfytMKuUhFapNR7ZXOtvlWxP6yfsJUuHcKhFYBfgsUUwOwy6YKWNrRdby6ddTvsF6/bsQPL/OryASTVSrY7UiRK1SwxtoRBsb1sP8LDVMAX2Jb0fOaMALYP/c+L6rYQ4eB3RW6DyB0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+DPsqAu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+DPsqAu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B005C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 21:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778965365;
	bh=L2kySP4UBGSw590dOuynA/LpCmEeBvEGQYVpM0uzgYk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z+DPsqAuHbu3d4k0IdzlwlVlRHr/idJvmAo2//KC3282kJJitOUYNBv5kYeTFtERx
	 S+hcpE8YTzCzZ/X2E/fCRRK+0rz1atcGEfgNwo4Ok6hnPdbRgtE5RZjCujddPXCFUC
	 ghpZ++Xkt7KSAfHMQd1SYD62Qj+RA2iDG+igkmvSqTOSBuYLhipUM9ccboBOD9OAy6
	 OJtH7/jL6Ep5ajgDp8nABIeS9V7a5d/De9LNiROUcD2gz+SZ2qzgO/u3FB7RidQbTi
	 3Rr5FimNmQXJKBcu8i4QFaxsaYKgP99X/gFXtA3J66IzIbG33eGmrsraXo0dpvh8LY
	 JPiyd1nyORv7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9422AC41613; Sat, 16 May 2026 21:02:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sat, 16 May 2026 21:02:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-Z4T3yKPU10@https.bugzilla.kernel.org/>
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

--- Comment #82 from Rick (rickk1166@gmail.com) ---
(In reply to Rong Zhang from comment #81)

> Anyway, my suggestions on monitoring and testing should reveal more
> information on this.

I do not have SSH setup at all and have never used remote SSH so that seemed
like it was going to take more time to setup than I wanted to spend right n=
ow.=20
Sorry there was limited testing today and I don't think the below is going =
to
add much - but here is what I did get done:

Using s-tui:

Running in a standard terminal window results in it's graphs stopping during
the pause events but when it comes back it looks like the power usage was
reduced during the event.  This does not seem surprising as the entire GUI
stops updating.

Running in a virtual terminal (the ones built into Mint using ctrl-alt-F1 f=
or a
terminal and ctrl-alt-F7 to return to the GUI) I did not see any variation
whatsoever while watching it through enough time for an event to happen.  P=
ower
was lower than the test in a standard terminal window (I suspect because the
GUI was not updating).  There were no pauses as you suspected.

Running in a virtual terminal and turning stress on I got the same results =
(I
did not see any parameter substantially change when an event should have
happened).

> So I speculate that some userspace utilities (probably upower or the desk=
top
> environment?) read charge_types regularly or upon power events. Before v6=
.17,=20
> ideapad-laptop didn't support it, so nothing could be read. However, sinc=
e=20
> v6.17, they can actually read it, and reading it triggers ECMT chaos upon
> power events.

This seems highly likely as there is a tray applet called Power Manager whi=
ch
shows battery and charging information.  I know in Mint Cinnamon the tray i=
cons
do their stuff in the same process as the UI (they warn that misbehaved app=
lets
can cause system pauses and lockups).  I think it uses upower to get it's i=
nfo.
Disabling these applets does not make the problem go completely away (upowe=
r is
still running).

> Oh, that was when the charge_types attribute was added to ideapad-laptop.

This makes sense and ties into everything else - and explains the kernel
versions and why disabling ideapad_laptop removes the pauses.

At this point is there really value in me taking the time to get SSH working
from  my phone to get the information on processes running or kernel
information you mentioned above?  Let me know if this would provide value to
you and I will see what I can do.

I would think running s-tui from the phone would be the same as running it =
in
the virtual terminal (which didn't really show anything interesting happeni=
ng).
 Unless you think the pause events just don't happen while I am watching a
virtual terminal?

I am currently running with ideapad_laptop blocked and the system seems
functional - so my assumption is I have to wait for a BIOS update and try t=
his
again to see if the BIOS is working correctly.  From previous discussions a=
bove
it did not sound like there were any really good other options to investiga=
te.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

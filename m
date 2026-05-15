Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06066388E76
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778882977; cv=none; b=McXPmFKAP9QRaHpCe/qduWINhgjiDsZDyNiuU/YnNc+PWRbFZaT+AZb0Lb47fKG2AT+qad7i4UXKaLvzu1bbhlUQ0wO0WieYaRS4TURz5VG6bjnf5MoEP2BGwKX1dHwU53cWZpUOBIEQWSTPOl0FCQexIElS1HIMjkfdE8Yoa+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778882977; c=relaxed/simple;
	bh=KLpCc5uUwcT1yNyMAbuqeEdyw42Lsu99G3Umy3P7fgs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NQecWLpHB4hu9mE/Zx0s3F08VZc97rdRqkOYuKgsB4vgOyBy4irBkR4TFaCLUPUC4LOgXHAkMCkbcJ906fFen79P9CAKDKy8NoXPcacvRmVxOhxy6KnwYmxYEbfOsqF4Yfd6mpyi+QSR0vwEjEcwyceAoFL3JMCqtJK97c32v4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/1e/ld/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/1e/ld/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A39D4C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 22:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778882976;
	bh=KLpCc5uUwcT1yNyMAbuqeEdyw42Lsu99G3Umy3P7fgs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M/1e/ld/F80XXIqwMy4lUcpK6RgJToAhbtlYdpburOYQsqIVB1Lk7efNVUtf6p2Br
	 tFsRGqgCbBwF30F92sRMp5pxrcri7IgoJfB4Z2K7nai1epsl0Y7VIEkTnrJbk88+mF
	 cH4PvbvKOwV+XEpO6wUnbfxR4MRThED0nC4MfhW3+4GnhLfJyRST6R6xs40NB+CFee
	 hHfsGj/YEPlRpmfavr3YTcsmoikuaa4eSBW5Ixk3AomBujIBk2/2/pOaeI+EkUbwjE
	 dcObDLByvfARPI0gu97LF7u7KZsm4srhU9lBWwm9UPPUTUne5tsdxs0HT3ggPL5Dgr
	 w2WMGah+nqSDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9A26DC41612; Fri, 15 May 2026 22:09:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 15 May 2026 22:09:36 +0000
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
Message-ID: <bug-221065-215701-qaNlCafHgp@https.bugzilla.kernel.org/>
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

--- Comment #78 from Rick (rickk1166@gmail.com) ---
(In reply to Rong Zhang from comment #77)
> (In reply to Rick from comment #76)
> > (In reply to jeffrey from comment #74)
> >=20
> > I completely blacklisted Ideapad_laptop on my system (using Mint Kernel
> > 6.17.0-23-generic) and this seems to have completely solved the 1 second
> > pauses every 7 minutes for me.
>=20
> Hmm, interesting. I assume the pauses had existed before I introduced the
> warning message (unexpected charge_types...), right?

Correct - this pause happens in Kernel 6.17 with no messages, when I load
Kernel 6.19 I started getting the messages and that lead me to this thread.
I tried Kernel 6.16 and the pause does not happen - so I believe this behav=
ior
was introduced in Kernel 6.17

>=20
> This sounds like a slow SMI handling due to the broken firmware.
>=20
> Could you kindly provide more detailed information about the pause? When =
it
> happened, did you notice a spike in CPU usage? Did you see any dmesg mess=
age
> at that time? Did it freeze your system completely or just make things la=
ggy?

The system appears to freeze solid for about 1 to 2 seconds (hard to tell t=
he
exact timing - but the pause feels like it is always the same duration).
Nothing on screen changes.

When running system monitor during the event I see it freeze but when it
restarts I don't see any spikes or anything interesting on any graph.

When I was running the "perf stat" stuff below I did notice that during the
freeze it stopped updating and when it resumed it looked like it filled in =
all
the data that was paused. Normally the perf stat seems to just produce a ro=
w of
data on a periodic basis and when the pause happens it stops but after the
freeze it looks like it prints a bunch of rows to catch up to where it shou=
ld
be.

There is no laggy behavior either before or after the freeze. The system wo=
rks
perfectly at all times except for the duration of the freeze.=20

No message in dmesg under Kernel 6.17 (the default kernel in Mint - my daily
driver).

The dmesg message shows up (Kernel 6.19 used for this) as soon as the freez=
e is
finished (here are three consecutive events captured using "dmesg -w" so you
can see the timing between them:
[ 107.554265] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast]=
 and
[Long_Life] are enabled
[ 501.851737] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast]=
 and
[Long_Life] are enabled
[ 933.076412] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast]=
 and
[Long_Life] are enabled

>=20
> Could you also monitor the SMI count, i.e.,
>=20
>   sudo perf stat -e ls_smi_rx -I 1000
>=20
> ..., wait for the pause to occur, and check how many SMIs have occurred
> during the pause?

There number stayed at 0 the entire time I was testing the pause - the pause
did not make the number increment.

>=20
> You can also mess around with sysfs attributes of ideapad-laptop,
> power_supply, and firmware-attributes to see if reading them causes SMIs:
>=20
>   sudo tail /sys/bus/acpi/devices/VPC2004\:00/physical_node/*
>   sudo tail /sys/class/power_supply/*/*
>   sudo tail /sys/class/firmware-attributes/*/attributes/*/*
>=20
> On my device, reading /sys/class/firmware-attributes/thinklmi/attributes/=
*/*
> always causes 580 SMIs, and other attributes do not cause any SMI.

On my device, reading /sys/class/firmware-attributes/thinklmi/attributes/*/*
always causes 504 SMIs, and other attributes do not cause any SMI.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B338248E
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 17:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713202942; cv=none; b=oE2JNYap/CpB1wfzmuU387/izZe1N66rODdncn2/8vMvf1DPL8ksGjKL6G33ooCHFjJBW53xtdZhZBJvv6CqIVPjHO/gbrvn1akeMIF9Q9ETX4hUbJnm+ln1Iqvag0aLsM4td6qIZeC0y3FqSfBYJeVBFjSx6vpR9IrUpS2KTJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713202942; c=relaxed/simple;
	bh=lP56Vh7Y+17iGJClWmjTpufJIwZF0uNsKtNR9m2YvRQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FOUIuWyE8Szy5OcfiBFFQVFQeGTrmrU+mL8PuuudrljGMImr3/mod7Whn13MWKsr4C3jNcV7O+Gnz0D2In8po/Xg+FQmU4JwSwjMOh++qIjKUIrkjcji8CyaOkevvmHoJkeaKmLIeJDnxVh7YmZt/XtaaVMkRkSYpXPH9YKQyBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbYsQNtO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbYsQNtO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDD63C4AF07
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713202942;
	bh=lP56Vh7Y+17iGJClWmjTpufJIwZF0uNsKtNR9m2YvRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mbYsQNtOLCYo+ROn96RA7EA9DJ1xdNOaxNPjPGChOsNblTqqvjhEe9iut/cxTfkC5
	 W5PuCw9d6rZFQD4AnfYu0qtgkNyZSn0duG9/P0ZgfkxrwVGBCTLt+SieXIk2M+6do6
	 /HD91OH1lOYJDuICWMtBXWaCnmko7+nBWgl5DPP27Td51J16BdyJDpI8qbw6kPVeqf
	 e10466Wsfo8+ZTOizESp+ZSJ9qcY68a6u6zIMPyl5De/rPLGDcOR6Tf9mLWRLAsmgJ
	 HomlI3Z+9bD5lyYVsAZfNf4uDbSL0NDpf/+YAd5PfClu1lrclwZYHoC+4aa8Lj9bzF
	 HxA7j/t/XeGPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E47AFC433E2; Mon, 15 Apr 2024 17:42:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Apr 2024 17:42:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: voidpointertonull+kernelorgbugzilla@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-fEbV7ZcQVU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

Pedro (voidpointertonull+kernelorgbugzilla@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |voidpointertonull+kernelorg
                   |                            |bugzilla@gmail.com

--- Comment #50 from Pedro (voidpointertonull+kernelorgbugzilla@gmail.com) =
---
Coming from Bug #217931 , I found the mentions of being stuck at low freque=
ncy
odd as I couldn't observe that despite managing multiple hosts, but then he=
re I
am.

The twist is that I have a 7950X3D desktop setup, not a laptop one, and I
apparently I just ran into the same low frequency issue others experienced.
Unfortunately the usefulness of my information will be limited as I'm on a =
not
really customized Kubuntu 23.10 setup with kernel 6.5.0 , but on the other =
hand
I haven't touched anything relevant, not even setting a frequency limit.

I'm observing the CPU being stuck in the 400 MHz - 549 MHz range which is q=
uite
fitting for this bug report, and the host was never suspended / hibernated.
The only relevant oddity I've found so far is that
/sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq was sticking out like=
 a
sore thumb with 400000 set while other cores had the value of 5759000, but
changing that didn't make a difference.

Not really sure when did this manifest itself, but highly likely after (or
during?) a case of Bug #204253 as I brushed away the slowness for a while as
the usual heavy I/O (over NFS) problem which even used to freeze the desktop
for more than a minute on a weaker setup, but the current higher performance
CPU seemed to take it better, although the experience was still disruptive.
Is this really a laptop bug then instead of a more generic problem with a l=
arge
stutter causing some logic to get upset possibly due to timing problems? He=
avy
CPU usage alone surely doesn't do the trick as I've seen hosts doing fine w=
ith
that, but heavy I/O seems more brutal with possibly similar "world stopping
power" as suspending.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

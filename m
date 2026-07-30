Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9953D3CE0
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404977; cv=none; b=jf2fCN+hywgoddlBdAZVFFAhDg3/Nea7u2KCU2vO2hiftLbk1GKs8l7VSay5i9ZJCvSQTLwTMWY6YRUd3GTc3fNzfE03YRt+iroFSAob5Bk3T54oQUkWmT+IB0VsvqmDeyHyzC27vsD9r5KdxpmlK12Q8BqsvaU73Xmfi7pTwrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404977; c=relaxed/simple;
	bh=lun/JzWGaGqZ8GnVPAdnbkBqz0TF4+mO6sPw+aQ2Ypw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HB8yFd0GoeFEqHPdwY4is/u+BI8tSli2GbkJ0VTmfoq03UxPgXOyepPJ3Unxd5lG8vL7h7dtTqM5CvBnqyJ/A+VzLtqOqwn7emmEJq/BhbkwzWLmI3EgmJIS26wufphOey9pMCFlpCNIlfIQ+vsg5rh/lZwAZl/gWFLzGgX4tKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfGqMUXd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfGqMUXd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5369CC2BCFC
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 09:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785404977;
	bh=lun/JzWGaGqZ8GnVPAdnbkBqz0TF4+mO6sPw+aQ2Ypw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YfGqMUXdabmVVeEY4XIt6pEZVdWpNoYn1bgN52whXTlgA7xTIb5XxiBhAnFZ38S8p
	 04xwUKhg5gNQIokW3C0RaK6d5hZ0YspyDQ5EN/O2f4QOe1Jo2poQkUMDVaAsIM4uqQ
	 6NLEP46bs38Ba/xCJpwfs7fdw9hCZ+2g8H2ssrixCI+gBurs8reym95RznlZjJsIen
	 tYQwpHP9N4ErDNdrAI6GYmumlL0hyluDGsG4K+8ZHMxDVJTLIbX7KoXFnJPrq6TrM5
	 ViWzUZKN0iu4Qm7wdSqE5o6553dRTT53QJ6r4hpNMymF5nssrUDPs1XhtNnk3BJ4f5
	 EvV16OVz9bXAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4366BC41612; Thu, 30 Jul 2026 09:49:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 30 Jul 2026 09:49:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: gunnar.kistner@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-8AYCriCWcA@https.bugzilla.kernel.org/>
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

gunnar.kistner@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gunnar.kistner@gmail.com

--- Comment #158 from gunnar.kistner@gmail.com ---
I can reproduce what appears to be the same issue on a different HP AMD lap=
top.

Hardware and software:

* HP ZBook Power 16 inch G11 A Mobile Workstation PC
* Product number: 9A818AV
* AMD Ryzen 9 PRO 8945HS with Radeon 780M Graphics
* BIOS: W85 Ver. 01.10.05
* Embedded-controller firmware: 8.82
* Ubuntu 24.04.4 LTS
* Current kernel: Ubuntu 7.0.0-28-generic
* Also observed with Ubuntu 6.17.0-35-generic
* amd-pstate active / amd-pstate-epp

The issue occurs when the AC adapter state changes while the laptop is fully
suspended.

Confirmed reproduction:

1. Suspend while connected to AC.
2. Wait until the laptop has fully entered suspend.
3. Disconnect AC while it is suspended.
4. Resume on battery.
5. All 16 logical CPUs may remain fixed at approximately 544 MHz, even under
full CPU load.

The reverse sequence has also been observed:

1. Suspend while running on battery.
2. Connect AC while fully suspended.
3. Resume while connected to AC.
4. The CPUs may again remain fixed at approximately 544 MHz.

Changing powerprofilesctl between balanced and performance does not help.

When affected, Linux still reports:

* scaling_max_freq: approximately 5.263 GHz
* cpuinfo_max_freq: approximately 5.263 GHz
* CPU boost: enabled
* amd-pstate status: active

Briefly changing the AC adapter state again after resume immediately restor=
es
normal frequency scaling. Under the same 16-thread load, the CPU then reach=
es
approximately 4.39 GHz.

Ubuntu downstream report:

Launchpad Bug #2162127

I have attached a combined log containing the CPU state before and after the
recovery AC event, the cpufreq limits, and the relevant udev power-supply
events.

The complete before/after evidence is attached to Ubuntu Launchpad Bug
#2162127.

Key results from the attachment:

* Before the recovery AC event, all 16 logical CPUs remain at approximately=
 544
MHz under full load.
* After briefly changing the AC adapter state, the same test reaches
approximately 4.39 GHz.
* `scaling_max_freq` and `cpuinfo_max_freq` remain approximately 5.263 GHz =
in
both states.
* AMD P-State remains active, CPU boost remains enabled, and the power and
platform profiles remain balanced.
* The recovery event is detected normally as `POWER_SUPPLY_ONLINE=3D1`; aft=
er
disconnecting AC again, the system returns to `POWER_SUPPLY_ONLINE=3D0` and
battery discharging, while normal CPU performance remains restored.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

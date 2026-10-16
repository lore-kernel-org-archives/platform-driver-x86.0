Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB8349BB44
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 18:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175309; cv=none; b=qUH93MJVpB2saEZPvdqPgRVk1i/zhP4cnHnqgXM35XUtMB1oWzDuOdEh0CK3amZf24tzRHYKoigBrkG9q/jVd+mEFGGNSO5I3sZ85FNDSQfj0FtYGT7PnHlwMnNTQ+9tyZoQ3mXWpx8KpSmuZok3Y8ig/SP80VDCjVrEH/xEiZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175309; c=relaxed/simple;
	bh=10hhcb+teMBFLSbT/3K2b8Zye2TeejDqFqqpiCHgZU4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z9Lcrlwg8EBoP+7gmqyYeuN/FFAypRBe2hzQujePPxLtekbqV0o2/KTKrIdODf6hUu5UI9ShWJZNtvwPGrLnjTVQHa1io4lFPKmvncKiQkLFdLsPTU4ZunHPi9i38IwAi0nl4BwJjZfk5IxD1B8pTVm3iLmA2rBy4afcDd046zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0lPpssT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0lPpssT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 587DFC2BCF4
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792175309;
	bh=10hhcb+teMBFLSbT/3K2b8Zye2TeejDqFqqpiCHgZU4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E0lPpssTK0Bet75J/H1pqC5jXC+adynDAXG0M8TSgnVpZMvV6FPK3a98Rn0fdqWhQ
	 ig/ucET24esU8u1xXFPllw/twMJ8sEnKai694NB8V3lLB9DFlbc8M1UkCLO4uGAnny
	 hmCcSwlKml4groGW7D0F/lkhv0kh3I4AhwgJekiWbq3XcMmB+8+Smjvu68n1dxJxCB
	 +ZBMaDucDHZMio+051DO6wQPKPaSEPbYjcsG4SR041RJQ38kxqHVyvBm/n5I2gf7wE
	 /210iTmNsbdEWgyjE/YEcfN9YpuuwYaI8avOZC6BJos5MI/ldswqjj3OcvawVUegIE
	 yPiSyYSNJDDQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 38BDDC41616; Fri, 16 Oct 2026 18:28:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221752] asus-wmi: no camera LED classdev registered on Zenbook
 S 14 UX5406SA (micmute LED works)
Date: Fri, 16 Oct 2026 18:28:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: silk98287@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221752-215701-WawIUifFz8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221752-215701@https.bugzilla.kernel.org/>
References: <bug-221752-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221752

--- Comment #2 from silk98287@hotmail.co.uk ---
Hi, I'm also experiencing this same problem, where the camera disabled=20
LED doesn't illuminate despite the firmware blocking the camera when f10=20
is pressed. I'm using a Zenbook S 16 UM5606WA on bios ver 321 and Linux=20
7.2.9+deb14-amd64. My device is missing both the LED classdev=20
"asus::camera" and the device id 0x00060079 (ASUS_WMI_DEVID_CAMERA_LED).=20
I created a little patch that seemed to fixed this issue by also reading=20
the status from device 0x00060078 (ASUS_WMI_DEVID_CAMERA_LED_NEG) if it=20
is present, every time the f10 hotkey was pressed (on my device this=20
fired the WMI code 0x85). Although this worked, both the micmute key and=20
camera toggle key LEDs would turn themselves off every time the computer=20
was powered off, and not come back on until pressed (even though the mic=20
/ camera would still actually be disabled). I was first going to look=20
into that, but I can still send in the patch I have - I'm very new to=20
this so I'm not sure how to proceed, and I'm sorry if I've messed up any=20
formatting of this email, it is my first mail to the mailing list. :)

On 10/10/2026 22:09, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221752
>
> git@turtledev.nz changed:
>
>             What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                   CC|                            |git@turtledev.nz
>
> --- Comment #1 from git@turtledev.nz ---
> Same laptop here, UX5406SA with BIOS .309 (11/18/2025), Fedora 44 on
> 7.2.9-200.fc44, secure boot on. Same issue, no asus::camera LED.
>
> I dumped the DSDT to see what's going on. I think it also explains why the
> set side didn't work for Jos=C3=A9 in "[PATCH v2] platform/x86: asus-wmi:=
 fix
> camera key led on Zenbook S14".
>
> 0x00060079 (CAMERA_LED) just returns 0 for both DSTS and DEVS on this
> machine, so asus-wmi never registers the LED. Everything is on 0x00060078
> (CAMERA_LED_NEG).
>
> The DSTS handler for 0x00060078 reads EC register 0x50 and writes the
> result straight to the LED GPIO before returning:
>
>      Local1 =3D ^^PC00.LPCB.EC0.ST8E (0x50, Zero)
>      If (((Local1 & One) =3D=3D One))       { Local0 =3D One }
>      ElseIf (((Local1 & 0x02) =3D=3D 0x02)) { Local0 =3D Zero }
>      If ((FSIS =3D=3D Zero)) { Local0 |=3D 0x00080000 }
>      Local0 |=3D 0x00050000
>      Local2 =3D (Local0 & One)
>      SGOV (0x00180885, Local2)
>      Return (Local0)
>
> So a plain read is what updates the LED. Reading it after the camera key
> event, like v2 does, is enough. It's probably worth a comment in the code
> since the side effect isn't obvious.
>
> DEVS on 0x00060078 (2 =3D LED on, 3 =3D LED off) is guarded by a one-shot=
 flag:
>
>      If ((FSIS =3D=3D One)) { Return (Zero) }
>      FSIS =3D One
>
> FSIS only gets cleared in EC0W when Arg0 =3D=3D 4 (resume from S4). So af=
ter the
> first call each boot, every set returns 0 and does nothing. Bit 0x80000 in
> the DSTS result shows whether that first call is still available. I'd tre=
at
> the LED as read-only on this model.
>
> Other things I noticed:
>
> - The firmware handles the privacy itself. While the camera is "off",
>    /dev/video0 still opens and streams, but every frame is a grey placeho=
lder
>    with a crossed-out camera icon. There's no USB disconnect. The key LED
>    stays dark the whole time, since nothing does the DSTS read.
> - On S0ix entry the PEPD _DSM turns the GPIO off, and on exit it only tur=
ns
>    it back on if EC 0x50 bit1 is set. That might be related to the stuck =
LED
>    in the original report.
> - GPIO 0x00180885 is GPP_H_5 (INTC105D:02 pin 31). Micmute is GPP_H_4 rig=
ht
>    next to it. The pad is config-locked but TX isn't, so as a workaround
>    "gpioset -c <chip> -t0 31=3D0" turns the LED on and 31=3D1 turns it of=
f.
>
> I couldn't call WMI directly because of lockdown, so this is all from rea=
ding
> the DSDT. I can attach the acpidump, and I'm happy to test a v3.
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

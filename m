Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD0364052
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776918271; cv=none; b=dFjJG2enLRx6wQc+0inyvGlKMjmDWAiiihKMLu5TcdCAViekHD5O6iNIwNbjQtwXuPJEg9yeuGw337nUOEKoDRSTXtbl70KWJOSTopoTBVPsA6ay5z0m75fNWWIDpB4APFVKJ9BnLgamY8/r33WXA+xyEPf8XtdaVOOdmdJbq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776918271; c=relaxed/simple;
	bh=zTe9MCxbi7LAcgwnkOCwyNhf75d8KTE9Z6gpFxkcq3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/1n3BvVc4ryI91DmgF4c50Ift2t9adeQOtAxJVbzI9zuwfA2lhqZOAKuO1dvkRh/nM/vbRUav6jkQ9Ji9/748cNBKsoQ9icq3z444NQrd89d8XydqpWhe0Ama1fcWfI7DGkLcpl7b/wm7nsf1qmr6YfxZqabRpF3OGwH3iAraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSOR3vV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSOR3vV0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC1E1C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776918271;
	bh=zTe9MCxbi7LAcgwnkOCwyNhf75d8KTE9Z6gpFxkcq3w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GSOR3vV0vfCLCYL++LgNJEt7KOnEWzQQqKYA9xi/jcIwtIv9LvILkF4hjOSZGtOks
	 +2+DfvWM28V5VWnKGl5YbxTWOrLWJD47i9ZK7zPkarGAUSR5FY967y+ND3WtdQHw5B
	 lMMWBOYx8vsytrH57Dd2OwzpaUknCWW/FfNXjjFHuinLMg4Tc11GcmgQHgCFyVJAb6
	 4PE+BwziQl8oSHJdoipIxy1UZohOXZU/7BWeGB6QmBrJX38siEI5GW0cixIsl4/GW6
	 HqmDxz6yjLXKSzAwLWx9eBi7Xg3lG8k7UaslsnIgB3VU8QcEZdFzcdSzONIW5WFdbP
	 Yea2X0bm/pyaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B04FDC4160E; Thu, 23 Apr 2026 04:24:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 04:24:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-biNIbolBxA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #22 from Daniel Gibson (metalcaedes@gmail.com) ---
Alright, thanks :)

So here a longer post about what I'm seeing on my machine.
Note that unlike Sindre I see these issues even if the laptop has only been
suspended for a few seconds (I always wait until an indicator LED on the si=
de
starts flashing instead of being on constantly).

After booting or rebooting the system, everything works as expected: The F-=
keys
do their thing (mute audio or whatever), when combining them with Fn they
behave like normal F1, F2 and so on and the lid switch also works, so when
closing the laptop it suspends (when configured that way).

However after suspend+resume, the keyboard doesn't work anymore, and neither
does the lid switch.
Running `echo i8042 | sudo tee /sys/bus/platform/drivers/i8042/unbind`
and then `echo i8042 | sudo tee /sys/bus/platform/drivers/i8042/bind`
makes the keyboard mostly work again, except that the Fn keys don't work as
intended (pressing F1 and Fn+F1 both report plain F1, not Mute) and the lid
switch still doesn't work.

Adding "i8042.nopnp" to the kernel commandline helps a bit: When it's set t=
he
keyboard works after suspend+resume without unbinding/rebinding it, but the
Fn-keys and the lid switch are broken after resuming, just like before.


In dmesg I noticed a message "ACPI BIOS Error (bug): Could not resolve symb=
ol
[\_SB.PC00.LPCB.EC0.SNTM], AE_NOT_FOUND (20230628/psargs-330)" during wakeu=
p.
After decompiling the ACPI tables the I saw that this indeed doesn't exist,=
 but
"\_SB.PCI0.LPC0.EC0.SNTM" does, so I patched the call accordingly. Didn't s=
eem
to make a difference, though, apart from getting rid of that ACPI BIOS Erro=
r.=20


When I tried to run `amd-s2idle test`, it refused because "GPIO interrupt is
not served" It suggests loading the i2c-hid-acpi kernel module, but it was
already loaded.
So I checked `/sys/kernel/debug/gpio` and it contained the line

> #89   =F0=9F=94=A5 =F0=9F=98=B7|     =E2=86=93|  level|    |   |     |  |=
    |  =E2=86=93 |input  =E2=86=93|=20=20=20=20=20=20=20=20
> |0x10240b00

Apparently that fire emoji means that this GPIO interrupt is not served (it=
's
the only line with fire).
`gpioset -c gpiochip0 -p 2m 89=3D1` makes that issue temporarily go away and
allows running amd-s2idle.

GPIO Line 89 seems to belong to the touchpad, when setting dyndbg=3D'module
pinctrl_amd +p' I get lots of lines like
[   25.273930] GPIO 9 is active: 0x10141b00
[   25.273967] GPIO 89 is active: 0x10240b00
[   25.280561] GPIO 9 is active: 0x10141b00
[   25.280585] GPIO 89 is active: 0x10240b00
in dmesg whenever I touch the touchpad.


Rarely they keys and lid switch still work after resume, usually in that ca=
se
there's a message like
[   54.421557] amd_pmc AMDI0005:00: Last suspend didn't reach deepest state
in dmesg. When that happens the next suspends behave the same (and still yi=
eld
the message), until rebooting.

Once or twice things "worked" without showing that "didn't reach deepest st=
ate"
message; unfortunately in those cases I didn't check power consumption on t=
he
wattmeter the laptop's power adapter is plugged into, so I can't say if it =
was
a proper suspend or not.

I attached a lot of stuff, run with Kernel 7.0 from Ubuntu's mainline repo =
(my
own build has lots of changes for additional debugprints by now) and mostly
with unpatched (original) ACPI tables, except for
dg-16ABR8-dmesg_patched_acpi.txt and lshw which are with the patched ACPI t=
able
to get rid of the aforementioned "ACPI BIOS Error".
dg-16ABR8-ssdt14-mod.dsl is the source of the modified ACPI table.


Is there any more information I can provide, or things I could try?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4063A16BA
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309069; cv=none; b=oJyiuurlO4vPJd9dgYNMn9aocEZ6vt9+3ki4KKvEJwqRtBb9C2RS4iC8TUpCEo0Lr9BBY5OOKgCZ3MliHH3PwmoWMc2GTQIXoD3PIQNxXFgOZkTW18dFCMqiudRICg711Z2g8wx03HtqeNvXC4TlUogRh1XuEXokooZ4ZL6uaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309069; c=relaxed/simple;
	bh=YWXxW6kD2rWWu2eAeZ4d481K2nanr+QSxyMDHHwqFTg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EQt1yvx/JsLQ4bwOoHSTqMa9XkAIlHCdAORcSXoyvTFR7bX2S9HL/KiNcNUd2AblrPzy73afbCoXOWdLMjrbFX9/TkJQBzsx4MBtFXTvCE9yETy4iUjJ8Lc4ewaCSYyqgP7j3UiJaZd/6ofvjhVkpR5/Y0cWtGl6/UxZmgDlxzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mh5RiabO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mh5RiabO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBB58C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309068;
	bh=YWXxW6kD2rWWu2eAeZ4d481K2nanr+QSxyMDHHwqFTg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mh5RiabOjK9GxrXZzk37nxhQgDNykOlTsNJPTbQw/IY6tZxWsxPNA0EFwnlRt29Hp
	 PtHtM72AeehzhMyq5WytxFd+5Cs4SipVE9yF4OSBq6nR9VlGHPafYoD4GEP46/u2bj
	 YXXlQ8BdDzj5JoeOnK8+hIwCqUIFpzqVjqkf8M1XNa5oYtxAimB0vMkvMjlyQuhf2a
	 6VwSS2hIKHPhecZm8YLSBxnJNn+QVoOT4UZHe/iSNhTsUezK/jCkTuaB2gXMWZ5d0w
	 jhCFSYAVoyP5t0GZCY8yUOZLga4q0RczSyJZ68gD7FTICBSeqHG/3t4OUoaixtemIV
	 lmONQ3Zi/ikSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA18EC41613; Fri, 21 Aug 2026 10:44:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:44:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220926-215701-dCHgzFTgEJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #6 from Gibs (gibs23@proton.me) ---
(In reply to Suryansh Singh from comment #5)
>=20
> Can you attach the text files made out of these commands?
>=20
> sudo modprobe ec_sys
> sudo hexdump -C /sys/kernel/debug/ec/ec0/io > ec_dump.txt
> sudo acpidump > acpidump.txt
>=20
> If possible, please also provide two more EC dumps, one while plugged in =
and
> one while on battery power (can be named as ec_charging.txt and
> ec_battery.txt). This will help me isolate the ENVY's performance flags, =
if
> there are any relevant to the charging status.
>=20
>=20
> Also, I noticed this a bit late, but in your first comment you mentioned
> that you could switch profile which changed fan behavior, but hp-wmi read
> fan RPM at 0 and the package power didn't change.
>=20
> How were you changing the profile, if you meant you did that on Linux, or
> did you change it in Windows prior to rebooting? Since the driver hit a -=
22
> probe error when you tested, the standard
> /sys/firmware/acpi/platform_profile node shouldn't even be exposed. Was it
> exposed before you even added your board ID in the driver?
>=20
>=20
> It might take me a while to figure out everything and multiple tests thro=
ugh
> your device to make a working patch, but I'll try my best to help.


I tried dumping with:
```
sudo hexdump -C /sys/kernel/debug/ec/ec0/io > ec_dump.txt
```
But there's too little data in there, only 256 bytes. I looked in acpi dump=
 and
used the 0xFE0B0800 offset to dump 512 bytes from /dev/mem directly with:
```
sudo dd if=3D/dev/mem bs=3D1 skip=3D$((0xFE0B0800)) count=3D512 2>/dev/null=
 | hexdump
-C
```
So the attached data is from this command, to me it looks like the same data
from ec dump, but more of it. I actually monitored it with:
```
watch -n 0.1 -d "sudo dd if=3D/dev/mem bs=3D1 skip=3D$((0xFE0B0800)) count=
=3D512
2>/dev/null | hexdump -C"
```

This allowed me to see highlighted values that changed in time. So what I c=
ould
make out is that one fan speed is at 0x11 offset, and the other fan way ove=
r at
0x115 for some reason. These two seem to be the actual fan speed values, ma=
ybe
% . There's also set fan speed which seem to be at 0x125 and 0x126. Whenever
fan speed changes these two values change instantly, and then the actual fan
speed values start going towards those set values, and they correlate as so=
und,
ramping up or down.

At 0x127 there seems to be some kind of...fan speed/cooling index? 00 to 04,
where 04 is when fans spun fastest, and 00 at 0 rpm. So maybe I won't be ab=
le
to set certain fan speed rather one of these levels of cooling?=20

Regarding battery power / connected charger I noticed 0x10 changes from 00 =
to
01 the moment I connect the charger to the laptop, and one second later or =
so
0x0e changes from 00 to 1a. When I disconnect the charger both offsets go to
00.

I noticed a few other values that are constantly changing, couldn't correla=
te
them to anything else, just an offset seems to be some kind of countdown
counter that keeps repeating.

Ah and 0xb0 and 0xb1 seem to be hotspot/die temps, and there's one more temp
that lags a bit at 0xa7, maybe edge sensor or iGPU?

Regarding the profiles:
```
cat /sys/firmware/acpi/platform_profile_choices
cool quiet balanced performance
```

And:
```
cat /sys/firmware/acpi/platform_profile
cat: /sys/firmware/acpi/platform_profile: Invalid argument
```

But this works:
```
echo "quiet" > /sys/firmware/acpi/platform_profile
```
Or any of the 4 options. To me it seemed like the behavior is changing when=
 I
load it with stress -c 20. Fans come on faster when changing from quiet to
performance, higher power draw at low load, I think but not sure, just a qu=
ick
test.

Also managed to sort out power limit, I have to:
```
sudo sh -c 'echo 55000000 >
/sys/class/powercap/intel-rapl-mmio:0/constraint_1_power_limit_uw'
```
And this seems to increase the power limit to 55W.

Hope it is clear, sorry if hard to follow. Will attach asked files.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

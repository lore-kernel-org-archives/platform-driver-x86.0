Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D7E24A047
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 17:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780767650; cv=none; b=TFZYa6sRbs+0xKjvF8uXtA4OWbobGsmh0DGbfjBDqa+N2Vze9LJtt4AVsf88fYiE78DBV5WlIJCo5HrUpSBHrS88iDl7Tdsim6tC15Iqt0+EcOKK7DoPI6mnU77drpjobDoTpJ8pqfwAzfOHNnmcKdiEZJbDI4MQ/YqVCsWwRbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780767650; c=relaxed/simple;
	bh=Ypy6jU9mwKc2t5TFvWbly8Pz7M8Ownr2MaAAvL7Jfug=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BPNack6twk+kpk8U8r165buvej0js30pVa6dtU6V3catEy1CKvfW24t7EhwAfZrQ+rS6YnLr37+kwNaIaWheoTGk5dSdC9VbnGfiGFH/IJrf7QzQGrYRU56dlE5a+xriPvEuf7vuv5otgyB8i77zetzzbgDB6jQiEkcjyjHC7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLhGecHN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLhGecHN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FE79C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780767650;
	bh=Ypy6jU9mwKc2t5TFvWbly8Pz7M8Ownr2MaAAvL7Jfug=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KLhGecHNg3L93SKXk52r4KAYYCrdJsovSo3omRuk+AfHhR81CjPU/V4m09dCS29tA
	 PNM2ZZ9PYBmo39EWQsXF7mU7o/BarVidpvfI9DVNoLond5HPYpPZip6Kj1DBHyfOzd
	 0J0rVXOWH8PD0g2f4+3zk2jg9YTtLlbV+A249ndkzIKfttWnwRq0po5JBK7SsooKMn
	 ic4EOpwp7/VMEsrnq5GZCTv3ACKsB42fa3RU3bVZc/kXskN+7pbWZpoNJqWvklZDL4
	 u3kuzRIKc6bfcRgbPTbzTcwRckYG6ZChq81IndOT1tx1Z0FgGnwFL4C00IS54CYYAn
	 40DedMgYFUtpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3E79EC41613; Sat,  6 Jun 2026 17:40:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 17:40:50 +0000
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
Message-ID: <bug-221583-215701-J8hIoa1SNE@https.bugzilla.kernel.org/>
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

--- Comment #28 from Rong Zhang (i@rong.moe) ---
(In reply to George from comment #26)
> Hi Rong,
>=20
> I did the lid test exactly as you asked. I set the keyboard brightness to
> High using Fn+Space.

What I said was "try writing to 0x2A, and ...". What value did you write?
Nothing? Or the High one? You would need to write a desired brightness value
other than the current physical one to 0x2A right before closing the lid.

> When I closed the lid, the keyboard light turned off
> after about 5 seconds.=20

Hmm, after 5s? Most devices I met turn off the keyboard backlight immediate=
ly.

Please check if GNOME puts your laptop into suspend (sleep) after receiving=
 a
lid event. If this is the case, please disable the feature in GNOME before
experimenting again.

> When I opened the lid again, the light turned back on
> at High. (Closing the lid when the keyboard light is off does not turn it
> open when i open the lid)
>=20
> I also ran the diff command on the MMIO dumps before closing and after
> opening the lid.

Unfortunately, you dumped the MMIO region twice with the lid open: before
closing =3D=3D lid is open; after opening =3D=3D lid is open.

I need it once with the lid open and once with it closed (and *keep the lid
closed* while dumping). Basically, you would have to connect to an external
monitor to use the laptop with the lid closed, or use SSH.

> The output is:
> 2c2
> < 0x00000000FE00D401: 00010000
> ---
> > 0x00000000FE00D401: 00000001
>=20
> 7c7
> < 0x00000000FE00D406: 00011100
> ---
> > 0x00000000FE00D406: 00011010
>=20
> 177,178c177,178
> < 0x00000000FE00D4B0: 00110010
> < 0x00000000FE00D4B1: 00101100
> ---
> > 0x00000000FE00D4B0: 00100110
> > 0x00000000FE00D4B1: 00101010
>=20
> 184c184
> < 0x00000000FE00D4B7: 00101000
> ---
> > 0x00000000FE00D4B7: 00100111
>=20
> 199c199
> < 0x00000000FE00D4C6: 00010010
> ---
> > 0x00000000FE00D4C6: 00010011

Nothing looks special. They are just some volatile values related to thermal
states.

>=20
> I also did the manual test of register 0x8A as yoy asked
>=20
> Step 3 (KBLO =3D 0, KLFS =3D 0): the light turned OFF
> Step 4 (KBLO =3D 0, KLFS =3D 1): the light did not turn ON
> Step 5 (KBLO =3D 1, KLFS =3D 0): the light turns ON at LOW brightness
> Step 6 (KBLO =3D 1, KLFS =3D 1): the light stays at LOW brightness

During the test, what's the 0x2A value? In other words, where was the first
step?

Could you try the procedure below to see if it synchronizes the brightness:

1. Write a desired brightness level to 0x2A. It must be different from the
current physical one
2. Read 0x8A
3. Manipulate the read value to make KBLO (bit 0) =3D 0, and write the modi=
fied
value back to 0x8A
3. Same as 2, but KBLO=3D1

And repeat the procedure with different brightness levels written to 0x2A.

> Hopefully i got everything correct.

You've done quite well, other than missing some pieces. Please address them=
 in
your next reply.

> I am also attaching the stock dsdt.

It's not the one I asked. I asked for a full DSDT corresponding to the snip=
pet
in comment 24, which returns 0x3 when the ICMD is 0x1. Your attachment retu=
rns
0x5.

Anyway, it's not important anymore, and you don't need to reupload it. Test
results for smashing KBLO are enough for me.

>=20
> Oh  yeah also Bios info:
> Version: GLCN68WW
> Release Date: 03/19/2025

Fine, it's up to date. So an up-to-date BIOS can't fix this. Classic Lenovo
conduct, sigh.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

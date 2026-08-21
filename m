Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CDB2C86D
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787277699; cv=none; b=rtZZ35zH7NdbRtQ5YYBpLn9hoR6SpTLlTqwxb2giEYYYojaq4HaquNXBk0hixyRvkms6ah3AarRCtSPDK8SAMupJpvm4utSqYf9Dg4w0Ls/pg/fysQ0bUVdCfmk/RMb9fC1TZnH4iarB4uhJ9m60qiwPCKqcYL/4FgiS7UQZDXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787277699; c=relaxed/simple;
	bh=MW8t6Yc8qT6OlkINTNiRCOE1QLKjJaqu4nPtRgOlmPo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SnVbFBD07QvHwx/c/flU4VfXQtJcys+El/PVXVvqqcD35DLzhn9ZDjWBmHH3GJbRoz5WKXPQfkeRgX2/cE0TByNvT8vsraxV2ggmnM9VtLZ8tNZY4sIzYDoeg7nC/BmbT3X9vl6x+lyeMHZXyd3oeI8SkUU5LBeCqTHGAB7AmFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkGFB8yd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkGFB8yd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98071C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 02:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787277698;
	bh=MW8t6Yc8qT6OlkINTNiRCOE1QLKjJaqu4nPtRgOlmPo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lkGFB8ydaVajSU5L50JN9j+Kqv40fpY8d680bkqxJm2zvTZWM1QH2QoBwPyLnb9sa
	 vQmQwZmjHZJVPWmMGHuudB8sAdhLsQ3OkWWqSeFw19cVPPuspt6HU+LNDn0gmG8VcH
	 dvUoB+53umz2moD49vlVgQRwPRlE1f7jmyGFdvlH+mZiZN5zdtPzjPYVZsotAP2ZyK
	 UVMZX/EZzz29i2t8a3/qELKPoN+g4vSPot1bz1K3Mg5DTLqU+xJCU53lfoyr6ZTVI7
	 ncKdSlDAhMjdd+H/NT4x9hpJCFkTWvCKj0sE86i2zlHjS7NBfTQqh/Qec17wNcoCv7
	 AeI6nbUPrC1jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DE36C3279F; Fri, 21 Aug 2026 02:01:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 02:01:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: technosfan14@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220926-215701-RVrxujg49A@https.bugzilla.kernel.org/>
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

--- Comment #5 from Suryansh Singh (technosfan14@gmail.com) ---
(In reply to Gibs from comment #3)
> (In reply to Suryansh Singh from comment #2)
> > (In reply to Gibs from comment #1)
> > > I have the same problem on same platform on kernel 7.1.8.
> > > Changing profiles does change fan behavior, but RPM reads 0 with hp-w=
mi.
> > >=20
> > > Package power also seems to max at 40W no matter the profile. On Wind=
ows
> I
> > > have peaks of 115W and then drops at 55W after a short while.
> > >=20
> > > I also tried mapping my board ID to Omen or Victus configs but doesn't
> work,
> > > the ENVY seems to be different.
> >=20
> > Hi,
> >=20
> > Could you please provide your board ID, or clarify if it is the same as
> > Andres?
> >=20
> >=20
> > Are you sure you've tried out all Omen or Victus configs? The latest br=
anch
> > for the platforms/x86 subsystem (pdx86/for-next) has an expanded driver
> > scope compared to the current upstream version of the kernel you're
> running,
> > so consider using the code on that branch for mapping your board ID to
> > specific driver data in hp_wmi_feature_boards[]
> >=20
> >=20
> > In case none of the existing parameters apply to your ENVY laptop, the =
EC
> > behavior and specific quirks required to get it working will have to be
> > reverse engineered and patched into the code, rather than the regular p=
atch
> > of mapping the board ID under predefined parameters.
> > You may contact me at my mail if that happens to be true, I'll be glad =
to
> > help in the whole process if it gets that complex.
>=20
> Hello, thank you for offering to help!
>=20
> It is the same board:
> cat /sys/class/dmi/id/board_name
> 8BE5
>=20
> I had a look on the motherboard and I found a ENE KB9542GF chip, this see=
ms
> to be the EC. It may be present on a few Dell laptops, may have found it =
on
> an Alienware. There's also a different package for this chip, still marked
> KB9542 but different suffix and QFP package, which is also present on some
> other laptops, like ENVY x360 by the results of some searches.
>=20
> I will have a look at the latest branch as you suggested, will report back
> after testing.

(In reply to Gibs from comment #4)
> (In reply to Suryansh Singh from comment #2)
> > (In reply to Gibs from comment #1)
> > > I have the same problem on same platform on kernel 7.1.8.
> > > Changing profiles does change fan behavior, but RPM reads 0 with hp-w=
mi.
> > >=20
> > > Package power also seems to max at 40W no matter the profile. On Wind=
ows
> I
> > > have peaks of 115W and then drops at 55W after a short while.
> > >=20
> > > I also tried mapping my board ID to Omen or Victus configs but doesn't
> work,
> > > the ENVY seems to be different.
> >=20
> > Hi,
> >=20
> > Could you please provide your board ID, or clarify if it is the same as
> > Andres?
> >=20
> >=20
> > Are you sure you've tried out all Omen or Victus configs? The latest br=
anch
> > for the platforms/x86 subsystem (pdx86/for-next) has an expanded driver
> > scope compared to the current upstream version of the kernel you're
> running,
> > so consider using the code on that branch for mapping your board ID to
> > specific driver data in hp_wmi_feature_boards[]
> >=20
> >=20
> > In case none of the existing parameters apply to your ENVY laptop, the =
EC
> > behavior and specific quirks required to get it working will have to be
> > reverse engineered and patched into the code, rather than the regular p=
atch
> > of mapping the board ID under predefined parameters.
> > You may contact me at my mail if that happens to be true, I'll be glad =
to
> > help in the whole process if it gets that complex.
>=20
> I tried the version from the next branch but still no results. With
> &omen_v1_no_ec_thermal_params I get a kernel panic, and with the others t=
he
> driver fails to load with hp-wmi hp-wmi: probe with driver hp-wmi failed
> with error -22.

I see, the kernel panic is slightly unusual, but other than that I believe =
your
board does not match with any of the provided driver data yet, causing a
mismatch between the actual parameters and the ones in the code, and hence =
the
error.


> For one of them I got an extra:
> hp_wmi: Unknown EC layout for board 8BE5. Thermal profile readback will be
> disabled. Please report this to platform-driver-x86@vger.kernel.org


I'm assuming this one happened when you mapped it to Victus S thermal param=
s,
they still use HP_EC_OFFSET_UNKNOWN, and that is what leads to that warning
message (explicitly defined in hp-wmi.c).


Can you attach the text files made out of these commands?

sudo modprobe ec_sys
sudo hexdump -C /sys/kernel/debug/ec/ec0/io > ec_dump.txt
sudo acpidump > acpidump.txt

If possible, please also provide two more EC dumps, one while plugged in and
one while on battery power (can be named as ec_charging.txt and
ec_battery.txt). This will help me isolate the ENVY's performance flags, if
there are any relevant to the charging status.


Also, I noticed this a bit late, but in your first comment you mentioned th=
at
you could switch profile which changed fan behavior, but hp-wmi read fan RP=
M at
0 and the package power didn't change.

How were you changing the profile, if you meant you did that on Linux, or d=
id
you change it in Windows prior to rebooting? Since the driver hit a -22 pro=
be
error when you tested, the standard /sys/firmware/acpi/platform_profile node
shouldn't even be exposed. Was it exposed before you even added your board =
ID
in the driver?


It might take me a while to figure out everything and multiple tests through
your device to make a working patch, but I'll try my best to help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

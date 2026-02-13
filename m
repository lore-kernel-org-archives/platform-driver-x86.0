Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E934F24E
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990683; cv=none; b=rrkvaeqxQd8UsBouPHGpNqfE354+ybGarJezvlAqGgCe/zCmGDlUTnBokd9hIZOHrpfEuiBGEjTQDEGxsM1UGsZzMoTfijmzS0DUw8eo3K42ppQVeyB55k28dFryLoRAMQEZ07WIHR0/S1p0cv9GUQyRw6CUZvWKcT8PLvH+wOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990683; c=relaxed/simple;
	bh=IKrrLREodVT1l36wQ/D2N1Fna9RzB6hxrT+VODMsUNY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DR5uNJbq/3nM58lI4/gbSVv28zD21NsW4i+IdjBLpHXT91bAJWQSWCMKabD8rms67DRidf97t6+PfmoqyDOX01evRuSJRw5Yo4hpHzOxg8l3Ms3OEKaxLoHRF3vX96cmNoMi4uIXlobS/wh4y5ub1s8T5o8QJ1ox/W+h6vWoq8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nuq9xY0t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nuq9xY0t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B39CC116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770990683;
	bh=IKrrLREodVT1l36wQ/D2N1Fna9RzB6hxrT+VODMsUNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Nuq9xY0tdYmEj/m7so7yCAeef0jk+fX7REEdvyb6s6hyi2DfrHHzeXkMBxXT789WI
	 x0NJ/Qg1Ow7lJu6d8x9mQaTRFDewGv+UdNvuGShC9dkpEvjiSC7tp4/qkygXMdPxbe
	 1dnRnTMwL6uUvgvfmDVJ4bszy4k4zjh1LfICgBjzQ8MZJT093+Q72D5y1tcKKp0cYT
	 ycoM6FrU+nyRLs29C0iNrL6F6kMgzXyFp8/ejVj2lkk0RWv3nSERjGZES+afThcYsm
	 aTqjFalYH4c3B35ROScWNBOIqmEQ74M/6V2cNaI6jO7SseXYINM9KGOXloWlqDHIJg
	 dG6ksItpupyWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0C0B1C433E1; Fri, 13 Feb 2026 13:51:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Fri, 13 Feb 2026 13:51:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-T7C1ErnjuK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #6 from Krishna Chomal (krishna.chomal108@gmail.com) ---
(In reply to Juan Martin Morales from comment #5)
> Hi, sorry for the delay in responding, here is the output:
>=20
> $ sudo xxd /sys/kernel/debug/ec/ec0/io
>=20
> 00000000: 0000 0000 0001 4800 0f84 fa71 0ffa 1c01  ......H....q....
> 00000010: 0114 251e 1400 ffff ffff ffff 40fa ac24  ..%.........@..$
> 00000020: 0000 0000 0000 f900 350f 2100 4436 4b59  ........5.!.D6KY
> 00000030: 5844 3049 3831 494f 324c 4500 0100 00ff  XD0I81IO2LE.....
> 00000040: ffff ff01 00ff ffff ff4c 494f 4e00 0000  .........LION...
> 00000050: 0001 ffff 3100 000f 4301 2d41 0000 0000  ....1...C.-A....
> 00000060: 0080 1620 3333 332d 4143 2d31 322d 4100  ... 333-AC-12-A.
> 00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000080: 0000 0000 0b00 0000 0000 0000 0000 0000  ................
> 00000090: 3333 332d 4143 2d31 3257 4b30 3630 3833  333-AC-12WK06083
> 000000a0: 0000 00d8 4100 0037 0000 0008 642a 0078  ....A..7....d*.x
> 000000b0: 3737 2c3c 2900 2423 0028 0800 c342 1110  77,<).$#.(...B..
> 000000c0: 0000 6d1e ab0d c232 3c2d 6c20 6d1e 641c  ..m....2<-l m.d.
> 000000d0: 0000 0000 0000 6d1e 0a03 5b01 0000 e000  ......m...[.....
> 000000e0: 0000 00ed 10eb 10ea 1000 0087 034f 0081  .............O..
> 000000f0: 0052 0000 0000 5433 5000 0049 574f 0000  .R....T3P..IWO..

Thanks. We can clearly see that register 0x59 is holding the thermal profile
state, so HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET should be used.

Can you please test the following patch (based on pdx86 for-next branch)?=20


diff --git a/drivers/platform/x86/hp/hp-wmi.c
b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..6a1b454baaee 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -173,6 +173,10 @@ static const char * const victus_thermal_profile_board=
s[]
=3D {

 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
 static const struct dmi_system_id victus_s_thermal_profile_boards[]
__initconst =3D {
+       {
+               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
+               .driver_data =3D (void *)&omen_v1_thermal_params,
+       },
        {
                .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
                .driver_data =3D (void *)&victus_s_thermal_params,


After loading the patched driver, please verify the following:

1. Check dmesg for successful registration message:
   "hp_wmi: Registered as platform profile handler"

2. Verify that fan RPM is readable and controllable via sysfs.

3. Verify that on changing platform profile, and it does physically change =
the
amount of power drawn in the CPU/GPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

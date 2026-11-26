Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697553;
	b=y00DhzEtRkokLwsCeofbscfhSwCrEalqnGGUm5zoVOUtQiVSFKj7fo6wefD7V+oTJuR5
	 aGyE2SDnOzG9+/8fwqlIq2jWwuPtpx+50PDNBmT4FrFWrbCKTrfRPigMZtU8XBLu2RZ97
	 vhUkeyA73yusf6vdsxvGlfWHcMCDuwUqxBPcYwYf0SJiPMaWXTn/EqeGyOKh4YOIfj9kH
	 MgvKiEIw9p0azo30vXmUE7xR6rOqrPrc41PsihoKm87ZoafMN5QDYqfNsFgPDc2g3ezmA
	 WWmTNA4JgYbWJdbrbawLPmoUGRa7quE3lkg3CgRwk6jLoA7CX/TzZRgzgttJYxiz+Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697553;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=zR/xZ4BCH7coC71mNndLUxWa+5U/UbNolbgNI+btiyE=;
	b=kmlybOfjKrFGqmPVmf3zS416Ay3cz5T7OdTLJAUZy+sBdlpdRpe+78i3V/WjoCY68GP0
	 O4PqR81u9mL2ji74wbdb3OtcdFDsbY/IpYwkDwENYszz1IweLURWhT3WVxw/N0Tv+THjY
	 ehMTcab1dbAtHFa2EFSkT5LrdrBu2OBGLfiiqx8m0xvPfeik/vuRcmaZRwOld04qIcnZM
	 uI2kM5pnKlsWaJyY4DI8QDlBFD8+nIr61uK3wb3lzHvrrQmD6mUVtwSU14Jq6XrAMnzC3
	 025L2gg9DDoxBJC/3/EEtx2I4EcXgx/8J06iQZZmuZwr2f3cCq6BKvNubfclOYiM0/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFsJ0dbX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073C606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFsJ0dbX
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30EA11F000CF
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 12:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697553;
	bh=zR/xZ4BCH7coC71mNndLUxWa+5U/UbNolbgNI+btiyE=;
	h=From:To:Subject:Date;
	b=oFsJ0dbXNx18K2co+KscBOt4zKg2S5Dx4U5NO8lXASv+9q7uzhGrU9ALBKJMMYgv5
	 Vra32I5eki9Agg4czvaCYDzSqVCmZ3O2hBGSE9izHUJGQV7FbgIV9BeGnomdZZczyv
	 h15WFwBJtg0viAVHg7sdJtPIykbyMzUK81ipjTeQA2wCVSuYLQbzjN/HLOIjVZRJJt
	 mhm6wK8meV22JABmJVC46s2IK0pWrrtrsC6OqnvHFUZfRg0zUkRFcXOtnciocT5t+9
	 JCYIn2lNWKMv06wi7SJg8+glxwrnkb2dS2RNkE0WZALhA2NONjxMZv1YGJ34Zdn1N7
	 rKxPukakMZXSg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 2D54D240040D; Thu, 26 Nov 2026 12:52:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222329] New: thinkpad_acpi: ThinkPad L590 returns previous
 threshold value when switching between BCTG and BCSG reads
Date: Thu, 26 Nov 2026 12:52:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: w.yizheng.self@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-222329-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222329

            Bug ID: 222329
           Summary: thinkpad_acpi: ThinkPad L590 returns previous
                    threshold value when switching between BCTG and BCSG
                    reads
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.18.65
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: w.yizheng.self@gmail.com
        Regression: No

Created attachment 311586
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311586&action=3Dedit
DSDT dump (ThinkPad L590, BIOS R0ZET60P 1.38)

Hi,

On a Lenovo ThinkPad L590, reading battery charge thresholds via thinkpad_a=
cpi
sysfs attributes returns the *previous* query's result on the first read
whenever switching between start threshold (BCTG) and stop/end threshold
(BCSG).
A second consecutive read of the same attribute returns the actual value.

=3D=3D System Information =3D=3D
- Model: Lenovo ThinkPad L590 (20Q8A0MLCD)
- DMI:
  sys_vendor:          LENOVO
  product_name:        20Q8A0MLCD
  product_version:     ThinkPad L590
  product_family:      ThinkPad L590
  bios_version:        R0ZET60P (1.38 )
  bios_date:           11/05/2025
  ec_firmware_release: 1.18 (EC R0ZHT39W)
- Kernels tested:
  - 6.18.65-1-lts (Arch Linux official LTS kernel)
  - 7.3.6-zen1-1-zen

=3D=3D Kernel Boot Log (6.18.65-1-lts) =3D=3D
Linux version 6.18.65-1-lts (linux-lts@archlinux) #1 SMP PREEMPT_DYNAMIC Mo=
n,
23 Nov 2026 16:05:10 +0000
thinkpad_acpi: ThinkPad ACPI Extras v0.26
thinkpad_acpi: ThinkPad BIOS R0ZET60P (1.38 ), EC R0ZHT39W
thinkpad_acpi: Lenovo ThinkPad L590, model 20Q8A0MLCD
thinkpad_acpi: battery 1 registered (start 45, stop 60, behaviours: 0xb)

=3D=3D Steps to Reproduce =3D=3D
With actual EC thresholds set to start=3D45, stop=3D60:

1. On 6.18.65-1-lts, reading start 3 times then end 3 times:
   $ for f in charge_control_start_threshold charge_control_end_threshold; =
do
       echo -n "$f: "
       for i in 1 2 3; do echo -n "$(cat /sys/class/power_supply/BAT0/$f) ";
done
       echo
     done
   charge_control_start_threshold: 45 45 45
   charge_control_end_threshold: 45 60 60

2. Similarly, reading start after end returns 60 on the first read and 45 on
   subsequent reads (60 45 45 45 45). Reading end then start once each in
   alternation consistently returns swapped values (end=3D45, start=3D60).

3. This is not a timing race: inserting `sleep 2` between switching from st=
art
   to end (or vice versa) still returns the previous query's value on the f=
irst
   read (45 then 60, and 60 then 45).

=3D=3D Analysis =3D=3D
In the DSDT, both methods delegate to the same SMI wrapper:
- BCTG(Arg0) -> \PSIF(0x05, Arg0) -> SMI_(0x14, 0x05, 0x05, Arg0, 0x00)
- BCSG(Arg0) -> \PSIF(0x07, Arg0) -> SMI_(0x14, 0x05, 0x07, Arg0, 0x00)

The firmware appears to lag by one query when switching between BCTG and BC=
SG.
- `tpacpi_battery_add()` reports the right values at boot because it evalua=
tes
  BCTG twice (capability check + read) and BCSG twice.
- `upowerd` also reports the right values because libgudev reads each sysfs
  file twice (`g_udev_device_has_sysfs_attr()` followed by
  `g_udev_device_get_sysfs_attr_as_int_uncached()`).
- Userspace tools that read each sysfs attribute once in sequence (such as =
KDE
  PowerDevil's `chargethresholdhelper`, which reads end then start once eac=
h)
  consistently get swapped thresholds (end=3D45, start=3D60), causing KDE S=
ettings
  to clamp the stop threshold to 50% and risk writing wrong values back to =
EC.

=3D=3D Potential Fix =3D=3D
A ThinkPad L590 quirk in `thinkpad_acpi` performing a dummy read (evaluating
BCTG/BCSG twice and returning the second result) in
`charge_control_{start,end}_threshold_show` (and legacy start/stop attribut=
es)
would work around this firmware bug transparently for all userspace tools.

I am happy to test patches on this hardware if needed.

Thanks!

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8411F379998
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 20:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234154; cv=none; b=K9CPD2xsdug9cQGWY13Bw7xal6w857fWI3mRgM0cqAK4PdsHq5Cv/kaiHimMSG+oPkHhLe8gwtEUuSR/r6Y9zMw4UC0mM1UOA0JzxtADyAWmlDmMl8tNOWOT013MPa++1beVrmxuZ06BdHZQt1p3AdQV91DN+74WxMD2HsqNVJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234154; c=relaxed/simple;
	bh=FIRRU95viU6eY8npEqWXbpKQc6UVLYS9sNa1yJqwmUU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LRolNpJDS5JFIJ32dP4Jb07dx+K93PVYMdCx+OIM9OCfOoRX1QNQB0pJl1qRjc8g+bkH9XhtAuyfw7S1mDK8sUQSM9FfrMPQXseNvvES4M8Oe+a/3R/NoAbsTs6jIFOVy+pI0kepLFSyH4nAoGJcQNXcwMP2PnVn0k0gToezIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d991jOsV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d991jOsV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5DDDC19425
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 20:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784234153;
	bh=FIRRU95viU6eY8npEqWXbpKQc6UVLYS9sNa1yJqwmUU=;
	h=From:To:Subject:Date:From;
	b=d991jOsVX5+WHeQtFGqoRorAFeM31fR8NUEjrwW70UTEkZ5B+dDvRsN7DlPk8m38m
	 p6Ky/LNLIHsqoBEK8+Zibp6gfBpeHUAfxqphUd5B4sWnGg8jJtY1XPx4rX4RLovROo
	 gDDXWplhRmiQkrtniHC+vgCbMg8b1WKez5d+AaJkI9XzftT/u1Fm11HAds5k9i5ocE
	 KDZRTvpTnBseNpaBP1BnEq9az6IY25xoDGx2SJ+HiVOrTejW748NPdMjHgtsMXGYiP
	 x2r49tKKgniaRMo2FyMI5IKa5PRlnMGWmBmguZKmNm0QXD1/bsSyB26vUu1KIWbFNX
	 hnzzPJGrri4Ew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AADD4C4160E; Thu, 16 Jul 2026 20:35:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221759] New: amd_pmc: failed probe leaks LPS0 handler
 registration; subsequent probe hits list_add BUG in acpi_register_lps0_dev
Date: Thu, 16 Jul 2026 20:35:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: francisdb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221759-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221759

            Bug ID: 221759
           Summary: amd_pmc: failed probe leaks LPS0 handler registration;
                    subsequent probe hits list_add BUG in
                    acpi_register_lps0_dev
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: francisdb@gmail.com
        Regression: No

Found while debugging an unrelated s2idle issue on a Framework Desktop (AMD
Ryzen AI Max 300 Series, FRANMFCP06, BIOS 03.05). Kernel: vanilla 7.1.3 (pl=
us
an unrelated amdgpu device-link test patch; drivers/platform/x86/amd/pmc is
pristine).

if amd_pmc_probe() fails after acpi_register_lps0_dev() has succeeded (e.g.
amd_stb_s2d_init() returning -ENOMEM), the error path does not call
acpi_unregister_lps0_dev(), leaving amd_pmc_s2idle_dev_ops on the lps0 hand=
ler
list. The debugfs dir from amd_pmc_dbgfs_register() leaks the same way. Aft=
er
the module is unloaded and loaded again, the next acpi_register_lps0_dev()
walks the corrupted list and hits the list_add BUG below. Even without a
reload, a failed probe leaves the LPS0 ops registered while the devm-managed
driver resources have been torn down, so the next s2idle transition would c=
all
into stale state.

In 7.1.3 drivers/platform/x86/amd/pmc/pmc.c, amd_pmc_probe():

        if (IS_ENABLED(CONFIG_SUSPEND)) {
                err =3D acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
                ...
        }

        amd_pmc_dbgfs_register(dev);
        err =3D amd_stb_s2d_init(dev);
        if (err)
                goto err_pci_dev_put;      <- only does pci_dev_put(rdev)

acpi_unregister_lps0_dev() is only called in the remove path.

Reproduction (as observed; any amd_stb_s2d_init failure should do):

1. modprobe amd_pmc enable_stb=3D1 dump_custom_stb=3D1 on a long-running sy=
stem.
The 16 MB S2D dump ioremap failed here (WARN at arch/x86/mm/ioremap.c:216,
devm_ioremap returned NULL), so amd_stb_s2d_init returned -ENOMEM:

   WARNING: arch/x86/mm/ioremap.c:216 at __ioremap_caller+0xfc/0x3b0
   Call Trace:
    devm_ioremap+0x5a/0xb0
    amd_stb_s2d_init+0x1c5/0x260 [amd_pmc]
    amd_pmc_probe+0x2d1/0x380 [amd_pmc]
   amd_pmc AMDI000B:00: probe with driver amd_pmc failed with error -12

2. modprobe -r amd_pmc; modprobe amd_pmc

   list_add corruption. next->prev should be prev (ffffffffb31269e0), but w=
as
0000000000000000. (next=3Dffffffffc06db340).
   kernel BUG at lib/list_debug.c:29!
   Oops: invalid opcode: 0000 [#1] SMP NOPTI
   CPU: 0 UID: 0 PID: 55224 Comm: modprobe Tainted: G        W=20=20=20=20=
=20=20=20=20=20=20
7.1.3-usbdep4 #4
   Hardware name: Framework Desktop (AMD Ryzen AI Max 300 Series)/FRANMFCP0=
6,
BIOS 03.05 01/21/2026
   RIP: 0010:__list_add_valid_or_report+0x78/0xb0
   Call Trace:
    acpi_register_lps0_dev+0x44/0x80
    amd_pmc_probe+0x224/0x380 [amd_pmc]
    platform_probe+0x67/0x90
    ...

Expected fix: unwind acpi_register_lps0_dev() (and the debugfs dir / quirks=
) on
the amd_stb_s2d_init() failure path, or move the LPS0 registration after the
last fallible step.

Addendum: on this platform the failure is not an unlucky corner case. The S=
MU
firmware rejects the S2D init command outright (amd_pmc AMDI000B:00: SMU cmd
failed. err: 0xff), so amd_pmc_probe() fails with -ENOMEM on EVERY boot whe=
re
enable_stb=3D1 is set, silently breaking s2idle support and arming the relo=
ad
BUG. Two consequences worth considering beyond the missing unwind: (1) an
unsupported/refused S2D setup should probably not be fatal to the whole PMC
probe, and (2) the error code for an SMU refusal surfacing as -ENOMEM is
misleading.

Happy to test a patch; this machine reproduces both the probe failure (every
boot with enable_stb=3D1) and the reload BUG on demand.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

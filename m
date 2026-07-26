Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82958481B1
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jul 2026 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785071690; cv=none; b=TTeS2HSS6CH5V/IeS7Nm8+b+L6pTw3J58mZRsNR7sXhzS8HSfqDUDlIoE9pAnCnK97NMF6lc4iVbcx6ElmRIeMUva8oKrn1OraWDYpUcARsJmsmOjN/vdPunyKKAAM30iMVPGWTbUEGudsKKE9/B1bGMmnMfZ5dOCJtfLPKaWSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785071690; c=relaxed/simple;
	bh=FNxUWAsXKxStVD/cnCs1pCDJa4rlUnj+iMPiU2D1tDI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ib4g3RjuXJWip6IOIr2SWFQ83QSf9k6B6gF8jglj60aNb3ja0sQiUgSuDcVrKXx6yi0XDid8eEXp40m6Ppjf/eAVDYqvamAQBkcurNynhQS/zKMFh2w1IuvRqD3UgdmyhhgBr76vzl2S/xjofIQkWjedJqz6ODwsdtjOBuUwz5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFScX87m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFScX87m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFB70C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jul 2026 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785071690;
	bh=FNxUWAsXKxStVD/cnCs1pCDJa4rlUnj+iMPiU2D1tDI=;
	h=From:To:Subject:Date:From;
	b=YFScX87mmO1cSe1bhv96EBtbJbyVJQMWHJyskii4O+60vnHY9xMgYoocpq6iv0HoQ
	 1Xb3Ctj6orykCwyS5Vmp1PwU47oJXd4FY2uRcnziHVI670zvUkdVcmQoRorP/nYUt2
	 fAayY9uiGxu9CQXk4KTFFdcCFxqqzkPJjfaltKKmnZAuxPDhk6vEYiQimx2tra7mRi
	 9ejWRFGw0C/ElSrO+p32YBR/gBJ3BJZYG9vpf2zv1MjSvcq++dRt8nc6+i7FDagyC0
	 vA5EaXhmMaQ4l1yGLxvcHE9KYXGJpXknAfAyOhVQyTB+FMzehIaTKI9YeqJH+Ze/Ep
	 BrU6fJBw61/+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C351EC4160E; Sun, 26 Jul 2026 13:14:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221796] New: intel_pmc_core: Arrow Lake-HX (Core Ultra 9 275HX)
 uses ARL-H DMU GUID and fails to expose Die C6 telemetry / existing
Date: Sun, 26 Jul 2026 13:14:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marek.suranic@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221796-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221796

            Bug ID: 221796
           Summary: intel_pmc_core: Arrow Lake-HX (Core Ultra 9 275HX)
                    uses ARL-H DMU GUID and fails to expose Die C6
                    telemetry / existing
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: marek.suranic@gmail.com
        Regression: No

HARDWARE / SYSTEM
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Laptop: MSI Vector 16 HX AI A2XW
CPU: Intel Core Ultra 9 275HX
CPU family: 6
CPU model: 198 (0xc6)
CPU stepping: 2
CPU topology: 24 cores, 1 thread per core
Operating system: Fedora Linux 44
Kernel: 7.1.4-204.fc44.x86_64
Architecture: x86_64
Preemption model: PREEMPT_DYNAMIC


PROBLEM
=3D=3D=3D=3D=3D=3D=3D

With the unmodified intel_pmc_core module, the kernel reports:

    intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU telem endpoint -19
    intel_pmc_core INT33A1:00: initialized

The driver otherwise initializes, but the following debugfs entry is
missing:

    /sys/kernel/debug/pmc_core/die_c6_us_show


RELEVANT INTEL PMT ENDPOINT
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

The platform exposes the following telemetry endpoint:

    /sys/class/intel_pmt/telem4/guid:   0x1a06a101
    /sys/class/intel_pmt/telem4/size:   136
    /sys/class/intel_pmt/telem4/offset: 0

The available GUID 0x1a06a101 corresponds to
ARL_H_PMT_DMU_GUID.

The Core Ultra 9 275HX has CPU model 0xc6 and is selected through the
generic Arrow Lake configuration. The generic ARL_PMT_DMU_GUIDS list
only checks ARL_PMT_DMU_GUID (0x1a06a102), so the available
0x1a06a101 endpoint is not found.


TESTED PATCH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    -static u32 ARL_PMT_DMU_GUIDS[] =3D
    -    {ARL_PMT_DMU_GUID, 0x0};
    +static u32 ARL_PMT_DMU_GUIDS[] =3D
    +    {ARL_PMT_DMU_GUID, ARL_H_PMT_DMU_GUID, 0x0};


RESULT
=3D=3D=3D=3D=3D=3D

After rebuilding and signing intel_pmc_core against kernel
7.1.4-204.fc44.x86_64:

- The "couldn't get DMU telem endpoint -19" message disappeared.
- intel_pmc_core initialized successfully.
- /sys/kernel/debug/pmc_core/die_c6_us_show became available.
- The Die C6 telemetry value became readable.

Command and output:

    $ sudo cat /sys/kernel/debug/pmc_core/die_c6_us_show
    31917705

Relevant kernel log after applying the patch:

    intel_pmc_core: loading out-of-tree module taints kernel.
    intel_pmc_core INT33A1:00: initialized

The out-of-tree taint is expected because the patched module was built
and installed separately for testing.


CONCLUSION
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This suggests that Arrow Lake-HX model 0xc6 systems may need
ARL_H_PMT_DMU_GUID as a fallback in ARL_PMT_DMU_GUIDS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

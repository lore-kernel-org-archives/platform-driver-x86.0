Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503E32ABCF
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759598; cv=none; b=RYygfoP5AQUt2HIPh56ECb3vKeXX0gE7NG7hJeHSVycoYAM6tHAA/ih0HAkXmpZ5EGX4dwAa9t/lCLW8dP7ZnrfSBzglc1tbVeS+WpghrnSbv2Xb/BRsHv+gHhd7wFE7bwTIle/yyuHw5aE4chVtI8X0xyRoVC6uQBdldb3DLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759598; c=relaxed/simple;
	bh=wtWCc1NeV8uJcqsrXtIjEKKn1gQu+HqqCM2iIbad3hY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gnIHQuh7nl3JWEzy3IX39sFfTnrE6pcN/oQXVkwNjQPtqLlXglnNEYMXSWFHCrJs2iEej5ozYw3XHIJ2Du/mUaI8pFKVg2TIQGS90p+Qf25Og3srcqd6KyHst8qao/JPuIyqNQMZDcXH6D/swZSsEQu4Vj9VHf1vD4UfxWAejhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bB/d+Ak0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bB/d+Ak0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45DC0C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770759598;
	bh=wtWCc1NeV8uJcqsrXtIjEKKn1gQu+HqqCM2iIbad3hY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bB/d+Ak0NmJqC4at/b8TPFN3gOqYXWpjQBDbOfXun/tPcoau6jKURjPsf7fd+BVnx
	 z++t1ZEOABfj1JtgT/vKj6I65V/acnQ+luA1f278KtzRRdEXTu338xSYCP1/StulCy
	 dlJeBuVbjfyFFl/nUup1wU6BPQTSOe4WlyIxPYGRy5tEDAr6+X3mYwJ0Ug3yB/588U
	 nHz5/k719eb8SnS5XZZtOoNIpJWv3o1tluYl19Gjl47QrjQKnAZLxdIrX3/Bac9JOA
	 fU7t0SFQgx916mkh1cKAlvSR0nIg5SRy0FOfZmds9gSCE7JYMo9Rf8Kfb+DfRxYy6W
	 jlWBtlEBwHZBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 371C2C3279F; Tue, 10 Feb 2026 21:39:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 21:39:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-ANbUqkCdGX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #18 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Armin Wolf from comment #15)
> Please check what kind of device is mapped at 0xFEEC2A00 using /proc/iomem
> (needs root privileges). Also, can you check if the thread number that is
> holding the ECMT mutex is always the same? In the ACPI error message you
> shared above, the thread number is 2188863744.

Pretty sure nothing is mapped there at all. It jumps straight from fee00fff=
 to
ff000000:
00000000-00000fff : Reserved
00001000-0009ffff : System RAM
000a0000-000effff : PCI Bus 0000:00
000f0000-000fffff : System ROM
00100000-09bfffff : System RAM
09c00000-09e00fff : Reserved
09e01000-09efffff : System RAM
09f00000-09f3bfff : ACPI Non-volatile Storage
09f3c000-2f232fff : System RAM
2f233000-30a32fff : ACPI Non-volatile Storage
  30a1a000-30a1afff : USBC000:00
30a33000-30ab2fff : ACPI Tables
30ab3000-342b2fff : Reserved
  31a00000-31a1ffff : amd_sfh
342b3000-72916fff : System RAM
72917000-72917fff : Reserved
72918000-76afdfff : System RAM
76afe000-7a9fdfff : Reserved
7a9fe000-7bfe8fff : System RAM
7bfe9000-7bfecfff : Reserved
7bfed000-7bfeefff : System RAM
7bfef000-7cffffff : Reserved
7d790000-7d7effff : Reserved
7d7f5000-7fffffff : Reserved
80000000-dfffffff : PCI Bus 0000:00
  80000000-806fffff : PCI Bus 0000:04
    80000000-801fffff : 0000:04:00.0
    80200000-802fffff : 0000:04:00.3
      80200000-802fffff : xhci-hcd
    80300000-803fffff : 0000:04:00.4
      80300000-803fffff : xhci-hcd
    80400000-804fffff : 0000:04:00.7
      80400000-804fffff : pcie_mp2_amd
    80500000-805fffff : 0000:04:00.2
      80500000-805fffff : ccp
    80600000-8067ffff : 0000:04:00.0
    80680000-806bffff : 0000:04:00.5
      80680000-806bffff : AMD ACP6.2 audio
        80680000-8069c000 : acp_ps_pdm_dma.0
    806c0000-806c7fff : 0000:04:00.6
      806c0000-806c7fff : ICH HD audio
    806c8000-806cbfff : 0000:04:00.1
      806c8000-806cbfff : ICH HD audio
    806cc000-806cdfff : 0000:04:00.7
    806ce000-806cffff : 0000:04:00.2
      806ce000-806cffff : ccp
  80700000-808fffff : PCI Bus 0000:06
    80700000-807fffff : 0000:06:00.3
      80700000-807fffff : xhci-hcd
    80800000-808fffff : 0000:06:00.4
      80800000-808fffff : xhci-hcd
  80900000-809fffff : PCI Bus 0000:05
    80900000-8097ffff : 0000:05:00.1
    80980000-809bffff : 0000:05:00.1
    809c0000-809c1fff : 0000:05:00.1
  80a00000-80afffff : PCI Bus 0000:03
    80a00000-80a03fff : 0000:03:00.0
      80a00000-80a03fff : nvme
  80b00000-80bfffff : PCI Bus 0000:02
    80b00000-80b03fff : 0000:02:00.0
      80b00000-80b03fff : iwlwifi
  80c00000-80cfffff : PCI Bus 0000:01
    80c00000-80c00fff : 0000:01:00.0
      80c00000-80c00fff : rtsx_pci
e0000000-efffffff : Reserved
  e0000000-efffffff : pnp 00:00
f0000000-fdbfffff : PCI Bus 0000:00
fe100000-fe100fff : MSFT0101:00
  fe100040-fe10006f : MSFT0101:00
  fe100080-fe100fff : MSFT0101:00
fe108000-fe108003 : MSFT0101:00
fe108028-fe10802b : MSFT0101:00
fec00000-fec003ff : IOAPIC 0
fec01000-fec013ff : IOAPIC 1
fed00000-fed003ff : HPET 2
  fed00000-fed003ff : PNP0103:00
fed80000-fed80fff : Reserved
fed81500-fed818ff : AMDI0030:00
  fed81500-fed818ff : AMDI0030:00 AMDI0030:00
fedc2000-fedc2fff : AMDI0010:00
  fedc2000-fedc2fff : AMDI0010:00 AMDI0010:00
fedc4000-fedc4fff : AMDI0010:02
  fedc4000-fedc4fff : AMDI0010:02 AMDI0010:02
fee00000-fee00fff : pnp 00:00
ff000000-ffffffff : pnp 00:03
100000000-45e2fffff : System RAM
  1a1000000-1a1c1b31f : Kernel code
  1a1e00000-1a20d6fff : Kernel rodata
  1a2200000-1a22dffff : Kernel data
  1a27d1000-1a29fffff : Kernel bss
45e300000-45f33ffff : RAM buffer
45f340000-47fffffff : Reserved
4a0200000-7f3fffffff : PCI Bus 0000:00
  4a0200000-4a03fffff : PCI Bus 0000:01
  4b0000000-4c07fffff : PCI Bus 0000:04
    4b0000000-4bfffffff : 0000:04:00.0
    4c0000000-4c07fffff : 0000:04:00.5
      4c0000000-4c07fffff : AMD ACP6.2 audio
  4c0800000-4c08fffff : PCI Bus 0000:05
    4c0800000-4c083ffff : 0000:05:00.1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

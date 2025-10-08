Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC616F288
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759931643; cv=none; b=Z52Ta9aT4un48kueUiaGbJEoHCELwFrruFaMYPI96I0mLsoDwDUI1ecP3m/8B9wh9p8Zc+O4d2z9a/F4a6PNCJT1d+YYzf3YJ2iTBW9jBdj0SQa1fUlaYX7c7ljiFVYdE3x5DWs2JTwQcgf3wzZVS4UCS3WqEVRqWvrOaZFtVx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759931643; c=relaxed/simple;
	bh=qS1mGdf3I4H0jwgmNyl1xbv3mocDPpbUUOqr5bD1/JQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sj/WfuySqAO3B3D50R5giAelCocynjPbLFi/Er79I5QjuB9WYBetmZebhUO5O2T1h5lh85QawJskGfAvPlD1sSJiF2DPH3+iovpLaCUHqdolz13lNYbrRChCEKkjamSOVJdkkyapUOdNG/LPesfAWOtWQqSW3Gwz7j276KUJPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjAiC6KX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjAiC6KX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F0FCC4CEF8
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759931642;
	bh=qS1mGdf3I4H0jwgmNyl1xbv3mocDPpbUUOqr5bD1/JQ=;
	h=From:To:Subject:Date:From;
	b=FjAiC6KXjwFgUQfYNb05ia+dwZCH68oV1CgmgUhCCucguObh4vyV4m/5zWYa4tQCW
	 8a+JzGKLhOKKTkKwn0WCvJ0K9d9FZMLJ4wJ346/Gw1bFETuOH6lKX1egk4lzHf2bQ0
	 eXadta6ZGLs+0gKPc2Y/Dq5J6yVyq0if3C1jJVn6MNfz+A8XsG23tgn2g9pTSqRSQz
	 wagfOSNQsWKB9Dzdqdpk9RrgdjEAuk1ofa8iLOeXt6W3EWCnRnZWIE51EA8rHk97KV
	 ozeeAv/+eibXw2Yen3It8F3dKstCOKzC0u9F1sZkom0R6IxWHGKjnPsvVrQG/5SJTz
	 I7W+/3owZk2+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81316C53BBF; Wed,  8 Oct 2025 13:54:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220646] New: Regression: kernel 6.16.8 fails to boot on Intel
 Raptor Lake Z790 (ahci/xhci error -12)
Date: Wed, 08 Oct 2025 13:54:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jn@yaloub.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220646-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220646

            Bug ID: 220646
           Summary: Regression: kernel 6.16.8 fails to boot on Intel
                    Raptor Lake Z790 (ahci/xhci error -12)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: jn@yaloub.com
        Regression: No

Hardware:
- MSI MAG Z790 TOMAHAWK WIFI (MS-7D91), Intel i9-14900KF
- Chipset: Intel Raptor Lake (Z790)
- Storage: Samsung SSD 860 EVO (SATA), Corsair MP600 NVMe
- GPU: NVIDIA RTX 4070 Ti

Issue:
- Booting 6.16.8+kali-amd64 fails with:
    ahci: failed to start port (errno=3D-12)
    xhci_hcd 0000:00:14.0: init failed, error -12
- System drops into initramfs, USB keyboard not functional at that point.
- GRUB works (disk visible to firmware).
- Booting older kernel 6.12.38+kali-amd64 works fine on same hardware.

Additional:
- Also see:
    platform INT3515:01: deferred probe pending: Error creating i2c-client,=
 idx
0
- This message appears on both kernels, but is not fatal on 6.12.

Steps to reproduce:
1. Boot system with kernel 6.16.8.
2. Observe ahci/xhci errors and initramfs hang.
3. Reboot and select 6.12.38 =E2=86=92 boots normally.

Conclusion:
Regression between 6.12 and 6.16 affecting Intel Raptor Lake SATA AHCI and =
USB
XHCI controllers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

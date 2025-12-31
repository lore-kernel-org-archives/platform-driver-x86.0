Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864483A14
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Dec 2025 02:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767147807; cv=none; b=qg15u2FR8HxTZUG5BjtaTLp1dNyR1jbXG/zyOtyuT9gqGkEh0vlAoH3Ejlg1X8EJK4ro1IJehSpINKbdpzMuvNj0D7Wryrn/VBSB1VGp6Bxub9uLlecZAIw6gAhQi6G8bftL1bGGzvnchvAeW/QoVvU7XMiJ7JQfeTBo8wKt41w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767147807; c=relaxed/simple;
	bh=r13GQBemxZY5ZOAp6WnMN95UOL6Zl8cUbUG9CgMHWqA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tmvD1FMhtzrmDTLar+5yfee8THoreL4ydfCuWE4PUZ60KhXb2FkkLiDSMcymq7beCNPv9g7GM6j0i+jUTBfhnGnpT5tlAPQ87LVQxTO14A6hRlpwSjUuGrh7sO7YQeGeWjq+PwZe3e+EOi7mLFznZ/mMM35bgLNGjUvmCBRATMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KewFAenf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KewFAenf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54880C19421
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Dec 2025 02:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767147807;
	bh=r13GQBemxZY5ZOAp6WnMN95UOL6Zl8cUbUG9CgMHWqA=;
	h=From:To:Subject:Date:From;
	b=KewFAenfNZMv0LMoShOSU/qPxed6K09o0zNMUuHcnZ3FcCYIastiPS+RYZTRgFc30
	 D7A794mOtaeOZZN0h9I/RqwC742JjRn1b863uq8hkO3N47X0UpCNzKiAr+NuluJSgH
	 42kbzmdFkFJA5oCNAvVe7YUFdqbzWiya+lF9DFnbERuCj6PWQ+lIT0DRHMAHWpoABa
	 gKvVnx8EBFA+9VRalhQb6Gvuw+xprccoNYSCmkKT6rpBhq2A3jiDxL6bFSsd7HHv6M
	 W0IEnLvF7Zzjza6Q3xfO6UXq7v33ONmzaIhpZtu3U1R2rJ/yAo1INhrUHAEn6tDLlp
	 zNsXTSBYDmzsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E44DC53BC5; Wed, 31 Dec 2025 02:23:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] New: HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Wed, 31 Dec 2025 02:23:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreslopez.23061@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220926-215701@https.bugzilla.kernel.org/>
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

            Bug ID: 220926
           Summary: HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
                    fails to read/write
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: andreslopez.23061@gmail.com
        Regression: No

Platform profile interface exposed but non-functional on HP ENVY Laptop
16-h1xxx.

System Info:
- Model: HP ENVY Laptop 16-h1xxx
- Board: 8BE5
- Kernel: 6.18.2-2-cachyos
- Distro: CachyOS

Problem:
Writing to /sys/firmware/acpi/platform_profile appears to succeed but readi=
ng
always fails:
$ cat /sys/firmware/acpi/platform_profile
cat: /sys/firmware/acpi/platform_profile: Invalid argument

$ cat /sys/firmware/acpi/platform_profile_choices
cool quiet balanced performance

dmesg shows:
hp_wmi: Unknown event_id - 131073 - 0x0
platform_profile: Failed to get profile for handler hp-wmi

Fan control is not possible through any method (hp_wmi or direct EC writes).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

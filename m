Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96E56455
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 18:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyrUEzhS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DD5FC433CC
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704737819;
	bh=wQnoRSCvoXI8kwzCgylFp1n8i2os9JWN3u9/WbrDyEo=;
	h=From:To:Subject:Date:From;
	b=qyrUEzhSlNqM8J50ldLDlnJpiq7qyzz70f16cBuHwMzn9DCkDu3i2jkqDluR4eus5
	 Tb6PwIPEwdtzn20nvNJaJj1KpgQIe5iEXNIra7k0zU0j26iK6+9jeyRkS9SYLPqwtr
	 HDXWr6eKJrwcJR6ZO6HeROUTHhubqtrTVpY/dsK3PUp7/7JYBHVpYCG3IqzJZG3MZZ
	 amuzf8k+Pb0DeO3qKMFKiV6t76+CaE82IJA+hhwwN3o4wiAoNsMMdVz8QIT1Wl78iU
	 +Y0Ne+Zo2I9QMElxpzU1xrt/cytiCQwYbvcsvhQB880Z9gaGjhFsxt7IBqNS4jU0un
	 dvj9/gzghH/gQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5278FC4332E; Mon,  8 Jan 2024 18:16:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218354] New: Writing to dgpu_disable always produce
 Input/Output error
Date: Mon, 08 Jan 2024 18:16:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: athul.krishna.kr@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218354-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218354

            Bug ID: 218354
           Summary: Writing to dgpu_disable always produce Input/Output
                    error
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: athul.krishna.kr@protonmail.com
        Regression: No

Created attachment 305687
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305687&action=3Dedit
output of journalctl and lspci

Device Info:

Asus Zephyrus G14 GA402RJ
Latest BIOS
Arch_x86_64
Kernel 6.6.10-arch1
Minimal arch install

ISSUE: Writing 0 to /sys/devices/platform/asus-nb-wmi/dgpu_disable, will al=
ways
produce an Input/Output error(echo 1 | tee ../dgpu_disable). While writing =
1 to
it seems fine. There's also an issue of system crash and reboot after echo =
1 |
tee ../pci/rescan.=20

Steps to Reproduce:

echo 1 | tee ../remove(dgpu path)
echo 1 | tee /sys/devices/platform/asus-nb-wmi/dgpu_disable
echo 0 | tee /sys/devices/platform/asus-nb-wmi/dgpu_disable
echo 1 | tee /sys/bus/pci/rescan

Observations:

Did the above steps 10 times, everytime it produced an Input/Output error a=
nd
everytime system crashed and rebooted, during pci rescan.
journalctl -p 3 showed an ACPI error after writing 0 to dgpu_disable.

journalctl -p 3, lspci are attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

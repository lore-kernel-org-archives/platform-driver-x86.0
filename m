Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919EA26FDBF
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773574471; cv=none; b=kwNzvQ0zu2LXmu/ZG/6EsMVq9m1oQ3NGQsz/jCI4+M+ZeMlr7ixpc9JXLIit/FM4d74JaNXNahmutuBDrDjqiCTnHKKY7sLeAdsL+xssXdyanzLSJ6je5nC51+puT+IKbdZCjyl92keFfZLXAMrgqLRL+TvQht+1IpwMTQiDXYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773574471; c=relaxed/simple;
	bh=S2mjcZHKQWD34/976E4MmeiDwou02DXKggdGv8NaAVg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pRMrPDIP+aWVeI0TeeV6jLY2OmAvBtueBwY7l6eyVlJs3tLfwVZ5lakLCdh5S8KLaLBsLOdOy+jkHH/sqiM/PLn84G/O5mlyqiezUDsiMGZgfqxtwg8xdqJUhFKrgyuxIx1g08+cL1cKzuJDVqmbT7y+QW8N+2bj0NKEHo+qmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eM8TB/La; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eM8TB/La"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 239ECC19424
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773574471;
	bh=S2mjcZHKQWD34/976E4MmeiDwou02DXKggdGv8NaAVg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eM8TB/LaHdMy9/8UPDAsK78BMQn97qqDmgj2ttvsM08YH0l7AzAb5udmbgMmFYmdU
	 K7Vz6POwBUG++6ivL+ZgA16v4NjVNlBa8fPfvhGR3wiPAApU2mA4q7oUkG1UQDdDfF
	 H8o/RFjX246SP2IYRqtQE0szNqX+ehEu3/Gx2H10mfHEBUrjsoOC6F+95jDyVH2n68
	 rtPQpqx4BBYW2+p/CBINWaLsrgZOHsnIoRgkwSW7luLyUPD8vnQsw+GKkdQrscarm9
	 Yh1qMgRb/fNf2XHPyuqCeO01Ph6hS7Nxg5jdqqdpTwtaJ4xThFxBSIjOGR380NlWzd
	 rNLm0CltNSSmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0ED19C3279F; Sun, 15 Mar 2026 11:34:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Sun, 15 Mar 2026 11:34:30 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alfonso.garcia.frey@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221238-215701-2cQkNhv2Bc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221238-215701@https.bugzilla.kernel.org/>
References: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

--- Comment #1 from Alfonso GARCIA FREY (alfonso.garcia.frey@gmail.com) ---
Correction to the original description after creating a local test patch:

The original report incorrectly states the driver uses "raw inb()/outb() ca=
lls"
and references a battery_hook_register() function. Neither is accurate. The
actual situation:

The lg-laptop driver calls ACPI methods WMAB, WMBB, and GGOV via
acpi_evaluate_object(). These firmware-defined methods internally access th=
e EC
through I/O ports shared with the i8042 keyboard controller, without
coordination with the kernel's i8042 driver. This causes the race condition
between ACPI method execution and atkbd interrupt handling, producing the
spurious ACKs and key drops.

The proposed fix remains the same =E2=80=94 wrap acpi_evaluate_object() cal=
ls with
i8042_lock_chip() / i8042_unlock_chip() =E2=80=94 but the reason is to seri=
alize ACPI
method execution (which internally touches i8042 ports) with the i8042
interrupt handler, not to protect direct port I/O in the driver itself.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=

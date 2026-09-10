Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3A3DCD95
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041936; cv=none; b=XuY3xJLpbfKw/zDUNXDljXSO/KtngjfyNojsmlmN/LlCfRKtdXTeV9a5VXlDYWjNxRckPgeGvnWR4qAvXCEvmNp78ixaE90uMzTpvVwzdUvOXkHsku5t9EboFFqrNg7nIodNHxX37WI9syiC/ddYWc2S3HqLruPEB2cfs4mygVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041936; c=relaxed/simple;
	bh=2ApgFWjCXS82yXzqORZ0DBwnVRkenQN2gvOKU3wmWuU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P32LJwjZOJ3M4TV84HY1JtuNyROgPStYjfZ4e6UsauQ+jbMHXwDPa3iv9CPJ5vdah8OQpFoEheQvUoAgp0uQqjQoMrdgHvxl9C571u3Udik+rlQYykaWoKGsTOA552e9eeFqTCGi/1I9LwIFZgeHNWVdTk0C7GrlXd6DftjEQD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYoJXXqr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYoJXXqr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CD5CC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789041936;
	bh=2ApgFWjCXS82yXzqORZ0DBwnVRkenQN2gvOKU3wmWuU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PYoJXXqrSwTdUdXUrxyCSHth+DHeMKz4Pp3O+GHE5ovD9V7wTcuLYp70f1s/h/kLR
	 A6WuTP6ord6jxE5//j65vLuqJvfqbCi/fPTOOs2AhazJm4ooECO0KrCOYrAzNcA0rz
	 mJLO5l74bwbj+jVQXscTUoSamSIzS47sbACIMevmXjqMd6gB9bflEo4T9nCb05jAaU
	 zAlBfZMr96lvSwxj5hr55DvvX2qR7Xv/+H+B8cSjOv2w4/TFbYatCAGcqgLD+kp3pp
	 VdS0roofHXPuglkKNbpO1f6/IcSNtSjeUd/nKxyj+TW8weSsnf6i+MRiAwgEXAgbwX
	 OneletZnvTolw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DD694C41612; Thu, 10 Sep 2026 12:05:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 215883] Unable to resume from suspend with module
 `intel_lpss_pci` enabled
Date: Thu, 10 Sep 2026 12:05:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: silverducks@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215883-215701-4UqtZ5Fk5Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215883-215701@https.bugzilla.kernel.org/>
References: <bug-215883-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215883

silverducks@altlinux.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |silverducks@altlinux.org

--- Comment #6 from silverducks@altlinux.org ---
Greetings!

I believe I have the same bug on similiar hardware.
Here are the details:

Kernel:
  Version: Linux host-175 7.3.0-rc2 #1 SMP PREEMPT_DYNAMIC
    Wed Sep  9 16:26:06 MSK 2026 x86_64 GNU/Linux
  Git commit/tree:
  Architecture: x86_64
  Distribution: Alt Linux Education 11.2 rc3
  Compiler: GCC 13.2.1
  Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-7.3.0-rc2 \
root=3DUUID=3Df35f4c9a-9e09-477f-ae34-33ea09d57042 ro \
resume=3D/dev/disk/by-uuid/9cb83606-d1a6-4839-b9ff-be22efdf26c3 \
panic=3D30 no_console_suspend ignore_loglevel

The problem was also reproduced with ALT Linux kernels 7.1, 7.0,
6.19, 6.18, and 6.12. Problem is exactly the same in all cases.

Hardware:
  Motherboard: Gigabyte Z790 X AX Gaming
  BIOS version: F15
  CPU: Intel Core i5-14600K

Failure summary:
  Suspending to S3 (deep) causes the system to hang. The fans and
indicator lights remain on, and the system does not respond to any
input, including short presses of the power button.

Steps to reproduce:
  1. Boot with intel_lpss_pci module loaded
  2. Suspend to S3 (deep)

Attachments (within archive):
  - uname -a, lsmod, complete journal and kernel-only journal of the same
period for upstream kernel 7.3.0-rc2, Alt kernels 7.1, 6.12.
  - Kernel configuration for upstream kernel 7.3.0-rc2, based on the
default ALT Linux kernel configuration with addition of debugging options
and a run through make olddefconfig
  - Kernel module list
  - lspci -vv and lspci -nnk, and list of devices with intel-lpss as driver
  - dmidecode outputs
  - /proc/acpi/wakeup
  - Hardware and firmware information from sysfs
  - os-release
  - kernel command line used

Notes:
  The problem appears related to intel_lpss_pci - when module is
blacklisted, S3 works normally.
  Unbinding intel_lpss_pci from devices or removing it with modprobe -r
just before suspend does NOT prevent the failure.
  S2 (s2idle) and hibernation to disk work fine.
  Failure does NOT occur when booted with init=3D/bin/bash
  Failure does occur when booted into multi-user.target

Let me know if I should open a new bug instead or if there's any
testing you'd like me to perform.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

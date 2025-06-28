Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538A023E344
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jun 2025 14:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120870; cv=none; b=gzvrYF2Tg/25RrOBpBo2nH5m3lYtGsM1nCKw676y2q2tqUH9kcZJdW5KrYw8WcaqfZr2M+hJVvXB+OlV/6+uLD2awqaFKkwuA95kEx4F4ESntLF2I2MfzC7zD2izRjrASbgmIHNqrJEGb6NzXvWHJ+VdZlHZ7rIl1nqToNzZmII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120870; c=relaxed/simple;
	bh=A7UTuHQ5ZR0kXldL6qd0T2mUyT2yajutl/+nXKoHXcU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Wz1Mg632886eggIYpErwKRJclIXT5UulV1e2ItnXQu8M2yqDQldQAlPtFWMeIskh6EGgxUstc9yi7shwBdsdT2iROSPSLmzHk8I350PWLdyW7ZVm3X6/RARIwgGh4LSyVA5vFN2hs42jheT6SCZWH/6ntJGE/LQi8a8b0zWeLKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAw3qE7U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAw3qE7U"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB78FC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jun 2025 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751120869;
	bh=A7UTuHQ5ZR0kXldL6qd0T2mUyT2yajutl/+nXKoHXcU=;
	h=From:To:Subject:Date:From;
	b=LAw3qE7UlpDFFx7EpgGvvi8r6A8vnve5RgfJX1QRXfgj0BEvPil6mBU8k/XLfR/1q
	 qMFuUnB8Tjq0awsIHgtcDluaf23Yk/Lt5VmcFWwcTUUEeCKg6yjbYxNE6+dmCjjqKB
	 yg+EZAgHEfZIxMIuwToxFYKf6e0X/en7D+qV1WsyPW4TjDiP40MOlWg9V8VPoMW+AM
	 u50ySo+xkYNuGY0x0qRvdzw8CxLT4MXqkuI7fbA7s0UmOhsr3wkEuPxz0o523TJr75
	 eF6aK0eNfReqmAbe3H6yjUfB99DcGeTcGfn9nEmRxZklx1vvbZhc/gMf8Uy7biUvFe
	 GOx8r88Zu8KtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D003EC41614; Sat, 28 Jun 2025 14:27:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220290] New: Samsung Galaxy Book Pro 360: samsung_laptop module
 fails to load, keyboard backlight not working
Date: Sat, 28 Jun 2025 14:27:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: l.delvigo.01@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220290-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220290

            Bug ID: 220290
           Summary: Samsung Galaxy Book Pro 360: samsung_laptop module
                    fails to load, keyboard backlight not working
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: l.delvigo.01@gmail.com
        Regression: No

Created attachment 308328
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308328&action=3Dedit
This archive contains diagnostic logs from a Samsung Galaxy Book Pro 360
running Fedora 42 (kernel 6.14.9), intended to help debug the failure of the
samsung_laptop kernel module to load.

I am running Fedora 42 with kernel 6.14.9 on a Samsung Galaxy Book Pro 360
(first generation).

The keyboard backlight is not working and does not appear in /sys/class/led=
s/.
The Fn keys related to keyboard backlight do not trigger ACPI events either.

Attempting to load the samsung_laptop kernel module fails with:

    modprobe: ERROR: could not insert 'samsung_laptop': No such device

This suggests the device is not supported or not detected correctly by the =
DMI
table lookup used by the module.

Attached is a tar.gz file with full system diagnostics including:
- dmidecode
- dmesg
- journalctl
- lsmod
- lsusb / lspci
- /sys/firmware/acpi/tables/DSDT if available

Please advise if support for this model can be added or if there's any
workaround.


This archive contains diagnostic logs from a Samsung Galaxy Book Pro 360
running Fedora 42 (kernel 6.14.9)

dmidecode.txt =E2=80=93 Full DMI table to verify model identification.

uname.txt =E2=80=93 Kernel version.

lsmod.txt =E2=80=93 Loaded kernel modules.

dmesg.txt =E2=80=93 Kernel boot messages.

journalctl.txt =E2=80=93 System journal of the current boot.

dsdt.dat =E2=80=93 Raw ACPI DSDT table (if available).

leds.txt =E2=80=93 Content of /sys/class/leds/.

lspci.txt =E2=80=93 PCI device list.

lsusb.txt =E2=80=93 USB device list.

modprobe_output.txt =E2=80=93 Error output when attempting to load samsung_=
laptop
module with force=3D1.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

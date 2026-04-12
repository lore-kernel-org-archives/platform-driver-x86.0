Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA629B78D
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776019558; cv=none; b=cqRQ6ueWFnKZpIifLDd+SuTmb5HFimKmUKvs6WI8Um0/MUwW1n9qr/lZaaNHJVzhe6VayPFfMGuSf5DZ8mHTxBfQYxoxlSpLFcz71Ny1LtlvHA4flrhXuKQVZ200pFw8klGE0vQ985iSst1HWFN6gapFIu+9MHMMej2ozo7ejak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776019558; c=relaxed/simple;
	bh=oJSldUBuJYqTF/q4YXkaMEVvnx4zwxUzQWLzWy1h19E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X5rPoDUpjPhJTTDVgl2kxVAVUwdzEbOKR3QMKjDXXOBeX1z9c+1mmPtxY6CYweNXusH9ZSFIazTya2xrGfCv2hSIn4KP/jTZIUAiLhB0v0W128f/ynK6sU8xNt7yRs+78GQwlaLBrtKXbAi8DlJNIve97AG2QT50NL/SEpQs8/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3gCPwqV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3gCPwqV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 581BFC19424
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 18:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776019558;
	bh=oJSldUBuJYqTF/q4YXkaMEVvnx4zwxUzQWLzWy1h19E=;
	h=From:To:Subject:Date:From;
	b=H3gCPwqVkNu7pJ/y5OW32p1uATVWxGm2uH0eizoYuMoBX7rIbVldHxklOy3YsEB1/
	 /r+dYZ7wBIFcM5Htv74fPkowpUERJ739pqdOD6c8iukJkVnpuDs2DZSfnq+CSaTOut
	 GRBBje9bm39h5+jDBRyjZZ5+YWTrawylsc49qOGyPDMcSXbu8UMMenvFunxkGj+gXO
	 AMVISWSoYZ/C7iIVrgT+phrB4jsHNE2h4pD1q/WZcPDal233TdyOz7DdWd/uT532TZ
	 TxYmCtOUNcpzqD3d5wdkdgKk4Igw1883MqWtf1oWuN231imITqa1GxtMw0e7azW2MG
	 EtOURzRc9bxJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 46114C3279F; Sun, 12 Apr 2026 18:45:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221357] New: Lenovo Ideapad - Bluetooth (MT7925) soft-blocked
 by rfkill at boot (hci0 blocked while ideapad_bluetooth is not)
Date: Sun, 12 Apr 2026 18:45:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cverellen@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221357-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221357

            Bug ID: 221357
           Summary: Lenovo Ideapad - Bluetooth (MT7925) soft-blocked by
                    rfkill at boot (hci0 blocked while ideapad_bluetooth
                    is not)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: cverellen@hotmail.com
        Regression: No

Created attachment 309864
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309864&action=3Dedit
Support document

Summary:
Bluetooth is soft-blocked at boot by rfkill on a Lenovo laptop, preventing =
it
from powering on automatically. Manual unblocking resolves the issue
immediately.

System:
- Device: Lenovo Legion 5 (Ideapad platform)
- Bluetooth: MediaTek MT7925 (USB ID 0489:e111)
- OS: Linux Mint 22.3 (Ubuntu 24.04 base)
- Kernel: 6.17.0-20-generic (also observed on 6.14.x)

Problem:
After boot, Bluetooth is present but cannot be powered on:

$ bluetoothctl show
Powered: no

$ bluetoothctl power on
Failed to set power on: org.bluez.Error.Failed

rfkill state shows:

$ rfkill list
0: hci0: Bluetooth
    Soft blocked: yes
    Hard blocked: no

2: ideapad_bluetooth: Bluetooth
    Soft blocked: no
    Hard blocked: no

Key Observation:
The platform rfkill device (ideapad_bluetooth) is NOT blocked,
but the actual Bluetooth controller (hci0) IS soft-blocked.

This indicates an inconsistency in rfkill state between the platform driver=
 and
the Bluetooth device.

Manual Fix:
$ rfkill unblock bluetooth

Immediately results in:

$ bluetoothctl show
Powered: yes

Bluetooth then works normally.

Additional Observations:
- Device is correctly detected (lsusb shows 0489:e111)
- btusb driver is loaded
- Firmware is present and loads correctly
- No rfkill-related messages appear in dmesg
- Issue is reproducible on every boot
- GUI toggle also resolves the issue (likely unblocks rfkill internally)

Conclusion:
Bluetooth is being soft-blocked at boot without user interaction.
This appears to be caused by platform/ACPI behavior, likely related to
ideapad_laptop or platform x86 handling.

The mismatch between ideapad_bluetooth (unblocked) and hci0 (blocked) sugge=
sts
a kernel rfkill state inconsistency.

Workaround:
A systemd service that runs:
rfkill unblock bluetooth

restores correct behavior at boot.

Expected Behavior:
Bluetooth should not be soft-blocked at boot unless explicitly requested.

Actual Behavior:
Bluetooth is soft-blocked at boot, preventing it from powering on.

Request:
Investigate rfkill state handling for this platform, particularly interacti=
on
between ideapad_laptop and the Bluetooth controller. A platform-specific qu=
irk
or fix may be required.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311BD2E645
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 02:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768358856; cv=none; b=Z5famthEvYusjsnTnq4HuvLrYvzla8XjJhRa/XyHZJ15PcwUGXpGTvf1r6CpwLIkxF899jbOUMC3HnfQsq2YmC3BvbRkOLYxazlCgVtgKMPAIv8YCZMBdZzi5C/9nFVTDYM2GaJ8k6PspSm0AKFp/gP71erxHMdsfYjBqULF3x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768358856; c=relaxed/simple;
	bh=ZB8COdLJpV1eU5KYYiVRBna0Dh6jm96r+JMHjNXoUps=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VlVCp4m5XV8AzZns5MOqkGrOa+ewpWeE4ROe+TBfDEEblAoWldwmHdVm3jBWKWO69+Yrlqkh2iOhuSui1I17P4Z8Ntl1iWX9CgIvWpQ5VMyUY9OWe5Z78Q5PqcRSPE2+Zk3VWCAnCVvizxeOIZOvAquxBJCmVfQvc1kcFkOtyuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPotMNzA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPotMNzA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFA5DC19424
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768358855;
	bh=ZB8COdLJpV1eU5KYYiVRBna0Dh6jm96r+JMHjNXoUps=;
	h=From:To:Subject:Date:From;
	b=kPotMNzAqAXhG5oi3l89c5suzOUk7DwZVnZWgQxcMwX8IOi7l44KsDKT4ZtTJnkbq
	 NmoFNc8WD7WHfglS8bUf3tWFa9iZcah9fItM3Dqi5cX/E8GG48obtvqbH2Qa9fXa3u
	 UC84DV0Hn0vgh2cWLH96jfmiW9hAp9aR1aWoXcn7kyUUi+UoZDIaUH/hVeon811RBM
	 /gwD4wFHafAuIv5M9QJFacz+Seb0GkqqWjU89OIb5uk5mWSyb4FE49sR5qa7OiNW48
	 gQ71f/rzS6efgcEGigcK7DSMZWOMygZvxL1usQloKL5WrCPoZy/Ge2mkqfJIGiVPy1
	 +hH8+X5MXqKlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ADD25C53BBF; Wed, 14 Jan 2026 02:47:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220978] New: [DRM/ACPI] ASUS VivoBook TP412FA: Fn keys send
 unknown scancodes after resume from S4 (Hibernate) on fedora 43
Date: Wed, 14 Jan 2026 02:47:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: monirloucas@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220978-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220978

            Bug ID: 220978
           Summary: [DRM/ACPI] ASUS VivoBook TP412FA: Fn keys send unknown
                    scancodes after resume from S4 (Hibernate) on fedora
                    43
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: monirloucas@gmail.com
        Regression: No

Created attachment 309191
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309191&action=3Dedit
dmesg_after_resume.txt

sys_vendor: ASUSTeK COMPUTER INC.
product_name: VivoBook_ASUSLaptop TP412FA_TP412FA

**Problem Description:**
After resuming from Hibernate (S4), the function keys (Fn keys) for control=
ling
volume, screen brightness, and other special keys on my ASUS VivoBook TP412=
FA
stop working correctly.

**Analysis:**
Some keys work only after pressing the Fn key again, regardless of the Fn-l=
ock
mode. Using `libinput debug-events`, I can see that many of these keys are
sending unknown scancodes to the kernel after resume.

Example output from `libinput debug-events` after resume:
event3   KEYBOARD_KEY                 +4294967.295s    *** (-1) pressed
^[OQ event3   KEYBOARD_KEY                 +0.153s      *** (-1) released
...
event3   KEYBOARD_KEY                 +8.366s  KEY_MUTE (113) pressed
event3   KEYBOARD_KEY                 +8.510s  KEY_MUTE (113) released
...
The `*** (-1)` entries indicate unknown scancodes, which the kernel cannot
interpret. The escape sequences like `^[OQ` are coming from the firmware/EC.
Some keys like Mute, VolumeUp, and VolumeDown are correctly identified
(KEY_MUTE, KEY_VOLUMEUP, KEY_VOLUMEDOWN), while others are not.

**Potential Cause:**
The issue appears to be related to the ACPI Embedded Controller (EC). After
hibernation, the EC is re-initialized in a way that changes the scancodes f=
or
these special keys. The kernel lacks a specific quirk for this laptop model=
 to
handle these changed scancodes. The system does not crash, but it fails to
interpret the key presses correctly.

This behavior is not present on Windows, likely because it includes a
manufacturer-specific driver that properly re-initializes the keyboard
controller after hibernation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

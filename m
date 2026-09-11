Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C043B5820
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114186; cv=none; b=gkMjvcLBFscVWwfL3vYkFm76BE9pqo+lZVE2/jI5fvShGsLhZJHZWtvAZfYkBnCjc3iNMjzxbAvd4PAFSMGyFn3o2cEqiC9wUV8cVn00J5ox+MQGAaO6ZyLZ2xwylJM/Tk4sauS8ZA4/cAgtjxkIQvQljWYQNqOJ27d7st8w778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114186; c=relaxed/simple;
	bh=ctfKl77JS6VMIhO7qlZY+51iRfajW8JD90AV6U6bUpA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HsAEC6RTtJGQa7vfDbtMk/OE4wZe45jbWAJeEaWiHtQkBRVrBsr5rQsrxrLI5bx0rXzKPhkpesywZk6qLl55i3oul1pE/LbxKioN5GOGXi4ARs1hxNyHNpRjMlaGMm7vK0TmT+SLRnpptGx/VonEb3i+1xtjrVdmPv0oNm38lOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEHox1y1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEHox1y1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A30E1C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789114185;
	bh=ctfKl77JS6VMIhO7qlZY+51iRfajW8JD90AV6U6bUpA=;
	h=From:To:Subject:Date:From;
	b=SEHox1y1qjlVkN6F2iKUVlhjuxPhr4uJ2xKE0jR41p5afv/vppjUqY4ei1aQAdgLt
	 ckNPsAo8b6zFzsHbV48oItbs69IBXbFb5zC9FJbJQyUSu2uRTsgVRwe+64fa2Z+kNW
	 EmvEiHf1GVcTGN+TU+7nnNdOddcfyqrbVyDCzAQir1+Gu3DHK6at+VZOpwXiaqZjWy
	 OPkJwZJcPOr6CJQ0cwlgYN3lj3qjZ+NDGvnD9VA1j/qu3R7nGX+QzRilmIQxCofk2t
	 517aaSC7vTtABsP0dA9VQnQhPzcLA7vxy5GpEgs1yDSjSnxhkQR7YIgpk6n0os/01Y
	 8ZQ/HL+ijiNMA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7C637C433E1; Fri, 11 Sep 2026 08:09:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222002] New: [BUG] alienware-wmi: Missing support for Alienware
 16 Area-51 (AA16250) lighting controller (AW-ELC 187c:0551)
Date: Fri, 11 Sep 2026 08:09:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: adrienpantovich@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222002-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222002

            Bug ID: 222002
           Summary: [BUG] alienware-wmi: Missing support for Alienware 16
                    Area-51 (AA16250) lighting controller (AW-ELC
                    187c:0551)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: adrienpantovich@gmail.com
        Regression: No

The alienware_wmi kernel module loads successfully on the 2026 Alienware 16
Area-51, but fails to bind or expose sysfs LED nodes for the built-in light=
ing
controller. Consequently, no lighting controls are available, and system
sleep/resume leaves the hardware stranded in an uninitialized ROM fallback
state (where only a single segment on the far left of the back bar
illuminates).

Hardware Details:
- Laptop Model: Alienware 16 Area-51 (AA16250)
- BIOS Version: 2.5.0 (06/09/2026)
- Lighting Controller: USB ID 187c:0551 (Alienware AW-ELC)
- Kernel Version: Linux 6.x series

DMI & Kernel Output:
[    0.000000] DMI: Alienware Alienware 16 Area-51 AA16250/0XYV46, BIOS 2.5=
.0
06/09/2026
[    1.958892] usb 3-2: Manufacturer: Alienware
[    1.975163] hid-generic 0003:187C:0551.0001: hiddev96,hidraw0: USB HID v=
1.11
Device [Alienware AW-ELC] on usb-0000:80:14.0-2/input0

Observed Behavior:
1. alienware_wmi initializes with a reference count of 0 because the board's
DMI string (AA16250) is unrecognized.
2. /sys/class/leds/ contains no entries related to Alienware lighting zones.
3. Upon waking from system sleep, the AW-ELC controller falls back to an
unconfigured state, lighting only a small section on the left side of the b=
ack
bar while the touchpad, logo, and remaining zones stay dark due to missing
driver register maps.

Steps to Reproduce:
1. Boot Linux on the Alienware 16 Area-51 (AA16250).
2. Inspect lsmod to verify alienware_wmi is loaded.
3. Check /sys/class/leds/ to observe the complete absence of Alienware cont=
rol
interfaces.
4. Put the system to sleep and resume to see the partial fallback LED state.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

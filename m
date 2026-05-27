Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A035D3AB291
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 19:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911248; cv=none; b=n9dPe31eFx3K3cBfrqjPorcmUNTpYzLbJjl2zHqBciwukbB7hbsdiI0OpfQU9DzE321563Wn0MqKVEp+YMso8v90mp/ZrYlC9lrJ4qinIjlR5qQHNLRp41FWpxv9jzNZyXIQdkXqXu4MqvQFounpfcKjH1cQ1oqXGMygkJLz9Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911248; c=relaxed/simple;
	bh=1iRM16fioHiUHoDdnsLlLfeRN7TXLfIMdCAeA4s8KxE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=irzqMKceoAM8Q63/XW/Ns/HuLAUDmuLLr/zRX0SZkzNxc4lpDgJDdSCrzBex9Pxk9SXs6n5oVypqmsolMQadMxLYIiVO/yY5dSVteuHinV6LzDzkRyBCIfwlLbQ9JXkpPQaWmFH35poGLO+BfX88WpWXR+Q+gPaAJvmbGqPIj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLCfZgnD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLCfZgnD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 361D5C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779911248;
	bh=1iRM16fioHiUHoDdnsLlLfeRN7TXLfIMdCAeA4s8KxE=;
	h=From:To:Subject:Date:From;
	b=pLCfZgnD2iSaOTJeEBqzitN0KL16L+aG+1TtW3aM3VE/png9kSKu41dMy9X/BoIvm
	 CKo/GN++9RnPAqr57YEaL7/ZHwNuzpnhxA5RqgtwO1S8u0BDKbE2OJRZkp0FDDE6UK
	 HKUrlY8k2iVaeff++VkDP7hqCGdUkM9sJAW4g6be0IuR7mQiijFLCsVfYNZQjoKcXP
	 jjeFfZBla4Lf4wzWmpLjS/nxdQyf2diHt0Ei8Bg/HzqU+yJdh3774MXambxP7P5i/F
	 RNbkZdqV8tV5ODbVK0JM1cD60qWnt9U1Dxf6KNnDi2ISpwpE7Bby+78YI0GYQafkc0
	 iCcmmZhb4847Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1C8FDC433E1; Wed, 27 May 2026 19:47:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] New: Lenovo 82KU: keyboard backlight works via Fn+Space
 but no kbd_backlight LED device exposed
Date: Wed, 27 May 2026 19:47:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

            Bug ID: 221583
           Summary: Lenovo 82KU: keyboard backlight works via Fn+Space but
                    no kbd_backlight LED device exposed
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: george.stafilidis@proton.me
        Regression: No

Laptop: Lenovo 82KU
Distribution: Fedora
Kernel: (paste output of uname -r)

Problem:
Keyboard backlight works correctly using Fn+Space
(Off -> Low -> High), but Linux exposes no keyboard
backlight LED interface.

No device appears under:
/sys/class/leds/

Expected behavior:
A standard LED interface such as:
platform::kbd_backlight
or
ideapad::kbd_backlight

Current result:
GNOME cannot expose keyboard backlight controls because
no LED device exists.

Tested:

* modprobe ideapad_laptop
* reboot
* latest Fedora updates

Outputs:

$ ls /sys/class/leds/
input18::capslock
input18::numlock
input18::scrolllock
input3::capslock
input3::numlock
input3::scrolllock
platform::fnlock

$ sudo dmidecode -s system-manufacturer
LENOVO

$ sudo dmidecode -s system-product-name
82KU

$ uname -r
7.0.10-200.fc44.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C421B960
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Sep 2025 02:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756865455; cv=none; b=atL25/LZ9iLONBKwSoHYEANJa9QavAdrjCbSK/3i3dczpCzvlCBkC5JfSJGJywLA0w0t5/Gg0Rbc7oIy28ROjmp+NxYlEjC7vTx65hmWjJyJJLYq06wuJ/ahe8fSs9bQ/lMEOzt/jHvu4bz4U/xuRYytjP9yFZOoKMxom/VYVaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756865455; c=relaxed/simple;
	bh=Il/3GQR4HH+rjb6uqnVyC6XsR/zah9BpaEpwIgi7AJ8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iznMyQRynXiRZjvk2WEbN6TstHZpRqxYvPEVxJiVdMJ9FJLr12w8Whp1naf60d6YN/mTNEIdN/2CDSVqOV2TnBGg9ybaXyz1rEDscze0fD9gTIHQHPMQkFIHTgPGdjwcP9SzWvRB1KIJzXtB+DvmUkOxKS0uCJaFi3+JfXfa0q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSK4j6HR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSK4j6HR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90EDFC4CEF8
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Sep 2025 02:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756865454;
	bh=Il/3GQR4HH+rjb6uqnVyC6XsR/zah9BpaEpwIgi7AJ8=;
	h=From:To:Subject:Date:From;
	b=NSK4j6HRgZ1Vskk/M1fPvEUzgbJRL31MzHVGLdVGDx2ZGCqqRDHIgwp0LB/ktI/9w
	 uM6slPvZs4+PeT2+pbZbUyZaIV5HZ6ZGkshBUt5Z2q1euQwNVn2v2g+6mxzAIg6W0Y
	 xFVqug8lk0EvtEy45dd9d1F+2IdHAkRLQYYdILuknMoC5SvLGyGK5pkR9/Jc72Ga99
	 eOWiDcW6Dz8MHDfxUZW9/PPD8hohukI1pkNJubSYAy9GyJqwot2f5GwHe5fmGUfcqp
	 xyqTnsHfoS7l59xtLQQmWP/y8+x9ajvLnu2kB1cycyOrKNQM40MOhnTdlpDTUnaMSf
	 b2UGf6b866u+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 838FFC41612; Wed,  3 Sep 2025 02:10:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220529] New: ideapad_laptop doesn't detect fn_lock in Lenovo
 ideapad D330-10IGM
Date: Wed, 03 Sep 2025 02:10:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: howl.nsp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220529-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220529

            Bug ID: 220529
           Summary: ideapad_laptop doesn't detect fn_lock in Lenovo
                    ideapad D330-10IGM
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: howl.nsp@gmail.com
        Regression: No

In dmesg "ideapad_acpi VPC2004:00: FnLock control not available" is shown a=
nd
this message is bring up by not having FnLock LED:

        err =3D ideapad_fn_lock_led_init(priv);
        if (err) {
                if (err !=3D -ENODEV)
                        dev_warn(&pdev->dev, "Could not set up FnLock LED:
%d\n", err);
                else
                        dev_info(&pdev->dev, "FnLock control not available\=
n");
        }

This laptop have FnLock feature but lacks led to show it's state so
ideapad_laptop module discards it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

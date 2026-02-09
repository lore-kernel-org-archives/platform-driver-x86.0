Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6A025DB12
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770623448; cv=none; b=UM+ZtNmohEr15cvlj6XaRfOrdkySYtYq1p/swr8tXsFVt4Bfgvk1WR5T7sgpgvANU5nAhaOLw3RTtRHYHck0bxh45/nZV33vdKGss709osWfiH0gzaZUpm0bTe+b9S9iXkOWOjj/MZ7plLsW6EgwqhGkzsnasoZCsBCBnL4Adhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770623448; c=relaxed/simple;
	bh=lbpGWZPvlj2le6+B3XxY5VoVepX2x+r7wTlbgVF43iU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fkgqd/+W1N12Obkb2zPbkGYjNLjj43nyDW2dhZpeHBvlfSILSEUxeDUtjWBJM1Dr/GgfUze/LYepTa6xDBNsvD3O+vsFX6974pFo/xNRzAqg/JtelHiWFL+hn/t6CKySU/mY7Pf2k5DTiv6ZDS5iyhia5T7xD1gIPJS51yeE+r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GG89epYq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GG89epYq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C07AC116C6
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770623448;
	bh=lbpGWZPvlj2le6+B3XxY5VoVepX2x+r7wTlbgVF43iU=;
	h=From:To:Subject:Date:From;
	b=GG89epYqLWb/IIP8d4mXvPEnKPUMSyPduB092AtDnMqJ1EsIu/PDjlWIHDetncWlt
	 o+hlqinuKpg5inyysVrIi+0xoog93F8KC1ZYSsWgbF3Kg8aMnOYG+ni1N5Ca+pEUww
	 4KYmda6vUXbN3VmFyu6TBXfGEXd4E5mNo9HJGTES83A+MBIsjn9h0/U+wJQYKQCjuj
	 wsiO8ouSjTNB6wohGXu8c489oUIZFkyrdJW9HU3BXJp9PZWrSRY7BPKbEQspllZSCt
	 ABbYhukRYT0y40OJKjCgUFQHXU/XHe8k2RV3J60v34yn1B3dmm47QzWBznYvMotVv8
	 uXpSU+c8/onZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 280EFC433E1; Mon,  9 Feb 2026 07:50:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] New: ideapad_acpi: unexpected charge_types spam on Yoga
 Pro 7 14ASP9
Date: Mon, 09 Feb 2026 07:50:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rbitton@linux.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

            Bug ID: 221065
           Summary: ideapad_acpi: unexpected charge_types spam on Yoga Pro
                    7 14ASP9
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: rbitton@linux.com
        Regression: No

Hi,

I'm experiencing constant dmesg spam from ideapad_acpi on my Lenovo Yoga Pr=
o 7
14ASP9:

[  733.997072] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast]
and [Long_Life] are enabled

This started on 6.19.0 on both my distro's mainline kernel and the vanilla
mainline kernel I compiled. The issue is not present in 6.18. It happens ab=
out
every minute starting about a minute after boot regardless of if I'm chargi=
ng
or not.

Model: Lenovo Yoga Pro 7 14ASP9 (83HN)
CPU: AMD Ryzen AI 9 365
BIOS: PSCN17WW (up to date)

The laptop appears to be reporting both Fast and Long_Life charge modes
simultaneously, which the driver considers unexpected. Functionally everyth=
ing
works fine, including fast charging, but the log spam is excessive.

Of note:
zsh rbitton@rbitton-linux3 01:46 /sys/class/power_supply/BAT0 > cat
/sys/class/power_supply/BAT*/charge_types=20=20=20=20
[Fast] Standard Long_Life

All attempts to fix it on my end have failed.Let me know if you need any
additional information; I would be more than willing to test any fixes.

Thanks,
Raphael Bitton

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

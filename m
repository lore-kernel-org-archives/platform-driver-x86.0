Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC6379987
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 23:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773703566; cv=none; b=OlwEec0bMQhu5IprVXVYsZjhGXY8tI+HyNUOx1uwVMQf4/EZxk/xft2xuyJyxefFCo0Ne6KxENgjIX6+/Zqug0TMRYkm/jn8svy0nm3BWAUwd8afTN7gTvrhyhVVhzUu09mFv2WZTGjxGy7KwzJ+ExRzI2KSF64xbDpscl9V/qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773703566; c=relaxed/simple;
	bh=2reJx3BnT5+HL5caw/GtdjHgrkXrK3Sk+1tbyAmqcDw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EXh3+ZEM65zXF8wYijhA6ZdpQCEieRlm8YHOf8eG+WMRXUOD9R67MH34LmLiDawERv1JE/E771okmYTFkMaJDH/s7XMBvzsw6uQm0wDirOkTNHXqCRwzcl6rkraNdr3zxk544KFMQ5uAGyiuYg7Va8Mnhul31XV1v09DhusGZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XP1yHn0d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XP1yHn0d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 346BFC19421
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 23:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773703566;
	bh=2reJx3BnT5+HL5caw/GtdjHgrkXrK3Sk+1tbyAmqcDw=;
	h=From:To:Subject:Date:From;
	b=XP1yHn0dKZpFH7xqEczyHwuGiOOGykA26/ztqH2rVWybEfsQV4u7canNPYKhsYLo9
	 +cdjerVTpHSFLJ6J4iZySb9FQZaVf0G88la8u0NcT42jtkT+erOLTsV1VZrinDnX9x
	 J9vde7mFW8KvXJ9pf/xjX5Py2mHDxO0iEPzn7HEmQypnXGxsnBmon6+9x/9suLdA7J
	 lLu8pMzjnaO7VPZgH8dePIgYRxdROBIK8onNUHQ+dUqvVbyEOChr7zzezlnDEObGm3
	 717EbSvQIO086tBwEuz2t4CwtEBaBa/I4NnlwiBY6FOUPi7Tfk7zuBc/vIkGyjqaMc
	 5yLLe2M4EMjWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 261FEC4160E; Mon, 16 Mar 2026 23:26:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221250] New: intel_ish_ipc: "ISH loader: cmd 2 failed 10" on
 Lunar Lake Integrated Sensor Hub (ThinkPad X9-14 Gen 1)
Date: Mon, 16 Mar 2026 23:26:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thisisamirv@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221250-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221250

            Bug ID: 221250
           Summary: intel_ish_ipc: "ISH loader: cmd 2 failed 10" on Lunar
                    Lake Integrated Sensor Hub (ThinkPad X9-14 Gen 1)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: thisisamirv@gmail.com
        Regression: No

Created attachment 309693
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309693&action=3Dedit
log

I am observing repeated Intel ISH driver errors on a Lenovo ThinkPad X9-14 =
Gen
1
with an Intel Lunar Lake CPU running Arch Linux.

# System information

Kernel: 6.19.6-arch1-1
Distribution: Arch Linux
Laptop model: Lenovo ThinkPad X9-14 Gen 1 (21QBS0KV00)
CPU: Intel Core Ultra 7 268V (Lunar Lake)
Architecture: x86_64

# Hardware

lspci:

00:12.0 Serial controller [0700]: Intel Corporation Lunar Lake-M Integrated
Sensor Hub [8086:a845] (rev 10)

# Kernel messages

The following messages appear repeatedly during boot:

intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10

# Kernel modules

lsmod | grep ish:

intel_ish_ipc          32768  0
intel_ishtp            86016  1 intel_ish_ipc

# Observations

The system uses the Lunar Lake integrated sensor hub (ISH). The driver
appears to attempt to load firmware but reports repeated "cmd 2 failed 10"
errors.

It is unclear whether:

- the required firmware is missing,
- the device requires new kernel support, or
- this message is expected for unsupported ISH features.

# Attachments

I have attached the following logs:
- full dmesg
- lscpu
- lsmod
- acpidump

Please let me know if additional information would help diagnose the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACCA7E0FF
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 04:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770956100; cv=none; b=NN4DK9vGZrixZ3Z7HimD980NsgFPW/jXAoQoGZxHPLNDXlfh60oGjMrf0I/ONXdgcJ9YQsayNA9kL15yLPAjqV9Uidz2r0PeXN0cg6RTUopFJvTIFwIw5Bip8LDUMXwenth8uMPoLm/wfj76LtuZHUVnU4w3Vo8ADL5OqZFegcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770956100; c=relaxed/simple;
	bh=ZGh0pLjLMqOX6zd7AFJjEXY8HQPNe8hywHdsdus/RsQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qa/gnBwR+JNyO5islWi0DD12cmtGcanVwriHkMSoHVA9uZAHQc1ybIDkx3DYDiWz4vzGX2e6hytXirht8KqdOl4DVdIaBPD2P+LaPra1fH6m034KfgH3MGz5uX23WLyXtrJiuZ+AOCZRKjfuP9F6jNGbb/M1GOIMLF4SZR1FPTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVTE0OFN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVTE0OFN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFFD7C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 04:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770956099;
	bh=ZGh0pLjLMqOX6zd7AFJjEXY8HQPNe8hywHdsdus/RsQ=;
	h=From:To:Subject:Date:From;
	b=uVTE0OFN6YPfMi51s32pwX5TJ8/tfvj0eBSiRkNQ1L03q3YdBcS3nn2MnGuZ+cG0a
	 50cOiTXbw4lOyrR2fc8gGYZ+5Io6Rf68LLD3lnxkIBFLQ2VASdHGewpHlI92AigVgB
	 IlukpjXg3c2lk3KN50OtQbZhzDcNX8k+ki6hZHxCP0Pej92yn2/ZzKuxHHgYjfqjZN
	 e5iOwWt4J3UopXf67SBjHLUL+QFE0N3fCU5UNAeu3XWZYrdaIIXp3rmmR0hk7OxbPZ
	 o8dJPD1lpzsp1kR+yYoZ0l8IaHhmGxfNhVzGoZ+a4HyFAUBwI2p4ndpa5FfXQB/g5u
	 QF9gSP03Mb3WQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B1639C41612; Fri, 13 Feb 2026 04:14:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221090] New: intel-hid: Tablet mode switch not working on Dell
 14 Plus 2-in-1 DB04250
Date: Fri, 13 Feb 2026 04:14:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: peter.metz@unarin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-221090-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221090

            Bug ID: 221090
           Summary: intel-hid: Tablet mode switch not working on Dell 14
                    Plus 2-in-1 DB04250
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.18.7
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: peter.metz@unarin.com
        Regression: No

Description:


On the Dell 14 Plus 2-in-1 (DB04250), the tablet mode switch is not reporte=
d to
userspace. The device identifies itself as a "Notebook" (Chassis Type 10),
which causes intel-hid to skip the dmi_vgbs_allow_list check and ignore the
VGBS method.

Evidence:


- DMI Product Name: Dell 14 Plus 2-in-1 DB04250
- DMI Chassis Type: 10 (Notebook)

Verified Fix: Manually adding this model to dmi_vgbs_allow_list in
drivers/platform/x86/intel/hid.c enables full functionality (tablet mode st=
arts
working).

```
$ cat /sys/class/dmi/id/product_name
Dell 14 Plus 2-in-1 DB04250=20
```

```
$ cat /sys/class/dmi/id/sys_vendor
Dell Inc.
```

```
$ sudo acpidump | grep "VGBS"
   28670: 30 4C 50 43 42 45 43 44 56 56 47 42 53 A1 0F A0  0LPCBECDVVGBS...
   28870: 14 4C 07 56 47 42 53 08 41 44 42 47 0D 56 47 42  .L.VGBS.ADBG.VGB

```

```
$ sudo dmidecode -t system
# dmidecode 3.7
Getting SMBIOS data from sysfs.
SMBIOS 3.8 present.

Handle 0x0100, DMI type 1, 27 bytes
System Information
        Manufacturer: Dell Inc.
        Product Name: Dell 14 Plus 2-in-1 DB04250
        Version: Not Specified
        Serial Number: *****
        UUID: *****
        Wake-up Type: Power Switch
        SKU Number: 0D2D
        Family: Dell Laptops

Handle 0x0C00, DMI type 12, 5 bytes
System Configuration Options
        Option 1: J6H1:1-X Boot with Default; J8H1:1-X BIOS RECOVERY

Handle 0x2000, DMI type 32, 11 bytes
System Boot Information
        Status: No errors detected
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

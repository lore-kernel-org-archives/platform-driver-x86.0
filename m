Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F32264A8
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772187410; cv=none; b=Va55p43w6pudVW+U/m3O+uOrhqjb9CsBOxvbXMpa3UtuMuL3sATk/lZXKTsDWQAShj5+VK1RtrmuUMJYvBcn5poj8KYiQ05kajJdWFMdwfzTiUzK+y0QKZcXxXiM3j1EokkNva5zwMmMu43DhflQw+s5Lff45/Zrl7vdLeRuHHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772187410; c=relaxed/simple;
	bh=5xjCRvGS5eg5Zxf03uTawDZ7ml0jPIWHg1M3w9wyIw0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nV8iq3EWPS1AaVXI06Q2mD6elOUaLLXrbd7Fnz1QprXlI1GFZAEgDXQ79AvtU3+no3XUxX9hMQg0Xujia7Wm/1uher1zfV5vtSnUtNcXAG22Nf6LPzSaFue6Fda+S0UFSFGdHf42f3CKy+3aDlCRMsxvWflFGRn6KL1GlEaAixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3qG9NOd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3qG9NOd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 646C0C19421
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772187410;
	bh=5xjCRvGS5eg5Zxf03uTawDZ7ml0jPIWHg1M3w9wyIw0=;
	h=From:To:Subject:Date:From;
	b=N3qG9NOdIVylKC2UwSWR8+EZ3q6aVGeanlHbI9BK23TzvPGURJfEouzsVOjTUlFBA
	 dBriqbEYOLfAkRuobK3LAPqwRswEbgzbdy/KV7tRQTOaeBvS3NQ+vS6fg8taXtHX2U
	 8ipzgVVu/+Y/ziWM7SHGo5wwPbwsZaq46HZjeYL6HmzRHzvUqxTYiZ7Cqi8vNYm8s4
	 EuZiU3KBxIamrfh5YryDW+seUEctV6ySO4siVGrI6vR8Ibl6Oj+jvm9IOowzEY+KBe
	 srNIE2hzwmqHF32ZnDYMyfvIMa4Y1PouXoQK0GdMNKqz6N9L9mARGbbpSfPMUbFZep
	 ScbqLvDGB17pA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 55415C3279F; Fri, 27 Feb 2026 10:16:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] New: hp-wmi: Fan control fails and RPM always reads as
 zero on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 10:16:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jie7172585@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

            Bug ID: 221149
           Summary: hp-wmi: Fan control fails and RPM always reads as zero
                    on HP OMEN 16-wf1xxx (Board 8C76)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: Jie7172585@gmail.com
        Regression: No

Created attachment 309484
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309484&action=3Dedit
log of OMEN Gaming Hub

I am opening this new bug report to track the fan control issues for the HP
OMEN 16-wf1xxx (Board ID: 8C76)

The primary issue is that the manual fan control completely fails, and the =
fan
speed is always reported as zero.=20

Description:
While the hp-wmi driver successfully exposes the hwmon nodes, attempting to
write to the pwm1_enable node (e.g., setting it to 0 for max fan speed) has=
 no
physical effect on the fans. Furthermore, reading the fan speed (e.g., cat
fan1_input) constantly returns 0 RPM, even when the fans are physically
spinning under heavy CPU/GPU load. The commands seem to be rejected at the
firmware level.


Errors from dmesg:
The underlying WMI communication is failing, producing the following ACPI
errors in dmesg when trying to query/set thermal states:

hp_wmi: query 0x4c returned error 0x6
ACPI BIOS Error (bug): Attempt to CreateField of length zero
(20251212/dsopcode-133)
ACPI Error: Aborting method \_SB.WMID.WQBC due to previous error
(AE_AML_OPERAND_VALUE)
ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
(AE_AML_OPERAND_VALUE)
ACPI Error: Aborting method \_SB.WMID.WHCM due to previous error
(AE_AML_OPERAND_VALUE)
ACPI Error: Aborting method \_SB.WMID.WMAA due to previous error
(AE_AML_OPERAND_VALUE)


Hardware details:
  - Laptop: OMEN by HP Gaming Laptop 16-wf1xxx
  - DMI Board ID: 8C76
  - BIOS Version: F.15


EC dump:

$ sudo xxd /sys/kernel/debug/ec/ec0/io
00000000: 0000 0000 0001 48aa 0f84 fa71 0ffa 1c01  ......H....q....
00000010: 0129 251e ff00 ffff ffff ffff 00fa ac24  .)%............$
00000020: 0000 0000 0000 f900 350f 2000 0036 4b59  ........5. ..6KY
00000030: 5844 304b 3831 4a38 324a 5400 0100 00ff  XD0K81J82JT.....
00000040: ffff ff01 00ff ffff ff4c 494f 4e00 0000  .........LION...
00000050: 0009 ffff 3100 000f 4301 2d41 0000 0000  ....1...C.-A....
00000060: 0080 1620 3333 332d 4143 2d31 322d 4100  ... 333-AC-12-A.
00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000080: 0000 0000 0b00 0000 0000 0000 0000 0000  ................
00000090: 3333 332d 4143 2d31 3257 4b30 3630 3833  333-AC-12WK06083
000000a0: 0001 00d8 4500 004c 0000 0008 642a 0078  ....E..L....d*.x
000000b0: 4d4d 3c5b 4100 3232 008c 0800 f242 1111  MM<[A.22.....B..
000000c0: 0000 7e1b 8505 0c32 3c2d 6c20 7e1b 6421  ..~....2<-l ~.d!
000000d0: 0000 0000 0000 7e1b bf02 5b11 0000 e000  ......~...[.....
000000e0: 0000 00af 10ad 10af 1000 0083 430b 0080  ............C...
000000f0: 0009 0200 0000 0000 5000 0061 580b 0000  ........P..aX...

I have attached the OMEN Gaming Hub logs from my Windows partition to this =
bug
report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969474;
	b=S6d39Owcq/5+IK7p5B8/qxgNJ7JrXc6yxaqh81QkxstRE22nnGB3N+0nFff7xu06Cfyo
	 GaTVUGZc80tFNP8hXpTcOwI2jDafnrPG7zxbjPL/alHQYqZnjnd+J/g8dqUNI+gp1R9V1
	 A/ACOAWRhZUBfZm8eS/zFNCLma9TLzRGQdl1XTKDqgLhqT8Um3nCD1qqRmg4lCSb7+Kc1
	 LfafWjjizzz4WwcRXToLRTxhx4MFYHapkcnfSiS3Scx+PLmDWAnRj7m42Q3gTSGyzmvye
	 1J2brL1S9gwxTjoDtK8JxHKCdV97Xf446/YkL3I9mTqclhHUI1X3OTR6aubcbnHJ/UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969474;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=9K5N3/LuOJSM032Cm8lJN0MkvWWUfYAeMvXgiw/jj14=;
	b=evtyyQSjjuig+uz8ei14GaOhSxfsn2jrITolBs3Dv4QYxrb8S7PZ23xPj9zohFDoZA9M
	 EVN0RavO8IEfi1DwuxF/7DRCoJwKuZmRQim3dfU4jto2ipv/gZWVUizSG5hywk07PG9mD
	 wtOfmX9HuosWFC3Gx7z8hd9VNCf1PZBBrZMJQZ+yBtO3Ko7qAPlWko3s+U+lsRIHtUSUI
	 wYKgDk0phmxpgWltVK4vPBI0eGOq2etGgAhS4eTzbOn/qKNVsPpvMiY3fqfECdjG9mggN
	 PCdWyql0FR8eOOlvQUM6Ayee8yi917IIhwOjoCQz2eccLueHrNj7yh1M9lxmFUSWdxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mVBB/Olu";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BC0606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVBB/Olu
Received: by smtp.kernel.org (Postfix) with ESMTPS id 228421F0089F
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969474;
	bh=9K5N3/LuOJSM032Cm8lJN0MkvWWUfYAeMvXgiw/jj14=;
	h=From:To:Subject:Date;
	b=mVBB/Olu9rScMHDpDfIfx73Z8suvu6XA8WW9Qe3PfGuPPrtizfqASsh732LYcjFX2
	 tfuVk8Zzjq2unul/9mnYjxWSw4OLiTTIdtcbmFBGJceP3LseZSK0qQDTKrxTyGiWQs
	 wi+XU9UOfP4+tyLZKCcXdD9QLon79rrLmWUc7lcRPGgtH9aAdkPFqcJH//QgYf/PpZ
	 lZupL24KmYWPFVrv0V1qC4PKHz4g0VcpdEf7bLJDtUB1z9qqbIS7NptVDZguGzUwn4
	 Fg4emks7YFBTT6wsJn8Yx35lFCHWG1P/xapE4JNKnQi3Xv3ts6BR3t344ggtLH1+zs
	 f6aoNDECCKpFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14001C4160E; Fri,  6 Nov 2026 12:51:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222240] New: acer_wmi: Nitro ANV15-52 fails platform_profile
 read/write on newer BIOS versions
Date: Fri, 06 Nov 2026 12:51:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nghiant@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222240-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222240

            Bug ID: 222240
           Summary: acer_wmi: Nitro ANV15-52 fails platform_profile
                    read/write on newer BIOS versions
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: nghiant@mailbox.org
        Regression: No

Created attachment 311391
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311391&action=3Dedit
ACPI Table Dump

On Acer Nitro ANV15-52, reading/writing to
`/sys/firmware/acpi/platform_profile` produce `Input/output error`

```
=E2=9D=AF cat /sys/module/acer_wmi/parameters/predator_v4
Y
=E2=9D=AF cat /sys/firmware/acpi/platform_profile_choices
low-power quiet balanced balanced-performance performance
=E2=9D=AF cat /sys/firmware/acpi/platform_profile
cat: /sys/firmware/acpi/platform_profile: Input/output error
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

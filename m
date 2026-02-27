Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658FC1885A5
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190573; cv=none; b=AuYyPWeyOx4KigNs94twFbibBeT4vb5C5ASFazvAPwxpiyhNc9gb+WQOZLf0sMfBpZoGrRSpT280sTkraYXcRQqCzhTmRQNeZ6PSJBrlI8KCd9kb9JnYUhU3dALOihYIcxfql6Bi+SzOEnQH7CMZDVHg7hQKO/IeLbZxm+lbUJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190573; c=relaxed/simple;
	bh=jze1+PyIQuPlUdzKKKtKq0cgvYD9jkWogq/VLLAGCYw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aly4AGAqPmm2mMgwB2naTCluxr6v+UDVr0Br+XkrZxVLRgnMr3dTNBjWZa6n5twJbwQaHMQBSu5TfR28G4oaBpow3p8s0Ev/nsQhhdJXV9//ZBBsLjPCOgxkxNXKXFQ91ftdLzJra4q0imL1SWvXyR6jyx6/8ofMKyA1WKmawgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsFaHxk1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsFaHxk1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31900C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772190573;
	bh=jze1+PyIQuPlUdzKKKtKq0cgvYD9jkWogq/VLLAGCYw=;
	h=From:To:Subject:Date:From;
	b=NsFaHxk1wbAuow4mrxtpTJNx1p3QlytiBxgVcX01dRj2gvCcKtucrUroASGupy58F
	 7QDC0Rrrngg5+P6CamN9K4cXPv2839XbsyfqRXosZZ2O6wNharsralM9f9nMxN6H9f
	 LQVXj7Cto14UxyLWDRz1OVgYQW3yp06A2LbZ5PyPeIC1RMMy3MikTLkoWYTQuqL/a5
	 elcjD3h2CJrSSAr02Kr7KuTVgj0QTEHMcjcyx3TUIR1oPIGLSRpoDYEeGOE3aPm/Er
	 W8TBCLiW41CqBX+Qg+4L1iPCCfys5JQ54LuuboqpLsyRzuVRagTOlL410fnsiUvklk
	 gsQH6vW9VsCKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1C006C433E1; Fri, 27 Feb 2026 11:09:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIE5ldzogW0JVR10gaHAtd21pOiBPTUVOIDE2?=
 =?UTF-8?B?LWsweHh4IChib2FyZCA4QTREKSDigJMgdmVyaWZpY2F0aW9uIG9mIHBsYXRm?=
 =?UTF-8?B?b3JtX3Byb2ZpbGUgYW5kIEVDIHJlZ2lzdGVyIGJlaGF2aW9y?=
Date: Fri, 27 Feb 2026 11:09:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: qwqgong@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

            Bug ID: 221150
           Summary: [BUG] hp-wmi: OMEN 16-k0xxx (board 8A4D) =E2=80=93
                    verification of platform_profile and EC register
                    behavior
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: qwqgong@gmail.com
        Regression: No

Created attachment 309485
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309485&action=3Dedit
EC dump,dmesg_full,acpidump.

Hardware:
   Laptop: HP OMEN Laptop 16-k0xxx (Omen 8 Pro)
   Board ID: 8A4D
   CPU: Intel Core i7-12700H
   BIOS Version: F.28 (2025-08-13)
Software:
   Distro:  CachyOS
   Kernel: 6.19.3-2-cachyos
Problem summary:
   The hp-wmi driver registers correctly as a platform profile handler on t=
his
board (8A4D). I am providing baseline diagnostics including an EC dump and
dmesg logs to help maintainers verify if the current WMI query implementati=
on
correctly maps to this specific model's thermal and performance profiles.
Actual Results:
   The platform_profile file accepts the input, but there is no change in f=
an
RPM or thermal management behavior. No audible fan ramp is observed even wh=
en
"performance" is selected.
=E2=9D=AF cat /sys/firmware/acpi/platform_profile_choices
cool quiet balanced performance
Expected Results:
   Switching to "performance" should trigger the firmware's high-performance
thermal map and increase fan aggressiveness, similar to the "Performance Mo=
de"
in the OMEN Command Center on Windows.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

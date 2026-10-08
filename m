Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7783502A3
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486931; cv=none; b=ZQL03f/Twj9CEUvFs0FnyxO9co+df2hcQDA/HFYNBP1uWfmv2hD9hOBCUARt9ubcb8euAxCjscRL0H6s0FOgloc2/2QIJul1hFHRBiR+kAvKLOSea2mDalHtpJQHA4FOiyJBMRF7xVvj3S5waJKGAXyqBfVAEwPPBFx6p1lrZw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486931; c=relaxed/simple;
	bh=RCU9RkwiDYAut2CTYkoP15iV0jxgSaC8SIRzNOk8d0g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=odyL4296rEpxCxjZFK+xeAuRZdzx37MtBxzhdCtw85ilKopsfIdJoe4lxDSkzH+2nmt1RVo5rG+uOc730w3bgDRw7T7i0uo7OGpRJevvmsR0zjWIYxXRO9CS2L8z0PwWxTfKk8Mpwo21jmn7EMVHgeMGpQPmuM7lTfeBnGOpQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqV48d8y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqV48d8y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 497E2C2BCFB
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 19:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791486931;
	bh=RCU9RkwiDYAut2CTYkoP15iV0jxgSaC8SIRzNOk8d0g=;
	h=From:To:Subject:Date:From;
	b=nqV48d8yQBAHd79wIYnid0j+4JtIiWYO6ZsbqL8BVxoWDf2jwpggg84dBvQGc/0SY
	 VgvN6S8rg9GPjunJ0UWA0nJfc40CM/wfLhyIdpYx/rWORasQUzC+H0XqnRqe9nRxqt
	 sTDEPxU+v2hxiMHdV9FPckIwYOJUpjHT5Xzeh6420aYoWydNegr+fEr8ecxQY1jtrb
	 NDnej/ahMnzpwNNKeet+hpf5LwECPHMy3dBizc5ihy05E0UdvkLrjuQz17ZgDBVKL3
	 9lGbWeKLijaItrH58Uu661ArfqywYE+iFXS4ee0IhG4CBO8PXa6ecT67xxw24fXu4K
	 UW91Uykrk9D/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1CA90C3279F; Thu,  8 Oct 2026 19:15:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222107] New: hp-wmi: fan1_input and fan2_input always 0 on
 OmniBook 7 17-dc (8D9C)
Date: Thu, 08 Oct 2026 19:15:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaeho2025@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-222107-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222107

            Bug ID: 222107
           Summary: hp-wmi: fan1_input and fan2_input always 0 on OmniBook
                    7 17-dc (8D9C)
           Product: Drivers
           Version: 2.5
    Kernel Version: 7.2.7-arch1-1
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: jaeho2025@gmail.com
                CC: krishna.chomal108@gmail.com
        Regression: No

Created attachment 311036
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311036&action=3Dedit
acpidump of HP OmniBook 7 17-dc0xxx (board 8D9C)

Separate report for board 8D9C as requested on bug 221385.

HP OmniBook 7 Laptop 17-dc0xxx
Board: HP 8D9C, version 45.36
BIOS: F.10

Symptom: hp-wmi fan1_input and fan2_input always return 0 RPM while
the fans are spinning. acpi_fan (PNP0C0B:00) reports the real speed.

I tested the GM fan queries in a small module. 0x11 (fan speed),
0x10 (fan count) and 0x26 (max) return PASS with a zero payload.
0x4c still returns data.

Attached: full acpidump. I will attach the EC dump (ec_sys, ec0/io) as a se=
cond
attachment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

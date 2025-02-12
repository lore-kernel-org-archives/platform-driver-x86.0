Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E08027182B
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Feb 2025 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739329823; cv=none; b=O9jJZ1x0lacshWvoZYpdZxgRWjG0GvpO5/M+KIwJ5eu8xZ7EBM9uQ15XM5+v7ZlJWDAvmR8iXQbUIGkXir+8CG9d/80UglvBt5mOP1UDj6U06U+Vop27hNs9+mgd4eYbl4cgVveBJyr69RExgGFS3f9S0qcxHytTEx1BHORM4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739329823; c=relaxed/simple;
	bh=hab+BVjAkXTRvKPLNYGF3Az2Tl77D88ZneFiKkuDj1I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gxVfYlqqulmXOp4k65YBVyiGlWi45t31KbiwKWZZbeRY6VRmq5hYEu2hytAGQQ621FKMgoRAhn1ee3iiiUSxc9a5ylFuLnzZU8WLVA2qkzj60EJwk2Mpjs9J7uis9W+02AwzRZaIiAf6jUmFE3SVA4lLs3Cx2EGxx+1hERXqOG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EV87hgdu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EV87hgdu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B4ECC4CEE6
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Feb 2025 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739329822;
	bh=hab+BVjAkXTRvKPLNYGF3Az2Tl77D88ZneFiKkuDj1I=;
	h=From:To:Subject:Date:From;
	b=EV87hgduY8zU0UxXurYJqaRDjo17miyPG3eQFmn0gc/Rr0k7TA/8q5VI0XjClEAfH
	 81GTwv5VSsX/lE3dxum6+XumGSVzlnNVcUUvqeCkqUtE/AdtfZcAU15nHaLsZdVYfI
	 DQ1UKvI7Tsc6D0AQTRicDAi680kDggD0qAUGlSBqxPlPx91w+t6JOF5nWjFSGpyF1Z
	 xxmCeIJO8YOKazojP71UggHxpn9Fb1iHx01/ABvlASfXu6u6xYv7C02GHv28VtUcVy
	 U5HSFHXfbt3VXexfBITYwtf8uynz6zXcL2dJAvxWwX6+hAE0vsis4S1/MM6N2ekJoq
	 g4s7Lpou44zcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 538E3C41612; Wed, 12 Feb 2025 03:10:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219774] New: Interrupt Affinity Inquiry
Date: Wed, 12 Feb 2025 03:10:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 553216989@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219774-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219774

            Bug ID: 219774
           Summary: Interrupt Affinity Inquiry
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: 553216989@qq.com
        Regression: No

Hello, I have a technical question I=E2=80=99d like to ask. I noticed that =
when an
interrupt uses both smp_affinity and effective_affinity, it is forced to bi=
nd
to the CPU specified by effective_affinity. May I ask which part of the code
makes effective_affinity override and take effect over smp_affinity? I woul=
d be
very grateful if you could help me with this. Thank you very much in advanc=
e.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

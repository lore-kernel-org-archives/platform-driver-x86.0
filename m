Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6080C02
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jan 2025 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158776; cv=none; b=LPeBxDVI2DRSCj5ZMA312Q3FIXV4JInwX2PgJpKuKtdOx2Ax4W/SLzK0y23pzcH/JmKWKssfKVpa8UshoVsBwWS5SheWKC578CGAL/0xKkrMDRJ+ImRE2UhCCAbiXjQ1lntJTM4Dd2VDnPzGXICGdQnLggs0WivyQpEwMMDYH88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158776; c=relaxed/simple;
	bh=2xddHy3lC+nl8rgJORKO3gTJDLqK7THDM8ovQ6ZvrTw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CQHmfOefzcCM25AYRHJomo0T3tsujopMKoCgKoqWHvNo69xpuxFsGrEGK15ZpwNZlH4KDNQ4D6f4pmeuH0rhVkhkvqXgNxOKJTCMGPa2+rMnjAHsIus2fYjUGrPPo+gtasaVfin163vs1aDvGYhD5GzUUcrFmwf2uMgsw+yfoSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+aHK21e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+aHK21e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05B6CC4CEE1
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jan 2025 13:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738158776;
	bh=2xddHy3lC+nl8rgJORKO3gTJDLqK7THDM8ovQ6ZvrTw=;
	h=From:To:Subject:Date:From;
	b=u+aHK21eO1VvsoSy2lCJEGirHZh7L4+UWJ5NLsX5toE8ZOFWNTrmv+JwyN+o42QI8
	 T8W77j4KuHRqE85qXD0uF1PpyGzFBEMif2wvgiu8O7t21nSYc6OMHLvp3rF0om28Ow
	 gjUmXpRszm1xrrxdQxs+y1hUEUcxCxzFWEo7OKWba+ywH0ujuax1rABq2sDZahFq+J
	 00r+fQfqx1/Ki0umZBFf4j4h0uFoEeeuz/3fb87djmU+WqncGYR37joByE4lq+I6q/
	 PJJGFb8qo1DgnSwCJT3K9/0k3uuNN5/p0QcWeKd+dHmCvYj9hTHW63Li2mMUvjSJl7
	 jUrFIr0xgJbZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED4BDC41614; Wed, 29 Jan 2025 13:52:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219733] New: No UI/touchscreen on HP X2 detachable 10-pxxx with
 kernel 6.12.y
Date: Wed, 29 Jan 2025 13:52:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ge.koerkamp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219733-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219733

            Bug ID: 219733
           Summary: No UI/touchscreen on HP X2 detachable 10-pxxx with
                    kernel 6.12.y
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: ge.koerkamp@gmail.com
        Regression: No

Created attachment 307549
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307549&action=3Dedit
Zipped attachments as descibed above

Overview:
We (at volumio.org) are testing the upgrade from kernel 6.6.y LTS to 6.12.y=
 LTS
and noticed the on an "HP X2 detachable 10-pxxx" Atom PC, the UI/touchscree=
n is
not detected and remains black.

Testing various kernels between 6.6.y and 6.12.y showed, that the last kern=
el
to successfully detect and show the touchscreen is 6.11.11

Steps to reproduce:
Boot the kernel on an "HP X2 detachable"

Build information:
See the attached configuration files for kernel 6.11.11 and 6.12.11

Attachments:
- kernel configuration files from 6.11 and 6.12
- bootlogs from version with kernel 6.11 and 6.12
- inxi -Fxxx output from version with kernel 6.11 and 6.12
- ACPI: .dsl files extracted HP X2 detachable 10-pxxx from version with from
kernel 6.11 and 6.12

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

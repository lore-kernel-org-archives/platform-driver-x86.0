Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A24390610
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787337524; cv=none; b=qCc3rGQyRazFM3bKnBrpYu8MfKSp4XsWKwKhsdh7qiW79I3/2kI9w41zIFyeYgpPinvtGVQ3xR4dL7OSZI1YrYoIS2lPHf3tG47dAenNLEecl/cyw4NUtLLGH80DG1KxlvPakyQ87VqtVQ6d2/obopJT9BP2RCbvi+pnlU5G67g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787337524; c=relaxed/simple;
	bh=z8INkx2o2cfHkD1mfAKQ7JZQsvh5s2hytmLtF8u8KIw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YXql9UgSqtZPvBi28IACWxU5u1DKKHoZWKj1SrITFayVjESQjeo3mUctAnve/QQYJQL4ObLF84lGSzdnTH/qI7ZS6+f9/XXj9I38QanuNTXQpBfG080SbsJxwzNvuEJvYAHg8ohXcOv5wRprRKBJtsggvTyQMVlmf+urX7NK7yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk/eatll; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk/eatll"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B5B3C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787337522;
	bh=z8INkx2o2cfHkD1mfAKQ7JZQsvh5s2hytmLtF8u8KIw=;
	h=From:To:Subject:Date:From;
	b=dk/eatll11c93ZnVNisBsPeZzYJuA0EnzQxuBzTihpW25jJO9IHmcOhPz0+l4rvJ6
	 5mi6Rhg/yzg+NwM01tFc6u+8HwQeXkKMkCXadCqotpUKiGCnLAqs0bkr6zfxfB7HKE
	 QXW7EY4eo2GXfdFZgW/AwOoLHOJzhINBQTojaFEPpV/4bUhlbGIUgi5hiDv8ibJ6AQ
	 n/BIg6XePK4JwtVXF0X2JdvHGM1tUBX3pF/ETq7fzIZH1yJRKM3LaYiIUe+HgVQntI
	 RSXU6hiRSuSMbtm1reowXQ11FvCuqavdrkYNV12juYbAInuoPV/qlTEeCHc1K1zn8z
	 J3PNOQpjtD9MA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 09EF7C41612; Fri, 21 Aug 2026 18:38:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221905] New: [REGRESSION] apple-properties: device path parse
 error -19 at 0x14 on iMac14,3
Date: Fri, 21 Aug 2026 18:38:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ch3fdan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221905-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221905

            Bug ID: 221905
           Summary: [REGRESSION] apple-properties: device path parse error
                    -19 at 0x14 on iMac14,3
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: ch3fdan@gmail.com
        Regression: No

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

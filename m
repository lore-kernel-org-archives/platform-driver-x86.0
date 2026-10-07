Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8994B346A18
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373861; cv=none; b=HzDWRbiHBQVBQ9l9mW34Kkncd/mhyxdBzLk0Lbzs3tlNDXMgKLddF9TzjNZnFxeV06D8+UjPqp0z4KGoElWrMoxTj1+Ao7OponJgEqj+GzyF2flocpbUsxNUz/gAbsdfcHCTE6dkJfUcjk72NgJ5dr6F7uDfLadai9mNpAFMuts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373861; c=relaxed/simple;
	bh=GShz1fa5UORLtOc6dknilDqZLASgwk2JGgwvuaVRDFo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MXUH4Q+8I7h5LnYsz5ObGdXo84GpNmTE08dwb3NqMScpOvBTPN27y7/NLoqFsiC602dH575VRFqCjpq5QFhmzHhG3vG4XLmDDuvl9+yT9x+oFXLKHUWHZO+tLORdn4Bd9gjq1eMKEeBTwXRhnA1EU7vMH36AXGAx/G074AqFOuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNIR4/S0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNIR4/S0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8BDEC2BCB9
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791373860;
	bh=GShz1fa5UORLtOc6dknilDqZLASgwk2JGgwvuaVRDFo=;
	h=From:To:Subject:Date:From;
	b=eNIR4/S08VjfNPvWYpSg2y/0cERMucCStU2ZbJdMhJXxPpMl2e992b0PqLax/7SYL
	 LM2iwQDoTOIyn4ViY54L5Pk5LDt0m9xY2LCdQSVlThZnv3MXCujbncpEKknEKBcHtX
	 xcaZdmTfaSZvradMbEr6oE+lWJggVc6SeOyggSXoK6KnLVN1VcyV8JUIwZqWH7U2LU
	 lTLeqvtLR0Re74yNpuW/Kpffbsir/MT42WaE9ExoITolmKOL49wauGCOLJzV5KJu3K
	 HGfNDAemxYARRzltk/X+ohY+Zv+pvK1D7pDuSwmUd0YDzZ23xMYNKU8bY0olnJFZoO
	 fG2qPC0wn1w0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF508C4160E; Wed,  7 Oct 2026 11:51:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222102] New: [ASUS Vivobook F1054ZA] Keyboard backlight
 missing/not working on Fedora 44 KDE - PixArt ASUP1200:00 controller
Date: Wed, 07 Oct 2026 11:51:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roberto_comandatore_93@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222102-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222102

            Bug ID: 222102
           Summary: [ASUS Vivobook F1054ZA] Keyboard backlight missing/not
                    working on Fedora 44 KDE - PixArt ASUP1200:00
                    controller
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: roberto_comandatore_93@protonmail.com
        Regression: No

Created attachment 311016
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311016&action=3Dedit
Contains all logs file

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

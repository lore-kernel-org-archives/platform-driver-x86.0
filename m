Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA945A2A1
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309155; cv=none; b=MiHdIqTXamSfGOAumT1rZTuvm55s+G1FD4EAPGLPmFWUh13vaH7VJpnSUh5B/k1Ewo9GZvmzOnI+EA5v62hXSCL09nFli7EJzT+qpWtfiz45I+YInCNJyL77TinTGlQ1aJ6IlPGSvIxqlLmOz0fnAUfvtrSV3XiPbNeMXx7yKxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309155; c=relaxed/simple;
	bh=D7VxOw1tVCGjzvhMi0RA61N14+8gNWE90lWv69frBPA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H0yoO8N29TaQkUhEyJmutNw7OjIIQQfz1syw/RpyR9rlc2dT8O+cMkWR6J9ItaW+DnY1vnKqq77Rk8GE+aB7wMRhoZSD/Y63Qb9M/zjRWxpyCWyQkNNeq1T8t1cMGxygVQnwAgy8N66zZA61/8eKrqXuaNFCIDju7w6Pyv9FuaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jg+DGjBG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jg+DGjBG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AC36C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309155;
	bh=D7VxOw1tVCGjzvhMi0RA61N14+8gNWE90lWv69frBPA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jg+DGjBGtvpcx466cJW8M+mI5mL0OAOOWQBwLQNlH8h5ROsLEjTY89urCSVVmOcUQ
	 TnDEwmVWU8cHCbQHelsSDlKuiQX7G3WIt6ECEiug1wCPuHrxDYS7H+xk2SsDdLIrCz
	 MFW0W+gysYPLXn0YiYza/ZileeZU5LzXd3Gacvt7bPOrnG7tarl8USpwDr6g6xNHMN
	 PYZvfmLue+HSiRU+cDP5KIf827muXvulgPMJ5o3O/paBJ1OEUKl8lI19pt0zw1en6i
	 dxZb9bAJaqo1C8nN2jLaShbke9jSGZwZUR7mNt+bGk5cG+gc2Z781HKBMX7nHNmyIx
	 hccF0y/hq1W/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0B0B5C4160E; Fri, 21 Aug 2026 10:45:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:45:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220926-215701-FPpcikfZVV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #8 from Gibs (gibs23@proton.me) ---
Created attachment 310699
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310699&action=3Dedit
acpi dump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

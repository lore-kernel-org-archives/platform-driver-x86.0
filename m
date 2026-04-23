Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8751334D389
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776917743; cv=none; b=n6BRnn8STh70ZzAf1iSFisB2unzvu63sMC6ZkDIyPrEH4wgI83Ac6g1YKFbMlXKJbqyab9iyw5Nd3Bgxvwt8Mv/Y5C3rdO4eOzGrucunn8rvKjgEIjo8PSJ/Bdn0Mk69ShYZRuV0b8oEbgKYZgMG9vYwZoxO+dzPw8qkib7N7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776917743; c=relaxed/simple;
	bh=fVV3sj8EEEJLwl1LA8K8h79K1gO2EmRj4Mw3vW+Nas0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XW/nL8l33sQE5gfgyJ0HE2x+Kd8iuiyh+VJFd7UCEErGaRKvwdFkSX1q/6EprFqAvnmBadA1WYtt+9Ynmoo8BtWSxLryul8f81Jb7f9bsr5ABjv+I3caq4AWyOClCorVXj85RpZwa3obeRKctyb3Z7h2TECkBOkiHOH7onZ40MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbGdF78P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbGdF78P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B9F1C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776917743;
	bh=fVV3sj8EEEJLwl1LA8K8h79K1gO2EmRj4Mw3vW+Nas0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LbGdF78Pa8ac2qF4lYw+501HKG3uTrhRtnh4AkJa+gKvYqMUAk36W2OaGOerWHVaX
	 F2xKStMZXYUNldDB0P9DossUKt+Pd4XP7oRlngp5qrUuMDHG/SBcXFuInb6lHCNT7x
	 E9y3q/EjN+qBh6u7YD3K9Xkic9GyqqnJkXCcoXjMgrR+xAZWm3Sr2wCMoUvVJxT5Nt
	 LhQ5nutxqKgqrkmDnxu5MTdaYZtVa1tEFtF6sg4PCtYxRk34o4B+dxQQckMlxDixaw
	 lkQRQmUB62bePd1aPFQMKs6mK0W4qWymlfG0Vjeesnx88rqoyPTEVE65vt+upJl/LS
	 SXJIjGggG2brg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 30CDEC433E1; Thu, 23 Apr 2026 04:15:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 04:15:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-YSOViI3R2P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #15 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309930
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309930&action=3Dedit
Daniels dmesg when running suspend manually, see XXX comments

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

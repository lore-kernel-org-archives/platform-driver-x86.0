Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0A02BEC55
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309501; cv=none; b=tG4MZpVfRgTOq5gyS45+giXPVcIGHCSMfwmBkngz0GDHMgAWFYo/0vKJwrSvdljsdqfz+dYQxOVh62AB/OU7O8mxN5fDyubP7uRsXPeZvRmsIkxNi+ls8TpNBS/HRrBejJjzc4CAA7OWzJyCG0/vOBpu744t+cass/koUgJUv0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309501; c=relaxed/simple;
	bh=TbBm/NDL5DOdRP0/eAW/naZBX+2Lm1s+v2f4uQhBYy8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KZIHWOuYIQ/BKCr/oeQh5wWuO1kAMtafay0N5NkCy8/jRKeM7VcKI5IQteoNqdAeBswVkR0FvdYdnyd9ynnbGLRdQmGBej3xylZyMYMQteYTDX/7b32OVgXX6Y4i0kkd2FguZ9bT0ssbOuBUtFYbZ+Gu837h7WdSuKKADq6hn6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fgugp3G7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fgugp3G7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CD53C2BCF6
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309501;
	bh=TbBm/NDL5DOdRP0/eAW/naZBX+2Lm1s+v2f4uQhBYy8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fgugp3G7G7u04Jz7LCDszpUkHitJ3h4sa9E0/b5EHCnMOK8XZBF+LD0cYEFlkdZbo
	 A6Ti35JiEfQw0tvkMWPmImT+5MtkUAeIQg2qV8jVMmO9xXlS2MHG/C/Jffhob1r3TE
	 mjOjJyy3LVTFwrQ2ylu+EZXsA7LquZ2+xY9WnSZZBKsGF2de77LwD69mL9FV26ByqT
	 QNBsKeCbC+x/Io+eMl7R5iR5ekVAVM78tLWynXn4tZS9+j9gk+V+aZLusBbEnBmDAG
	 raRV8vr+RN9wJ/0X08WiF7iWqSFXG2G6vHofPrdgixsb/iorkN5+66H0U/7P20hrNj
	 bMJ90XOs7Ejeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6D130C41614; Fri, 21 Aug 2026 10:51:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:51:41 +0000
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
Message-ID: <bug-220926-215701-WqaMsl45US@https.bugzilla.kernel.org/>
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

--- Comment #13 from Gibs (gibs23@proton.me) ---
Created attachment 310704
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310704&action=3Dedit
ec dump with fans at higher speed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

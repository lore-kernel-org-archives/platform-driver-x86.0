Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714E047A884
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787310657; cv=none; b=MP1/jsGyS7XBWwXuiSLb96btv8juRfzfUFvoVgZma2QpuZ37SC+dSrhRpTLwbYFlprb+Qv/8TY/piwVkliE0HocQdR+nzGjayIdmdDAVTrcsy9/4S2GYOONg5CRj6WLdXZDW6mv/eHbWKiUdxH6uQ4SHmfsPWbpfpxKSsXh/K1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787310657; c=relaxed/simple;
	bh=d/qLsANXemAaxIkl7V5TPEGGxCfWCZ2B+N+jWhLmh6Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xykvuvw1vxhehJJ9eib/TiOVvjtkHl+Q0RN8W1f1ukoTLdjYWUYBfUtgNeCQEcutdurVfbl79Gxc/3WisOuM6vIHNm4aV4+eeFhxB9w6BffOuiXNDBr+0Q4civpetBE+7zkjgHsC9KySNFMRGF0hUtmYom/vvF8XsX8f5FUCxcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p77MCVWz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p77MCVWz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A281C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787310657;
	bh=d/qLsANXemAaxIkl7V5TPEGGxCfWCZ2B+N+jWhLmh6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p77MCVWzlGaW71ovjd8VB8Wv1YnwgbkFQcTSqk3Sxf4l5vHIq0fVVLEnhTWpa86hD
	 J0nw/LPP7swS4r6cnoe6noGzEih99peNioX+sCQwtZsa6hbXpD+EhfuA0rHnpYolif
	 VhLLZJRfwcLcGiMeGZ+UdeFJBcv5AODjmmpOW9XwYsyF8nvlIct/ad+OzOpA2WL9oS
	 52t37Ngi5/fWZ+hBX8p+9/wixGaMGl6eYKCyHW/T1W+sSsQL7OL39o6blaaiDMWCXv
	 rj50IcMj+glC4wrv1bs4JVQZ6FPyd72WzFPB8thmts58QnDjbREGjt3mQ8nnG0Gu2F
	 uyYKsedOyGb0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A25CC41614; Fri, 21 Aug 2026 11:10:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 11:10:56 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220926-215701-aWT19hnbpu@https.bugzilla.kernel.org/>
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

--- Comment #16 from Gibs (gibs23@proton.me) ---
Another detail I forgot to mention, 0x102 seems to also be coupled to actual
fan speed values, but is singular. It does track the two fan speeds, but se=
ems
to be a higher value. Maybe PWM 8bit signal where the fan speeds are %?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

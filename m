Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3C31B82C
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771865975; cv=none; b=QLhvtx0jzPSzk5tgLYASYwHrQzTswK9qHrgrmG0bPfD+kTQzM7PlzJDGJ/4CA4pi5E30mK/JxKgDe8uCQNgY19E6OXk7EoTC3AvuhhjApQI4+lOHHD6fSMK0wVSjNUOf9MBx0HdCrkM4V73S35n+pGk6tcvg7MfV76HmA/vE4VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771865975; c=relaxed/simple;
	bh=lwZUnLI+bqYw7+Cgpxien7ktLAGuzRKGaHLSinIyvww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nJMeUiUXk9E6bEgvSCuOEtguPS3A1f3MAhAUNWxE742exxdtnTcFSqKxBECpAwhRr62ODMjmvdh6zYWKC0l0ugkdrsZZ/Wu2PM5fhzxeJ5Hmf70oQ9Oi+DBttFB9Hb148XQXvHIkIIE54FW03LsSlPzMpZH1kZb828VXbwNbnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEyXJFrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEyXJFrM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2429EC116D0
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771865975;
	bh=lwZUnLI+bqYw7+Cgpxien7ktLAGuzRKGaHLSinIyvww=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IEyXJFrMfRygxfAEPpcv+UE0otjBCKNJ/+JtkY94fiLtKAq4JGXq+/LMmFbcC3zy4
	 BS7kjDVHHgGM0YVWqI/gef6skDWvJujr3B6PleXn67hjcbIT8vUcbZ/Wp7OdGGmyme
	 JfZtlClARRwICclODB0g2iQhriVFVyXay2IRK2dUtm2qQRQLEPykCdGFfiAhliouUm
	 cpv1g0+H8wDpqvxd9egSViRiPmCMioAAc4xQ2vasyvL8wltINlWUxYbYyC1JHdRuBy
	 0VR3TOqygoPM7yXqUI/RwW9zgcxIiCcmGHNY3x6ECmrBNTYLpNyKkrBIwaB5d72A+J
	 JnE4c7e/03mXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 12E18C3279F; Mon, 23 Feb 2026 16:59:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Mon, 23 Feb 2026 16:59:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ggrundik@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-1cIM1xMJZC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #13 from ggrundik@gmail.com ---
Best solution could have been to hotplug the stylus battery device when sty=
lus
comes in range first time, but that would be quite a trick for the driver.

Less convenient solution could be to hide this battery readings, if stylus =
is
not in use. This is a userspace solution.

But current solution, to hide this battery always and from everyone, seems =
like
a worst one. At least there should be some override of this behavior apart =
of
recompiling the module.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

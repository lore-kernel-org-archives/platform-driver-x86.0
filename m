Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AB82628C
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Sep 2025 00:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757810755; cv=none; b=i4PACdsQMoB2fNmsJslEigQ5+qMxgFegJjO8/HlQQ20PjpL0zXrUCvAkX24N0kBetbI3HFGR3agZ0FfDjMv3/xt4y+wGt0XVas7FB0lENxEY46pN3DUwHZa6mBMkjwLY0hz4SQVG7RccAIOE9JDGPXBhI5q38eZV4MgQt1D+6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757810755; c=relaxed/simple;
	bh=GhLgEVXIJxSVSc7UKwf8jScqJfl2AvMDuymUUkJ7w40=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RrbJLkXcWm/+VVOlkuzZR0tx9+cNLpMlJ1oG28qDOJcy1G/xs9zzapH2bl5k3wzAJKzhrnA1S1jkgthW6TyRdiXbk++uVdAtobcvragQjdMf1Iioy7/mWOInbl+tBJd4PCKeA4uo2+jBEWPLGxEKHytsbq9fmga1L4ZeuIiSfx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C24z0ACx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C24z0ACx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECDAEC4CEFB
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Sep 2025 00:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757810754;
	bh=GhLgEVXIJxSVSc7UKwf8jScqJfl2AvMDuymUUkJ7w40=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C24z0ACxHqgvyFEYdMhIWLrUiQrHO6OWp9uw7DssvOnU8L40BWfqbUM8W6QaMUQAs
	 C/sFl+7nduWX5NpWg2ARmUkMA+AKqoEzYV3cpVXlCDnKrsIaiBxJJK+2buEOIHsKC1
	 Bo/wLVfG0b1kdQIYzg/WXZuoUznKJS/e/ooSP8OkuNlVHrBRZtEE23aY8zetTCin8N
	 MMiTuZtvPZfeA5qQa6bvcQcc223d4OA0zHKu6uzQ/3CMOoF/ZHf+90ruReX7IQaNDC
	 t7vmpQsNV7LQXcyzxYpfkxppGYyISIb96C2eMua/GYG25SyKrSVX2LyCl/D817Iuzq
	 sx63SJQkRMGWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E57DFC53BBF; Sun, 14 Sep 2025 00:45:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 14 Sep 2025 00:45:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-KZuHIzJJqs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #117 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
Created attachment 308671
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308671&action=3Dedit
quirk for Petar's system

I asked for an s2idle report, not for a snippet of dmesg.

Anyway; here's a quirk for just Petar's system since I got an s2idle report=
 for
his.  Once I have one for you I can your system as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

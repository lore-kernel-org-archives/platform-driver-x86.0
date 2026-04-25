Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F57630DEBE
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777137207; cv=none; b=pQtnK9VMgTePjgsOQ5D/Fd6EsW0CwwGlqxB+Avq+Pi0E6rXzbTuZfXEy5HdJHdDsVlYKswLfKEHNrzZv20/2zJupWV/i/6L04TC4k57VhDhoFvhEoWG/CKruun03dtpZI/O2q7wvnwaj+LVvlW2xMqf0hnXHag8uNIY1xKHIve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777137207; c=relaxed/simple;
	bh=4J8FxIfiE01iNMTURcsZIqxCqrbkCoFqxKMUwhtVt5g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z+AwesX2NwbIIw3fTu8gxcn4Y5UsDUVSCviOaw8iV6CTI7EpHX3nH6BW2VE5MVfGk49KFC9pGsDDFLRpaQ73tAhksyWiQIAwfpI95eeG8iZbInAgWIHr7F0moa6OMfDdYQVE0izIb2/cvAY2ypDxABuZoWGa1tRxa94gKSowHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uztj6BO2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uztj6BO2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 394DCC2BCB5
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777137207;
	bh=4J8FxIfiE01iNMTURcsZIqxCqrbkCoFqxKMUwhtVt5g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Uztj6BO2VwkUteo9Hjbw5Tc0QFqmGcMVUSgYhFmbYVN0DpD3rQY2Y4C/FoZae9nCM
	 9X28cYKrAUb4UhkNO7iaJdQCstY1ZZSQsbbQh3b+CmBzwEzouI9jJjXTq+jy7ZDwSy
	 +Xu6As7P7/xperUiyK1LyQ8IMj0G2d5O60/xKr3pbDbDfs2xOzs4wZp+eH0UzArsKy
	 a4WRcI8xwfEOPdfFEArudhPZzXv96KPE+B1Na3hzSGtpdU1wL27+314Fr1nqRqdaFg
	 TwZSbCdl+eOfEk+eIvKWYCbj0au/BHzcs9sK3AxzME3oLGUb8rL3Iuu7ET9c25rPDu
	 H9aIZ/kLupiQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 243BBC4160E; Sat, 25 Apr 2026 17:13:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 17:13:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-dP3GgVxxze@https.bugzilla.kernel.org/>
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

--- Comment #40 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Okay. Well if you decide you want to just jump to a quirk I'm not against t=
hat.
It should be pretty straightforward to add your DMI info and run this code
path.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

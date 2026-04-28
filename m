Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF5C42E01B
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385120; cv=none; b=FWUSnJ3+oPzNZCHoG8BnYL4EdnCQzJnZ0m10WNJAsS5CzLsADszT0nAnhvA6gJRJF0SZhLXXE9v1zR8EIHQwdmPiOAr/cwj0WbFP+yamELo0mYriXLyMcWj2PLXNpgTojEvB5cot2tx1mQUPZukG4cAn8K3rdCMdXJnZDMy4keA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385120; c=relaxed/simple;
	bh=dtch7dcPadcwPC7GRuh2qwVqmUcMHyE7+/VNgjOslOM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IMhy88ltS0qpTUl0PBlvRAM2gE7UmfcTDBmw/RwEJB/+gVe+7vuy9OpIe5NLoyKNkDGhsVN2oE9DP0qeCG5iLOUnom9KThm9MSfCYscd8+rgMHQI3KUKkf5yVpjShR060BMlb+Rr6Ork+/9g+mDKrQh/cfWrZy19U75V6IkFBF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W21EC46d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W21EC46d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 064F5C2BCB5
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777385120;
	bh=dtch7dcPadcwPC7GRuh2qwVqmUcMHyE7+/VNgjOslOM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W21EC46diwlvSOmILuVPtRYFK/36UR7AZQ4YUzC2qPBmA0HP8ZbmaURvHRUdMtRqb
	 aFsYwSq4U4WlSCScvij73CJMQreLPhuyAv1QyXg0zsdIvb215RVrgyOBRF2yW/SbO5
	 mm8D/wCM2ePZ/SUYce9hBYc8oz0Bzbap9XDX2eTBpIKsESeJO9Jo21oLir3iECj/GY
	 RzQqVei6pQ44VieSocyt5VR3GYSkHsqgU2DVBD3t1Q0DvIBw1gUJT0qm7d7zijyqcx
	 AgTSX/J9F2FL9wkLIt/amsJ9Idp4JfzUaHQhKFZTo+nuJ3XZh+jL3n8nQJIkpol2Lr
	 g0vKyJmY/MQig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E89FAC3279F; Tue, 28 Apr 2026 14:05:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 14:05:19 +0000
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
Message-ID: <bug-221383-215701-7s7G8lM7DX@https.bugzilla.kernel.org/>
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

--- Comment #55 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
re comment #53:

Can you just use "82X" and "83K" for the product name to cover all those
systems?  I think that should cover them all with just two quirks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

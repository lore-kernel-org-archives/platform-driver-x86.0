Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2340D8F4A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 04:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757478528; cv=none; b=cE4C2VMl3IhjxFZDxlINCdmjYESm7Z0dmuF3fBN/kq3a1rFHhp+1ksJ2vJeFJaquHpp5VH5rfOx4vF/xK3OdJsuUmrRwRO3vc+2G/lRw0mI/4d0fHQCmi7kdsnOOFCkWuCnsf5oK0fv8UEs7VyS+nRx1CkspDWyV/dAFNwq1U9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757478528; c=relaxed/simple;
	bh=JAEaP0hSqnUHupAlifqBBQdzZi1fbqcqtW9A45UjFro=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g8dfvmfYVRU0opmVZPRz3OAeMrK0GtQy5lK3trCLMygQkmZCo3M6QAjs3lQO2Ed2BhMc1ZUpBei5JxTozDzJ68Fuvz8kGFgly7hh6wpMb0NnZPKvNUrBTgh9SKCNOTWfllvtX0O7SgxVr4JDqWNcUAxyRUWVnDC/8opTYmop728=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PArgrMz7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PArgrMz7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD930C4CEF5
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 04:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757478526;
	bh=JAEaP0hSqnUHupAlifqBBQdzZi1fbqcqtW9A45UjFro=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PArgrMz7tckiQK17mbTiuHRL8YuG0Yp6MLZFuOig+c0khGL/RHoVOujKF1aGueape
	 BKBNr9uyGsmEQ4we5O9Xy4mFeftAwU1BOIXOAhooPImj/ooZJZfLvRxF/37dIGiJWF
	 AK/i/D6lnuj9enA3cm9dWKQA9MwOrLkP18M0pDYcH87bt17+JSsH/Cim/PLohHNhDr
	 61MKd6yyvYQmtq2haBgdJQWl4XFVj1yRvEqO8uJTobpdsJzG0gW13wTY/gH3Sfzi2y
	 wq8scYDyDl6nxA4uWCEr4UI5AiIrG/WR76RIpgh9lVh0W7fqUXdpL+RfxN0nrk4Fji
	 fbvHXa4C5/jhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A6C3FC53BC7; Wed, 10 Sep 2025 04:28:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 10 Sep 2025 04:28:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-LK23Ha21Yg@https.bugzilla.kernel.org/>
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

--- Comment #105 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
(In reply to Mario Limonciello (AMD) from comment #103)
> #102:
>=20
> Yes; that matches the workaround that people have indicated in the past f=
or
> EC on this issue.

Is it helpful that it seems that I can reproduce this every time as describ=
ed
above?  I feel with unplugging from the charger (where the dock wasn't in u=
se
previously during the session) it would be more random when it would occur.=
=20=20

Also, I ran the amd-s2idle script and have attached the report.  This is
without reverting the commit you mentioned.  I'll try to get to that in the
next day or so.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

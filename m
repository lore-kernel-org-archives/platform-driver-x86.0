Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3A87E799
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715167315; cv=none; b=MTqBWfHN5j2lCF+185MdpyfL8FLYNnPqCvwcpg+36oY1K9+VPMndnkDWFV+vv7Rf9lNGAFHnjvFRm5/dzrDGok8/M9ej4ghGUKBAV9XZfB+2zH1W82gfWmrAsGejDhHnELv3gRvDiNJCRF2gwOheaR21OByiQZd//Osiz/AofxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715167315; c=relaxed/simple;
	bh=J+ZgUWsg7HgFcU6t/OHVcuapM4dhYRatTJRuvHAk6OE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ex0A/QqBLwtdbRjGK/7Q7lAE0rXVMJVlB9PdZasb/IQ+kB8fQQvWdtI7A80iMrkoGxKzloD+6MJAHlbhT3HddBx42qIn7ro+hOhVPYNm+tHSHzkbfSUj4tIXJxNCDJ4RRg9/blNEjTD3gXIDH/RSqa6sPClgkknBIIfu8pgbKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uD2oej3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uD2oej3O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08C3CC4AF67
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 11:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715167315;
	bh=J+ZgUWsg7HgFcU6t/OHVcuapM4dhYRatTJRuvHAk6OE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uD2oej3OF0VRIpgklYub8hDvjdE7IuYu9PpwDarOHtF6COyMRqT8l8s9iD5BqDq90
	 +ECVimomtOJYyfgqlJhdw8s9ykFD4Z3ViaqR7DV40T1dHACbiNYdRDA/urlONWShBn
	 XWm+19HHB3S0UEvanHhmIvRjeKAexnCZ2t2uYq03wVylAcCYTo07Bv1uw8tDXK+KpU
	 geJs9onMqJWVmAcbX9GDObt+Izp/3W6RcT0tpEJ5/FYnLInPVGm4HjmwkxOwDpM0O+
	 M3agE2ZW7pWsK50iYPvNJ2ZMtKtrxP6RdBnpSvbGD59vbvMUcSOQRxqmkAX25Ys4A3
	 13ReWLF2YG4Ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EEABDC53B70; Wed,  8 May 2024 11:21:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 08 May 2024 11:21:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vanoverloopdaan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-SKM8aVDalw@https.bugzilla.kernel.org/>
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

--- Comment #63 from Daan Vanoverloop (vanoverloopdaan@gmail.com) ---
Yes, I tried it a few times and I'm pretty sure this is correct. I noticed =
that
the value only changes to 0x017f1221 after unplugging the power adapter. But
I'll try again just to make sure.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

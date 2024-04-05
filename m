Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC265101F2
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Apr 2024 02:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712283634; cv=none; b=Y49f8ZlMcD5ItrLj0LY3OxqafaKFgp+YMgC22mT8ai0pnYGJrZzCoSd7SQqVBdSObuKy+KVckSmjyGa9cpNVz+t6iA2aQ4Le0SWNfZIFAfaN0LTx84oc2XzAcDAHE2Y5N2on2AkTmBc+aedxnYhsSMs8+em+5aOpMSWwVrqP98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712283634; c=relaxed/simple;
	bh=4ZlDkVtFapi71TlE3kvOS4Gs+mGS7u2U+Ff6z6admwA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HtrRQ7sKhq1CFnO/IBRgqM/iRs2oQor6NEY7NCQFxs+qLJT1gXqBj9/edpH/da0oKSvgPaWVzJgV3/NwVupLXlwUZoeXvxhDiO3zKL405Qkellw+jWBBWyeG0Pf3ur5bAB/NOR9YI2zBkHUIM/ZcwVSGQ9vC+e+ID27snD6fCtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HaLWTekx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HaLWTekx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64E37C433C7
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Apr 2024 02:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712283634;
	bh=4ZlDkVtFapi71TlE3kvOS4Gs+mGS7u2U+Ff6z6admwA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HaLWTekxQHFDaZcowFZCzCYfV21KuS4Ox3DAnxAG2ugIwVOWpGDVaZ8J/v1LI5epD
	 Mx4JulUofUhtohmxfnrHiuaoUvlSKwdGou8ss/nwlTWJWjcLiBuJJbmaHTnQgoCrAU
	 gJkzQogMhJGNS+kzrwZ6WNf1Y9U5YjCjOXNWEbDfEzJMGzmZsXMQhN22679nyZZpZd
	 ywbShIRArxxmpQHYT56KDSeCovVCUiGmwmaT9dE0AN5LoCelEp6ZId2xIPqH8QM8dQ
	 bi/Q6InKEyzHhmg83Jk5Czgj99KiIhWgIPgbwr3stS4o40IAz/FuP0tJhs5FzcepMK
	 +Fhl2uef0Y6WQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54B16C53BD3; Fri,  5 Apr 2024 02:20:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Fri, 05 Apr 2024 02:20:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-OcqPZ5TXgV@https.bugzilla.kernel.org/>
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

--- Comment #46 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Any testing results for that patch idea?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

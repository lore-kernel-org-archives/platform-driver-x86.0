Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D1A36B04E
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047981; cv=none; b=uxdBijpmlV8aR4zt4nsjpn1PLTEjQlYBm9s5DpXpsdbeCpQ/igiBOUgdTMTZ11PbmuZRugtrpER7oEs1B/gPKi89UgoTN3TGlPI0JGCkyvTIvszeDNXpGwBIZV254o+7MHZesWMSaWu31i7vo0zpIAsTVbOoeaVM5s9SWXhDUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047981; c=relaxed/simple;
	bh=D63mWuGgDslJU3lsnZrsh3iM/Qm7Mu3Xbh2m7YkrKek=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GHWA/1B6xcwa6WNTHfLL7JIGcneCi7S8hxDwb/MQw///UF1mi7W2RXAU1hvrPSdfKgOVXkFPTRN36S3bGXrnxTOq925idEKH09Kyh5/GpBi1A+lylpNe2ZUJ/rSyZdo1IcLNTanD+Urh3LDC8l5f6IXVRz4scxDsz+FIou4S45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0xk+TwR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0xk+TwR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8E04C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047980;
	bh=D63mWuGgDslJU3lsnZrsh3iM/Qm7Mu3Xbh2m7YkrKek=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g0xk+TwRWxsq/5o9skBaiitGzSf7jqj85zKgMYoJjg01DC3xf+TNkwRp8ZrzJDzsS
	 E6VUpTs6N4q88r3AuF4WYzbfoZ59O9hFRGW4uuyZRYeaoI46b+74SUmoGjaDPoBxK0
	 zgOu3kTNzlhwT65Tcm36tdSjBtd28GOCGx/KiglUiO+hEzwL5IR4fJkEoUxWMzBeMK
	 D4KZ/8/XHW4cbtXIbO3W09GkOYpMfpcIwiEfmC32QlYhg9RmS8hqVWUEAr3lhGknjb
	 Smu8A3TFvRcSJaDNlslW0KNHwoo7lDaSsR6O5Pf+A/4zeTUp82hmSGmSCw1GwHCpcv
	 npne409QqED7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94910C3279F; Mon,  9 Mar 2026 09:19:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 09 Mar 2026 09:19:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: team@nitrosubs.live
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-rNmj4TEp0w@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #50 from fililip (team@nitrosubs.live) ---
(In reply to Mark Pearson from comment #38)
> Can someone nudge me next week if I don't post a note? I'll get this tick=
et
> forwarded to the Yoga team then and ask for them to look at it.
>=20
> Mark

Hi, did you get a chance to notify the team about this problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

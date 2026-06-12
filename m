Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7A1375F82
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289417; cv=none; b=Pp4IcomezyzujMhu49QQi6Kh3Q6i9iLPuOvuhSox9hVlFB8cYyNElREBLMqSVx4J+OsEA2ibEA9zw53gDHoJTPJkRDlXbKB3gUA06Xv4cMX3I5XAPiv32aTDnx5MEdOrHfF36kV8u6okTEQc6tSr2TP0KSQPye7Dfh0xaq9MjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289417; c=relaxed/simple;
	bh=cADcCS4u6vzuOqNCq1LY/1Ghf9LH0XBsu5qDGeroBbs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r7M0/aJsIhrnVBd9E3tcSEeV2g5XKhcMqqe3bkR0l4wGa9x9LuVOrIgKkHtRcEM1lQQBuGuwFTZsOQhQLVpvPaOE8P0Ui/2zRAywZlL4S3Cs8aA9UrNvruF4dA/oJno7J0PfH2p3IWTRRbL0zuL2J9mdCAxPRXzTw7KucxykFbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/vTQnrW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/vTQnrW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EC7AC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 18:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781289417;
	bh=cADcCS4u6vzuOqNCq1LY/1Ghf9LH0XBsu5qDGeroBbs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t/vTQnrWsyJoLowcmT9lYelCj1BFGakw0Y+iWi3x3quA2C9fAfcouSjoMNl2nkL3g
	 NJMqmtKEPdiInnJn+JAMeUKMu2p7CXO5IDGpgyzwrlHsBF8thlmKH8reVnqfc3IRng
	 5tKpRNpU742L0pqungqumzq6fGCAGiQfMpZHrsMKBJX1X7WqgvFETXsbsvNKEmcbp1
	 +Db+AuXuWRaHeCiK9llEgtDH1fqbEOF6X//9b5WY0y3Me8SAdNbDuCuZsQ4X/ZIE9C
	 z6KZzUjzNuzGs197oeMhMjZey3tFYZdhXIkXoBUA/km9fQj6lj1ofQm2r1zy0fXev6
	 L0pC11esylO7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21CE4C41613; Fri, 12 Jun 2026 18:36:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Fri, 12 Jun 2026 18:36:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221569-215701-Z22BMdiJ0k@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

Milan Oravec (moravec@ukf.sk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |UNREPRODUCIBLE

--- Comment #21 from Milan Oravec (moravec@ukf.sk) ---
Seems to be solved into the road to rc7 so closing this report. Maybe cause=
d by
AMD patches for this platform.

Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

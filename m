Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6B72BDC32
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781958160; cv=none; b=QN63rTKMEyqDvTm8VpvwlKAwb6bdwkxPIYLibF/fpCodVp4ATKGX2Z6GjOxPSC9KZjVoG5la/qEUdCpMFM++Dwk6L3T/SHrGMzFEcTARlDwTVtJm+XETeQN+HmBkRCnUzATJZumjPVs8tyV2BiiNV00FA7qTevpVYQPNS11emCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781958160; c=relaxed/simple;
	bh=P1flmPqe6jVgLZM49++E87VqrLxVYdHZyO9UhnN8sQ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uQOFQUF5TeP5uTqNj9lTJ9qBbRwU9wEcevKJKwr0BG0y7Y8Ew6+L41C3p2pede8yT5nUFUGvAhfzIUzza5KMrC5HAGU+xXoeptMTcay+NSdVCjLulVdNCn+RKLSUv0y/osPNVzljA9FpQafoPM/DreIiu2plZBqYtDtSIU+l910=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYU7zIEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYU7zIEU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 028F2C2BCC9
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781958160;
	bh=P1flmPqe6jVgLZM49++E87VqrLxVYdHZyO9UhnN8sQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BYU7zIEU+i89wspil3w5iIuaotlL9mFSSO+tn1BADIDyEM9Pu+nhACFjcuCAKDMZ3
	 q8+SAFKwIHPzIo8GulOBi7GoW4KEWyGbhWiwkKGZ8om4FkIs24Gh/NwwiHd3MIYXT3
	 t3na0+rsT9m/vkN4pgLoFLKdyx1QwmhDvFj8FFy5bAHxRWH9L7ifQ70HUxFPoTqt03
	 rccrBApTQ6hKOwenh6GOng9/kt5l3uuoumLo4zoK5DK3IpRJmTvNDyDHwBdFDbGZN+
	 3PHY/0/cjv7p+9zB//o9Rp7jelnCwxQ6KLJyOIO3Qlxboh5phYDK9+49WXxdSc2cHe
	 sXpnyKSm+K1MA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D5265C41612; Sat, 20 Jun 2026 12:22:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 12:22:39 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-AimzoU68xq@https.bugzilla.kernel.org/>
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

--- Comment #41 from Milan Oravec (moravec@ukf.sk) ---
Those settings are there from beginning on (from session login), not change=
d=20
anything recently. Sometimes is 45 and sometimes is temp. 80 C deg. with the
same usage... no changes at all. hmmm. IDK. Will try disabling it later, and
will report back. Thank you for your 1st class help! :)

fan is the same.
powertop ia manually enabled.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

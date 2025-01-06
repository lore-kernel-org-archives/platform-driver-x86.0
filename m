Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C01FB3
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 03:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736135250; cv=none; b=eKDtXWt6y/a92TzGSisc2AWlTKv32oahrl4i7BLP1iKPH7ImJr/rDoS0J9o+VMaUmVfE1xwSlWSxXJH6jatD6sGRV2nyaCTNW076cfwTtUXep7sTQ/urOVMylXx8cjL2WvAVrXWKD7HaREbb6i/qAs0BLhli/5r1PhxE4NUzcfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736135250; c=relaxed/simple;
	bh=gsaX8Wp1suI2M2EQ47FqXwXtruj9E277G+uOAt5yDnA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E71mDpSOmBaJ21/N1r4UPiQQtxHOItDQrDy/RxouSjkvLj8xh25DS5dNEDI7kIn7yZ/Qs3YMMPuRzonPYOnExuhLu9Nr0e7PZb+OLnounAC+WewJt2V0mSkLglTIR3bOZBiVG4ek9Ym3Ij4IS/hk4IGrq3gNB+dZrH7QQB7z00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4py4FMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4py4FMc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83DF2C4CEDE
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 03:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736135249;
	bh=gsaX8Wp1suI2M2EQ47FqXwXtruj9E277G+uOAt5yDnA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U4py4FMcsFH0NXkCzCVyXNF7L4AZiZ/MgZynhs2IJ7hfAbY9avR0u5jAJrzEyscxH
	 buEjxElD4DvoB7EeBER94rj7h046L2CnPtRFcZqPB3f6FB8KQHlqgs4dfFYTokH7pR
	 nRckjyXqyqM9Dfg+0j/2nSggtWViYnxOJyXrIBmOhYNR92S32gfYm2nGszXvBOZSSJ
	 0Cq+2o6182VyP/H90jVIb4fkurP26b9e44K4SfR6yOtwKCz6SLdTnVilA81uXNAGag
	 IG7mdqfX/XeW0nqJgUH9cG1sFVqDfKWz39rsqqFy8BzqiNdXEZixMXVpRfC2rECMZg
	 A3/irdQ7E0CZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 72938C41615; Mon,  6 Jan 2025 03:47:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 Jan 2025 03:47:29 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-AF6XYp4NW0@https.bugzilla.kernel.org/>
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

--- Comment #82 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> But that makes it even more suspicious. Why would such a critical compone=
nt
> be outsourced?

That's how the PC industry is.  This isn't an "AMD" specific thing.

> That almost sounds like a recipe for a disaster. Possibly even a security
> issue?

How is it any different than BIOS, or PD controller, or any other component=
?=20
OEM designs have OEM specific bugs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

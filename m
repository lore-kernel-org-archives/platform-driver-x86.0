Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142C3215F62
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705330; cv=none; b=Pte7cgWwE4y8w5kte8EBQEIZZWRvh/VIkot2T3FBi8kLBUC+MM4J/TpdtTJhWPMKz26Fgw7AFVJ8GpHmG4P+gjqw5Qs4kRDXfmF1of1gj4bESfLe7aBjRMuDsX3L1yQQb8vB93kNS2QTKfwtY/ycQWhh4uZA4Usu0A37ZKe/xDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705330; c=relaxed/simple;
	bh=/2hDmRDOsXV5OriD+vpM1+t8CJWeCEZxZDp8lqme5gk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ndDGhZMxFWhydhiYGhYSEp1VEJacrrpsZVIvmmOZ8RNT7UTMc1lKkv5jBwBl3R9q1ub6kyn0TneJcsWJL75lNx0ONj2Q10TuXN2mVKPGIVuJu9w02+Xc7ASr9WGK2bWoon1vzjE8XdlFzAcLdls4e4b8mcut4fstA1UKIZlw2Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QReVUit4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QReVUit4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87B2CC4CEDD
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 14:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734705329;
	bh=/2hDmRDOsXV5OriD+vpM1+t8CJWeCEZxZDp8lqme5gk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QReVUit4aO+p5aEaN6aJ9joviJwZXG5h/Xk0qFbz4tZjyou1TFPr8HfKc61Z4bL7F
	 ljecUlPp4153PdoJSFh6MegSPbBX6FC6N/c7a6pyKYpxWFKdEKet2A46unhegNsYYs
	 iHXBfT0GumyJnJqvhkj+b3Y9jsT5+FYynyVvr+Bxvlyv4ma2Jz7sYPHr1B9KULs9Nh
	 3v+bog8F1F3KZoPs5BZmQHJs40lCrWW0mnUXiMvq8qMWSwxAJliRe26meaiTBCPrcX
	 FVHNq9Bqf5KGr/DFD3gCSLN5+0mPT3BKbAU+zsai+UILQnNiCyq0ljv9xfFYmGq9A2
	 irJOpjGtWl7Ng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7442DC41606; Fri, 20 Dec 2024 14:35:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 14:35:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219495-215701-JE2NmlIdgU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

Matthew Garrett (mjg59-kernel@srcf.ucam.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mjg59-kernel@srcf.ucam.org

--- Comment #32 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
The spec doesn't define any maximum size for the buffer, so while this is
ludicrous it's not inherently a bug in the firmware - what the firmware is
communicating to us is that it's allocated at least that much space, and if=
 we
were still logging events in the firmware environment we could do so until =
we
hit that limit. I believe that Stefan's figures are for the calculated size=
 of
the log rather than for the table's buffer size. An alternative approach to
allocating the LAML would be to map the log area, use the code we already h=
ave
for calculating how long the log *actually* is, and then only allocating th=
at,
which would be more computationally intensive but would probably save RAM?=
=20

Alternatively, check whether the LAML is above some arbitrary size, throw a
BIOS_BUG, and just copy that much. This would work fine in this scenario (w=
here
the log is much less than the LAML value)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

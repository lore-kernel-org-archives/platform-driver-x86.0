Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFFE1361C1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747733; cv=none; b=Ba7KFPMz4XvnvLtgASbsvDT8J0U2UHyEGFAcheiTLbxKIEA4HU+vfL/7pt5Tgsh43fabULv+ku1MN6lbMM1PXWsIB1HKaVA69g99Eqs3d3FBpXuiVttgMkGi1B/4SNqA3/17WCIZc8/ZYARZ6F43kuudpABehDUdu0BuRCg+IyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747733; c=relaxed/simple;
	bh=IjNEjCfG0N3r0+pVxZcvErfi/7d4ZXVSNxiJRyxS46k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gvmGSAc97tSKzwo6zVWr+MwlR5aFDRHSM/rPBEW1p1fQUjotPav/AiNJwdiPBt+XGi95fIh9EH0WpeGmRzAUOuzZS+Xa70FFBI4MYIe6xOk2Zxv683OVQx8r3nl2J22pTLOMbqwAk2RgsvKx9y7y08B89Gv8xA0u3jtkEfEt05s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAFVWV7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAFVWV7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C688C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709747733;
	bh=IjNEjCfG0N3r0+pVxZcvErfi/7d4ZXVSNxiJRyxS46k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MAFVWV7Y42+pz/9TY0Ub7mcir339bHj5dvWqR3mROlvYBPX8r6+LqtC/PWa9t6sHB
	 AY2S3QXoW8f6JCTKAGo+3k2TjPBLx/OQuQUZhdnyRodrnZ0vF7F7B/MWI+hICq9era
	 UDcEUYyh90CLjpj/GRAb5XFbgVjwClEUPEGWYTVfo/3/S6iGth5wbAV6wKuWzPL3Cf
	 omBnBGJas4FQbw8cNwrTEwRvAZLJi/pmZPCq3Mb3vEiK4alBkJ1NzA+gXAzae23MDR
	 9E7LVGN9D/x2x2aQI9Ql1J3xhCcRVbKv/Tsa/NO/7/wPZkyytCy8GJzvuCFe2bSdY0
	 +tGjQ3X9WNkCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45A78C4332E; Wed,  6 Mar 2024 17:55:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 17:55:33 +0000
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
Message-ID: <bug-218305-215701-KGFiIjqNYt@https.bugzilla.kernel.org/>
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

--- Comment #34 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> If only it doesn't break other systems. That sounds a tad scary to me. So=
 far
> I seem to have been the only affected person (not that many people seem t=
o be
> using HP business laptops with Linux).

The code would basically look like this:
* Capture state of power adapter at suspend callback into a private variable
* If state of power adapter has changed during resume then rewrite all CPU
coefficients.

It should be safe for everyone.  But I need to know that it actually helps =
your
problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

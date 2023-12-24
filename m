Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B69C610D
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 15:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrDVK7CO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E75AEC433C7
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703432315;
	bh=q/U0GSBVaLU4J4J6zavfwAhxUtqM+IsZoyNTAthOiBk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NrDVK7COz64zPKbG2MA5PO6usrctaxbIHyPKqPyKuo3905/zrP03JKWvQ9KjK90mM
	 Rn4lFrmuxNMBJBMpao2E2JIdtstdtZNxj4NJAFscRQN5YvYZx7F1svxHoPnHeMxWaH
	 GjH+CyS5x1h7cMpmAWsxj5Byzko4O2msRKopiia3v36SE9JegIPPJsgUSLgCFEFOFk
	 vWOVxM5Ioh55T6njd1qcpM9W6R88o9+mJVNOkTHJ1TH85ajx5inU+gG/3rlbiwmaeL
	 p+AkltVmW5hoOFGc9T3JV6m3aUy4e1EBiM1Ra8xuKzR4cu3zra3mPP2GF6T00qc7cl
	 VWowNJSFVUytQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D5004C4332E; Sun, 24 Dec 2023 15:38:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Sun, 24 Dec 2023 15:38:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-mVRyxsSFNw@https.bugzilla.kernel.org/>
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

--- Comment #5 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Armin Wolf from comment #4)
> Could be that the firmware fails to properly restore those values after
> suspend, does the issue also happen under Windows?

I rarely boot into Windows but I may check.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

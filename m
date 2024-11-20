Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478F3C3C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732072771; cv=none; b=VmCnJx3hPQxRu6RzLkdtC7pSZHf0TxKb1VLwTKg6EmeydK+JGrsKO3qN5wqnrxZ3ySpsbRvlAS0OKZkNUU6nfGfhzg/S8pPzEPajeBtudYE0UPoSiukjYGT9rykMAOjm4rSyeWYnna1HsgpT6EHv/7RZC2SyOks6ZpDwzBimdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732072771; c=relaxed/simple;
	bh=vA9qznyUMPaXfMF79vNegbYN1wl20vZvY6ajsrWlezk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jbT0FzGIhD4jua8Fm2SRbkjpEp2L6Uw3HaI8Xz0A2nIvKgpExRFwy6Xe5TgureKPJQ7Zc98PRHJWUNoLCG52NM0PkGHsjO0CnhEOnI144LcxP92HKcHTymIPCO16jHW2Cm6JJthiPO+cNUHtdFc4uubondIRo56S46TCtI+5Izw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRNp+Gx/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRNp+Gx/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B388C4CED2
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732072771;
	bh=vA9qznyUMPaXfMF79vNegbYN1wl20vZvY6ajsrWlezk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KRNp+Gx/8FYVYJQ1nPjesUFARskhQYDSIBh25Mly8pgohfIIgMWv0J1JbYzi43jQA
	 0LN5U5YFupsSeBdwGCR/3Zwh+QW1pfuMVHuz0HYtW6gwiy1zVXcGAspfZuBHPpTk0p
	 K69g5kdkLpkIArzIAwOfQIinsuM0zC58FxKbvT2MSRe17/ViLuZV2flO5n/ri1NDuY
	 SpCu51oVSE3Wluu+uRTa3Bcp8/tURuTTiARKYfDzdyb2t7h8Qzji+E2bvflWc9qFFQ
	 r5bN8lHKhvIYL1Q77hbyjcT2U6y3sSER2X2X4zCnZa5WyqeMR5BUP+ULs8VZdnhTa4
	 Ez/7DX44FNy9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 31034CAB786; Wed, 20 Nov 2024 03:19:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219515] intel_th_pci Driver Probe Failed with Error Code -107
Date: Wed, 20 Nov 2024 03:19:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219515-215701-kgq32uJPYr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219515-215701@https.bugzilla.kernel.org/>
References: <bug-219515-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219515

--- Comment #3 from andy.liang@hpe.com ---
Created attachment 307251
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307251&action=3Dedit
Intel Corporation Ice Lake NorthPeak device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

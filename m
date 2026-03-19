Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD7D221FC6
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920664; cv=none; b=T5zYkxZIeoDYUwKSW7S9qJVZrqsxYFiPmlNjLfmehn15xpBdA03nTm0ZkxUyLNp5w7jm+Eza6zoKz8eGxfe5dFPNwE2QA1nr6AgNsUszXdSDfuhTsn4EOwHlaPM3DQnKcyAtThB1hG8CDAbgyMJo1ltPYAtwvQvHWnDAtWEj3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920664; c=relaxed/simple;
	bh=ACS8mu0GpUO0DtRoLr7dA/AS2xIn+2X//VmURqEduKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a7ZrIDLlkELR3K+ptUKAenpe9m2NkrBzNLPyMFu2M404AyUBkIGNRsIRACQgAdUotGbdlDkehCFGXfXaoYCT66GYDGct0nyeYjNl/lt57F86FTACjdyW7fgLYo6uGO4WhMzqE0v3ZO8Xm6tmIqQYV3m640gq/EKp4APfHdSc6ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLdEnaUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLdEnaUr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F420C19424
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773920664;
	bh=ACS8mu0GpUO0DtRoLr7dA/AS2xIn+2X//VmURqEduKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pLdEnaUr/OIIrS64YrVKvdBE1/VQA3qdT0HqW/0vt0KejT0WqXwLcFJ4UBgNhc+gh
	 e69o3skP+WIFqoZnKx2zbB1WTgft9iX1zMWS+mOIDAdEtgNcbyRy9EWziz7GwqnVGn
	 v3HLUOXpJ0276Dt+P9FOybsZpcWBmkFxxYSogDkAM+BpMAV5atLp3i11PXfo1uh9Dw
	 BF1UYmGDy9j5uDN8kjiP1BMrwkPvRNJqI+62U70UI+M+pBfYMSzPbkfrgWqQZkiQgb
	 SImMZOwZomB5+aWcyioDBX0unPG4acaO3Xo/U2HYxyFgN6VavAqC8ogz8DvWKNSa0C
	 nxLydD2OBcMcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60EEDC3279F; Thu, 19 Mar 2026 11:44:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221260] Tablet mode doesn't work on Medion Akoya E322X and
 Medion Akoya E229X models.
Date: Thu, 19 Mar 2026 11:44:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alan90000@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-221260-215701-Orr68Ij5GM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221260-215701@https.bugzilla.kernel.org/>
References: <bug-221260-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221260

alan (alan90000@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.19.7-200.fc43.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

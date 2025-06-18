Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EFA2FC014
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268493; cv=none; b=QrgOhsnKx4vjBaWjGU/ei1RIdceoWSLCVAYQENxDxnjYrRXNtMPVm5Qk6Fbb8BiywFM8DYDa3ruGv7u4MddVglunHt1oYN8TdNP/Dbmvim+GRCXmqSUszcKmSuTFZW1UFt0os81NGYL7f0ES+BHyiV3lDSARh7PdgWiddgyiv0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268493; c=relaxed/simple;
	bh=JZCuDx553PS1P0SEKC0eiXzTwA4RDcV368RaZvcDz/A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jtnghqHaS05mCblTXcbht1H6RTqJ1SWFgKSWZ1auArBDghjTvVIKCL1dz8gA8NAMyeKDY0LnnvKLLvVyZPtO54FauH++vUezX6mB9VUm2OUp0T+7hu3xpsCfBC1co59E27onlrNjBKcxIdqfzacy0N4Eg4XjBawNUBWro+0WkAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHb87GiK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHb87GiK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BCF8C4CEF2
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750268493;
	bh=JZCuDx553PS1P0SEKC0eiXzTwA4RDcV368RaZvcDz/A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uHb87GiKIBWw66Q/XMNNB7vsYBj7ucQP6ij8wdV+RQr4sHCvSDnXM1Gbu1xWRZpM7
	 lVSh5W9uqs/JUKaKxuEY1L5qd/dSpz2KDFmAdPs7NcMxMhmkshKpaj1uhp3LjHxEce
	 Xsom/rUYq3VbCf55abjLhVdC7BYYSEOVFJENeWUp/wmfPD3QtiElLxxCcGvmmllL/L
	 /8NpcTdTZz3snhMlRigx+NhfHZ8i5URyfgVPNXdmVBa0diAwnwgo8M+zTFEacWRn5u
	 9FXmCW7OMWKoGcckJfUr6lSoO42QYl5MBWMRCq2WZ9tlB5optTHhGR9sAjFR+5NsDU
	 n8g+0AqPeUQmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5786FC41616; Wed, 18 Jun 2025 17:41:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Wed, 18 Jun 2025 17:41:33 +0000
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
X-Bugzilla-Resolution: DISTRO_KERNEL
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220224-215701-e2FcVSbuXj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DISTRO_KERNEL

--- Comment #24 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK thanks!  This was actually really good; it's valid issue on the patch th=
at
is on it's way upstream.  I'll close the bug tracker, and we shouldn't merge
upstream until it's fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

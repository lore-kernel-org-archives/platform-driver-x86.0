Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDA53E2B
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2024 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712920901; cv=none; b=HinyjpGLt0WYmPpdKv6iFJnmWAsA3ZiSRIEqBsWNiylWpOBhVuCXRLx+d6E10mDLbeK9qmh/sgj99VIb1O2qkREnt263+oHVd0918uBBX2H3sPuRaZ9s8s1hTc73cMxBhwd6K/o3u2dgIFlSG+nS8SUkEnd6j3y74a8pxAgjF9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712920901; c=relaxed/simple;
	bh=se+YkrxRh82QFEGBH+wjWTyP0haPZqDxFb6JNcrROkI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WWlu5GO4NOIbSllCAiMZWEo3iRV25sCxFSsVLIa08Ul/ttdRTaXQH8RAubjnTTNjZJF32HhLaFFrC8TKnelQdIL6za35CGGFBRDd1KpFjpaiH45kxtFLaT6ESW7ei0Ja3dtnLzBLVGBsvwrXv/UAzP816Ur5umueXRr7mybRAs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwIkBPOP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwIkBPOP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0176C113CD
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2024 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712920901;
	bh=se+YkrxRh82QFEGBH+wjWTyP0haPZqDxFb6JNcrROkI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CwIkBPOPraoEcRtvGBKrw4szmiaMDcpUVMohWSpWbxVVTnyLRCH7nMCZ4eKOLlgGD
	 aWsEiMFGWu5d/4LTjLW1UPEGohNVGCUxeqKh2kp6LglNthImskuvB+nNhKI93pHUI7
	 STH+zTMm4JwWEsrqCU/6O0NGGMffj9XrdvzrQadCOIqL8Pt5XAIcFKnE59FQssmGuM
	 KmBZ5K6H0ZGRAXQUUiVQEryDqeqEHfrkj91xZP5IEPiJ5nBPKvhy1wVm6qJ8JhAb8Y
	 zDwekQCPvHs0nn1fq8RsK0apC3FtremyyYJ6aGfzTQ30wPgO1ybDAAF01QS1Pdd8oG
	 5+TkjT0fRlBLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2DB2C433E2; Fri, 12 Apr 2024 11:21:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Fri, 12 Apr 2024 11:21:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-k2TK0Ae6KQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #39 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Just to be crystal clear you mean 6.9-rc1 + ghY patch series right?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

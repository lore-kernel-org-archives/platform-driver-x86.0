Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE40F30594F
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775747799; cv=none; b=ciUwvLgDtPtpjAtB+EGaocoUoC0EmDaweCjmNClmTl5xIIZUn14quEFSfixPsR8hSelAX3UsbYOlbrDvrobMy4SnbNXX5RTeeDI1heP0TBNYyXtzE6KUBEpqQhn+BBBTcQU0BkqMC5R1jx2hQnADIBxpL5GqhvJaWCoISvjW7WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775747799; c=relaxed/simple;
	bh=iSdGwR69Vh3csFtrX2kbCJUCfKGWfOQHrhDroMSrVKA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ar6trN1wjFeZOjcQuSHAxmKCWdsLnVXtAl1dV6yQfnBDYUzjC+RAReMaQFvnKU74ZedNQPBq5p8+WjFLcGFfX1BkpZwpSswJ+GKGrtbJp3lFNP89DJSZuRWB0PvcviSA0dTbEXP6y8zoj/qK1C5j2IOf60S30dvuF11Bzap3AZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFUNhqrZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFUNhqrZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61932C116C6
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775747799;
	bh=iSdGwR69Vh3csFtrX2kbCJUCfKGWfOQHrhDroMSrVKA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bFUNhqrZCfO2aBy2NRoDBMMDVpxwPnZfMzIXF4Flg1mxP62Sey9BDvt4zUTCB/boN
	 NBW0TDDUyuq9g41UMdlclIUk3AwElgJ60MvbgVFhQ2/EAA7p0Z9VfRTaRzIhm5Jyl6
	 pn7BgfKEFftI5ItefM43carvk2YlJCd2nhuh5NQ17m8767Gcd9ViaQ4dDF72pieRbr
	 IqfkLSBjUSM969YouE5BkJwto+TaBRPYlGWZcMmcFNchwMq1VlPWLWSp55XYG7xeo3
	 N+YL5MTFEDciGIU5plbQYGJGWdXmwCWSqdfuwIy7EKF2l9mCsu35821mLbOAV5CHjr
	 aLnqXgAHloCcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 512D5C4160E; Thu,  9 Apr 2026 15:16:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Thu, 09 Apr 2026 15:16:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: masterwishx@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-6CbWIuH773@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #21 from masterwishx@gmail.com ---
Good new, but Still have no update for my Asus PRIME B760M-A D4-CSM.
Seems need to contact support again... :(

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BAA38D3EC
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 21:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781299718; cv=none; b=KdgiqhDZtnN1NQylewv8GEoylD41wzBHk8itFv0mXAseIM/cIEUqcUxGtRvp+GPzbh2lqIVJxjr3+HBxMc2ACvLbsELnhbe1I1NwkqE2UJx8nyksyJb6/SDZvS/RILPWWHLmEo+/9yZPy3ueidv0UL/fEuLTGgop5ioxX7cYqAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781299718; c=relaxed/simple;
	bh=5VCFKjDOWT6/KkK+Pa1W+WGDq1MEjZUzBNTO5iDl8t4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XlmtFswK/5mn4l8qDD1nSe2C1i8uYhefuKMJG+Z3JHcUdVPUQqb6WlpVuYz45Go9VsIQDQ36Ku0OfbnzdtCQQOhVAxjrP1KBiLyLpShU56MH3Wcs4aE84ftviYl+gWk0bdL2CFAp0SfwqsG5Mkr8mkqVHHhUVAe1jXr5PuPLWoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvMGnI0w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvMGnI0w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CCADC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 21:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781299718;
	bh=5VCFKjDOWT6/KkK+Pa1W+WGDq1MEjZUzBNTO5iDl8t4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bvMGnI0wPX1FPX8aUUHPn+y+b0X1IMdomZFr+NaanBmomo2Cr3zkoCtvbLDAdwYAH
	 hjhJO1lhVokOqfmVXwvtkF1XS1ucrE7g/oKL07D68bLOOsmr024eFk4wGTpRQyOuwR
	 BCa5ryAKuKj2a3fveCauh8fLIJ8difNv9k0zpp6Ncw88GmA13F9eREH9En3c5SgSgK
	 W3RJy/zAg7ZuzyOpV9Sk9KHdBUH/Of6oq+QGPYj4la60zwUVdoR3cTFKevkq9gP1SP
	 be8Zr2oR38z54hfoIitAkGyLH5loAu2YXdCeUDl9R9G5+YrqNJ8YDU2NovAWI+rJFT
	 prG6evxpBQQJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43062C433E1; Fri, 12 Jun 2026 21:28:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Fri, 12 Jun 2026 21:28:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-GgFn1sjJc4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #96 from Armin Wolf (W_Armin@gmx.de) ---
Can you load this driver and check if the keyboard backlight still reports =
the
correct brightness? I would also like to have the output of dmesg after the
keyboard backlight brightness has been read.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

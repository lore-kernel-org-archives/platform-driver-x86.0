Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455826CE05
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777339233; cv=none; b=UZLx1LQs6zLglF67YpzG+qELcIwypS9ucuspfbhvu1fb1kJIQZc5gGIFL6ebesP5isGl5rAFonX2tbbmXbUHOGl9ib0nDsS+Jdknly8C0LWSiL1Y4djcjRJ8ahFnNLvi7cnHrtW4aUIBcFo+JAVaPmvxFH9jxl66lX9sziBV/JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777339233; c=relaxed/simple;
	bh=LH3K+iAmiHomsLYKAnhZiIrWyL94cJsJdDVIsZsauAQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dbQvL/cWIXgXy0BBNS+wKCvoP4UhYp+lRD30rL7SjjY/NFrS9yqhIuP0kaIRiFtRr/+2ZQR8hNTyLg5AVzm1wimdvcY5j3wFtq4EKoilclO5dK0SxWqOvgSGnb+khqJ9CsVyingAe4SEn6CvQfXCnZvqYazBA2i+nQ4i7UW1JXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI8VWIQm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI8VWIQm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3988C19425
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777339232;
	bh=LH3K+iAmiHomsLYKAnhZiIrWyL94cJsJdDVIsZsauAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mI8VWIQmMKLE6EeDuARqbMysWEm/OlLaWnzKdgxa07trTF2rgFyHpQfwB7tog5FBS
	 HaWlq+HNTWAPLY6o1q5GocJze617ePQUclenhNXlM1RMAn9WZmZHA0xbwk55DOV3Tn
	 upbmEJums6zw21AalzTyPkmQJ/fFc2ApWy6jIti7pzgLUr9Q2nyfLGoEi8Fn7WX5Hd
	 Jkq5DCVkJ5ZSXtxjVNHZBechx9gOZMEAxtRcMeRay6wJgojxwSJIcC6iTQ991/4cvw
	 55JffvrqHY3w+dNAlQxWPm1kpB2H5cPl8eFc1KFM8TXV/G2OFxfLNaP0aVlGAQkelV
	 oppc2w4fF2TVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B7DDC433E1; Tue, 28 Apr 2026 01:20:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 01:20:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-X1PCaeOm9j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #48 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Try using DMI_PRODUCT_NAME like the other Lenovo systems.  This should match
whole generations hopefully.

As for the other ideapad-laptop question, you need to talk to the authors of
that module.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

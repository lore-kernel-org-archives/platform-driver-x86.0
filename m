Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE20A50251
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Dec 2023 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzfFzv+q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50282C433C9
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Dec 2023 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703501181;
	bh=s+9tL2HFMWyYALEsX8MosxdzPWPYRcfiMATcr3IGSUo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PzfFzv+qjmvD9rxXZT54DBbzXt5LmAQsVnk7b6lPOzQ8ZU+mtc8A32y3hoJC4DciN
	 m+Xt/vovseDTaWiHmEByCgImuK229ZLYYHRBL8+vJX78ijHcQSL38ZCCfZlPWYYOP6
	 Oqi4TdzsGuGoDuwF5+5WkvHaUH+WrXRfVZBkdk3Cu9IeqZqW4AdHJEcI0BWlFcn9Zh
	 6nAYfdZk+AchhQtus3FK7Ha4j5yOXNaKrhmtVGM4AtzvMTu7Tg1BAdvyROwqGXpZrR
	 IiS6Gu/Hfwd/yd9y7me9ad7nT8geBxffsJLKQYes8B4GhWAkrUTq1AGfZV/KDjkmXe
	 BRtpmzIEKkigQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 30E72C4332E; Mon, 25 Dec 2023 10:46:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Mon, 25 Dec 2023 10:46:21 +0000
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
Message-ID: <bug-218305-215701-zphU30AINM@https.bugzilla.kernel.org/>
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

--- Comment #6 from Artem S. Tashkinov (aros@gmx.com) ---
I've not been able to reproduce this issue under Windows but then I didn't =
try
hard enough (which means multiple attempts spanning several days).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

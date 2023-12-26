Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FF224CE
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 04:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMLUNfUK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03DDBC433C9
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 04:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703564513;
	bh=vw4Lbg+e9vSS1EH+xQxrs0BN32HDRRr3EMW98ItGPWs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jMLUNfUKDy9yDoZebMvyKPMepO3nB5qN4t6UpbMLj9Fna6zI3VKy7zZNiVS9Lj/HU
	 goMTdPL8AHvvDG8abJ99avsOgqJ78HKdhIjRG18jdEVme8rnaT8GJs5xD57gL57cIo
	 xmLjd8fpGOQiOaYBtSXSskEkDvP031Be+V+vGPLdV+3kd0932Im00z7XHy9fmobQDe
	 gNcJr7I93bAulvw5UGfRE9XRFfB8ox6714Q1rDkbq+ye3Bfr/NPVDma4ylJuGrbVGs
	 V1yLeL6lVjstQ2S659Bvq/1sBoMvk7A/WeAtMCoQfk7phvzrMJKWPwU76jPS2Lq8H9
	 c1sBqzt0BXTdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E01B0C4332E; Tue, 26 Dec 2023 04:21:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Tue, 26 Dec 2023 04:21:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: shyam-sundar.s-k@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-Y9ryP3ITll@https.bugzilla.kernel.org/>
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

--- Comment #9 from Shyam Sundar S K (AMD) (shyam-sundar.s-k@amd.com) ---
Since you are pointing to STAPM, PPT limits, Can you blacklist amd_pmf driv=
er
and see if that helps after the suspend/resume cycle?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864E52F62
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Dec 2023 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fp6m0LW4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7536EC433C7
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Dec 2023 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703515354;
	bh=z4ZO+5jlRzmz3mfRmq2y1yn+EXaznLl3UrOPmrWcBvY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fp6m0LW4zzEtgpPQ+BSicXRY23IvWP0x6E2wipWlQEJcBFDtu7t1PLlb0+K9RWBF3
	 9j7t4F9D21MVQxk584jLYUYCiq9Ju7juI3+TXJOaF2d2tcqmGV/wQiQVkI9X3/+6Vh
	 wW/kA/q3ej8M3rQWpmp8/SLY6rxODjjgF/9kyp21WoIffwIHzhkSlv2ZStQuxLTrbm
	 +B6K/EypwIrLL6QFT1yTr7FBue1G+YD462XO6qEmFTxPcf4OB1c8wB8PwuOAhoVzmE
	 muwCL7t8nDw9TxV3t35sw5gEp/d5ur19VrZo+tHoJDOpFp+C5swgYsNG4AQtXv4y6l
	 L0HJUGyEJjNPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 58FB6C4332E; Mon, 25 Dec 2023 14:42:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Mon, 25 Dec 2023 14:42:34 +0000
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
Message-ID: <bug-218305-215701-5AmesgGEHF@https.bugzilla.kernel.org/>
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

--- Comment #8 from Artem S. Tashkinov (aros@gmx.com) ---
The issue is reproducible with the latest BIOS release (V82: 01.03.09 Rev.A,
released on Dec 15, 2023) and two versions prior. HP doesn't allow to downl=
oad
and flash earlier versions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E750278
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Dec 2023 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbyHB+vo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5773C433C7
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Dec 2023 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703501621;
	bh=uSn6dnv0KtJLeC0GAGcSwhUsBjgF0XfStJBlS5svt0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jbyHB+vo0w9tgmIaPpBZzNBB7fLOwzIcI8PcdWqUa0zEyVlM1OKUUINfhECpmbpO6
	 M45L0Fi70m75WyBu+t2NlOGBjAVVHRClWj2NRBqnsPcE6c3cr6ah2VDNpLsUxR87or
	 EC4j6PaS0QfzcGWAQVML7wD8P6Glc0Vzi7M6Q/NANBTCiDlVJ4FoinhVHhAFlBe+FZ
	 FULrssD67lXZGCetysVC4KvxQUvDAxjnW33czfS/+7vU9yQmhpPxrCSoqCbTu0PMDN
	 8WMzsoLiBwBgL+2xqDh8Qzurte7S7UHhm2wxqib1ov4nW3D3gk0UYDF7zKkYWxfU6J
	 nNY84wHIiQrEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8A334C4332E; Mon, 25 Dec 2023 10:53:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Mon, 25 Dec 2023 10:53:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-OtASggviB7@https.bugzilla.kernel.org/>
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

--- Comment #7 from Armin Wolf (W_Armin@gmx.de) ---
Have you verified that you are using the latest BIOS for you machine?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

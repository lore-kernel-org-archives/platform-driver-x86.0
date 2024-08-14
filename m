Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AB142E70
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723625851; cv=none; b=iDzAv1ornD8tl8P4rB3AaaiJcaRTjlnleFhKxBqBWxDiQfz/+OyUqwt/Gtj96pUpZMbkckR6E/5rA9UniG8rg32puTsrhquv6EdkrmAPLPmSDu9fCLuDh8VjMZkOQaNLQ/siSDSS1uH0/TXfxU6v8yEzmJY+LsluoCPx0OwMlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723625851; c=relaxed/simple;
	bh=DkUbFVklG1k6VPIcxXS3VZ3d0FU18M3+i8Selottw60=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GwrG/ZVS2nxy/C+DYvBI54RL4wnOSELx8r7WagSENlcxtS/cV/r2pyUvb02+ftT+KDJ8qmgJkdopHeEg13SKdLXP6d7rBXC8uJU8e2WaGLOjZDuFpxghw9wXzxg8kZdiB8MypIF7ZODpVADRBP//0GZYw5WALRddu211DJkoiww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjCApMpM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjCApMpM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96BCFC4AF10
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723625850;
	bh=DkUbFVklG1k6VPIcxXS3VZ3d0FU18M3+i8Selottw60=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fjCApMpMDdnm4u0CltTxewyOJ/KkKBkLeJNs2Xy43ixKYMmLcBMarazgC+/mkHbAI
	 +ZkpF3eBFqhP3Jlfy2UMPsi3JwfnAFPjP5EMHDOX6nBqXm9np+MKhr0UCIeCqbI+Am
	 kU1An8BSOfzTB+7/LddYQAaMN4qsznylh/Za7L49VuiZfluUDYuHzlnbB51oyj7jSP
	 hlYmG+m5fdXmCp1LrkbjM2fxUNyBvye0Semk44CgUGrS3tjhd7NoUlI1O9udFnH86F
	 gcAOsRDv90OQAtMncqp+NY7EeGJ8riaWVgnV8AoZaMz0xYZSLqnAAfs2UX+v+4pE+B
	 jf7tDFAd7yajA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B64EC53B7F; Wed, 14 Aug 2024 08:57:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Wed, 14 Aug 2024 08:57:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-1jB6g63RBP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #32 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Shyam Sundar S K (AMD) from comment #31)
> I apologize for the delay. Upon reviewing the dump, my preliminary analys=
is
> indicates that the critical security metadata required for the ASP to
> decrypt is missing. I am currently checking an in-house HP laptop to
> determine if this issue is present on other devices as well.
>=20
> If the problem is widespread, I will collaborate with the BIOS team to
> deploy a solution. If it is not, you will need to contact HP to obtain an
> updated BIOS.

Thanks a lot!

Does AMD have the power to force OEMs to fix the behaviour of their BIOSes
under Linux? There's another very serious bug in HP laptops that the compan=
y is
unwilling to fix:

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

I reported it to them over a year ago.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

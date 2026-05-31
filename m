Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE387263B
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780208859; cv=none; b=jet2g5jyvboqTqzKSSOw4UG97qa/lib1sn1UTPxfl3O3qfrdaVlIgyNs2UDOfVifWsbDJYPdWpVDXG3F0qAcNaak13sJAXHbRts7acSG77KB2wif9Ecc9+x28cHRTuXJkdvJRQ9Gr6iKGiN0kJnm6cXph4o4AbhlBvIeThVOV7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780208859; c=relaxed/simple;
	bh=92uE36cP1hTCXFcv0vUgVLlEPTYXgtDdgNEv/COU5lw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AwUtPaCSyB8e7aH9lU9wmkwmGEinV7y+goUPsZBHWuj6uxaMs7AT/WLreVbWSElOu33vnTsSnNm2Iy25xyazeNfLEtQwgB6d2vpny/n3YSwEE8Zsw1sfqADnGWW/sMzfD/tSpF/BEE1yuY6ubL7G25CJZ4xyhA+qjxctXK5Mq/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kmzs+jwe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kmzs+jwe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7D07C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 06:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780208858;
	bh=92uE36cP1hTCXFcv0vUgVLlEPTYXgtDdgNEv/COU5lw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Kmzs+jweFFN4r8IDlRHf1LI4b/Vyh2Vp1rKQRQtYMbgxyuwosRQ0PCkPA9+G0CRIM
	 HPLq4435vgbNxLWJ2dtTuoZLNBw23RnWvQPotQwNkHqJ44FzEjo0UXeHA5aEg5fZv7
	 e9kEdf2PX7V4bj3cuExfIfw9kxU62+84mSc6/uL8mlsLueMynx/fwASw8Hb5CiFpn0
	 IhCMogt5BHFYbyKlAU47Jzdz6Aj08JKACDjSw9S/1/JJ+ITQo8/PenxcYM0fHQ8LG3
	 p3UhjRgqrfJ0mRE4mItrAjbhrjvN7/vu4ySkF/bS70qYeY0mxljwQwGn/VDRIAXtUi
	 CHtyjD6D2oVlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 87E57C41614; Sun, 31 May 2026 06:27:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Sun, 31 May 2026 06:27:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sivasli-ahmet@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-Qj5uSgtSvo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #12 from Ahmet =C3=96zt (sivasli-ahmet@gmx.de) ---
Hi Krishna,

I was not able to set up the nvidia service to fix the dGPU issue. Now after
two weeks of testing I can confirm the power modes and fan control are work=
ing.

Please use this as tag: Ahmet =C3=96zt=C3=BCrk <sivasli-ahmet@gmx.de>

Kind regards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

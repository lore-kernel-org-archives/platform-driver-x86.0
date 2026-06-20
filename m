Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A271A7264
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781943497; cv=none; b=pFol+549Lg/jQvRguxbEP4v2kVKpSTcXk4kevYHbfGzkFdHpbxZhkgR0iJRtwLEtaGlmXPh0jIlcYoMW7lv2JxM13E8amlSb4fMUpGuM4nUoHGqTa6l8AVoCyLyaN/BvD966YR3Ovj0GS0xXtDR4yVLsJLdnzdd/Z/8jVI3edjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781943497; c=relaxed/simple;
	bh=iK5oF2Cq7uiT5NNuSJ4tKfTb/gm1vMhHMIHJk+aQ9iA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MisJNPhtKwryLMb/eMiNShfYeYIevhs4/F1HTmLN6UU8d5dk3AdFnPo8jNDjeoePs9QSDd+eXv+uNqcn88bBetJTXGtaZ57Gs4pwS0hA5A1qgW17U5X/8J+kuC1r3BlDOw0wxbmxAmb+94gofli6vZ3Kf2NcofTBpdocegR/5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKw0E+hY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKw0E+hY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81287C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781943496;
	bh=iK5oF2Cq7uiT5NNuSJ4tKfTb/gm1vMhHMIHJk+aQ9iA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mKw0E+hYqgXyqDV4LKR4gIdKf9AgVDZ8voTxk/FExpFE9Rscff0IJvvGGXSqaP/Ie
	 PkpKnb7sisPrevomrYuolgLe1YSmbkaxeZiNGldHiRYyzNUMsNmetSxlOo+fSjE40N
	 nH5ZcVTmjVP1Fo7N+I4NKeWFFhu8vDlDyEKoHmwUSmJqi8iHfXUHgu76EqZweSazgl
	 Jum8EuV/ZVpeCW6v0FU7URImEUeQcp1+TSVuxVkwdaZb8GBF+4f0aUCytH7d2MmI+e
	 YaJRPEFKS4g2znooqOzeHnTkgyyZVKYCk+8KjQ93jPXXMycfir9E2pWASmhlqa/RfW
	 UcFiwhHsEkQnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 665A9C41612; Sat, 20 Jun 2026 08:18:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 08:18:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-KsfGeBkpFq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #27 from Marco Scardovi (scardracs@disroot.org) ---
I've opened a patch against it on
https://lore.kernel.org/all/20260620081548.14143-1-scardracs@disroot.org/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

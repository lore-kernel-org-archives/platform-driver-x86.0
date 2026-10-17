Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392248380B
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235739; cv=none; b=hgiOPw+iblRFsHz8NIhjQ/F0IKufT3QYKVlEzpVt0xgQW/ZmdwFpGcc/JJI9O37kWilHg7tLVgsJ79dPfUI4QyFoU9ZjIdl5Z8S8EPJIzp66L4KXjZfb3CM1zFLb6blZafUgk2mcE2Znj5gmRFJjlKakN7ycAhRjHXU8ALzmMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235739; c=relaxed/simple;
	bh=ovogC7Bm+F7aFLy9FaW+3XLqKjHDciXCuHprw4HbJk0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cVdeus8ll+hPwqgsZ3UOcLkkHIp8CJAaseyhJLMS0vbxPbr+ySwKOn47BA3iVVWhlgbDMHZIrncD6BFu504NVOW0cv3BViqbMn85BFGrl2WNpamThucrH2InhSb0oxLzFMIqkoSwXz/0b8Kf6+3eSvPMyEWbuRQhM5r53tLHunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biCdeBGJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biCdeBGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8829FC2BCFA
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 11:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792235738;
	bh=ovogC7Bm+F7aFLy9FaW+3XLqKjHDciXCuHprw4HbJk0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=biCdeBGJe4Lvo5vuvMO1TILXXmGJT2iYikId1VSoUefzkZbvPRCmjvgibl0fuiQeL
	 KuO+Etc4iq/BxLdXkPTpmiuC01PJQY3rIVZ/GeUzqR3AvttM6zKXD+bU5vv57eLmcf
	 tA6MtNHW1Psz8Lx1aOZ+cyj05QtwEY6kaAYTwZNk407Y9YHlFhJuIaSxpKy4RBGUOz
	 Izlbc+ZmAFe5iKKoDg7m7mhvdF7D9+h7gPS6NqypadtzMGa3/GJnMJJPVMDTmGLloU
	 4dARxT4CVuSebAlaaQaqa/Or8GDEHu8Kk1NkET2ZfczryC3kbqrn9+Eu19n6CxO+oo
	 Pl/BQqDBxoS4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D2F6C41612; Sat, 17 Oct 2026 11:15:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222138] hp-wmi: HPWMI_GM queries fail with AE_AML_OPERAND_TYPE
 on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never calls GMCF
Date: Sat, 17 Oct 2026 11:15:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lorenzocollevecchio17@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222138-215701-uyui5fEKxS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222138-215701@https.bugzilla.kernel.org/>
References: <bug-222138-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222138

--- Comment #6 from lorenzocollevecchio17@gmail.com ---
Hi Krishna,

Thanks for confirming, and sorry for not mentioning the base tree explicitl=
y.

Please go ahead and send the patch to the mailing list. It fixes what it set
out to fix on my 8DF4: the -22 message is gone, pwm1_enable and the fan
attributes are hidden, and WHCM is logged once at init and not on every rea=
d.

For completeness, here is what I did not test: module unload/reload of the
patched driver, and suspend/resume with it loaded. If you would like me to
check either, tell me and I will.

You are welcome to add:

Tested-by: Lorenzo Collevecchio lorenzocollevecchio17@gmail.com

Thanks again for all the help.

Best regards,
Lorenzo

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

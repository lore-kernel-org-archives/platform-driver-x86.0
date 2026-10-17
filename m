Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D983BC69E
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221608; cv=none; b=YiyDdn0HfeQllZi4ADCdxajlHRHklHEYs+nhGVAp/cOXc3uQkvomvWNvol3+4Y0/YedCmw13kkTRHc8COK3EjEuEJXrH14auM5+xzJz12J0LKRCa+8P/OkW88V1X039Ki9qC4Lkx8s/VB/UhiSi201ucLEUPTb2EBCxwFsiWSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221608; c=relaxed/simple;
	bh=0JdCe4O1VHgqE8A3irOAKbHdXFPVfR8PEXueXybYfvs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZrBlhgTxzZS2Lw9FPNclCNeLT9KjacK2Qlml+IdZj2GQYMrm8BKyddQ/LhpVUoTlWnY7NFxDNTS8tgQPjKOh3z2JG88lZoqLIw3p+cF7ICFW4+nv0OxR0rDIenszHz5PUuf2x0QZa4sGK8CpxT9vZgKtHH1HibZcGirZ0bzPTOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6MXUtIe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6MXUtIe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1544DC2BCF5
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792221608;
	bh=0JdCe4O1VHgqE8A3irOAKbHdXFPVfR8PEXueXybYfvs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n6MXUtIeRPGEXsowWaFfODuLd34EzW0pBNeFBN6EujttJGptoPq7BqpwDYHE5ryvg
	 GwuCex/Jlnbn6MmHXQlJGZ62oPClV32EaEmE8G3GiVel2MLPA6Z38n/0W+6YgcSjfH
	 mFaUEiiYMKAF5m01nWdFGm8iga1sRbJonCAF0a5/VQNN2Fi+ImqAcBCIKGd/o1PslH
	 0lyJpWKi2qHWhTgjDX+3Ge+XydM0Tzy6g622UFv7RDJcrYQIo1jDPboebt9ntf922v
	 YODukL/Apei/c15ClKDYVmefjUbB9peHDBn78IH/3pI2+UkTRD3mnaNqmwoC41NQ15
	 7aCqG3MLFV4Rw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2B7BC4160E; Sat, 17 Oct 2026 07:20:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222138] hp-wmi: HPWMI_GM queries fail with AE_AML_OPERAND_TYPE
 on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never calls GMCF
Date: Sat, 17 Oct 2026 07:20:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222138-215701-mRIqOchpb5@https.bugzilla.kernel.org/>
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

--- Comment #3 from Krishna Chomal (krishna.chomal108@gmail.com) ---
The proposed patch (attachment 311148) is based on platform-drivers-x86 tre=
e,
review-ilpo-next branch.

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/?h=3Dreview-ilpo-next

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7221C22D4D0
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Dec 2024 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749016; cv=none; b=tOzToRJ4jnY+adKdM1sPg5Q8LjMOjxsrnxcLRrKr9zoQbWsDteO3t/SwhKb9+XyI2N3cNLsq7KlrLPlxiH76tBz74BtV39PrFRNnTmGnH1SLPZ8Lo/QvS9AjMLYdgahLsxpo5Q2KTFHgcYKWfq7cWS4y5J+s1v35rlAiMdLzo1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749016; c=relaxed/simple;
	bh=IS1mI3nqTapg5TKQlAaRrpL3q6RWrSc2L1LzXUqza6M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YMjjy9MaCLR5JAZ8eBEGR+z8AEa/HgkC9MDDKGmwx/8u8Uvh/eOjn1/7IMJFyBNXhyjLKS7S0tMzfuAP5cjWhDWjrvcQ5NTbROaHK4wXhx9eXlA/HqHXoTarBwtrx8xy85lcNEpppeXwKH17jNdXhMurEUqySd1Z/Ys47+BaGME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Falh2C8+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Falh2C8+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00D74C4CEDE
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Dec 2024 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733749015;
	bh=IS1mI3nqTapg5TKQlAaRrpL3q6RWrSc2L1LzXUqza6M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Falh2C8+c6jQBEeW/9lqGAaLBTRhYsRdzXTdbXig8tovwIT3hAq+nhK2JzFBynPMG
	 H2DurFv0DLd5cdlNpfyFwIR+MyHy1dehd/4C0mxV2tWG+JngYcAuOGcL9q9gllFNjE
	 xFjMLkDhtWH632ZirV+tIpkgjrFN31qqyG1CIbogyhumKs3MgY8HKzntH55+9fozgc
	 3ydGdBbsEL+m4DSHfxz8BmcI8FsPDyWgkp5KoPLbCMDy7XDCNSWY5S5mRNUArbvpwl
	 sDbKC4ImzhIKJ/6aXiTJZV2oNTsY8gIe6vvmbAOAxMP44P1vJ1Uq3f7f1ePMc1p0TY
	 7/3v1YxeZCaNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6B43C41612; Mon,  9 Dec 2024 12:56:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 09 Dec 2024 12:56:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-eMYuS2IaVd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #18 from jarkko@kernel.org ---
(In reply to Takashi Iwai from comment #15)
> Jarkko, any progress on this?
> As Stefan suggested, just capping the max size to 96kB would work?

So, you should:

1. Create a patch.
2. Add relevant snippet of the dmesg to the commit message.
3. Explain why the size needs to be upgraded.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433C2594AE
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 04:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734667789; cv=none; b=bNStXd7cFgQxDT3KADoDi3rYj2LVI1oNC+/VzRjZW2iOlYsjqF6WXotVk1RLt1rHf05lgdD8QEkJ2GWy0YtMXvUbQ7a+SACIOOqirlR6u+Zz8c0ohGOEGXq2hQLcKcMHqIGlr6n+aTKStSELzp27akSX+fNK4ZQuP5jNjGEN4R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734667789; c=relaxed/simple;
	bh=ol1D5cgev74PxNFU9YaaYuUyS9KaGyqs5binnFeodFQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FYkN+4uvGgvbXIaNDQ+MHE0Ibi6Ix3ALyiDUL0uSIXyDABb6wZctce11snikeHemfEMZ5YWQ/ryRRfPDqwnaBus3bHDXb6e1uq0ccNF1XndiGKEfbAxENprJAB6S38pw/eYy2S393n2koZQJmMv7qYfejs5v+QLoF9PqRMAK5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6cf+1D+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6cf+1D+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96316C4CED3
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 04:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734667789;
	bh=ol1D5cgev74PxNFU9YaaYuUyS9KaGyqs5binnFeodFQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T6cf+1D+tn8Iu7GmavTyna7vXrYp2vEfquJRFXombHfjzpF+rTBJA4WsdPT/1e1uc
	 MWFtrpPbozLQ6D96TGeSRbcvKqgc8/pIiz9zfPUMXGIuHuTlwJ+5XnKFqoi7p2EA9r
	 whxUVvaj8AznTQh0xFG0ESX7RlO9MDkCF6bMrlFnr3jteeVT09fhrINXZiXYOG+hiW
	 RPFd0eD3YCbrrFyI1EzlXZXFQ5d8rvBUYI3UhX9WfnpVUTi/XpBhBjiFXAoB/noyFp
	 Q6SpikAcjDcxudgxtjO9/+cx1ZJBtjtgosza6RymywcQmM2HTrM22giv2yX+yq7ymp
	 aHu0GCyIsStLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81490C41612; Fri, 20 Dec 2024 04:09:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 04:09:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-pszEO0i6I4@https.bugzilla.kernel.org/>
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

--- Comment #30 from andy.liang@hpe.com ---
The kernel v6.12 dmesg is also submitted on Nov 20 and this version should =
be
newer enough. I am using the HPE DL560 Gen11 as the verification platform. =
If
you want more information from me, please give me what you need to resolve =
your
concerns. Thanks.

The ACPI spec doesn't address the TPM event log size limitations at all so =
any
other BIOS requests more than 4MB should all hit this issue can cause the
kernel tained. In order to save time for future fix requests, we should move
this forward.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

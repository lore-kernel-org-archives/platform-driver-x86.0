Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B41FF61E
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 02:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771296245; cv=none; b=XyJ/THAEr+PWqcj1jDuuDrH2QyqU9zPeJOZ5i3FDAgTgP47KbkeIUOrOBkhpYI1IAdRq9vDEqbITC8gk0FJjnnaVgfDMnwBMHIMihiy8Pox5yXa7Vzqaa4Ds+eWsDt2gTrQQY9ZjhBMi3O/99jwkQf05/w9JtIOSr032PYtWsWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771296245; c=relaxed/simple;
	bh=t54fYUuX7d8E4xaxkTEsqPZOpFl96TkXVwYj+rRXn3A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cq0E07OM9Wj80VQ7zQvt22H57gG8k11BlEga1AK6FlI1yNNF+gbKGqcMW1/EWLVrhfl8/ARnFWQG/sZVssHsevz4xoEtXM3NUH2grVHITIJQLQdELNOVdIIAw5MWVh1XP6eV5/FqAXFy1sEhUWnAY4Vr+ZE8psu9xvf6u92t6UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sc6xWAE5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sc6xWAE5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F723C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 02:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771296245;
	bh=t54fYUuX7d8E4xaxkTEsqPZOpFl96TkXVwYj+rRXn3A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sc6xWAE5IV/O+0taL1snEV8cLFLOuXJokTFntR4iMrEoWg8Vt79coBw0kzDfA91Mo
	 wXpxXA12oBCXpCu6RJa/nfbSlyubq/xWBAt3QK878EIdRlnuqjvHEcA6s9tILX9x5s
	 o3sDL05ZNLfCX2t91RyzuUqYCipuzmaV++5RXxfyshVCbDSytCMZTMSBpMYkWqcly6
	 Swyv04j65lcvJnXjX5H5sHsra2/of0U4LkW8DP4APHO4JHipVmOWPEhwWE4UY7VZLZ
	 k02/vsLk7VooPqFygZ8FbGESvqXQjbfvZyaJlTM7b31krpqXkJP9cUPx3OeQlmMvlF
	 ZZ6MRmtdhekzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0AB6C433E1; Tue, 17 Feb 2026 02:44:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 17 Feb 2026 02:44:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-HgXJNQ7eBB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #39 from Avraham Hollander (anhollander516@gmail.com) ---
Question: If the problem lies purely in the DSDT, would it not be possible =
to
test a fix with a DSDT override? I am open to doing that.

I think it should also be possible to fix these errors with a DSDT patch?

ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP6._S0W],
AE_ALREADY_EXISTS (20250807/dswload2-327)
ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog
(20250807/psobject-220)
ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP6._PRW],
AE_ALREADY_EXISTS (20250807/dswload2-327)
ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog
(20250807/psobject-220)
ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP6.RTKW],
AE_ALREADY_EXISTS (20250807/dswload2-327)
ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog
(20250807/psobject-220)
ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP1._PRW],
AE_ALREADY_EXISTS (20250807/dswload2-327)
ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog
(20250807/psobject-220)
ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)

Maybe that would help with the long resume time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08217E473
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943491; cv=none; b=jhx6IYuK6vhJG/Zis1OsFq0DDBl/PHGq11FyJjtd6xOrZqFcptH6TgPqoYMHHnledGFQv4h8O+8n2KbuXJ+C+6oC7edZy3GN3Rg25JAxOrjo80J0wwJmigdiRIzlkqhJuqxcuHwFVR+/Fd2WbJFIYI7KR7Zo0cesM15uT6oVdNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943491; c=relaxed/simple;
	bh=LswkulfYJ1OCl+he4u4RKyHQeNit2Y6cXatnGzZ33rA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XULtpWnt/UI8l1IWbe/LiZl5MJi5kZGkmbnoIMS+tDxcAhGAMnQ/pLQrfZh56YBlTgKdlDbxmZhwEyB9X5BDOKrhWmYrNq2m9aOOGirJSLht+LjBM3qVRT3U2dEJuBJUqMIPaI88c6BkZjR2+VMRygkDxFHoc2QRm7EduY223h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9iv0HbL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9iv0HbL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FF91C4CED6
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734943490;
	bh=LswkulfYJ1OCl+he4u4RKyHQeNit2Y6cXatnGzZ33rA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O9iv0HbLaxZMCsl+JWP6I4r0Bgv9XuelcnHYLXDcm0AtxpaHS3xYs+6SKCkTvErRk
	 G3N1ghCkFgGDUggD5RYMkRw8P0eI/GHmgH1s3T4yGD5wEfIvHNFg/wNrP9NuVA/0pu
	 4+j5WlXwcxpw65C1BZDAOoC6bQyHp1RYKfznFUCE0ecLK9dEP+ofZN+pwtamx17O9X
	 F44oyxxBw8ygXDl9NbazwNoX5wENxtZASlLg4ckf+QSz9pzL+ri2VRH/rG2dCsMnSY
	 bzWVpudFPK8aItfERNdrP/kDgE8ZKKT7DcGOZfyRBHhZYvyph5N2zVfsRE7xd+Q9MC
	 R9v9k2CKXppHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 98EEEC41613; Mon, 23 Dec 2024 08:44:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 08:44:50 +0000
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
Message-ID: <bug-219495-215701-ZuGEmfTxYs@https.bugzilla.kernel.org/>
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

--- Comment #59 from andy.liang@hpe.com ---
The binary dump and kernel log for v2 and v3 patches are uploaded. Thank yo=
u.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

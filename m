Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6F837EFF4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679427; cv=none; b=nvHIgcZkWwTEkPiaXNwO+xvbF8bB4YHgJ6evP3Op7kWfW2vOdHf4BEvUkz1+mTGKU4S0IUDC0fMFekH7HFkWga15jKYDTFRjNE7YMHXcP7oaSmErEffaiuOh2SuMOQs/9oA1bDDCic/Ip5wVLlxrp+qbBH8bNBJbWA9RfesK6ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679427; c=relaxed/simple;
	bh=TJbFiv1kaI5Cbs0xkp1AGu9JELe6PucQNR0drS9484s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bNZUwsqdhp5ebpDZr/RCriDn2mDK2+Oyx8+nZLjdckNmEbnrmgSJUadL2eqb5W8bf6j5EFRu9vy5yrpvDrMChttr97nzkQ6t3v1LM287jYDBqfRU6imm2DV4X3zld4HNfzvjRyFlK78U+vqgqyDRPcDE1v3kG+xgQe+TFpIWTXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFzNl6xH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFzNl6xH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B465C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780679427;
	bh=TJbFiv1kaI5Cbs0xkp1AGu9JELe6PucQNR0drS9484s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FFzNl6xHCe1osiO4KIXNm9NQQm4BQQPiHHh8zd1hEyidt9cEc/FIbEsPA9wHOjXjd
	 nCuVjYUNk7vi43aMehWtWS6TGsSsmDbndz5fCks0D7dU7FFrXNkSzqut6oyLDmV3pe
	 P5PQEk+JJ8hO7fJDPddz/jtZR/U1EmTQzYpY0XUMIELLiregtc7T8jnGGgqHRCxxSK
	 Q9Cq5jffjZU9Dvm+uskY4zWZHbaPqfdCxqsEGu8IPFBtmRiNhZdLQ8xnWUN1+Mh6ej
	 FflhOGy93/1IJzos5IkHbnT20xuhdl7cdRlk7cY1+fxEYvVupBdWygkX+FHJ6gOLY/
	 FCl+tAp16dsRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E8A9C3279F; Fri,  5 Jun 2026 17:10:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 17:10:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-5kqSKMtUA2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #13 from George (george.stafilidis@proton.me) ---
I reinstalled Fedora on my laptop I somehow messed up what the power button
does.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

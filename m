Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941991EEF9
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727953349; cv=none; b=ZYV3epypNwcKLjXKzvxSs/vYvEafXH+0xBhLkTF8tr9EU4lPdwAXx2OnXxSAi3PCK8vB3iK1eiuRGYWhsEv6j11r0TX1zarg/DW8Iia3SFZ9z2/DA74kyvXVEy7gHBJ8QTXYcm6zhxnugpsYc+l7rAuZpvdf4h/ji3Eh6iSK3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727953349; c=relaxed/simple;
	bh=K0UNlZLQkzlXFa68SKe7pWTZYneCkq2A/ayylAORZ9c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mm2zC9kaflgjYaeK+qwPeWk3RggnIzwq/etgdHsF3WVILwF5lwc6VLgLiiMYZI+4Pq4LecK/zIMJF7xjT3edVEQCn3O82okEH6Dtcpquhj7zmSsKXEY6aRr00ad0HAT6fq2E9VZ9qs3bZFmAFszpTqJaeDy+73DXmOjIcjChqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A47BUAud; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A47BUAud"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3453DC4CEC7
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727953349;
	bh=K0UNlZLQkzlXFa68SKe7pWTZYneCkq2A/ayylAORZ9c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A47BUAudOGORORAwUuR1eGCo9fc861cFViw80f+w+XbX7Gs3nyjb+Tkp4/8gHPQNn
	 1A5mcUmzIkWI6SlSOyJa1YMItTVhwgBlFXPuWK90ACSOWbA2uOif3/N9Wy1ehDvUvJ
	 LcvD7DR6cX1RcbdDOc1GCg525qenpf5QpUS5cgxqz0epQ1nVU3T/PGob34aCLEWhgI
	 fIeQVj8SlcYkERlgUMZWuuAhOoHefe0BIrxh8eBIrAcVmUzhNj3BYPWeevU5+HcTFZ
	 YcKtoJ7YxYEGtxMFWzJCAW4tNl8WW2K2ULMfiv9/Kw7YkSZcfbIG50ACRL7A8zlf4y
	 ux/UHJKSg0jvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15CC0C53BBF; Thu,  3 Oct 2024 11:02:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Thu, 03 Oct 2024 11:02:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219346-215701-mc6jYiuEvK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219346-215701@https.bugzilla.kernel.org/>
References: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

--- Comment #2 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for reporting this, there is a potential fix for this here:

https://patchwork.kernel.org/project/platform-driver-x86/patch/202409191653=
49.235777-1-hdegoede@redhat.com/

Which I plan to merge soon, this should at least fix the mem case, but I'm =
not
sure if it will help with the others.

Maybe instead of not doing the ACPI PM Timer disable when using S3 suspend =
we
need to just not do it at all on Kaby / Amber Lake ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

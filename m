Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E807C3F786C
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366882; cv=none; b=pIGcat/a7gRqQgvDxIKvfBWekYbwWq5/TWE5IFrICvtuT2Rpp1owtgtmmPmD6tucpFIwUBYEY2/BB+myU0Svykgx0qYTQxl69bqEmUIT/3TKHMQpLR2V28E32/jxYdSWB5442SQ5xy/dP/l2t7mLUgeJVhQVMMMkE7XfXf4jdzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366882; c=relaxed/simple;
	bh=dgUZsjBf+fgvWDzkX58wobp3RkamhMA345HKuIkcZ4M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n3yiqsNdWlS7SacJr3g6Y7MExQHMFv8UCAqvf3gWS8QAECpv1NM3lfGS7CT4RyJWeGkl+Wsikx8iVKwF02DlZbBUPQ34rnTbPDGjh7RugWWm/N7v4tOhvQcfxywHNYmGnt9rG5R2bsNTM7aJdPvnqVgtuv3Nrr+5XBl+XOfzYuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjCywlBe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjCywlBe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 542CBC4AF19
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777366881;
	bh=dgUZsjBf+fgvWDzkX58wobp3RkamhMA345HKuIkcZ4M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gjCywlBeqsF/XthHbQniQxiRaoVEi0ZM4t81l2zwXngPRFhs7zlOxt5QmhnP+pa49
	 uK/au6GRpfcGZoHe0S3/vySw9aDqQA0grLPGOqYtVWNqcLYuti1BJtfc5WIQ8HgFhI
	 Ud/9fSuJhD2d0tOJIVTPo3CfuUog6MZ0F/LjXsNN5kYJ8cY7PevF0CHQL6HRNisqtX
	 5RbgYkjU0OUuMnbPfnVguSNWXBBeXUAmyd4Dl85xJ6MojEOkAH1ExGdaRGDABfeq5P
	 fbmh0w7erdvDrBA27BGJEFXrnKpFGf3DXPZl4UcOzRRsJpAbTJUMFCuBgnq7fDh/Xv
	 qFk2c/TK6U2ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A72A3CAB781; Tue, 28 Apr 2026 09:01:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 28 Apr 2026 09:01:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-MXnMNH0K1c@https.bugzilla.kernel.org/>
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

--- Comment #72 from Hans de Goede (hansg@kernel.org) ---
> However, with only ideapad_laptop loaded and not ucsi_acpi, I still got .=
..

There is nothing we can do about those messages. The real question is if th=
ere
are still any messages which repeat periodically filling the disk with logs,
like the original messages starting this bug.

Or if there are any actual problems when using the laptop?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

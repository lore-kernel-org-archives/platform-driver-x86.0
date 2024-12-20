Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC2D21C9E3
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717012; cv=none; b=YbpK8TUkzD4cG92SDiUo4we9If82V8VnnnR5LxMFHG02gOfdSqhx62Cup0qJe/M5IfnkIzBSqs2nVHnhaousda7WJYVqq+WsKAkrrOSWzZLKIAkjHSFpL0XQDSSZaqY7KBd1rkHXjniWSq6yP6kXqgmFWe9oTWYB5GolAZiiuHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717012; c=relaxed/simple;
	bh=OmZ4S2+Ymcy7TN6R3UGRsmaxsNRxX4jI1TDz4lXSCrU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SG8eXa0YdIQCNIF775nbsOShgO8hwd0OZJGS6kwNs11sYhEn0MBkOcncTaOfAiyiPKZg95sA7+Xb8b+b1etSobkh8/++gigbfdQQJtsi4Dx5Ls5Q+YVTiPMy+XaDbQxPwty4GWO3+tY+3k9wGyfc/iMZXmRj0VEemuXSDV+OcXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EogXwbwY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EogXwbwY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AA23C4CECD
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 17:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734717012;
	bh=OmZ4S2+Ymcy7TN6R3UGRsmaxsNRxX4jI1TDz4lXSCrU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EogXwbwYp7QsmlD6vIYvXwaheT8ar4S+taFD9QUYpWkTmUzAqjJBEEi1ZsaA5tBbU
	 0+J+G/aohcrntLwVdY+i6oTuPDxDQuTVk48IkkNHfkRHRrVwFLDw1rlEj+iqxtu2yb
	 RSH3lq3MJ2k3uO5+5OCxOTzzZ4fhAyXQo5cFxIhu5QG1OkVoJo2mqjosyw/W1jx2yt
	 mT7aQ9ie/iG56pdKQ0M9UfGuI5xbUDTEwOKIwBD1cyWu4Jil3clQbRtJgrG1alnln0
	 UE378+JP2Ot6IDLBkePw/TtqydwCvp1YbbIr2m5hmKnXPS/ggCGvjgdg1FOUxBR5D/
	 PkbXzK4XxlzIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3F0D2C41612; Fri, 20 Dec 2024 17:50:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 17:50:12 +0000
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
Message-ID: <bug-219495-215701-OT0v0MUBI8@https.bugzilla.kernel.org/>
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

--- Comment #33 from jarkko@kernel.org ---
(In reply to Matthew Garrett from comment #32)
> calculated size of the log rather than for the table's buffer size. An
> alternative approach to allocating the LAML would be to map the log area,
> use the code we already have for calculating how long the log *actually* =
is,
> and then only allocating that, which would be more computationally intens=
ive
> but would probably save RAM?=20

So what you're saying matches what I'm suggesting for the most part doesn't=
 it?
[1]

[1]
https://lore.kernel.org/linux-integrity/D6FS8ALS4HSV.2CSS6SGE8ND09@kernel.o=
rg/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

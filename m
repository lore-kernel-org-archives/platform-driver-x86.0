Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0F770825
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733207020; cv=none; b=SNsjPHEGMlLYvHoafmjYY8e80AKMfpJyd1SBsoUoQ2ApvVJwbISEF8jpEgrOOFHKt0YLjeLt8pIE6sCOa3Jgv3XU+jQdalft0JjG8GH+byZLcN5MPBovGqDz8DVnf6jzWQRvtXV/l3h6fPW07RyoAH6MiKpqhWGM1zAdea0lE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733207020; c=relaxed/simple;
	bh=CkiTP8A286vxCytzngVoDLHFRyMsVy5i408/0IV5Xf8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=imuLveJRhjXtL0VsYmsqwVHjVff0uRtorl+ln8QxyM1ttxHaQAv/rhBir02/vRgpgx6/d7eG4wepOpIb/XllETCBTDPi06lIYiXtfCsbJYI3JuppxEVxytiRwbdJtWU7XaVOpu8VFV82Epcsj3Zs/LfEIcMs+4ZNcraHMBUjmik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDltLzLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDltLzLC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B5D6C4CED8
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 06:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733207020;
	bh=CkiTP8A286vxCytzngVoDLHFRyMsVy5i408/0IV5Xf8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kDltLzLCI+D725BpG1wpJePd/n81cDttu2qrtushEyQ7AmiSkvm11LCeMJipQk3SU
	 j6ylIBAZdB+89ZyCgzIY93eUrNU4ZzNr4dZBzqeqZlx46i7SQsQOT2JTrla9S1apHe
	 O58Kt7JmzXTk5FzizceXrnRvbFikBSGSCVti7SgL2ZaKBS21LhvYZg4X9JufheYF88
	 ABanQD8mWxuV9fDTFC7+DVC6kbuWPhoqKAHOLmZiquDrkYnxRO8JtuS0EwVSLRxKJI
	 8E7ZKwHShnoRIc3yDSp5FitadXmnxsJG1A6v2KvZ3aYTMJ30oWmBTKkDCUvjmjZiS+
	 K+ViPf48Co+Cw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13A0FCAB781; Tue,  3 Dec 2024 06:23:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Tue, 03 Dec 2024 06:23:39 +0000
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
Message-ID: <bug-219495-215701-T15jw1TTPI@https.bugzilla.kernel.org/>
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

--- Comment #17 from jarkko@kernel.org ---
Obviously before that you can send RFC patch to linux-integrity if you think
you have a fix for the possible issue (consider this comment as neutral:
neither encouraging nor discouraging for action).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

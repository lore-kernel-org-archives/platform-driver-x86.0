Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F20188733
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 18:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734978879; cv=none; b=rfjoTGINXVWik4f0ALQ9AyTV697at0zxieo1ZjFhTrN/3DqkWKjf9WvYRSXAr61JZ+CL0hnAuX3iSHQDuoeLEnpHk5Geqnbck0kpEO1+mXNVtNdkEqXcU3G41ofUoetYrjv9aYicuGjFVPkNZAsh/3KWeC9/PWgyal9PJ1o2MKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734978879; c=relaxed/simple;
	bh=QTcIcM79w696wzydhD8CSZBA/unFdLmorl9Vg8nPQqc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z7Woog6XcQWOIgDb2DcxU3mwiWp4bXURjjIzcb4p2EOezZGznUZ7x7/oKQkSlOe9tCYF1yb0s9z3uF/k+SqH/U8g0HgR0w6i/zkTbsOKdWKpAavXx5d4QercVT2j+8nCZu8pUTDGWoZ9B2UMT0oFnK5LIweLqIr5eyLUx/mADqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJiIdefF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJiIdefF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05F2EC4CED7
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 18:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734978879;
	bh=QTcIcM79w696wzydhD8CSZBA/unFdLmorl9Vg8nPQqc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VJiIdefFttHy5aX2UPQ3RPnQAdtsxEkIwxblko70jV6sy2mkDxdbYjVyyctfM/3hM
	 go343DsRU+GUXFpnvO8VKcsXwXfm0LfwNP1iFzJeWQdrio7oN2u2DHF5rhM0oUINGS
	 GiCELLOUgPUlWOOoVafE1TCVnDvO7N2ULTy46JmrKqdgYVetY4G2YIfzpMfNxN8Xv+
	 A6HSbNKMiiAyChXyNjEH5tIO55HuXgUALmOp1TqGVH5dj5K/16+4st5As5YiINaO3b
	 KsTvwzD28PbU92rkC5RRRJpivz8sHVHzzoy5d18LEGPEBVQ6iPGpT9iv9uJdPOW/o+
	 qZNR8nXk4rRgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F1DB5C3279E; Mon, 23 Dec 2024 18:34:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 18:34:38 +0000
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
Message-ID: <bug-219495-215701-TjXIbKO1tA@https.bugzilla.kernel.org/>
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

--- Comment #64 from jarkko@kernel.org ---
Both v2 and v3 look totally legit.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

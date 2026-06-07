Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D7308F38
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780829486; cv=none; b=grFmGrOAyxKtrXWO6MM+kpmk28PHBG9xz1W6PR+uyQAFc+elI3vdMlS9dhw2FF9pEaEy9avcC5KgXwhopoufkpkqNUJ7kGowKzl7GzD3pK740hgOC+8tcouhPGSZH2ibDQUorSo+BTdLPeZ/VfdEvE6W49hLvMQyC0gVFg4FNmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780829486; c=relaxed/simple;
	bh=hdgDalSYnecGLaMl1yakEsh4fDnaqCG5G94R6df9hbI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=blFODlcuNlihS2v+xtuqBRqe0A9BZhmacc2lJp6dkWX/H1HoRxLQmi7Asncz3AGBm8zfIWDgZr2Wvdq1Bhs9YdK+GR8g1/e99eNygf9ZUYhfKKH8uy0AVCnQDqiKZMuMuFxx0UBeKhsyRQas+xyukpt7e4WRChoGkZMkxkKTXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7sQ3ij2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7sQ3ij2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6E3AC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780829485;
	bh=hdgDalSYnecGLaMl1yakEsh4fDnaqCG5G94R6df9hbI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z7sQ3ij2vc2+VHSEhaghyCqBRC/NyHVQJdKkzPG9diSQeT7FNNhIfd7xRtp1uDVVY
	 BBYijzqX6+E74UT+soIJN/y8oP18XTYkHDIe3d8Kupp3feD74v0jOmiDBW4Q8j357M
	 1QWIjHHM/3mS5wSVqtNsX3yhdYxGh9780wvfvtk/SlUD2IiiPCEPCbUvijQWRchqNk
	 DoFNN4X22ZOq2cNXJ2SMh0zbPlzAxQw+nt4uSZbAn7ijZZm2vujFrDsdPbcuoHluLc
	 cKgiySjlavQVx5oLQ3tcO9U487McfnTotQViz7g+sYA/G38IAZWrrccCRgEtI5fK9C
	 M0gToDDViCTyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9A0B4C3279F; Sun,  7 Jun 2026 10:51:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sun, 07 Jun 2026 10:51:25 +0000
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
Message-ID: <bug-221583-215701-SEzefs0esK@https.bugzilla.kernel.org/>
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

--- Comment #40 from George (george.stafilidis@proton.me) ---
Thank you so much! How do I close this issue?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

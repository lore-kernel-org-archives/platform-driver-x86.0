Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDC11D0F4F
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 11:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732188842; cv=none; b=Aiub2/8gJsuHVZr5j7Qm2wPh9Rw+GIp3vkBOmGNi/AMuHACeABZRS/adzPgZJm2NZpZ55cegTSIx9/828yDXQFe+SOKy9ovL9CHBmjOZrKybltqv5D61NxoPBjU0Atj69IOy4c7ku7KgyI9Qc20BivzQN6yn/yLatpJTLHMR+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732188842; c=relaxed/simple;
	bh=mv3h7ICqnqYviEvV34U8yiFoNiVcz8iBxW/eZcTCoHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kzs6xo9Sh0iFFjZfeNoJ24n6mMhyO3mYUm3ebUpKDE78fTG7aN6vuhaj9jz8LQYth7scR25qLDBIyiCusSeXKJbGoO2ZJZg9E3sGfHI7bGfgf+1bH6sSkec+cwcmOKC8+TW9VCsewinmFx+X65rMjNj5fC1G9+4OPTZ26PCrbok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwOY4ruA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwOY4ruA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14DFAC4CED2
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732188842;
	bh=mv3h7ICqnqYviEvV34U8yiFoNiVcz8iBxW/eZcTCoHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XwOY4ruAVzyVeGCS/Ws/J2wKQr5OuB7CAeQGHZRRfz+qoxG+2n5U3kXyETqPBbWP1
	 Rw2jRWs5kfcL4hErBX0h4QQkbNOu/H8pN4sgsbfKBp5vDO1wpL2OmnClvYDql8MuOM
	 k5w/lLzOJq4CvOXW0TtDZesEIuazaQoihcJd8jvHt9Y0ZA/2LcXOoUj+q76UafcDos
	 a6Gj1kUs5MAG4z4WJvf2ivC1F9SAG2BteGbZHxaOZrCkOumEx/DYXWdyVkFgWg5TwW
	 XCZAB1TOfotgAk8vvdELOqxRfHgoeeV6DyQtHXgXNVdJKIRhd4QVNWB5Eh4OP0pcZQ
	 5NLxFpo6gI57A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 028CFCAB783; Thu, 21 Nov 2024 11:34:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 11:34:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-7UmjX1RK6J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #10 from Armin Wolf (W_Armin@gmx.de) ---
You will only need to build the module, i will send you a patch soon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

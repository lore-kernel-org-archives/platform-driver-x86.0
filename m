Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1317F9DF
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711978670; cv=none; b=Kbm05sGxfjeaqAqFB81iX/P9XSWwGZiGu1234lotJ+IDBxa3HNKvxxSr+H2SNCL1wLlggP1kPtv7ufQVSNXMM14XHmd2FodA4JwnyyLPdtH1NUpWPRJP0Q/FKHQy3BGOd9co7r707cbMEOXdJaZyJEYsiDHAI0mZzB5gspPH05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711978670; c=relaxed/simple;
	bh=qEeUTCgXidCqII7GdldCnCnzdhl5aNRYDlD+npB/bTo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NvRBVHiTl3+k/TcBaZ9ZS4Exdvj4x3ti8YKQgoPv1q0jgOKA3zFNY6TJJxc54rFMNVwNmL4VljsTJgulEQaICYuf7ffoq4DTeYaq8T5yxFUJv4kB1YgGE4cBI5T/oJuqal0K+5Is7dQDiUo7kCz97tUM0daA8hmpnBGz2R0KkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/Ne2u5W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/Ne2u5W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C1E7C433A6
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711978669;
	bh=qEeUTCgXidCqII7GdldCnCnzdhl5aNRYDlD+npB/bTo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U/Ne2u5Wl/6d/UcZU9nE69fMAwHISIwCTBccDda4LPceaO9BcvDrnr3DNMGxxpGAU
	 K2CImZ/bCo/zi3eqH9tnvKLiM6mbbbgSuZQbkdrD3fsYBhNxWdkSdYPaOsmYA8FEhe
	 KJm/KSGfQwUwRquXBiey+TJRF5L3U55mBmvNy/41pHv4CisuXiJnDPtsUEavqdc01R
	 sNRD94y1hZxdSzRJcNDckfjrDJS/0b3OY+mY4nyVWSziQdgs1TwKs6m18ydhMj9AJT
	 uZBtRIx0lc0RTq/LYZwgX2mTtFVTCLcMn5Vbja/m7n1cObOibnIa6LUMtHqTONPUzG
	 WaXEsc1kLCCag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7090AC53BD8; Mon,  1 Apr 2024 13:37:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 01 Apr 2024 13:37:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-ULQv2FERnh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #42 from Artem S. Tashkinov (aros@gmx.com) ---
>  From the above discussions I believe it is triggered specifically from an
>  event sent by the EC when changing the power adapter while suspended.

Yep, and like I said in my case unplugging/plugging the power cord is enoug=
h to
fix it which was a relief for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

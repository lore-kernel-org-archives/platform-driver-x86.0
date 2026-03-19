Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE423D1CD6
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925320; cv=none; b=Q4g7dfYr/Fu0oM4FCLHETyGvJkoiT4lhBU7O3pny+pSx9KjD1q+fjuLnEmrueiWDqEbyYfgKU7oraz9N032axqVWhOH2lKPRLBHmc+rt+pTPo+UjVjKtY1Gm9e59nrmam3Jp47bOHm83zfzhT2YT5bo6b7AJ/OYDYKW+BhY5pWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925320; c=relaxed/simple;
	bh=22Jy3FAot1sHZp9nlDcBu9DiRZk8PyLQ+QbX21R9gX8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EL4V7fbRLjFapV18I7QEZjPgAuJvL0tIupjNaxxxUjXvmg1zrFGJ6SKvY2i3giIvKkgATwgNnpmxIzProKsCRRMPi1v2y0ochyEj+tTfuURXkP7bL1A1FUlnA1po1WPlmAKIMjZnlMx9gnMIJyMOVP8hD0yQUr3RR9em7qw5iok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+MSbenA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+MSbenA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C5CEC2BCAF
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925320;
	bh=22Jy3FAot1sHZp9nlDcBu9DiRZk8PyLQ+QbX21R9gX8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A+MSbenAifroGf/uO58/U4OYU3nNSYyiaMkye4tPk05ABpanofJVEqovkOUiSAj8x
	 e/JSugaRZY/4F6FyXPuI7YxX6GowWYiuaAqAwtaOPQnMs0pirjsyDsyrvvEb4d61tM
	 +BsaVdPJA+Fu2L2SVoT66Zt1L7IG+qczsjJiHcg9a5gDjOaGxcP4HRsim5MKkoX7wN
	 JBOCI2IXyrCo0aSzI6vj+hZMh2jXpQk1igh7ixftKK5TXmlgycCEkgAOycCgpSrVHy
	 rOW3tJXtb0yfmIZrju1RbLsw8bcVt/97c0IRI+au/zEfHHtZzA2DkOkrFqUprbwit5
	 cEV4QXRUE7spw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1DD5FC3279F; Thu, 19 Mar 2026 13:02:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Thu, 19 Mar 2026 13:01:59 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alfonso.garcia.frey@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221238-215701-mzq2vyIkNF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221238-215701@https.bugzilla.kernel.org/>
References: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

--- Comment #7 from Alfonso GARCIA FREY (alfonso.garcia.frey@gmail.com) ---
Tested with kernel 6.8.0-106. The spurious ACKs still occur =E2=80=94 in fa=
ct they are
significantly worse:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20

  - Kernel 5.15.0-171: ~17 spurious ACKs per boot
  - Kernel 6.8.0-106: ~114 spurious ACKs per boot

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=

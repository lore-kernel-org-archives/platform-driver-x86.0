Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC81B4244
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 07:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766388775; cv=none; b=NsW2SlcgdQbO5CGaDVjZbcix2xoiyzZ91t1NFDNnenT5862/ge9iPxB5EPV3FqX4SLLZ5otfsKYFNn5nBucEOdQXHl87eMzS9akPxKh1JvjKLFNsmF2IyDVOzd+vV4BPjDtUQ2WBEBQh20/YIcXOZkxjVIA2f+CtfaIu5Us7SAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766388775; c=relaxed/simple;
	bh=qd7Hpm/24HDeHJK3X66qeULqdhLC+/OxmGJY0EI4vK4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=phWao3Y8B7rJwdrQWaoB6EVVozuMBwsOjyYLfJFjZfwqUA3ft5JcXBFZh2r7taCT5NeyHSDon+Ot2iaS7L3zBkVIdRXGYAU0mgU/TekcEtp+PkoX9pCT148grN1tURz40gojCff5K09elM3ArXSMjUZZH2hdP2stnOdooflWU7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAfVvCWj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAfVvCWj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD840C116D0
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766388774;
	bh=qd7Hpm/24HDeHJK3X66qeULqdhLC+/OxmGJY0EI4vK4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YAfVvCWjYQ17HhNWkzc5lLnx4Fo6pGIJ6hWBNI23rcW+rEk6dREG4Re6W6tiTU11/
	 qK5lT1NczTwN6ozfVqImx7mxLDah6rqirz2gXgXrSfOmW2M9TLEvgG40/JsXptB6TG
	 de6GdPLlHWHFP0AyTTxUPIpATYkjRUtC6fyh28T9Eb0yH4WLpvQ+h1N/abcgM9x4kK
	 i4aapPN413P0YAfvT/kEA5Q+LqYOMkAXixcr0OLOe5wX/il8FgtImyet6Tfp8Qgp5t
	 Qf7U1rAb97O15Z5c1JYDH2i4M1ftw6eVL4XDl1Mulqhu8Uim9BD3hzftWGq+gFTYg0
	 Bfb0wQmtVAyug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AF52EC433E1; Mon, 22 Dec 2025 07:32:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220421] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU
 telem endpoint -6
Date: Mon, 22 Dec 2025 07:32:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rdunlap@infradead.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-220421-215701-vLNdXv1asj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220421-215701@https.bugzilla.kernel.org/>
References: <bug-220421-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220421

Randy Dunlap (rdunlap@infradead.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |rdunlap@infradead.org
         Resolution|---                         |CODE_FIX

--- Comment #7 from Randy Dunlap (rdunlap@infradead.org) ---
All 4 patches are merged.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

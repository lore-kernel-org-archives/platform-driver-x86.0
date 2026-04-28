Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C0C256C84
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777411536; cv=none; b=fDhabuhENatxj/DDxXL+nM2L4xNzes6k7RhFPpiKJVByRvDZfQ418yTn6CLeZPCUfJK6u+WfEbBIb9ruAOcecwUXJuE7L7aWOBxLLk4OhTKS5+c2QEx6bchHIpHRXdDx3UH4C4PelKD9KRvipP50ybwRe07NkHSHc2qdQ9YpLus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777411536; c=relaxed/simple;
	bh=VyRKjGn7i7QdXpdnD1ouD1RUxz7reKRC4sDRIClKTrk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DCcSFX/GM7wxtPKlJcWEArfGKMVlPmnvzLGOW7NQ81Ott/fZ2TL4FZcd2Ty6yPAsSAxfOCU3Mq0STV+//tB943pPgjdJoN0LpufWWAMSYtN+Y9a8pT1awhg+IjrOu7pvM1fga7QqICddvSfaAIqRo0n9vO+l4TwpmjaJ47+RuZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmo4QOMu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmo4QOMu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D984FC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 21:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777411535;
	bh=VyRKjGn7i7QdXpdnD1ouD1RUxz7reKRC4sDRIClKTrk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bmo4QOMutq3ftowFDhXQUhshbe+iBt3b8ytxJAb+a1thiLfMXbdZ5d2+10kPbjK/P
	 YHN890hBpy4WKc2vYWnTZoe6p+tjt059v3EIe8JxTHktA4ldsLYDO6r3kvOTlkeaS4
	 vHvVpzUvmVCqrQOyEr1itbGLrpkEhiS7LQD2YKyITHJLKmzP4XZWd7P1o74rdOwW5/
	 Ph2/Pmt6DH9kV1cxzTQ3Odffs4BWJIOC5thODlfW6OaM6Ox9b3loOD4H3xEeLZmw3/
	 OA9PTEXk78fyLHKEL0OpaYsJUljc7edaPLLgTm3KCmXAe3SOS7zavt4JQsFMJP0czR
	 Va9e1Ftr9+Xdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CFD93C433E1; Tue, 28 Apr 2026 21:25:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 28 Apr 2026 21:25:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221430-215701-tigYubiiWj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #2 from floquimaurice@gmail.com ---
Created attachment 309994
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309994&action=3Dedit
dmidecode output (serial/UUID/asset redacted)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC9E4C65
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Apr 2024 05:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712985838; cv=none; b=CKO41eY9qYs1w6zOOlmdC+FKNDO4MwjjItddnCxjCcfPVoYLllxFGDncL+WdCLlTzRxe+OjO5V4ec3FX8POwYKkjVkvpcDWfhvSKwejfX5O0YU9UyspxiWY3+XWs2Fr+lpC7rWoK7cb3dDpkOMECB/rq/9NIrFHHQSa+hlsrqho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712985838; c=relaxed/simple;
	bh=3ZvyDXP5ghyPhT6QQTyduyTqYoXPpBKAObHeBu605go=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dhyvxgeoiiTd4Hz/wkvfRwH2Aapweb9yAkzwqiCURNLyWBVRX3adQ7hhLQ+1+6pSIV93jA55rUsg986igrq6VEzsqutFLj06srdDN1rbEQxfDg+RbSLkfdRe4XZoUDcawSHkn0ycu6tzQ9Al5l+RdaapWWhkkiJoBVgpQmPVgRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCOenDL4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCOenDL4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B93BC113CE
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Apr 2024 05:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712985837;
	bh=3ZvyDXP5ghyPhT6QQTyduyTqYoXPpBKAObHeBu605go=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GCOenDL40GdHiAmSQLAcNAjhr2EItGmoxPoLcU9OTXMMXMsZA4NzBw6dLhQxJQ/Of
	 Acm6njtYf15/pTu5H5TXJlwSFS/sXBcJ7fAow9Pjx6HurrzRGQxAvZIvuz7eEOYfzT
	 76Nq3UgBqTCEn8Qjl99kMbW9RUV1C1i2XRvuPQdCQSwFw/C8t4MS8jwybNUa03Wp1N
	 G2KZceaqJlhmwSlWpXgSg8+Lzl43Ghw6NXbY9IXdhG9smzOWxX0AZ44O3RPbiq2UxC
	 wZoSjSSz8HYO3KD/SxqG2vpxXTVw/xjxaZXDxgMztpoVzIaRJVq4GhHKmeLa64tB32
	 ZXY3T/vV3VB+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40BB2C433E2; Sat, 13 Apr 2024 05:23:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Sat, 13 Apr 2024 05:23:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-pG5kcVbJwa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #7 from Lucas M=C3=BClling (lmulling@proton.me) ---
Hey Mark, I was testing today and noticed that it happens when GPU temps re=
ach
~70C.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

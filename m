Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA039A07C
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120448; cv=none; b=XMwb9XN+bgswWWWoVqX9bLN0s4Dn2SJMgJYZ4SEIcCDwe5eESpoXwJjCWuJ96Ms5zjnY6KkOv2I7A9/qUtmRCIfVzGm0PdSdpMGTBTSyb8o++S1NUJGiY1h1xbI+fNHJ427H6qJLTuYGpYDlGQeB2wRz/98C7BxbnzGz0+byGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120448; c=relaxed/simple;
	bh=/vnzBb6A34s9FuAv1dKhdsvOZGorZLkkEi2cVxGptao=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BINv4GhaRbBytUqrqp/FJUJWhE7sNh19uY6pIUdFsd1xOi4oBHCKl5IUi3Z5/5McyAjuWSafsPrjTEYwIxOznsc7fXiondjSauLOU465NH/y3MzwoKn+ogHXrdCKe6vwirBJ3WjsYB7lcpqUfau8GLk2/K4pj5V1Y4+69A1d23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWBBJ0Lh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWBBJ0Lh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 423B9C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782120448;
	bh=/vnzBb6A34s9FuAv1dKhdsvOZGorZLkkEi2cVxGptao=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GWBBJ0LhfjrHACLDh8XzyYxVgNIVihsJd3dK7lbUlLnOu/IzIoeMWRZaX/ssxoB6s
	 2wR4LqrUD1WQ21lN7ewDEZ9fzPhgB5ojaPhbfo99QEJ/XYL33y1woag7rVT7WlaDV/
	 C6LPzGNJYBHRJSkLUkA8/IlfHuGpd/XUt3nOPWTPGqEgS9P/l+C8aobFwtwyk3rvXP
	 201dy8Y4TCXYjwFLsi4nuXvhA4G63hjTzRZ2+80is+Z6j40sNvTLmNr/hzGWRvsqzE
	 S0OtsG7bW+XglODpttNHXvwaLfXsu1HrJk1lM1rxsrISCJMB8yrWogz+pYnYg167hZ
	 CnzUFFzfIy1EA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 30A2DC41612; Mon, 22 Jun 2026 09:27:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 22 Jun 2026 09:27:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-LqTRAakIfK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #46 from Marco Scardovi (scardracs@disroot.org) ---
Unfortunately, I don't have any more ideas.
On HP laptops (especially non-gaming models), the fan curve is hardcoded in=
side
the Embedded Controller (EC) firmware and cannot be controlled directly by =
the
OS. Since the ACPI tables do not expose active cooling trip points, we cann=
ot
change them via sysfs.

You should ask HP to release an updated firmware: on my side I think I've d=
one
everything in my power.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

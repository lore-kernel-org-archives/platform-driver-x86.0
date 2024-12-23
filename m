Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8632618BBAE
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943356; cv=none; b=pHXQG3TKI8/yryWwrl+oOVtXqpoQVqZhN3CLrtDOEGdY0wBgbSRurpguXagIejz/T7ecWuw7TPqUEZu7xtu8/mHw9jgT2WSSsqMj6HI7TSA3Coo4KPM3eoQEEAo82qyrJi4d54pPUV1g9Tdr99oxz/eKjsEc9SO5HsF2jzNyjsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943356; c=relaxed/simple;
	bh=T4Q68hxCRZOBX8yUIwexleL5R/rhST796XAGplO/U5s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHYKt+a3jvIS25yZURqTfO2IfdDZvQAUCCu9cgSR3SPm0y+YB8aykDNva5WiEox20kVukmR7pLFIWWJHmoa0m/25sYWYhjKdluc6k0djTT8XfFQ/F9eU669o04326NUPNG5/VXnKxlI+/k9Gb3aIOxYFUwgI0IKQTdmjG1wslNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiNidIo4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiNidIo4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1245DC4CED4
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734943356;
	bh=T4Q68hxCRZOBX8yUIwexleL5R/rhST796XAGplO/U5s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uiNidIo4yRJR5uw85H+nrYvUItM/1Q0AhINdiNUJRv552Yz8KjQwHrFDTsDPzekWo
	 1a/aeYEm2vu3uuoBtPD0PlGck9urAFQsBzVXr9IjVe7UW4ktV57NZyyw8vtp14fc45
	 4ntEEFIm193RdSYj95Ul+2IuogCWavyP5VroEQ1ubtSupkPQKWtajVU/KN8g0smxXH
	 NoDax55lIwbQfv/j9wcX8AJ+vijU4K7SynjCyrpyV9YEXR6dVj3ChCIk10urv2VVM4
	 EoKSMXM2GJMNyLzBLz4xzBndQoAKlElzmZ+YWhDPwbo4AxcSiP09XTpsdSTU0kfKer
	 /avo8fAqngcEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 04FCBC41606; Mon, 23 Dec 2024 08:42:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 08:42:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-YX0NBQIwVI@https.bugzilla.kernel.org/>
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

--- Comment #55 from andy.liang@hpe.com ---
Created attachment 307387
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307387&action=3Dedit
v2-patch-binary_bios_measurements_kernel-6.12.6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

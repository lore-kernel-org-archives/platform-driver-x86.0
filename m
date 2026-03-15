Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C8329C73
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773586266; cv=none; b=nMp4oJV1h0RL0gtWU2LaAMba+JHjDNKaVjXoRwbOvYm1iQfzKmiTCHWAkLe3ywHvXEgoT5rL0LasU58hGCKh0rPYs67g9q4DoaoZAHtIaL03FEBo0c1lQxAXrp60eoyVWTOUwCgIUNu3rrU+rc6kShFu1u4re6TytXYZHOwGvyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773586266; c=relaxed/simple;
	bh=zNQm7/1qwGKxEBqjVyx3eyzAvLgfNmF3zR/k6RawZOg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ANGd8FfapL2p31RF44dZgiskzL1UOTfJVJrxdIJaCK4WCC+THWSZJWSGiQP10d0L9buc9OIWcncaiTJykWVP5QJE/NfBO3pMnX5aoj3HZOb7jyfmaG0xTvVm+uqGz3+SwVpTDupPwGy/rnQp4TbYUMYUOLc3rgVr2A6UevGVXfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmVrKEIR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmVrKEIR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FB20C19425
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773586266;
	bh=zNQm7/1qwGKxEBqjVyx3eyzAvLgfNmF3zR/k6RawZOg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UmVrKEIRn3/qeBxn64tLF7xTk2JovlHKpnjvG5bo13CzNpDFCIsvwz/pcUxMp7R+Z
	 HeGVQgfpdLkA2LabmJvbZJrXTtJb/eHKW9bxnhqslGMLrkQRtI8uf9HlYMBc8hsEEP
	 CC9vO5VXGONfOPfIqtCl+ZMNkkGFX0qss+e6z9b1BvA3fcLk3PiuhlnddRWz0pBUhO
	 pb2N4OBWUnnOxgiJoGiyAHFZjm/VWlZXHlxBdrRK9MbzfSyexb9vGdwWpeRacpKewy
	 TdyvcYWpATuQ+AYDEzSVXuO3u3obxyBQiwDYKynqZuQf3Q3bT0X83mEmWCNOKBxrV4
	 1llhen4f7MYOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 41742C3279F; Sun, 15 Mar 2026 14:51:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Sun, 15 Mar 2026 14:51:06 +0000
X-Bugzilla-Reason: CC
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
Message-ID: <bug-221238-215701-ycEJIedUts@https.bugzilla.kernel.org/>
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

--- Comment #4 from Armin Wolf (W_Armin@gmx.de) ---
The ACPI bytecode indeed creates a operation region for the atkbd IO ports,=
 but
said operation region is unused. So this cannot be the cause of your issues.

Can you check if the battery limit exposed by the driver actually works and
returns the correct values previously written to it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7038B7AA
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777231262; cv=none; b=bX7WTaWOHSxR2Hop2kMWTgyUE9dRaRDwMDgiouOsaDUsmYJks3CjNZbZr9XhVTVWLUKxIPB3yTRO9fCpvVPNAwdOg0ODVP/ETgqEIpYz0cCcuggvy1r+Kjekh3MptlEfJyll7zc25CcN8a6WeDQHFuIk1iPA2Ttf9wPr9jzn32M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777231262; c=relaxed/simple;
	bh=MNuOaHNzvdqJs5Ps4/AT3OYrwtO0AqCmUKGzRiAoPGA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZL7wvOD8qvPWsG8hxJdptG6GDVQ0blIOMVoSlnWtyRRkurle2gBZMP6FFDscuexgqSLl7zm4Zqit/ubvP6YqGbQUZB2ctOPuY6LK/gQtRSmlGfDHF0jCdivzkow/cZD9QmmxS1XAjgAsTPNKt9RNjhm0jfJtjPTMoM+TD6YT4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZVnod8f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZVnod8f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6A53C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 19:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777231261;
	bh=MNuOaHNzvdqJs5Ps4/AT3OYrwtO0AqCmUKGzRiAoPGA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KZVnod8fQavhRyuCepRorX6Jnk7o5fqkT0wUWIdTywjlASK9EJpXWX78nvKiCh2BH
	 ecUAwRA7orkI7qtiOSNQvtf6B2PuxfA5jQ14C1jjnfKNcTPldfwntZlhD4Klqc9wpS
	 obSve72shbiJXfYJodmhPhF6QVBmjUeuO1vlBH9luX21vqi7AeDZPVtUSQV96op3Y5
	 SKszp30lbkYIyYOIS5Q+GrUmA6a6xSXXLMHFyV7gEDa7zYkv0iq4D+e9Eb9bUEhunZ
	 /6H9VhkvwLl/KmAU/m9Mefxu/2QNZHPk4fykOQk0ImKNkC6dyrdHg5VslkrxfrIRli
	 nFalAv4JYngnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF236C41616; Sun, 26 Apr 2026 19:21:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 26 Apr 2026 19:21:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-5ohgxi5t5H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #66 from Rong Zhang (i@rong.moe) ---
(In reply to boite.pour.spam from comment #65)
> Would it be possible to serialize the ideapad-laptop and ucsi_acpi
> simultaneous accesses to a kernel mutex so that it's not possible for the
> kernel to timeout on the ACPI mutex if only one kthread can be accessing =
it?

It's a completely dirty hack and would not fix the issue completely. The EC=
MT
mutex is not only used by ideapad-laptop and ucsi_acpi, but also heavily us=
ed
elsewhere. If you really care about that, you can simply blacklist usci_acp=
i as
it also returns garbage due to the FW bug, see
https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c34

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

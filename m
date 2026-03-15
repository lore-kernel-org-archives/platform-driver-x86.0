Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A917C220
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773574158; cv=none; b=MXIMQEMCLghZhd4ycURij5QaIE/pT4MqMDn8T43Lka1j6JjrMm9hAO1svaHNW49J522xR5AjkCae5Z6YsoeRFyY0/2gAxwXRQWOGm1wxonXilWnZLnb3dmmogB8nQGpWgx1pbC0bnrTw57wHw5jOFEdHJKdRuz6+G4aIefAo+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773574158; c=relaxed/simple;
	bh=+vf4y7I7K6mdNQCcBbZ704vCgsgbUErcsmuZYE0gLmU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rhIKR+1GcOfwFius0hfyKeg0XtvNCFJjcJoHX2mz3b64YQID1wEWmPDatmei27D8TXxemWPRaWBpmeM7v5l4zIETET3RsIcBlFV5rOKMzrxM0lx8lzduu8IjkFFllmBL3Vo9J4OjEOWf77hs4D8GRTrEnwY4Vb3w8JneK5wOebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbyLbbd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbyLbbd8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37D66C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773574158;
	bh=+vf4y7I7K6mdNQCcBbZ704vCgsgbUErcsmuZYE0gLmU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AbyLbbd8Jgr+iLhggzhpmCNHXEQ8eRLiS2jlLeYiXGclKnryRCC6RnfIvlTf76H07
	 tt+QpwumJ6i2TMpVk4eedb2CD8b3Bbq4/BWZ5au8fZ6PsJm0V5rj1PeteCCeU55h8h
	 hK3QTbyWgYMa/QW6e3mVJ9+9ZbXnPLZ4P7/8XIeNjnpFy2nMrWLnlec8wjH6wIGKAO
	 78pU60CxyL/GZ+m7OQp1nW3F/LvZk5dHGyKj9UwFpIDInHotNrR+m95gaRKVN9XTNh
	 FIg7+1VI2MPbcgQBEnTXKUlgS+9sjdZleF2iHUzpViLaU+uWAVqlFKdqHPBrFQmhvM
	 f9lyfJcxsAWXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 26741C3279F; Sun, 15 Mar 2026 11:29:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Sun, 15 Mar 2026 11:29:18 +0000
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-221238-215701-vTI0iakerK@https.bugzilla.kernel.org/>
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

Alfonso GARCIA FREY (alfonso.garcia.frey@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|lg-laptop: Spurious ACK and |lg-laptop: Spurious ACK and
                   |dropped keystrokes due to   |dropped keystrokes caused
                   |unprotected i8042 port      |by ACPI method calls
                   |access                      |conflicting with i8042
                   |                            |driver

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=

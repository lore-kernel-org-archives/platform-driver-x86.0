Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4B01F4199
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749059719; cv=none; b=f/DbAAaqBC1MsKgNCK0ANPmZtNRTyUsFuqbDcFAa3wYFlXE/Z2UF5Kd1Ly99vzAVMnKw2XX1kkjXp8loN5kipwi3C5IFYYbz6iStM6pPSy72JQOBRCJCC8zQg4fW0F2P/a1rPtO5KB3jacj9zKiaJ5CReChqj0WYGeL1irJggI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749059719; c=relaxed/simple;
	bh=wqXpj0Xx8rnJAOn8cw4RE9geXE20Kix3Tt/81hCuSlU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EZQUbR4UWb8Wh8/TZUKabZz2GAs1JPVUFmdvRHkocwyOvhjWCpgu2Y2DEiZL6OShObmJAf3XYWvUjvyt7hZ8oY0KzbuGJgyZEgYv1OPdwtd095rJ94Kzj8OQSNPGlM8lXZM2rWbKQVYsGMYhwLf6HHHrg5F5LlUrVBoXWe4nhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0JLsAGH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0JLsAGH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C3C5C4CEE4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 17:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749059718;
	bh=wqXpj0Xx8rnJAOn8cw4RE9geXE20Kix3Tt/81hCuSlU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a0JLsAGHs4sqM00GTyacl7SG2xXZAAPJKCzQxWqzF0np+jYqKacq5PnIjWAy8gUw/
	 dEDrUvAPvA/eMSZcsrTF95WVsZQiUYJaYCSMXZz29+vGj4kOVqN7ug+zzayskwWA0L
	 b8XGMH8LLwsapgUxDNWdLQfpROqIh8qxa5YgWDXZUXTYcXCgePlGZ3jVlDtzJVjUmW
	 /T11Olajvkbo9Jv6bmWSMsSW1G+YA+wwULOJEkml3wFVHna+kueKbznboAry4odCNO
	 lMj4GtpjUIDD4SKt+lSp4m+WtCW65wnMEuDXl3ko2w23l99qCvieWwB1hsJDpcVXIG
	 Gxh8PQHXKtYPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 73BE1C41612; Wed,  4 Jun 2025 17:55:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 17:55:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-dGNaFmDIoT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #13 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
@raoul, did you press any buttons?  my understanding was the event looked
spurious.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

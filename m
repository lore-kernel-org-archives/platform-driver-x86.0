Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3550413A3ED
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 01:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780624135; cv=none; b=ZqJXhhtuNpQiWa1lxgOYearNqdrfjLt2npcKrshO6F7pVxWlVCLXV08aG39g2QojSAMtS5PMr3y5bPGB8obdxLeM7PEwlkQzCqmkRj23cLckzqv7k4971L4rjncYlZ2T4z75h1ye5Iw0UKpBkLpOEZO9Sgy+ciktIPyValpKm6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780624135; c=relaxed/simple;
	bh=rpfC/79zxyovixJeBjAl7TMgtMqFCkMYHu7uS6Y3FRg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gka2g5Eyl+1HL675EY9ucT6SXgqiAfhJG6XRoAK7atklEPqJr6RqJP2yY9qNOGCBS6EYLMLnKJe8zqlI/4Qrs5+tdISG7cvWD61CjrKGmLF/cj6Oza4ACZCjqPP/2DUq+zqFnk7E6aHbW7aWp+eMYGmpBKo0m/1jjpnBcZ6sIOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOuB83Wf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOuB83Wf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ECC1C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 01:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780624134;
	bh=rpfC/79zxyovixJeBjAl7TMgtMqFCkMYHu7uS6Y3FRg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lOuB83WfxgaHdQ2gf87oEqs/07ilRxlCOOMKiz2CbqBDwES1+jwDNrXB9q0pjmuhl
	 VpbNeMbXlSdELUAvjhAEoF9dySQa6mJH6u79oqoqdzZzeyQvUFqbl6OPMj+3MeNyT9
	 MwNjKWF38T8EhikD/Q5His5SZyvYYMVSwKpwf7q1x07f5cAtqzpHdZMvgeHy8ZxdkA
	 1mvWh4qaj7bg8lqX1Mtor0lqHqxV1YJxZxpxjIJV2e4KSjv7DfDXkg37nlxwq5+aQ9
	 bZUHFKmJC93EDN8QkrHIxDPOq8F5Z2hcUo1YHq6xsBYuXGdVFAGDP/bAeeEHfGhg5I
	 Co0YCjPn1Hg2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 73D48C41614; Fri,  5 Jun 2026 01:48:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 01:48:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-DPTmEYP7oQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #11 from Rong Zhang (i@rong.moe) ---
Oh, you are using 7.0.x according to you first message. So that's not a
problem. Could you attach the final DSDT patch you applied?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

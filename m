Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820C30CD8A
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397310; cv=none; b=NI25+v8WKVEiN8D4XGybx8fUEbywDHyUWH06jysjf4upT04o0A0aq/rN7UfY1P/H+gI+tItCjo2QmCtDu34Bbp6umOIFq8aDxbUPb9VywWZrGlrGhWp0dTxxI8Y3pBWMIKXsb3fvM5mNWAk7bdnm8ZV5xDJ0mj8m2ORTUxHRwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397310; c=relaxed/simple;
	bh=dUNBI+DraceNejqrgy0nvNdIa2ffCZb9Ux5cvDp+2YU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gpKr/WoWJT3GuNzXUnAoJ8HCz1T8p0PCM7Ofo8jeuO5aGWKZYK2k8svuBhJ8ADuosjLpUoXUYB1unMv3ATbvuYH6bzRk9kughBXMAPSiwYeU+RCt5rZR81A6Dsrk7/RgQCVAv77W15IH7JENqg6bzuHx1jVeb7ljp/CHWhZcfLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocQwIoHX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocQwIoHX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3CEDC16AAE
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 09:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397309;
	bh=dUNBI+DraceNejqrgy0nvNdIa2ffCZb9Ux5cvDp+2YU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ocQwIoHXlgYNVpoYJ3O7Cw6xDWf7xDmpYdZs/wtIfdqC74UYe8qK1S1+5K1qriO4h
	 OR6dKloK+wo4NrgqGIptpdABylxtJ+1KvX8Axc/f8HW40O/TZtA4DnWqi8IUAa8t4d
	 lFSKI+0tmOTgMrkHlUjCZckLODPM+DrtcwZPaLGw27n0RlefK3L8eG+taoPA9piR4A
	 6vd84STnowkWJUads3v5102wtzKWQ7kM+TRIRVM2GJsKXS7bK3VTRdrRJI6rSHbbQ3
	 TF4ZKenIh3MRqGpq+eZmE8U+WHA3elXRpk2E/dnXk6ocjirlk0kAxenVu7Ag4UfUUV
	 zi2Iwouf3oOow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9ABD0C3279F; Mon, 22 Dec 2025 09:55:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date: Mon, 22 Dec 2025 09:55:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jdelvare@suse.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-203191-215701-z71IiIR8Qh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

Jean Delvare (jdelvare@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |INVALID

--- Comment #21 from Jean Delvare (jdelvare@suse.de) ---
Closing per comment #20.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B9B4C6C
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 04:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751256372; cv=none; b=SeHddCK7/ZdlmNd6uEXN25vGckpjx+RZi/v6XKqkYmFEfiRZXx6ibNOk0VWfd93OuGzr23xU+kK/6nHnPKVboj4RnKoQBWSvgtURJm4QM7xYlsqVKIjp+eSHi3hcP5SnBjdukWkjtNDRZfPkCCfC974+mljDWui0m0jhPPUEfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751256372; c=relaxed/simple;
	bh=/moRwWBYI4O4Lh6FosJtyBD/uIsq5qIyP5zekRtkbRY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GrgNgHGslQLABe5L63Ob4fY2VzalcCePQFYcOppu3xgWhcY/H/0/c+I0LyV5AKqnZcp7HRQjC+FFD6mnk3HXbL+LFFifBtY6xPix9Mvr44Tlcy763mRRftk/dmcakcbiaPaUYxnbo1bIhe40OMEgO7EvIBRTt1JXjo49R8UDc5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxKTJL6v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxKTJL6v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3C29C4CEEF
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 04:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751256369;
	bh=/moRwWBYI4O4Lh6FosJtyBD/uIsq5qIyP5zekRtkbRY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UxKTJL6vCrtK+3DIMMwwOMa2EJomLGbMs+cSCu48sUgTyzZlubCmsnPSghWKfeDEF
	 FuKASZiUB813XZ0hDOFgk3lG4tqprDTFK2NET+F24A8zFR+y1dz64LTgaaWBZoo4aI
	 p1bIY8ofeDlv8L0DKVxIYMTkFHVWjzeaO3l6UTow5dPz+BENRsw2OUkIgc7Qrei/CY
	 zJOBvLgDUpo/nN55wcpf/xYMj+ELFnaaDq1ZVpHQEbgt54HHJjlJz+YjKs0B8EjP6a
	 dGWCo6EmGaP6qMT6Uo1iYrmBmZsp1gs4OvV5b7g1+Qo7C352UiHbLYkdzYc/PCBXAb
	 gDcMqjjtVsrVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B5711C41612; Mon, 30 Jun 2025 04:06:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220290] Samsung Galaxy Book Pro 360: samsung_laptop module
 fails to load, keyboard backlight not working
Date: Mon, 30 Jun 2025 04:06:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kuurtb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220290-215701-BcMiC3PM4P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220290-215701@https.bugzilla.kernel.org/>
References: <bug-220290-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220290

--- Comment #2 from Kurt Borja (kuurtb@gmail.com) ---
Sorry, I meant:

# ls /sys/devices/platform/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028CB3C65FE
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 21:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693792; cv=none; b=WmyLrFr01oC4EE5RJ0mYeDT6w7X5PpKoe2WodFg2cLYG5Ewpg++ZDZAY6ACDj3ZKPmltgPj6T+3QzX08MmeN+ra01NMCw5IOhx+u+5hHYnxkXdAvObnh0wRbpvQuG6rppzCETPF0W2w/v43Mvc4oQOjRLYchZccN2QHREnn6Oog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693792; c=relaxed/simple;
	bh=2VTfX0FmW35Ff0qOB/7LxJSllB+t/+YHMsRO08cF9TU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lxNHhkPdDc02hbEja+uYcpa/v95gsZ1wp8JHmVaDv1xmVCfZSGXgqITp61aGB/QbPnNGSuU+k0Hw1aowIjXGgvJI5BNs2DSwqDG5ZD9dCwnlkWLhYN+8lg8xozOXmQ6EB5ZZQyCYmmqtGxLrkwCco07LYU8McT/yyuJ303mp/gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6E0HLvd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6E0HLvd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A401C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 21:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780693791;
	bh=2VTfX0FmW35Ff0qOB/7LxJSllB+t/+YHMsRO08cF9TU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C6E0HLvdCjbgFZ2REc1ACysyJFakAFUDVhHuQYSuvrmY3Fsb2gNMqzI594invXNF3
	 fW9ut+XZMxRPJ+vSdH+KlDvaA3cQRhF+w6zp3rAT1RJLEf3cDeDW5ejPiTiZAaEgrP
	 7fOFs8N9juX6Z/e43aqj9u1qBSh8fxzGFvRuflOvdOwb/wUrC7WW2Ou3kkJ9PM0m3Y
	 +IyHhlARWM2oK76LAxSvYN0Ml1KAWSGFgn3Ji0TBqITI7hc0IcmbOGcbqOoKO+9hT3
	 oM2eb9yEAHWEPf5vOOXkWaw7kT7d89P/6Ax8a3EvsCpa+R6tEyzoBAaduSAhNQ/ZHo
	 N9eDJVDOGOMVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7EF9DC3279F; Fri,  5 Jun 2026 21:09:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 21:09:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-kPf5gWMXtf@https.bugzilla.kernel.org/>
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

--- Comment #27 from George (george.stafilidis@proton.me) ---
Created attachment 310277
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310277&action=3Dedit
stock dsdt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

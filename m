Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124E2874E6
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818868; cv=none; b=jqOaJC8bY6JQ4rkd3W9Hl0CdBvp6jEzfHpWSM+vRmtNKop8OuHXU6WsUB8IVkqP8DOEwu7egeMla7t4WQoK3y2aC5oSMC40OUYIQW/4EykkTm4Yk30yviy4PF/posMdeXLBC6EavjILQQ5CkPHcSP2yljaE63ymVrYB0hL/ywJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818868; c=relaxed/simple;
	bh=ZN8tZlPDFAYfsM3oOUF/bN10W2qN8QlOrH2ROyKoDKo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VXZpu0y2ZOXgZKN7G3JiOj6tjU5ytUu4bFhd3jB0p02U7hC9+tTYMaMnLdoB5GtqKVEIQGjteNYKEXt14kt4SnpxcGyQNcd5hKsuBICmpN2y3CLsxs77TCNcUTcU33HJN0jSFMKnKzZpuZocoatZKmMwvWRywjwScNtAj270epw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFQ3SdD3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFQ3SdD3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1790C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780818867;
	bh=ZN8tZlPDFAYfsM3oOUF/bN10W2qN8QlOrH2ROyKoDKo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iFQ3SdD3VbzX/NHcVIhpm28z85n+xo1lWFP8g3p36t4Tf+MPgvcehdykBvaUsBou2
	 eLQ48tv+JtQSVpPIfG/tcRaDRm6z4PewlTC07rDvF3W7FWccwHK15KwQkW/d0RoXt7
	 4hOodAcCGKQ+yDkOHZDLCQ01SU1k/2y1cbIUzv+WCglgJhyvAsPOF4DyiNsNCSlfb9
	 50Vt/21yaLYFHelqnlUFes0nAjoUb8ptidxjdUqmSF8/xVbtayKVpCxJbSNC2IS1dx
	 /vrEfvnTf6U5SiR6dPeADED5Vd8t9UPj2/ZlP/Gw0hSneOmOx3kprgYTCJHgzZJt8D
	 R4YF8K/PXa/TQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A7F97C3279F; Sun,  7 Jun 2026 07:54:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sun, 07 Jun 2026 07:54:27 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-mQOHSd2TYY@https.bugzilla.kernel.org/>
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

--- Comment #38 from George (george.stafilidis@proton.me) ---
Rong*

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

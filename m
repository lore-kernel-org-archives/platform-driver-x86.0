Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B53347C7
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 21:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777066019; cv=none; b=OzBwbQuRyw+4A5tgQiol15nNaqwZDEgRxo5fwbHbv/HNl/yXEvFkE/1TjNq6o9nQ0AQyGg31qh7EFHu/wgO1A4dYMvtXYGgZVQMaFT4tRFowuFoxM5F0W+fTapuxXfuTEc/a42X+XFKghQOoz+oWiZGiLYp+SffXpeOG8PIHpGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777066019; c=relaxed/simple;
	bh=Vno+slzF3Mw/1EY6kEQacvXnj2qZyEeE0mr0tG+/4v4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RQuG8lfc+GgS3N2/7aXpZy4sDhy39Ke9GBo5qL7aKoIGeAPzq0srmG7KbVP0NE7czPS7LJpqMyI08XIz4hll0FFcOWo2tYtScEy6/PWD3oDwq34WE2YPrb1W5XVVAiAz0aESheMC11JuxhEYSeN/Di8TzWjdA6/vTIC9fAXBELk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2BtOBJQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2BtOBJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35253C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 21:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777066019;
	bh=Vno+slzF3Mw/1EY6kEQacvXnj2qZyEeE0mr0tG+/4v4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B2BtOBJQH+d0GSIZh0AFxtEqJCaFpvCAjQCFMERE0vyOTg20Jz03BSgAps8Kwfzog
	 0NrJ+MvNn8P7NvP/R8ESmmLlm8UMoN79qHoUAHdmH5Oqy3mnPNBqCSz+A8TzYnNcTw
	 lHNmx2vrKT8hZx1OpSbLVIdqWmUrkas5Vkkr8UmrVHO90os2DzeB9y+H5/7TpBtpBD
	 gX+IhsFl/WM/pnyap7PKr3tovdKfUXFdAmYn5U7xDuCR12qEr13rPWTyXeUHrMCMDb
	 9ER4HDzm6DWpd94x2IZec7o0L0/jQlZ+YVsPaIYV6pBE85tY9nK3l5YxPe6c8B2KxZ
	 ugpDFfz/lDgbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2257DC3279F; Fri, 24 Apr 2026 21:26:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Fri, 24 Apr 2026 21:26:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-GMxCId63D6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #31 from Daniel Gibson (metalcaedes@gmail.com) ---
> Woah! Well play with it and compare EC and PS2 traffic in both cases.

How do I get the EC traffic, besides logging the functions in amd_pmc?

My understanding is that these functions are pretty much the last thing
happening before suspend / after resume, so probably not much should be
happening?

The PS2/i8042/atkbd traffic isn't much different, except of course after re=
sume
it starts a bit later now, and the functions called after resume (resetting=
 the
controller etc) succeed without any additional hacks in atkbd or PS/2 code.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469E31327F
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 01:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780623420; cv=none; b=J2ye0elTAcDCAwrN+IlA5VW0SIsrf6cSNEorT+M/oSAf+L9Z5sPwRgc4IkB6CKCp0r+PMStMQjB+rPfe3nzAHBfNMAYzD/RAB0Rybpmu62K4kO8hPrZG3w7xbZVczd0eWHtsgNEABf+DXHAbk1pNXo5YH18pBOJTpIJ+iFlVtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780623420; c=relaxed/simple;
	bh=/pRGkpeXMyS0onP/2DHDPBM+5SIqjXonRrERR3KZfks=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b/a0mNntgeEv2YVJitUyKFF7+ToQmVusq1ThMp8UF5Q20FiMTh8QCOcXOJcOplsQ6MujQ7gK9OYFwIv5c0mk52qGzZacNorcB5FwR4f5Bkt3pgXsKzbS1BnX7y28IzoiqN/Ir8b+V5rkh4G61XY954i0k4C0luNMs4xppbVC85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkbtdeGH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkbtdeGH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFB3BC2BCB9
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 01:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780623419;
	bh=/pRGkpeXMyS0onP/2DHDPBM+5SIqjXonRrERR3KZfks=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gkbtdeGHzEWys8Hm7ozXLgUpifqcHfpRhOD3IFUSjrq5ad27QVjb6PP/3peAfbNNP
	 qWBD9+yNAYcDViPd3Pa8+KqmjaVqrgVKdbl7yh3p/fdtcqJ6tIv6ArFCcC8N9oJkcm
	 PllOcxIDRq9m3D0vUSJyHPZ+EkJ3WO4vz0wA/wxjAZZTfd/x7WFEi5R5Nv+Cg+exnU
	 DSu0SP8uvwbir+rH0PWYcRGJpO0+FngoMOqtgU6CSf5L8QWvjeUjXMlFt8JgAd7b1G
	 gby5yHbLgFp43N+G22h0NwylhvYWgdmjLI/sgyw54WNP6cjNsfuYv34hwJOviZCsXo
	 MKo4Ytreso0LQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A378AC41613; Fri,  5 Jun 2026 01:36:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 01:36:59 +0000
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
Message-ID: <bug-221583-215701-JfvNs4NvHR@https.bugzilla.kernel.org/>
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

--- Comment #9 from Rong Zhang (i@rong.moe) ---
I attached a DSDT patch in my previous reply. Did you try that?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

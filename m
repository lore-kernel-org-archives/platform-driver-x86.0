Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C364087C
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 May 2024 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715070281; cv=none; b=mQ2xoObl0kJ2ENWiEf3qHgAlZmVnHLNPsOxw0i5tIZ0P6nj9taFXTOkh6tA7D7ZGRAnexIeo8R2vGBjlJVOgZAm9NPk+ZaBJIOdcDpr+GxRMiaW4q9UXTGgF1KoYsiJHv2VdavgxNplIcQHoUVJ+nWfrbqzm7G9C+alEKFvu6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715070281; c=relaxed/simple;
	bh=Bc843eJISY6lPS60DByulMkDi9n36jlaEeO50YGtT80=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uAtY3YpIB2zjIpUxxbDg+jC+2neYlZaZYaxXV5HcHEiFA9BSZ+KMxIPMEg2K9iyGhliG8zaY0j1M/WvYHKK37WQ+F7R6uCY2oTUOz1eBSXj0yFrv+TnpZXfGsxjSZqppUTFAcJg3FuHCudwoFicYv2AZ922AfHgy4f+Za3hGT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPaoggQJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPaoggQJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFB5AC4AF63
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 May 2024 08:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715070280;
	bh=Bc843eJISY6lPS60DByulMkDi9n36jlaEeO50YGtT80=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OPaoggQJ5E4mNbk2PKPKVA/wNlwCBU8JogNwY+TiNtxFSOgffEjVXhqbmgCDGaDfs
	 IPACdMSIY7DErWlVctGYYIJyJs7V3rJqVvuHlWiAJ/O4rraYpQbS+PCzptJt2CnW1R
	 hzblk116KJT4vLFgMVediupUgAI07a4rMt/MiU4Ro7rnPybbpqEfwz3FctXk6pF5yI
	 /Hk9zov0rx4V9tBmAyLT7DxEC/Z96CJKBdMarKZfL17Fz8asF5ClopUFXO5uM06fvD
	 aqnZZh8UElAn2NVIUZT0rQAT8G5VdsWRQbPj7jhJSV76TjZr+g9sIhclZbznhJYpxW
	 Bp3LqK2durV+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4C93C53B70; Tue,  7 May 2024 08:24:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Tue, 07 May 2024 08:24:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vanoverloopdaan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-rtubfg8xeU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #60 from Daan Vanoverloop (vanoverloopdaan@gmail.com) ---
I applied your patch, but I'm not able to reproduce the issue at home. When=
 the
issue doesn't occur, I find the same smn_value as you. It might be related =
to
the specific power adapter I use at work, or other devices that were plugged
in. I will try to reproduce the issue tomorrow at work, and try to narrow it
down to a specific device that's plugged in.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

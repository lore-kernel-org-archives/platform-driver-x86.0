Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CE026CE2B
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495846; cv=none; b=NwNWwyDj4wPD3Y80OjyX3tziiVOEVu/0zfn24CT4DARF9J8XGjeJsJtsExOCMuXYgUEPOGWZ6Vtu0dU2onLYG4hFoqYn/e4vbyKkHBgi8lw+ecnD8BCFZKL88xkNW6A2Bac1x8PKJF4t3le0tcX99T4mh7QfIVy5ktsWw7JPj48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495846; c=relaxed/simple;
	bh=FC/xEKCwoauGCYhJS0blW5hovPWmGXaH70BulS8lzGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ox7kTGzLi4vAX5o2FOYDpGhRx9t5OYDqmWXpmyvuuktTvkkfwTXYqVlKwe5jNwU9yvsXQ+YbgBOI794Qh0ljDY/hG/fM+s47zkFFneL3AxmC5qFj3PrJq/VAJhLBx2ZSrNyMwEp2/2oR31TzidL6i2GMqqwgKnPyTvo/kFUbkdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNrvStKi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNrvStKi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69EDCC2BC87
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773495846;
	bh=FC/xEKCwoauGCYhJS0blW5hovPWmGXaH70BulS8lzGc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WNrvStKiyvYrDm047qbk5OV/TQTXByUBeR6vdlIiAI+l7HAJrMP5KdlEQtYuFslMx
	 spiLIdP54FIY8Vot+Dft0iL7fZMq1Td4WvyvaA+XnWgBW+yP4Dh0EnaXcPlxTiUJ5c
	 UpO3BZKU9xXs5JnLO9GgSpUjsJc4GqKMbLKtJoYDXyHsjwNvhTi+jqSkTnSeBX6Qf5
	 ss50n2fjNxL0k5bb2wkaU5JcpeGNX2Zj6lZUdSS1mkKWsBpTQ9cffocfLs7+sKp/fP
	 ZiA7GnRqwxY6FS3gUO4r/HfZIfPpk9OS63EQVOAwfOSsVRnbtRUQq+8Ow+mr93A2zB
	 VF7UuF7+FY1Zw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 65717C41612; Sat, 14 Mar 2026 13:44:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sat, 14 Mar 2026 13:44:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-bEa6jIPTRY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #352 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Theunis Scheepers from comment #351)
> Requesting addition of ROG STRIX X870E-E GAMING WIFI to the
> nct6775-platform.c ASUS WMI board allowlist for stable fan PWM control un=
der
> Linux.
> --------------
> A full data tarball (DSDT binary + decompiled, sensors-detect, dmesg, PWM
> override test, hwmon drivers list) is attached to:
> https://github.com/zeule/asus-ec-sensors/issues/100

The dmesg log attached to github issue does not have mention about resource
conflict or applying some custom parameters/patches.=20

Have you applied some patches or custom parameters for the kenel? Could you
please provide dmesg messages before and after applying patch or custom
parameter?

Use comment #350 as example of patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

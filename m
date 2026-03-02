Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D5F3FFADC
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462461; cv=none; b=jc3pYlIxvMPRIVz/2ObrSHhNZBgMxSECkID52YE80THoIN13ldqxXQgXDwwt0cIiUnDW8FjhIF2Fwq5eTwgUqYUJ9lFKa2vS7MiHN2E8zxQNma+N/QngFKi/vBVoyxa9eVp/sui3ndVL8t+UNDWhHzKRKKq7Qz7J4odp3HALqLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462461; c=relaxed/simple;
	bh=9J8LrsMBG4yNjbOmbNBoEcmiibOGq6KkCFvOpYUHfAA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TNpieuU9+1uLbf/glcdAPQIiRZOEm0lvlwDsT8RzsoNO7wxgFsI0RzkxjNoysH+wXOzJ/a0j7HagIOrk5JB6eHCaHztogSf8OSN1FzNbaRYSpQtgO5HtJTzTMhdV68xo+Er22UHhEUXaDc8bl2AMXz/zsx5ydABClwWLqUiFYkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l19HtLY0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l19HtLY0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 858AFC2BC87
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772462461;
	bh=9J8LrsMBG4yNjbOmbNBoEcmiibOGq6KkCFvOpYUHfAA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l19HtLY0wig7/Flqqr4VcUbwSci0mA/rRD1QSQVsSYiL1V+O8UvRrv6WCgxhmxPtM
	 WxrujaUX5xA11NgE4kO1JXyvUIPOeUwx5lmpFhAgZaM4D7EkK8WGfo3qeneWeNS/U2
	 rQXlEVilguc1wIrQDBkSEO2tfle3F6dVCufXPUnRLn+Dzm667raOhqzI+R9NzNherl
	 ZyxuX3KJV0vNCfeZ/pSwXYcT0GEEq+dcyH8SWxnn/y3uKaMRwAYsOsJ9WHYF6/t4ne
	 7z2vJbDdmkHgM6PySvJj64wWaciAZmSjiP2vJx/kJzT3+VoDN1xXUzL62N6jPjeO6l
	 UgAtK7lPtTsLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 76242C41612; Mon,  2 Mar 2026 14:41:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 02 Mar 2026 14:41:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: team@nitrosubs.live
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-0MWSxiMI5r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #45 from fililip (team@nitrosubs.live) ---
(In reply to Avraham Hollander from comment #44)
> I didn't know you could do that with fwupd either. I'll have to try it ne=
xt
> time.

This only works for AMD platforms, I think, but all you need to do is run

doas fwupdtool get-devices | grep -A 1 "System Firmware"

get the ID, and then execute

doas fwupdtool install-blob WinPSCN21WW.fd [that ID]

with WinPSCN21WW.fd being that extracted update file.

Then fwupd will prompt you for a reboot and install the update from the EFI.

Intel platforms have an additional IME update and I'm not sure how that's
supposed to work, so caution is advised.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

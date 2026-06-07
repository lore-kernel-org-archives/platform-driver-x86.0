Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C433502B8
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 11:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831133; cv=none; b=NxuNVs62ZT8frscEGVFQf5V27BbSrA0yPyR0YGYFi4X6mVIt5vStF39uib8MWHg/8+MxFSK7ydlbZ8+w3D62yIx70n8oEmWzUEHfG3FFJ4IrT6fCnpxjIJOHsqd1B5x8FOfsfCQh15ah8EetZiPmfu0yj7xZCnyvXze3V3IpryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831133; c=relaxed/simple;
	bh=+8iNsP+yjYfbeALT8eL5vB1/LNr3BmwXvEn0aLq292w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I/162f+XSxi4qn7Z01OiS0Al7bHzHDBWBNfhWlkUGYLWwxNE3JuvJjwTRBS5NsH9yfXNNok7nNt+7qcLeKWBFvSfDCoIOyecfkvigokhDAPokzrTTrSQSly3KPTDVpT54jegwNLoKmGYk1k0yCbtB5YwEvPZjO6AbDPUAdDAJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwDhFLpX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwDhFLpX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB5ECC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780831132;
	bh=+8iNsP+yjYfbeALT8eL5vB1/LNr3BmwXvEn0aLq292w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IwDhFLpXOQyYS3zqBoOX47saqbhMONX6M9soVk7pxzWso4vpfV8bRvREIOIc/4vKG
	 9+gS7ZActKEIFv5U5IW3ZFUSw5zShCV2vf+rbsblJ3t35eA76inPqKcAJaYS0UUiLr
	 thIe87X7WEn327zu2GsXJbNkk91hlHyL1Pin3moLdSJY4TLurpBnCJIcDt3o/g6am+
	 Mdj4kQkrRQeeTXORJjiNLLLPNYm/QOYj/k6or2rPkAmZYg/1sqTWf0LAsktG4ZQozM
	 8btSCqQMw62Q7EfP8E/o9bhb8BqMY8IN6SNa9SdrT405Dq6HthOLKDx1oVv3tplQ1S
	 S0nNckZp56whQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8A84FC3279F; Sun,  7 Jun 2026 11:18:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sun, 07 Jun 2026 11:18:52 +0000
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
Message-ID: <bug-221583-215701-yycRKtv65m@https.bugzilla.kernel.org/>
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

--- Comment #42 from Rong Zhang (i@rong.moe) ---
(In reply to George from comment #40)
> Thank you so much! How do I close this issue?

You are welcome!

There is a drop-down box to update the "Status:" of the issue just below the
bug title. Select "RESOLVED" and then "ANSWERED", then click "Save Changes.

(In reply to George from comment #41)
> By the way, is there someone at Lenovo I could contact to ask what exactly
> causes the keyboard to switch to the =E2=80=9Chigh=E2=80=9D state? I beli=
eve Lenovo has
> started supporting LVFS, so maybe there=E2=80=99s a way to get more detai=
led
> information or firmware insights through them?

If you really want to contact someone from Lenovo, Mark Pearson
<mpearson-lenovo@squebb.ca> is active on LKML.

However, Lenovo only supports Linux for specific devices, mostly ThinkPad
devices. Since your device is branded as an IdeaPad, Lenovo usually doesn't
provide any support unless the same issue exists on Windows. But on the oth=
er
hand, Lenovo will consider it "not an issue" if your device has never been
advertised to be able to adjust keyboard backlight brightness via software.=
..

Sidenote: your device will reach "End of Support" on 2027-03-19 [1]. It's
unlikely to receive any BIOS updates unless there are critical vulnerabilit=
ies.

[1]: https://psref.lenovo.com/WDProduct/IdeaPad/IdeaPad_3_15ALC6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

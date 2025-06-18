Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF2E70830
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269901; cv=none; b=IoxPkQXJ8ASpFbJu5B+0atnS6BryDdOsoB4a0PCs63fshsBxl36ywfhhYO0PV8fY33NqZ4OvoSKh3HYSrdWqO5vnSaci2A66XDxMxPMfz/n24r3oiHgb8x1pYBtfEdK0F+A8BRMZ7/8ZpbzMoZip57HOQEfnMXGVpojQD6+jYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269901; c=relaxed/simple;
	bh=oBkIPbsSSXYmulHDP5dwoe1+4v+9fG8NOoNVUqIyg0Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hdEhtZeyhAw67Ks9tuQlybzZ2E32TS79fUtwI0qsSYLPJASkVRFQTw5o0SuWivhrfdmxygYJDKkJ72G6ihlsHPa6wCpV88VzzLOVAkG6H6b0G1Ka4lheCanOx2x6HGJlMuP5idXsRGqEanmPOtddJdf784a5mcy9G374Us7Qhpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OczAmuOT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OczAmuOT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED7E9C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750269901;
	bh=oBkIPbsSSXYmulHDP5dwoe1+4v+9fG8NOoNVUqIyg0Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OczAmuOTqBN5W6ZMNVZ2CoL+RRjtI5J9p7ZpRZqBULJ33PPSfwhBSlSQZZ7HanG1v
	 WYDSzLEqM8CpXho7WsME5j0qewN5kntzmQUHNPAUAfo0yeOlDqL7lBb0V+ATOqeuiU
	 UWW+A8XPbIC7GPE9GYSIS/KmEt32qd7znNygVHET+5XpqgutIWeoO0MfCH+h2s0y9K
	 xGm8w2zLWOUtbGkteVrpoLBeDHQteVvKJArmZDbyuZPATKBajaggmd4v/GgXy7fG3b
	 wEDyhItDIba5UF4cMDtuYh9s+tqvdkJ+HjIwpWtbF84KEmsI+4kfpIEGBe3xrs0LHm
	 7jCkDQfq8xkuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D5F3BC3279F; Wed, 18 Jun 2025 18:05:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 18:05:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-t5c9J5AAUL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #3 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
Hi Kurt,

Please find `libinput list-devices` output attached:
https://bugzilla.kernel.org/attachment.cgi?id=3D308285

The output is absolutely identical before and after regression.

Source of KEY_MICMUTE before regression is event8, i.e.

Device:                  Dell WMI hotkeys
Kernel:                  /dev/input/event8
Id:                      host:0000:0000
Group:                   8
Seat:                    seat0, default
Capabilities:            keyboard=20
Tap-to-click:            n/a
Tap-and-drag:            n/a
Tap button map:          n/a
Tap drag lock:           n/a
Left-handed:             n/a
Nat.scrolling:           n/a
Middle emulation:        n/a
Calibration:             n/a
Scroll methods:          none
Scroll button:           n/a
Scroll button lock:      n/a
Click methods:           none
Clickfinger button map:  n/a
Disable-w-typing:        n/a
Disable-w-trackpointing: n/a
Accel profiles:          n/a
Rotation:                0.0
Area rectangle:          n/a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

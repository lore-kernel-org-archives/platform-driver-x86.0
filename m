Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782E73B8407
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 19:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601590; cv=none; b=fmav3gMfwsBIEswrnkzo2TJcLXxmUGNpR4rWjsBeTkfS/e31kjpdX81j6H+YOUYMlIfXXu46NRHL11CUKA4ZefDI//bJwHmhHss8XX/TYL0l0qaxnUx9JGcPrKmR79VQBpU5Nw63ltl5dBNtP9bhBBh66Lh6sO168u6G73Az6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601590; c=relaxed/simple;
	bh=/wSGsDt/rw2w8BfS+GEBvpOXXImI2kd7+HUJgyIOWAg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M1aRgFJj6ihlEUpttWqUdm/KXX1ZPGSOk/kJvEMEde6LusBVagjrQUOC9JkF+Ur9PM3xzWMboqf4696YWcwMBRRn85EdoepWY63LQm53uOzN4Whky6Nc7B9NxDrt8oLw4zyPo1LtzEgGSCA06TaFILC4T7+ZWOZn0kUQIbcWZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKG+D0Zl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKG+D0Zl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A493C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 19:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780601590;
	bh=/wSGsDt/rw2w8BfS+GEBvpOXXImI2kd7+HUJgyIOWAg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BKG+D0Zl1lQL7rCmAojlb51CnoFzZassxum+QgaIHhExnCFWbeSH+AprksqOhQMbX
	 MORJWHO4NWtraBm/JWbgKE3OYUB55Lt+tA5Nn1+35tAtpfyUWgmiFleDda7OU7MILz
	 XPddm9zZiU78lYa/L8ranJlOgHk2OVKS2Vne7JuN31fmBR5lw3dzle2xf7W9I28r8M
	 wTkYoizJ0jtK1K2WyoE8pzpzaDuD592JG10qd80eJXU6JYqFXfBBUJapiqZOBv5U2e
	 +7N6da6ik7Xrk1wGhknTt92xZdZhP09KRC2blim7j1+Ybozw/mNFznQARyXZkIuzZs
	 bA2firqYjFJuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E516C41614; Thu,  4 Jun 2026 19:33:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 04 Jun 2026 19:33:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tacodog311@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-l65E8mzL2i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #78 from tacodog311@gmail.com ---
Fn+esc does not toggle the Fn lock.



Device 3 (keyboard) emits the touchpad event for Fn+f4 (without your updated
driver) and I pasted it below:

It also emits for Fn+F5, F10, F11, and F12



/dev/input/event3:      AT Translated Set 2 keyboard


Fn+F4:
Event: time 1780601208.236292, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1d
Event: time 1780601208.236292, type 1 (EV_KEY), code 29 (KEY_LEFTCTRL), val=
ue 1
Event: time 1780601208.236292, -------------- SYN_REPORT ------------
Event: time 1780601208.241476, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1780601208.241476, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
1
Event: time 1780601208.241476, -------------- SYN_REPORT ------------
Event: time 1780601208.243674, type 4 (EV_MSC), code 4 (MSC_SCAN), value 76
Event: time 1780601208.243674, type 1 (EV_KEY), code 194 (KEY_F24), value 1
Event: time 1780601208.243674, -------------- SYN_REPORT ------------
Event: time 1780601208.248840, type 4 (EV_MSC), code 4 (MSC_SCAN), value 76
Event: time 1780601208.248840, type 1 (EV_KEY), code 194 (KEY_F24), value 0
Event: time 1780601208.248840, -------------- SYN_REPORT ------------
Event: time 1780601208.257093, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1780601208.257093, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
0
Event: time 1780601208.257093, -------------- SYN_REPORT ------------
Event: time 1780601208.262320, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1d
Event: time 1780601208.262320, type 1 (EV_KEY), code 29 (KEY_LEFTCTRL), val=
ue 0
Event: time 1780601208.262320, -------------- SYN_REPORT ------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

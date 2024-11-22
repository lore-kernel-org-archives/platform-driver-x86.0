Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ADD139D13
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732286412; cv=none; b=X5ItKLsC9rA/e44Dv6to96XG5jUgv6JgP4Lu/s289fYrswDCpE/bGz6PZhIQGqd4QD+kiUuyJlafP+akCaWyFNqE+g4hxSGhv6SRQIvxDXxDF2XGZJQ/HpYutzn4a61PeAgDKuJbpEfADjSMR5Q1iWgwLfsoCCnAnZOSOIQVJRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732286412; c=relaxed/simple;
	bh=H1PRtuNJbV/gTfr2jeSQUGzYo5sq9cQ6GFwYlEltPyQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I+7Onaa4gAUt6o8QQFSU1KRDXFeEbL+25Qy0MUvt1qOIIF1hdDnmyxMKkXlBqq4hrTkitwXqEvJDKVPDjIb3ozFOTvO//6/MaWtPKj9Ew/Pkown630OVhC4oX2vjoZTmNxzog0fKyNHy+a9yHjSfattxvjymjuEr6j2JRVvt7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o20Az0ir; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o20Az0ir"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C97BC4CECF
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 14:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732286411;
	bh=H1PRtuNJbV/gTfr2jeSQUGzYo5sq9cQ6GFwYlEltPyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o20Az0irgBbPLuh31oO9VGVEWiD0ivhIEIc7HyRMR/tkbw4P4D2Bkg24Lkl3RCWmN
	 2AAOWvZT4oL8tZ5TDw78bY0VzCGzw386v+UU06of5czhsSxG7tMxOwZgWbV8lczGOV
	 kQK4Y56fNRFO5cA3kceolF4huM7T01FBntuEubjkElKSkwkqVk65XxqkQDJ5VjIDD3
	 ALvGjlh9jQeSde6n7d5DGdo9/Ssr2HVaXnHDE7EeLJmimVetF9KzbCKGQYT2sNuNI+
	 sTIJOPJ6B4R9dtNRin87DZOF4qdD4JcBpIsjfqohv/BH2I/dYpEuf0VkjOOXXoA+ee
	 E9yhGJ1j7qvzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8310DC53BC5; Fri, 22 Nov 2024 14:40:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Fri, 22 Nov 2024 14:40:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-VJOJsu0rEV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #18 from Michael (auslands-kv@gmx.de) ---
No, it is a single boot setup, running only linux.

Here is the dmesg from 6.12-rc7 with the truncated patch applied:

=E2=9D=AF dmesg|grep asus
[   12.756754] asus_wmi: ASUS WMI generic driver loaded
[   12.797541] asus_wmi: Initialization: 0x1
[   12.798530] asus_wmi: SFUN value: 0x21
[   12.798540] asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS
[   12.845043] asus-nb-wmi asus-nb-wmi: Using throttle_thermal_policy for
platform_profile support
[   12.860431] input: Asus WMI hotkeys as
/devices/platform/asus-nb-wmi/input/input11
[   12.909854] asus_wmi: using asus-wmi for asus::kbd_backlight

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

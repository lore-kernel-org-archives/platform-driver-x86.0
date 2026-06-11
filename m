Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834E020DD51
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204550; cv=none; b=gRgXwqYhHLUxj3kWiD7vNVmSj4KrfWQVsKfb6pD1aEEyQDlvhy4Lu3IOeMD0s19nSGDuXp3qEm7UYaeAaj7xRbPiKey0rxZi6hm/AENEDYMTdHUHNitve+MUk9LyQWBpKKVM6UNOaK3joP2+flSuZVvK9rdhGMj1EVwsbW/iaek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204550; c=relaxed/simple;
	bh=tDhiavCbER6pqnjpsA2MNdBFhPPTI90oa8OIL6vEUGg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I05Xzy3TEa6w7O4PssOCyxvtZrR+TuP/AzUv2dg0GllE1MOpuzYLoCAzfZD7nKsOn0aoSRUpkOlIPNs+PihthPCsJpFPZAFqSzcosABLbBrWHgzYX92sDhsZx4ggYFf3wXSnMSMOqVf9GD3aap4lgf/m5RInTVmkpB54tsnOSeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WV1LC4ot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WV1LC4ot"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 288A0C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 19:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781204550;
	bh=tDhiavCbER6pqnjpsA2MNdBFhPPTI90oa8OIL6vEUGg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WV1LC4otnDO6MlHpgbT1cC9gsRX3/z/VX0wLerNQKR3HG4Lco7IpxzCGUch1RLLl3
	 Os3tK0D1PyV4ulHg9xy4l1AOEhh8Immy4zCjgwIMeSIfHDsK/PYt9oFa85ksByqelU
	 4hc+7bxiukv/afvMz4mVpNA7OIFEpUh0GEhqvyT7zeHRbvtKZiF3nVCrp/Gz3z5D51
	 TFP4XC65pmZfICduAOFgAlHBfzL3cmlfT/orLGIaadOv6+McJ9fsz5lIL1CevRgxI+
	 vuihFsn4ex0umefSBo+KuHV52xI8m0iDp1RPHrJrIWrsXwxpHWb3oqNaWYkUUWb1pT
	 3QrrSIugVJ78g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0C10BC433E1; Thu, 11 Jun 2026 19:02:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 19:02:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chgenn.x@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-sKTQzlGFNw@https.bugzilla.kernel.org/>
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

--- Comment #91 from chgenn.x@gmail.com ---
When I switch brightness using hot key, gnome shows popup with 0%, 50% or 1=
00%
progress bar. GUI slider for manual control doesn't have any values, just UI
slider. For my eye, logical 50% brightness looks like 80 out of 100%.
Corresponding values via terminal are below:
evgeny@egramm16:~$ cat /sys/class/leds/kbd_backlight/brightness
0
evgeny@egramm16:~$ cat /sys/class/leds/kbd_backlight/brightness
127
evgeny@egramm16:~$ cat /sys/class/leds/kbd_backlight/brightness
255

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

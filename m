Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32B34C6F04
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 18:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781202322; cv=none; b=iPctlEBl6w4EVXhduQt013u4IEQvDnvKooBMh3C0PVSehLe/4f2xlvAQK4jEkGZeCiZGxjCvgsCHF/8AVpbQA3XN91NEpx8o68c3/Bl654VPOdlBTFntV6LBxBRhGnB1jA3D3TgICx41qF54QpATgYFQnXGSX+OROPNet/dxDjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781202322; c=relaxed/simple;
	bh=JelCScdUsuyAUxMqd1koyF2b3sT+GFsemCHlQCkAEm4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fWJ/XlEOdYF3yo6FZL8NpmarCeovTnnHGnCCuqfaAxLk8yuaDBoYe3l8igp6xCFivxjCCZ75XiaWCl0QkOZ1gtdcOO4OmF+fT0sZDmvAKSOqtRy2Q2CaT5I39kT9mEMJddlqGTC+lywxhEqoyfeuT4SekA1B/doaChiXS6KkWuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQwq1mhK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQwq1mhK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F369EC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 18:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781202322;
	bh=JelCScdUsuyAUxMqd1koyF2b3sT+GFsemCHlQCkAEm4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pQwq1mhKet/MewOdMrYNTka0OVuMAH4lLuK4+nH53tEbdsOQvTd0kq5th9vehF0op
	 3MUCemNQiLIFtgk/S8qvVQwCSClSh35BLdJR3mQzfjliwmeTyo6RXxQnc4mSe00b5L
	 EPddopMIoV9PyvXPtwgGptnZHtbBVdJm5tFw7MItVkZWd7+Dqi+Ay+GQLuRTHisfVP
	 DbWCEHktVdTPa2qXyLeanXyIO4U4KKCl9I7kuSvTtIX926xUo9lNA7y1eu8DIPqEwJ
	 QXkeVOVtOt1FEHtA5Y92YZbK5fuHdcmfXu720cEDKgQvMzmQoiuwXKtGKTQ2dzKMZ9
	 FlUOq8E8fpPtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D3B44C3279F; Thu, 11 Jun 2026 18:25:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 18:25:21 +0000
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
Message-ID: <bug-218901-215701-cTYQznOv14@https.bugzilla.kernel.org/>
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

--- Comment #89 from chgenn.x@gmail.com ---
On current config (Ubuntu Gnome shell, Linux kernel 7.0) keyboard backlight
works. keyboard backlight toggle hotkey switches between off state, 80%
brightness and 100% brightness. Ubuntu Gnome GUI provides slider for keyboa=
rd
brightness, but it actually provides off state (for 0% position) and 80% (f=
or
all other slider positions).
Screen brightness and sound volume hotkeys work too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

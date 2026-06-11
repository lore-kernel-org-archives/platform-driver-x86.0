Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C52F0C79
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 18:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201557; cv=none; b=GBNv0UD2YLoZfj7GIomYlplzksu3e7bHtMJ6la3NhwMuwNUlnLIkU6jPFwLQh6WMYZhV/ovt2d8UzLU89BIWtdCfGOwsjhV6HmHUwMFHAw5XU8AQ8ngW8nlotWZlxzvLQfnb4tqkJN1gA+eWT6CduhE24dhKIZPZV1OLwuaHIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201557; c=relaxed/simple;
	bh=kd0T2CzhvyA2qIFk2evOzW02FeO2y4DPyJLULXcFvdA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s5QqNfcekYLMALEKWYZy5PYb6VWSwRPEf712WHPlrZt9E4idxdDHWe3YENibmQKPhDL4ErE/t893f166AxVYppm/UV53y0Nb25MgHGn3LIXzwX8xrCEDY91ofGWET+KAKc6bCoySn55V8bWqgF5Lg04WI+IUjOIPSDBRgO+RnUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hp/wtDq8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hp/wtDq8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57CF4C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 18:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781201557;
	bh=kd0T2CzhvyA2qIFk2evOzW02FeO2y4DPyJLULXcFvdA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hp/wtDq8MYVboVSkpf8XGFEd1NKXlxCK6r0j5ob5hdSdakMh8F4MR/oleuHrMyJkp
	 EhXFj5UOjh51jtv5/AKkPvxMRKAMfG1oTyc9k1iZCFbhwiZSTKQsofOHwFeZjlrPmb
	 Fzu+/VquNLIybEEJ7XpQX6fEHyf9DGqMEdYS5IhnKdQBVTWiSRjSzx1XpmYjYrDh0D
	 jP2gTvNU2/cHDMKd36Kqn5bHu2j0VY2qEV/KpKk6wzXkQuEWv4i8jw3lgPTgPpLrWP
	 Z0So0N1y0fwlVb1EcVShjdLfv37TY6Mre2Lctk7x8C6Kw5yiGI5fYSEWxi47zlKxra
	 N5Eeg6kjrddnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A957C433E1; Thu, 11 Jun 2026 18:12:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 18:12:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-lUGihKsnWR@https.bugzilla.kernel.org/>
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

--- Comment #88 from Armin Wolf (W_Armin@gmx.de) ---
Does the keyboard backlight work on your model? Does the keyboard backlight
toggle hotkey work?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8311AD3F6
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 20:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727987363; cv=none; b=AAlsDBSfX1zWJ42zWfOvP0xGB5piuwRHe86TleRH43FSzrFl43LIBbOD2n08NLxV8Rj/AvzdG/IZOGPcHcZ0iA5h7sZcpTreDtOi072CWanYooV6YESRePPLI4ncxSiY+f1/6AAYIViK7WRUB6HxdO4+BzMvbo9R+QOBJG3gFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727987363; c=relaxed/simple;
	bh=CRZPjGHpFRzjMdemksU1s2zIHepXvuLiqVjufN/9C+c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bumJWUyYi97igX7Y+eEr5R53zw8HA8efrW2kNYGXTtdxP1kQIh05+TGYE1hx25xsVuq8O2A4l+BFiGM6+AHW0nA6CpYAtNA9pk44U0I8Vh807EKj/mdKbdn/iygQ7WWRl+DSeooIS1BBboIoRGzhIPI+qLgWNpXFG8+FaAQ5bV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA0emDsP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA0emDsP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E11A9C4CEC5
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727987362;
	bh=CRZPjGHpFRzjMdemksU1s2zIHepXvuLiqVjufN/9C+c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dA0emDsPdAWnA/NWvttg36T04k9fo8KvggeQ9O7PLdNWvNlBFlaEuzbAhCm4c/Bja
	 iQnNfGvaE745dRB0fUlZNc112eORaLl5UB7GBnKJJZwmQE0dCCpbva13Sq/3PkWcoK
	 j2bdat32ktwMxy7fCwA9zIQQsOjBdaQ3AWlMvNvwEBOHJ9teQF+tBRlBm0Fxbaoq41
	 1T3XI/MrUsR0s0ltnru+mIdx2IEPdiVmd0HpwLPUQ9rTOe9Nqn1LifbA8v4e7wo02A
	 +YLIYH6jQ+leBnzi1OtItbDwq8ZSQaxYjRCe5YqLS+VimkjNyWcVleFlEQPAIG6Az3
	 1op+NMN8pZFeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE2B4C53BC1; Thu,  3 Oct 2024 20:29:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Thu, 03 Oct 2024 20:29:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219346-215701-C1yHsuBXeq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219346-215701@https.bugzilla.kernel.org/>
References: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

--- Comment #6 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for testing my original patch.

I have now submitted a patch which outright disables the ACPI PM timer
disabling on any systems with a Sunrise or Union Point PCH:

https://lore.kernel.org/platform-driver-x86/20241003202614.17181-1-hdegoede=
@redhat.com/

Please give this a test and let me know if it fixes things.

Once I have confirmation that this patch works better I'll send it on its w=
ay
to Linus.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

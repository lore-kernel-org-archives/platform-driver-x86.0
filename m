Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C503E5ED1
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839266; cv=none; b=ONVoYYCJvDT3SDJhg8m6PDQtrkcF+pzDaVdZASghvug8jCkeiXlyTq9toFlhfq/l7JmP5Jr5SGvf4jmz4VRov2CV/+vjMdJXg2WAHnFo6DkjxL0y/RIcDFlIeWGxKD09EOgI9RY7SDSzxWg0i1cIB9kikXUlWkIKLls2QoraHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839266; c=relaxed/simple;
	bh=LEYUM4yeOoSDXzQz/K8trPuSx559dqA05k4tJdu1IE0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PC1u5rYCfsAkL8VhZgFZ/Ig1zltNMalbOV04MQDtHveflWFd52xjwKr1mQoUz3WSdzpHWgG1L1N4Ez9R6jQWhj21VM5E3d8ZzzI27KqO9ejRpeVlMXY93AN2e+n808iDjRf+1bogmXohvGRFA+ZfQ8MawPo8p3cn+GMbiMCsYDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMrxtvGD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMrxtvGD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A8AAC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778839266;
	bh=LEYUM4yeOoSDXzQz/K8trPuSx559dqA05k4tJdu1IE0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rMrxtvGDPRJ7V1hzGAdWXhsSJ77WPICyzCwqD4jmLFLi3CBkON2QyZLygFW1ehrbt
	 LnW6yCCRIIl5awHIBUOPF7HLiegf0L0zJ3XwRdD6ZiqbnRvvZl6YpxTNoUGEZ8Cpbw
	 3omA8YtFWkcjvWMdl9PW67ZAgmPwVt1GZsSLkSHhHMeRXMh53elOiVxVpJmZ6TiKau
	 vKxk/AH97Q/sOiFcK50dTOB0xjifAzHJ3sjnfld0K5wxbFFAH/P7kERDW7F+i0CHpW
	 wZqwTNwexBINmTH2Ez5qMUAjZ5JW9fHkwA/nQ0LKwvXxNTKdiaf0BEzPdIXBWiyfb1
	 Uknbv9bvyi1CQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6A76BC41612; Fri, 15 May 2026 10:01:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Fri, 15 May 2026 10:01:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221430-215701-LJPWLL24Ao@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #12 from floquimaurice@gmail.com ---
Hi,

I opened a ticket with the Intel DRM team, and they analyzed the drm.debug=
=3D0xe
logs.

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16065

They confirmed that the VBT correctly points to PCH PWM, and the i915 drive=
r is
doing its job perfectly. The logs show the driver successfully calculating =
and
sending the PWM updates to the registers (set backlight level =3D 98259).

However, the physical panel ignores it. The Intel developers concluded this=
 is
not an i915 issue. The hardware is deliberately ignoring the PCH PWM regist=
ers,
which perfectly confirms your initial theory: the HP Embedded Controller is
waiting for the \_SB.PC00.GFX0.CBL1 ACPI trigger to release the backlight
control.

Now that Intel has officially bounced the ball back to the ACPI/firmware si=
de,
how can we proceed?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

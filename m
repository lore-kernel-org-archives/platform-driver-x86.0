Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4153314BF
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 11:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548610; cv=none; b=iSzh2wQTV06djI0pVO6ZyIXXSTA9DEtK+12QKRA9ryEoAqVL2C4qig2L/sGbn6cFx5LoSB3CUbxQkG4s9C+JcCnBzZCh9n36Wj2GudQZBIkfaTFL/QAsSzY8yyOuVoIUYhECOljaAIMxqMgaLmMFdVz2LQcTEPdEYM0yfqxrtGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548610; c=relaxed/simple;
	bh=dh/NoBRRwjnP9L1KqBbR6rs7DyVxCkp/NNbJrKEqL+c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AecOSk1AHud707mpgv+VH4qhIxQlb91htAAOAsj4B/hE0Oh+Q4xguOG8okdcYpW39LUBNoJRML5ezSr4cdtmztXUj9OL1qXMj3Q2ZfZPZ38563vtZfjer1ssv/7qPeXu+wmdJULTX6q0jRRbW3Z8dN6ICHaCyELu0c9P6XR2/9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V27b6h9l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V27b6h9l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BCFEC2BCC4
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777548610;
	bh=dh/NoBRRwjnP9L1KqBbR6rs7DyVxCkp/NNbJrKEqL+c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V27b6h9lDQuAxswKmyUTBMpuZoECEsUPvhpi5fwXN9Dp+0oiqEfyTBoVq2sByYk+Z
	 kZ/Ho4Z6BgQuP4SvDfg/10vqFCePqsfb3SnokSTCRDxrYSqXJZzsrXLzjWYdSIAO78
	 69TInD2SiBM1jP5v8Y+PxP0wXb22fETamWPCpHis7EgK3M9OPxmDIuYbv/fPyiTl6+
	 5PmeWqfUqykyIjnr7JJc2n4RBJKS6wSfVx5Mpacev2J+McEQDxJ+DlL2qY42AeGgae
	 qmDtI8OfCLQu87uK2qMuQtRqRFFpBYY+cjxKeBWuwl+AX8WjYXaXk30D/m9IkcKTJK
	 jGyKsU0Kqdedg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 790B0C3279F; Thu, 30 Apr 2026 11:30:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221441] asus-wmi/asus-armoury warnings on ASUS FX608LP: no
 matching power limits, fan_curve_get_factory_default failed
Date: Thu, 30 Apr 2026 11:30:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fxzxaxon@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221441-215701-ViFxfoge4U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221441-215701@https.bugzilla.kernel.org/>
References: <bug-221441-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221441

--- Comment #1 from fxzxaxon@outlook.com ---
Additional information: I also noticed several firmware thermal zones faili=
ng
to report temperature and being disabled on the same boot.

Relevant kernel log:

  thermal_sys: Registered thermal governor 'fair_share'
  thermal_sys: Registered thermal governor 'bang_bang'
  thermal_sys: Registered thermal governor 'step_wise'
  thermal_sys: Registered thermal governor 'user_space'
  thermal LNXTHERM:00: registered as thermal_zone0
  ACPI: thermal: Thermal Zone [TZ00] (28 C)
  thermal thermal_zone2: Temperature check failed (-5)
  thermal thermal_zone4: Temperature check failed (-5)
  thermal thermal_zone5: Temperature check failed (-5)
  asus-nb-wmi asus-nb-wmi: Using throttle_thermal_policy for platform_profi=
le
support
  proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002)
  Consider using thermal netlink events interface
  thermal thermal_zone5: Unable to get temperature, disabling!
  thermal thermal_zone5: Disabled thermal zone with critical trip point
  thermal thermal_zone4: Unable to get temperature, disabling!
  thermal thermal_zone4: Disabled thermal zone with critical trip point
  thermal thermal_zone2: Unable to get temperature, disabling!
  thermal thermal_zone2: Disabled thermal zone with critical trip point

/sys/class/thermal summary:

  thermal_zone2:
    type: SEN2
    temp: unreadable
    mode: disabled
    trips:
      passive: -274000
      passive: -274000
      critical: 80050
      hot: 75050
      passive: 65050
      active: 60050
      active: 50050
      active: 40050

  thermal_zone3:
    type: SEN3
    temp: 45050
    mode: enabled
    trips:
      passive: -274000
      passive: -274000
      critical: 80050
      hot: 75050
      passive: 65050
      active: 60050
      active: 50050
      active: 40050

  thermal_zone4:
    type: SEN4
    temp: unreadable
    mode: disabled
    trips:
      passive: -274000
      passive: -274000
      critical: 80050
      hot: 75050
      passive: 65050
      active: 60050
      active: 50050
      active: 40050

  thermal_zone5:
    type: SEN5
    temp: unreadable
    mode: disabled
    trips:
      passive: -274000
      passive: -274000
      critical: 80050
      hot: 75050
      passive: 65050
      active: 60050
      active: 50050
      active: 40050

SEN3 appears to work and reports temperature, while SEN2/SEN4/SEN5 have the
same trip layout but fail to report temperature and are later disabled.

I am not sure whether this is related to the ASUS WMI / Armoury warnings, b=
ut I
am adding it here because the same boot also reports:

  asus-nb-wmi asus-nb-wmi: Using throttle_thermal_policy for platform_profi=
le
support

No clear user-visible malfunction has been observed so far.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

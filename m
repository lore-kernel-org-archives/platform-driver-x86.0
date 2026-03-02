Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE8435AC34
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448994; cv=none; b=EvIO8ljBRCXuri6++3iCNZl0WifGUt6rvl9353LEkQlcsszmoYeNN1zFSBBBOXAGKxGYtM16xkMR5aCGc3WEirKwsH7hA5fzs43rVFcDD9iFnw8Zc8klSDWPlG5U5H97TrAFszj6z3GemVQ4lrPlOiN3mE1i7LCflXmogcd5OO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448994; c=relaxed/simple;
	bh=YRWe7n5pZ1JdGO6Th7PNJ9CwSrtDFLqiNEGy11hZF2c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KNftq7pEmGOGaGUYYRoonpYc59EJA8e13oSeM+pUDApJSydLy5bxeAxDHYPq9l+nTTHH7MrkL5zlrrvUbzQgTMRayuTrFIN4m0VVNBRgqaBeKr1Zi9aNGGf1qchXEkRyotPrbob8fKi+YGD48M55Z3Gytm2VZmj5tvrDquWwARs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkpIzl7v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkpIzl7v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A360C19425
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 10:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772448994;
	bh=YRWe7n5pZ1JdGO6Th7PNJ9CwSrtDFLqiNEGy11hZF2c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UkpIzl7vXa3IcrhZWMmDx3l3Tw/snHIU/lGuCxV1y/TLXzxMG5e4hH6wVMMNoTrAC
	 a50mlWv96+k3LPhUvDFNJ9fMB6gQd7L6Vev6ls/jeTjHCcVpldLyboLypoBS68XQFh
	 VRptUikpVytoKInLJJk88B1M+IW3QExwN0WhTW9SoqPDq932z17QF8uGv9fDWSqFYA
	 gY992jJ0jz6UCR1WP0tfYryw4feo5KK+uWmaMOhlTT6W5nEB7SRigsOidTVf0k3vri
	 HljpOXDFVpHhBq/6M2lgw+/TWRhJJLYlhBCj51g5IecKtAYtEMKFNCUYgZGh5MYqe/
	 8JNot4uXmkQKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 29012C4160E; Mon,  2 Mar 2026 10:56:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 02 Mar 2026 10:56:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: team@nitrosubs.live
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-2K6mYNxW5A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

fililip (team@nitrosubs.live) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |team@nitrosubs.live

--- Comment #42 from fililip (team@nitrosubs.live) ---
I think I'm having this issue as well on my 83HN laptop.

dmesg says:

[   48.931988] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast]
and [Long_Life] are enabled

However, listing the contents of
/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00 returns:

camera_power       driver_override  fn_lock  modalias          rfkill=20=20=
=20=20
usb_charging
conservation_mode  fan_mode         input    platform-profile  subsystem
driver             firmware_node    leds     power             uevent

There's no charge_types file.

Is that intentional?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

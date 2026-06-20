Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0429212FAD
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781952451; cv=none; b=QStCsptuqFp0M1DMnjRDNGujov5JGBuOfE1lvUajETafIdemI5Q/ec9zOlkkXFzDP9qWRa9hll4QkVJWtUm1N6AVUzATLs4MPFRlH6VVvaer4Sm9L/y4UlNpxHAT7RQ7IG0HAkvZYk8xLvgraA8kmCZT1ZQUK05EYe6Bps2dQlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781952451; c=relaxed/simple;
	bh=06mD+tfYLdFWN0g/GrPlnhR1VTutNNBZk4ZHxHKWLIo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=npi8gYticCqjM3q5hzk36OdwiJs4ijL7MgEWHfg8H9oKD3EQX99jDD/RqsJe2I0Dt646TZt+n0WCE9nRrWAGnvoiJUACwCJkmPfVgpgvNfyRcFuPe3S8Kc02AXEnE4B3PUBGUmoBGd5XLa4xaPtO8aiQWwr9T7anGbUw9M1HM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiE8FezU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiE8FezU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E6F4C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781952451;
	bh=06mD+tfYLdFWN0g/GrPlnhR1VTutNNBZk4ZHxHKWLIo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UiE8FezUA9LVJY0qTZxoMZt6FpPT8+R1OBdfHfDMrimvQkDzn38bH5gPINlQqidAJ
	 /z7E0znl4h9n3GcAPQfm+s4GWAKCoVb/NJ7Jvru6OxbvDuSoQl1S7GWEB0gYYJCxHJ
	 DO3ZitvDWbVvNc+fLcRLwmHRE/4Zx5qvI3zRFvJ3x1fVTb2LIrbyaWi6BIeN+E4FwS
	 WBA+BPHHUpN2zoXgti4L+RNiBH5LLuo0Vg85TF556DucMqZpeuPpK1xkmnI6hPhhxp
	 TVC4po9E7c1aBItj6wMNEs8okjnShItKc7idXidOWg49by9HVXuXxITiQyolxbABQd
	 jimU2bIpfji+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4DA71C4160E; Sat, 20 Jun 2026 10:47:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 10:47:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-odt4i2xRNV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #36 from Marco Scardovi (scardracs@disroot.org) ---
Thanks for the details.

Looking at the trip points for acpitz, there are only critical, hot, and
passive thresholds, but no active trip points. This confirms that the OS
thermal subsystem has no direct control over the fan via ACPI tables; the f=
an
is controlled entirely by the Embedded Controller (EC) firmware.

Even with the CPU idling at 37=C2=B0C, the MediaTek WiFi 7 card (mt7925) is=
 still
running very hot at 79=C2=B0C. In many modern designs, the EC will keep the=
 fan
spinning at a minimum speed (2100 RPM in your case) if any monitored compon=
ent
(like the WiFi module or NVMe) is hot, to prevent localized heat build-up.

To test if the WiFi module is indeed the one triggering the fan, you can try
this quick test:

Block/disable WiFi and Bluetooth completely:

> sudo rfkill block all

Wait a few minutes (with the system idle) to see if the mt7925 temperature
drops.
Check sensors again to see if the WiFi temp drops and if the fan under acpi=
_fan
slows down or turns off.
If the fan turns off, it confirms the fan is triggered by the WiFi card's i=
dle
temperature. (You can re-enable it later with sudo rfkill unblock all).

Additionally, you can check if you have any exposed ACPI cooling devices in
sysfs:

> tail /sys/class/thermal/cooling_device*/type
> tail /sys/class/thermal/cooling_device*/cur_state

Sometimes you can read the current fan state there, though the EC usually
overrides any manual changes to cur_state.

Another suggestion I can give you, if you feel confident enough, it to open=
 the
chassis and check for dust around the WiFi module.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

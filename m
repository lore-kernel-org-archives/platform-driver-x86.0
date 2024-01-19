Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F09537E1
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jan 2024 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705672369; cv=none; b=ZFW3WqDpCMMBH8Y/ow9+PftwajAeM5XDN+00lA0Q2R6JpcKIcbY3oL/oYYBSLUgtZyajppCrEgdLYIYeexaWg6EZNDrH/NJVYt61RQJ7fJcBYrIzMFghQKoI/zDgxgHgdLSiufI6T5d9v6tP20N5sxzhUMCvGTKM589K3vSkuXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705672369; c=relaxed/simple;
	bh=pANndPhf5k3u+0ddKuJ8Ty9CaeUUAKE+9bfddfr1IK0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ggUUhw0xRBsmQN7U0ZjiyY3W28/H2GYLl9BtMME9zRfEX5nHwtKJQr5CkWgb5R1ngaGARt9biKp+pgJQjsArRbZng7HWb5/nbFsGDfEX0e8ul4nXm5Lta7GLmWE1OR3GtTHVCcE10GXgQg/liObTv4+w2zawkdFptcKjAQb/f30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odAbZnW4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odAbZnW4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB2F1C433F1
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jan 2024 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705672368;
	bh=pANndPhf5k3u+0ddKuJ8Ty9CaeUUAKE+9bfddfr1IK0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=odAbZnW4U5tjUIdHNJLVSQr3Yb+WyJh0IfliWNLSJ4GPXHjbuNZOs8tzeGKAyFzoC
	 rozlEMmKF3020D3igygWCFp8F+2TLTXshfUNWhocsjXzbHDJ7cnNONKhSa2TD0bdN/
	 DKI/001VzVhkAbS4irxrYW5X4p75erY5z5isIQ60y1WAtRlYCeslwQYmJMEb9z1hRn
	 gOfeO5rk0AtQkypacIfTZxwYRJKg5IG/OtyDRRme8AcH4/doLGP2G+xLRz2w5dGCK3
	 kQsYwZTagmJiCJ+DTnTShcWmdoupNP15h3r5mD7iS7YJ8l0MQOV4iMHMqwB8NQuNgy
	 G1pfBdJxajebg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 92E51C4332E; Fri, 19 Jan 2024 13:52:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Fri, 19 Jan 2024 13:52:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dan.martins@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-gpLpnMkDPS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #18 from Dan Martins (dan.martins@zoho.com) ---
(In reply to Mario Limonciello (AMD) from comment #14)
> I read through this thread and I currently think that Artem and Dan have
> encountered two separate bugs.
>=20
> @Artem:
>=20
> Under the presumption that ryzenadj is actually retrieving the correct
> values for STAPM, PPT FAST, and PPT SLOW I want to ask if this is tied to=
 a
> specific power adapter, or sequence of events.  Like suspend on power,
> resume on battery or suspend on battery resume on power.
>=20
> If there is a linkage between any of those, then I think this is "most
> likely" an HP EC bug.
>=20
> @Dan,
>=20
> Can you reproduce this if you manually always set the scaling governor on
> all CPUs to "performance" before you reboot?

Mario,
I just tested setting the governor to performance before reboot and yes, it=
 is
reproducible in that case too.
1. load the CPU and observe all cores can reach ~4Ghz
2. set governor: sudo cpupower frequency-set -g performance
3. reboot
4. load the CPU and check frequencies: on first reboot, all cores hit 4GHz
range. On second reboot, cores 6-11 can only reach ~1.7GHz.

This is in-line with previous tests. It is inconsistent, and various power
settings don't seem to affect it (epp, platform_profile, scaling_governor).=
 It
does seem much more likely to occur when on battery, but will stills happen
sometimes when plugged in.

A couple of more recent observations:
- I don't need to toggle from performance to powersave to fix it. I can just
"sudo cpupower frequency-set -g powersave" even when it is already reporting
that it is using the powersave governor.
- on reboot, the scaling_governor is always showing powersave, even when I =
set
it to performance before reboot.
- Using kernel 6.6.11 as of this morning for the above test

Thanks,
Dan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

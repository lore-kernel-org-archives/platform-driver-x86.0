Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501FE1ACED5
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778891626; cv=none; b=lL/HMMatsdXPM8+G9AvLHi3TZtYOPpWH9JY9gdf+4Dom761ehft8fA04zy43iIfdYyoeLhH71pj7tamhnhRlYcZ4MPL+SDS5tOGHcVqqtr6hA3haVIUZ4rjTYlqyuACAYF29kac3DrW2B/eV2Ah6KBgmh7TmjFDE5k7BvIhf+2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778891626; c=relaxed/simple;
	bh=hat7dZq+w8OU/JoJ3y99jz+e9sK125AF8GkLJ1OS+hk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=swj9v2xn40tppkjtSUXh/LIiR+6Vqw/cxiLh3RNPF+Be8SqyN8bu2Zh9U/0Cf5Ys0mksik0K0SYMKML+wDNBN1dE5RJLtLBx6RJQTMnNjjOhRjAWbRv2ImR7tS3X05xL6PVYnb73QHtD6ZlwI2nZOzwC5jHPZ9MSDu6esKqaE/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqQwdwms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqQwdwms"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 022E5C2BCB7
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 00:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778891626;
	bh=hat7dZq+w8OU/JoJ3y99jz+e9sK125AF8GkLJ1OS+hk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YqQwdwms/Kt9vEBCYKDf/ziguHkwCVEHwQ+CoMb/ZQ3L/CPRMfCvsFeSj/kN8r85u
	 Vw3JRazCRd36ugxmPjAuE1teZRu0H9z18DZInpUleFIHTnwKvWtJ4msyo8R7cjwrRe
	 ltiPNZazDGTjZe1VbIDmbPVvV57uB3T2fthiovND9+llexPSAyfx8pgQ1bQmL5pmJI
	 M9INbYQkCH21hXxVmCQwoPUlWza3dLfAPUI9O0BAISXQ28vWDN36Zrgge2Y4cy7n4w
	 3GzSyCuYibPOVbfeWJqQj/ZBK5RzkDvazmfYPAENeXfyUhWeNveKX5cZVnNnLA30+3
	 fQUQQkNW9xR7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DC359C433E1; Sat, 16 May 2026 00:33:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Sat, 16 May 2026 00:33:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sivasli-ahmet@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-rAYZvGhipW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #5 from Ahmet =C3=96zt (sivasli-ahmet@gmx.de) ---
(In reply to Krishna Chomal from comment #3)
> Hi Ahmet,
>=20
> Your device ID 8E35 was not present in any whitelist, which caused platfo=
rm
> profile switching and fan control to fail.
>=20
> Could you please apply the patch (attachment 310134 [details]) and test t=
he
> following:
>=20
> 1. Check dmesg for successful registration message:
>    "hp_wmi: Registered as platform profile handler"
>=20
> 2. Verify that fan RPM is readable and controllable via sysfs
> (/sys/devices/platform/hp-wmi/hwmon/*).
>=20
> 3. Verify that on changing platform profile, and it does physically change
> the amount of power drawn in the CPU/GPU.

Hi Krishna,

I was now able to update the hp_wmi with dkms. The board is now detected by
hp_wmi. But I cannot control the PWMs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7FF3EBF2C
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770831166; cv=none; b=j19tiYpaICtt6r1b6MjcT7llowP741f6aI5F9F8qaBrtMpgDAOIDJLcMKlS10p2KbJtN5q3ufFz8oS2NOsWY7nwSgpmZY+hENUCUlHiTCkYTTm1eintQblsd47rz+X2HRaLDJ/4LhJf9kWitYpLh6pHMrUSawoUUSTdwqDHKSyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770831166; c=relaxed/simple;
	bh=VUgGx5LRpyj4B0D/4NfkJ56/kOAbrIG18YMFcFhVKwc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J3ZNV/+CbTLELerJFB6kkn8XI/mLp8muQxrYIm8V8gj5qAp6CtYkz642G1mksBejq6QKMRKvpQGI+zKcU+5aTTmpnwtJ1heqFSusaH32Uvh2c7kM9ucY2bZFpFr0EaHBzyW0LOasjUtiqrCM58SHMSdL5R2MNBiJnjoYrct0D2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmsxuSeA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmsxuSeA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB364C19424
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 17:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770831165;
	bh=VUgGx5LRpyj4B0D/4NfkJ56/kOAbrIG18YMFcFhVKwc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SmsxuSeAofzLys/Z1Sf9/Chi+5F7dx2IitBojbv22Qp1vTzo+d9I8B7ehJ0s2fTPs
	 kjwamybPwJC8GYuWvEW7tutzQTHiRMZkYdPH4t8b3slXNKCOGNZ9sxtv6qeW1zI4sZ
	 7AyW6wa9QlIOaAMDhiBXou3ez569kckmGspF9fA72zDJuG4yhZCni6vmFbFzuLldY+
	 9SQ0Ep5GbUp2ApalOWiiL9GHexMyNcgA/mZaG34Cj2AGV7vcjhEw7bVslxiMoqd51j
	 LE7Xc0MgM6fBla8vfcUmRCKCE8ATJr0D74EIztI2ELpZ54lmFdtx3fPlAcKegeQzGx
	 IaTMfV/i7omfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C2540C4160E; Wed, 11 Feb 2026 17:32:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 17:32:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-ZDPgFY2amy@https.bugzilla.kernel.org/>
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

--- Comment #30 from Rong Zhang (i@rong.moe) ---
(In reply to Rong Zhang from comment #29)
> I've seen GBMD, SALS, SBMC, and DYTC calling ECCC.

Errata: s/GBMD/RPAM/

To summarize:

ECCC callers: RPAM[1], SALS[2], SBMC[2], DYTC[2].
WTER callers: none.
_BTP callers: none[3].

[1]: called by EC queries: _Q0A, _Q92, _Q93, _Q9E
[2]: called by ideapad-laptop
[3]: but itself is called by battery (drivers/acpi/battery.c)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

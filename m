Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899E439D6E5
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482439; cv=none; b=N5jDStvJE/LPn70mBVPWFx+NMbVqTv3Zq2BRbJ5veQIqqWHO+nBzkNNONcU9gG52LkCjney6QdD2ZV0P2PmESjjY9NE2EuqcVgXhf2H2EVw73vN/HZsOi1zmEjceBDQ1lknvIBMUo22jjp+3aC7rAoMLgOP2JzseoM2nLGxoYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482439; c=relaxed/simple;
	bh=C+RCeHVAbaMr0zm2y0NrYY+l5S60U+LhYxaTStZlKSY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OB/B/NfhL0y+GfzfF4PT1kU80ZXPvK878vICr/0iLJBos+JhWdUIg1sZ+Lak9M0S4iPayCbQ3xM113OCo7I2LMfqQTNBzaWE+czdWo0BEzNYgfinc03LxPugSFhtSoOvaH1vdBj6fvt8kO8b7lzwPPPm7vVggQ0RvG6I9veRrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfbeT/dL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfbeT/dL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E3EDC2BCC6
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780482439;
	bh=C+RCeHVAbaMr0zm2y0NrYY+l5S60U+LhYxaTStZlKSY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SfbeT/dLd3rIvB3Rc4Kgcox7Pk9GcGW1lniBlnx4OoeH2GnT28rzk/7UsyYxSa+N/
	 4lPtQkA6i7G4fhFCI6sk0H8aupXs1d4Js5MRylQQrIGNLcRUQxzh4eDOjrMPjTU/tH
	 WanrSl3+qq5W6bbFzJuMD3tTz60n1jEN1tdMPC9yOh49wWk0gSGV+FFFNm5BIG3xR/
	 ZE9YnEFSD2F3JgN7Zc5pdpa/uWSDHmqcIACnTlFeGItFcpnBJOEwVxqwiYKna8fs8L
	 bu9tryFSs7ceSxFfdwgX0JaT71MEOrqwh5ITcvomueYzPjcb9Fi5wwkvZkH6G0j0Om
	 cF9R8+4nHDgTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32DDAC3279F; Wed,  3 Jun 2026 10:27:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 03 Jun 2026 10:27:19 +0000
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
Message-ID: <bug-218901-215701-lpZIba2X7s@https.bugzilla.kernel.org/>
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

--- Comment #68 from Armin Wolf (W_Armin@gmx.de) ---
F1 -> KEY_CONFIG
F2 -> Ignored
F3 -> Ignored
F4 -> KEY_F21
F5 -> Ignored
F6 -> KEY_F16 and notifying the LED class device
F7 -> KEY_PERFORMANCE
F8 -> KEY_MICMUTE
F9 -> KEY_CAMERA_ACCESS_TOGGLE
F10 -> Ignored
F11 -> Ignored
F12 -> Ignored

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

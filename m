Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBB339023C
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742054; cv=none; b=b8Zc8faNGpKTYwPwk2mPZW/Nz3euY31F5sU3VAipmZyWrxuQcAfwYyAhDpSCvxtVBRZiBBA70VtzMVX52kWMEqqc/UC1+JEWnjuVqEnIc+cie65bedSXt2YMtpJwRRlGsPmIy8BnD5yLKjpDj5rW5yRPjZpnxjyhtH0ouGPAkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742054; c=relaxed/simple;
	bh=iFrvQX8HGgaiNoFcPWFQYQcUFgEcwZBHlJGXFnzqfkQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CGgHgPzKOOncsGxypdrsUowTI0pvheTDDnjbvRCW3AmeUUpDT1fj31peOktFxBAb2XoSPRuDK4/IA4Zrl6Y75BOgpdchPP5/toAMiqJPDBT7vzCrOCp9m/GcIfMQTsdaxQW2YRb40QwdzQBRNYMmzmgr9/Qw4yogi7UaQPOvOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvtiIzxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvtiIzxa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EA17C19424
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775742054;
	bh=iFrvQX8HGgaiNoFcPWFQYQcUFgEcwZBHlJGXFnzqfkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LvtiIzxaN+yyuGPLgm/YkvWaLoE2TMm2FQsqCMdoh6j8CkwZZwfTd6BNoxqXzATGC
	 baLYxtGCui/wg5r1zHogp29p8GiRDbjIizowEAKOIKwYTFpqoVz8SlIwYV8kyRPE8t
	 IWwqTjPHonqa0/J0ouUoVoBqLVONzwXKcAFihPHE1vblDu1Hd38AVq6RcwiFcQ+wc6
	 kkJVKGmEgqKgelpL71Tr++XpJwRcw7832THmrvRQaw9gwtgWdjDSGPhg+3TSS5j4Jq
	 SH192fCPvf/Xn3LjBWFJdW2fUvTNhK0WAQPvj/dXLOmgFyc8cO2qclg1X32eNjEbj7
	 JWiY0iCO5bl1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3080DC433E1; Thu,  9 Apr 2026 13:40:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Thu, 09 Apr 2026 13:40:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: keyofblues@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-2gfDpQXLLk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #20 from KeyofBlueS (keyofblues@gmail.com) ---
Good news, the issue is now officially resolved by ASUS.

ASUS released new BIOS versions for the motherboards I had reported to them:

- ROG STRIX Z790-F GAMING WIFI: BIOS 3201
- ROG STRIX B660-F GAMING WIFI: BIOS 4001

ASUS support clarified that the feature is present but not enabled by defau=
lt.

To make the PC Speaker work correctly, you need to enable the following opt=
ion
in the BIOS:

"BIOS" > "Advanced Mode" > "Advanced" > "Onboard Devices Configuration" > "=
8254
timer clock in OS"

After enabling this option on the Z790-F with BIOS 3201, I can confirm that=
 the
PC Speaker works correctly again.

Unfortunately, I cannot test the B660-F at the moment, but since the same
change was reported for its BIOS as well, it should behave the same.

It's currently not clear whether this fix will be released for other
motherboards too. If you are affected, it's worth checking whether a BIOS
update is available for your motherboard and then looking in the BIOS for t=
he
option "8254 timer clock in OS" (or something similar).

If you can't find it, I recommend contacting your motherboard vendor's supp=
ort
and mentioning the issue, as well as the fact that ASUS solved it by
introducing this BIOS option. That may help them reproduce the fix on their
side.

Huge thanks to ASUS support and their technical team for actually investiga=
ting
the issue and implementing a fix. The support experience was genuinely
impressive.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

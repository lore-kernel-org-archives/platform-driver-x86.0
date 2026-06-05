Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C544419D8AC
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780692469; cv=none; b=UhPGQ4QggJ6oaoxMWn8fGlyNLx1zEZo8xJPa06JNT/mMYLi7CTVoSu+BgmOoC4Hf0YgMDr1z/MFX2ECgKthg33nJlzLWxvIzX7vBnX9lHokC5ldm7WP2VN3gupr9LH3qi19I6Sfgh6I5wEaK8ITDm4jOUvJuJrC06x6kGK+sPaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780692469; c=relaxed/simple;
	bh=drFERsUSGMsyggmc4O8bPri67z0IqG7RDvzv4YtuXLs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vzg562cuy/Oz7JnGNDZdfEal+7iUBIxzX1oJmF/UgXnB70Uos4xTxPHbujddclk23JweO+Gfn4gg//OsQL0zjZl1rmLrmwoL079ZdxWnMworNwL/2fZFRtwDlqmJCeofLUxmJr3EvPKMoutmupkcZeMvlBq5ZboLWpMgNzB02TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frg3XD6k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frg3XD6k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CE2DC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 20:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780692469;
	bh=drFERsUSGMsyggmc4O8bPri67z0IqG7RDvzv4YtuXLs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=frg3XD6kYh9Ezen7v8GW7N8fw5IGXSy7QpTjyzimtigz69Dz/DBBbQTukRFrp2M1i
	 TKtMzfGiLnSIw2ODYLd+8MbfHYejszwxY77AfMdjBFGDe1sk5MGrc0k9EOHIXziAS/
	 i0XPgSYUvUqkPsL55a4Jp0RYhhciiSoLpu5mmeEjzZ5Vwmy5/YepINXcYUE4jxaBjq
	 /tFm3MZQBjb6aq6vxNFOjOPGAlica7hnhd3ifYYMYuCSxijoCsa1ODSt5TYBR07CGG
	 i+rVB0UfkQAjdkfXz1J6C1IpEskx1vDOwqZzCtcg6dSzGQ7vrQBRLMaN5sTLMEcB2l
	 Z4ljbd7xynehQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54690C3279F; Fri,  5 Jun 2026 20:47:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Fri, 05 Jun 2026 20:47:49 +0000
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
Message-ID: <bug-218901-215701-nvLmfnbapk@https.bugzilla.kernel.org/>
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

--- Comment #81 from Armin Wolf (W_Armin@gmx.de) ---
This version should emit KEY_FN_ESC when the fn lock hotkey is pressed. Ple=
ase
also test if controlling the keyboard backlight works when using the LED sy=
sfs
interface.

Regarding the duplicate touchpad toggle event: i have no idea if/how we can
detect this inside the driver. For the time being i suggest that you simply=
 use
a udev rule to disable the touchpad toggle event from the AT keyboard.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

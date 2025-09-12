Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B727A10D
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Sep 2025 06:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657216; cv=none; b=dyzBsdVApo3y6qXHUbccaaat7btFe26KBE2W+eKCB48sbbjd52DXWEg33xk9MsYWg/3eUa0GelOf6jyD3tOxNVRnczfaD7snPObaWK5kTqy7NcdPjS1qMP7/yh6gVGFyI2YMbNueoPuSwwkbe9JC782FDXl09NHNLBh4smxoVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657216; c=relaxed/simple;
	bh=ap+HaTWXDWcc8hHZ/wzBMoat01kch8MX6S0ElTAlKC0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pIIKWKDSEHs4GUyG34U3b4Giv9jPhQI7yjPwOSlD87EO5PwtEwB6Lva7F0R92nupJkHnz1XJWMnfPkVgD4n5FugAAOuaWNYoyjIeH1W/OibTsHQxIvPDJvnz5uLbManJ89BCwL8NaPpYoxRuu5OTeLRieyU57SAeuLFh/t58guA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buIYa7OG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buIYa7OG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B064BC4CEFC
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Sep 2025 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757657215;
	bh=ap+HaTWXDWcc8hHZ/wzBMoat01kch8MX6S0ElTAlKC0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=buIYa7OGpbo098mDEN5cQjCM5Gd+Rq8p4QWyxM0AxcdDay9X85gyzTbbvxI1CbLfH
	 HhgrLk8yukHenVcblB5l6y0fWTk0NY35+lFednySNoqbkkY0sycIVtZqGwQjAt3Ep7
	 1QFMnA1Ij4ZuwOLnb9k9FGcj8ZOrH5nsJmaJJo6PMyhQHt28HUoCEv84Ucj2lYcKr6
	 Ua11n7FDWNzd3+/cuArlQ6+xZ8CUzUuD53DOddygrTWa2kpVXoH1GEpn/KEvwIc7xQ
	 +k7hEvu8yRCbwzIIEcg/3Xvng9neJzqr7M13EXQcdwBuFuQI8BJIYisVHltstEitFg
	 1sqwNcE+zLAJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A6E99C53BC7; Fri, 12 Sep 2025 06:06:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Fri, 12 Sep 2025 06:06:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: iceneko@protonmail.ch
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-8Ybhj8Ej4z@https.bugzilla.kernel.org/>
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

aisuneko icecat (iceneko@protonmail.ch) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |iceneko@protonmail.ch

--- Comment #110 from aisuneko icecat (iceneko@protonmail.ch) ---
For everyone stumbling upon this bug with kernel 6.16+: I suggest to first
upgrade your device's BIOS to the newest version provided by the vendor. The
problem was fixed for my Lenovo XiaoXinPro 14 APH8 after upgrading the BIOS
from MKCN27WW to MKCN37WW (released 05/06/2025).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

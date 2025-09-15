Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0E123D297
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757954018; cv=none; b=pf5iHcslptn//PoJzzr60Nb+Fa+4VM/NnfJUL/02lLF/paS15+bXhDOMjZ33CjHZyYwCxG16dZ+hLeqkBZ12xO2C/vVpyoI1TbmuUW3iZLTEiPj0v7gZdEa27bb4dE/DgcWvW+J1/GZc7XyE71VFCgCiB51q0HiJNJkk9bLsgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757954018; c=relaxed/simple;
	bh=HXUIbm6fjfOzygikjh3eEOoPfwSO9MpH2NM+5VE/R6k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ig5Flmcj6Q7C7SkEpYJ/ObojjqVWTyOVPK/bNqTsWokTEX3/U+DA95pnsqCb6BwLdu0FqvItmwY4mebtOgIFlgu7WMo+O+eoBvpRkWuaigEOaQDvQqF6NjMD56b89RCbvEsJH9ieO+celKkVymgdtu9aptUCrfUs9AYe+51pFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h60tJni2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h60tJni2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9147C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757954017;
	bh=HXUIbm6fjfOzygikjh3eEOoPfwSO9MpH2NM+5VE/R6k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h60tJni2eny18qLTe7nCDZ/xehDCgeH40Ul06zI9bbovmO9gBs7FcW55NM5a74QdI
	 vm57Nk15McgwpPNBTAXqw/baew5STNJ4dsOuwlAEIet6YoATC+YhTlaq7rsDCvw0DW
	 Z9m9lJg0FwpGnpQxqda+QdWsL8tOag3aIF/AE16EZ4Z+Or+oc3dQ92QN64TvFmAktd
	 MPrwHIt6Sj+BLJNQlwy5VXuOJwoT3qwj3qfgNtAG2/z34AfMlBjj/Fwm3nod4fpaRo
	 wlmOHyMBWczj0i+hi0eJjF8IgAM79R9iOZC93vPiyPqhO/46fsanGi8gIY2H5/P1g6
	 yh6ysdnPZEpJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A1D00C53BC5; Mon, 15 Sep 2025 16:33:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Sep 2025 16:33:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-NBocp82cu0@https.bugzilla.kernel.org/>
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

--- Comment #124 from Artem S. Tashkinov (aros@gmx.com) ---
> 2.5 seconds.

I'm averse to quirks and I really hate that the Linux kernel already contai=
ns
hundreds of them, so at least to me the solution with a delay sounds the mo=
st
sensible.

I guess very few Linux users will object if it doesn't blow up everything e=
lse.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

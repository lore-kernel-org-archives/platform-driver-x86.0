Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3D1F3B9E
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904996; cv=none; b=G62/iAjFzJf0KWo1tCtPK4lwM7z/TmFdyqOLjLmDVBwCDhaqaqWaosoJeoqeHEU6Xc9GZnT7s9rKNWJsHyfR2fy39LotQNvwDDZD1LtGfqbzK7+72ffh/Q6yEABeFkakJ9ioyGf7gNNSfkxMdWKsDzhGI/hxgvA1DkYljdrZOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904996; c=relaxed/simple;
	bh=VVeUq+WydiFhjpRnPM4QND9x80ZOBORof51cKmbTRtQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ksocdLMefY38OhqIK7BcJaDk8RPBsSPkSD5T/ZztfQodnhiNr1j+CXOpoH1cBzLG9HlSDXAbQH0qV83UYpmbzklbNfHz6rvY+mSmfrep4SeOLCgcoy2WmzKcZuaqBgU4EYKf7WwwnrumRIw313odyEocplsuX+5GEotqv7OkScQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXZgmoEv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXZgmoEv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2CB1C4CEF9
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 06:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759904995;
	bh=VVeUq+WydiFhjpRnPM4QND9x80ZOBORof51cKmbTRtQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NXZgmoEvor9Wr8CZsJhQ30hbtYxMHZ4i3MDW8ftbaW1dVFZO9hzE/+mE4xv+mzAt2
	 FF3rq/RZV/FYrZkTCSIZNoZrF6f2rv5LWOpbw1D7RoYcBs9wCOq/McC9BkdyNOo50h
	 bi9ltftIzqA6iI4B8cAv6kIBJFem3QS/xPJqz0+cjZcUt+Bwj65jM1jnDUj733HyXs
	 c4UjL0H9jkRA4Fyz0bQ7QlcKbvfRQw4D/hp9Mm/+wrb9Skn4+sbDMJZMa2XZbDixRC
	 v36SKLWYC5cnlfcoZfj34TDBC1HsG/MNfWmhGGeQ1olezJVmT2Z9zAfgNPk2kUotee
	 qwdd0cNsVM1cg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC681C3279F; Wed,  8 Oct 2025 06:29:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Wed, 08 Oct 2025 06:29:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220639-215701-oCeSnguMt2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
Did you install the Intel thermal daemon?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

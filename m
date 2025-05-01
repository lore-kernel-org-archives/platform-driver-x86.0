Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6581171CD
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746106171; cv=none; b=EfFIsz2z46dX6mRqBPjt6a0e49poogwvMYpK0da/ae5kSVLnwW5L6cNtQgiY6E1hO3R1y8b1fFUL+6AVfKgPmWrLN/Lnm6p3uf3vuwyfHcY0yjmDJagf7My9CpBSZS+M7DqaI9FVEIWa3OT4Lzos6A8IjZoP2QzKmKPQlQVTeKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746106171; c=relaxed/simple;
	bh=sYAshkndtcXN3feis2OHGJhq/HTsyQG++Dd8PgeTlrI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UzaHV/OuYgNyIjU8wQj0PaJsn43uSwPoIdFZtvFEdQwWxWrboedzfmPN2aUDoc6+k8saibr38VaJy7iz3OL0znOwuUIZxO4Xhw2KHCGeb44Q1NEmNbsHzGm9BetYG745AZFeczmRL1Exg8Im1+UT4NfcvY49kOjn8pgHxy0CV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noXbDec5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noXbDec5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81FA6C4CEED
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746106171;
	bh=sYAshkndtcXN3feis2OHGJhq/HTsyQG++Dd8PgeTlrI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=noXbDec5pRKVW7XOak3ATC8zz2n1lhZscGRQvOmrT8lgyKhcTW+o+VflGMqce/u8E
	 kSp8LwVmaG1UDBUSkE/2+9/ar3Jn0dlTiMt5t+LLTj9khRdSicyZnxpWHOGguSuHfT
	 lj2uNSXGqLZPxpa3ArKIa8sZSuVPj4yRoMGkibCyCwNCJXjEwjnf7IBaFmZEJOdoSo
	 RstrmkIwAT5y3Gzn3+VbL1XQ43feuriTO58lIQvcAR7cBubUijqBRiK9u1y0xzL6Gn
	 P7RMkmNdJl4/wHKk+Ny6AUVIKRLCVQ5Fcp/DDzAsowJK+PzRwB8+6UZQZGXbbYpxJX
	 7T12BW3eTwQhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6BA6FC433E1; Thu,  1 May 2025 13:29:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 13:29:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lbtowers@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219786-215701-aaBY72YnpK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219786-215701@https.bugzilla.kernel.org/>
References: <bug-219786-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219786

--- Comment #15 from Louie Torres (lbtowers@proton.me) ---
> The only quirk I can notice is that when I'm connected to a network, if I
> toggle off Wi-Fi, it shows toggled on once again, and I have to toggle it=
 off
> twice to have it remain off.

Are you running GNOME? I don't get this behavior on KDE. Toggling off Wi-Fi
immediately reflects the changes and disconnects me from the current networ=
k,
and the same goes for toggling it on.

The behavior is the same regardless of whether I am connected to a network.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

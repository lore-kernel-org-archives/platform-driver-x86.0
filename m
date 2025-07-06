Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098BF18A6DF
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Jul 2025 03:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751771214; cv=none; b=KJoWi6+SYRQcqYPqyLgZFOeSi/Owy1u5K6EGnhn2tTxsDqIT8uXflZgm6PR4iHnvqX0Cj3RdLl8PA8zsI4GgACRUZxNVHrZGO2sIJuXj4r+z38SRCdT0ooMltypNJHAYLs73op+xj6TbxShYe7q+MLhUrpwZXKm9oDt/dfjJZRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751771214; c=relaxed/simple;
	bh=8lVHmVnDHFgyFFy8jORtSzb9dEqLOurqz4rBfULo0Ms=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tmx16UnEfmvJmCH85fFIEBHaBWEJ0pm2pLV8lX0ZDshWTWTnh5amWewUX/eyM+PHkvI6+6rlKNLXY3wu1/ermuDZiTbbZWZEmcaa5RshPanNyNX7Jytl+M0GNqOxWrRUE7ba3XldE2JkNSC2XBDlDbCBhZxspc4phc7K9GRqI+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEqUAYFy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEqUAYFy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83CE6C4CEF2
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Jul 2025 03:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751771213;
	bh=8lVHmVnDHFgyFFy8jORtSzb9dEqLOurqz4rBfULo0Ms=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pEqUAYFyLaiyQeiFhWRlZ3ZM2v8HrkF+y/C2iZ7komZpR3Jh8NAonJFgTo1suxyBx
	 VoU2gWjIn4VWkehklRILFBQEaHmOO5fdiutr+1+er+eP/AUo0ef64ao8rCvjsdARA/
	 XYwuSUveJjpl3qDIwllAqbcr7mqYzC8O8QawWnB8Kk+T0s5hIRSu4i4ImmxCrUmeJb
	 axQA+FHC5G65lpNLh9AygkNlLZ46Tp4NarBvBch6/r/a4+T5F7VdTiOkf5zbtYBWU6
	 0e7oUqdynojRlOXfFbZ/swV5AsXnJ8dNfaKpoXAZHFEACUDsRbPO9FPXOMYBJWV1Gw
	 1siqNVbvdIyYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6B2ADC433E1; Sun,  6 Jul 2025 03:06:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Sun, 06 Jul 2025 03:06:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220246-215701-bJmdRX7Rdb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

Dmytro Bagrii (dimich.dmb@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #23 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
The fix appeared in mainline. Closing the ticket.
Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFCE1AAE1E
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016845; cv=none; b=UflhANK4kQIxz6kRzW4wOWjsmUylP5dCQJQNhrC6MH/ZOcOpPJJgyJUWnmNa1yJfuVtJHsX3wnqoBrp2rKVbWBEnAKYqMLbkeEyvItfyfGmCrdegVxG8oBVctecyuF0LMyd0opZxoFo6lnngAN15mwflYRj8hKNJkhuK9vlq72g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016845; c=relaxed/simple;
	bh=sH5HQxATO90MluJoAAQL0z1mtVfZaHpemS/p1ZDZXAY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nGWEwKm7GKMploqxLLgZaWXdSFtixf4KEgzUGxMFUcEj7NpS/Lt+isSlVhLjdWTChHNAHg8CdCrs0+Jf8gdrw3aHNOIsMMDDQJzpYZ73Jz8l5UoWngInKyX2kAgb9h5yL1zGXEdHH2OIAqxJf6H0TVCqVuk6koU8/zh10c5XoMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DU3DztVw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DU3DztVw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D780C4CED6
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737016845;
	bh=sH5HQxATO90MluJoAAQL0z1mtVfZaHpemS/p1ZDZXAY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DU3DztVwTIZbJjjbyFEKAl6dvJb4coTwmkyj7b11sOdAch6vvnkaMafTKcX2KCT3m
	 AZ0kxFqqngvGGQKosg+MMFABTWFU3mubznCeq8eHEVSphmtc+g6xpnfAP8UX4PD92b
	 SsUDPddwMs+UX1mTuuys42dZ0TOHl2qsllVztCCW1DYP68UgHn7iajPBSLsLBCnGS5
	 8lYQqTOy+u8IoR+pdVDwiIHGSjgy3+IG7vQ6xhqxfdR0B9Q3gNX7Jb5ch2UgjDiMEA
	 RLzggvpK/6fQHU5tNUhkLESCII+ySlrZIoWT44/G4ZJLQTUEzinsVQibtU04WqBOHV
	 j/B7NB/F9AqGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 28F33C41606; Thu, 16 Jan 2025 08:40:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219696] touchscreen (i2c) stop working after hibernation
 (Lenovo YB1-X91F)
Date: Thu, 16 Jan 2025 08:40:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: I2C
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers-i2c@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-219696-215701-gAXrtTWcMS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219696-215701@https.bugzilla.kernel.org/>
References: <bug-219696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219696

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform_x86                |I2C
           Assignee|drivers_platform_x86@kernel |drivers-i2c@kernel-bugs.osd
                   |-bugs.osdl.org              |l.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

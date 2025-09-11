Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28AD215767
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600420; cv=none; b=u6b4v2IUAgOM4pXPJLcCLB4xLIY7HxOh6VU120UWelDK1dBKHeJm76a5i7hXOOInhgMx2cr1oiQbWvhT1PlLZ1rxDE/sbyW3DomC8PKNUV85C4+fl83hnfYBUbyCm9AZUjffvhSSu6EnYahllGd6kNffmdenhPLYe6NzQkNydy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600420; c=relaxed/simple;
	bh=ZW0SUCeom7raeKOlhfX1H9nKfkLo25mX1Hjq6rjgrc4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NbdO/DPVj9VFMWcI/x4AA+rh+aJtNKxzJPmdYB5JAS5TOXDcHMvQLpWhc1lJoZo9tmV6QA4bAJxJkpmmo+1jT0FUXwQ/7jAJswwIKDyyDeZWZORZ7ddyRKnebTT7s4PMvJCDlLHYfbTkYmBjUuA3rKtQjGZX4JIaX/20HdNSKn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KapaEd1/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KapaEd1/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57652C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757600420;
	bh=ZW0SUCeom7raeKOlhfX1H9nKfkLo25mX1Hjq6rjgrc4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KapaEd1/HHM1eTd4Sjvhzo9qLbz8R18RDw/gUocEaFeWIdCZcTxlFVeEYyBtzmlC1
	 i8nF3/0pu9ijiuEm9LcWdA8cfmyNHkVFoLelLeuWBjQTbP8TSNdCz4SWnrrbVQEHO7
	 miQzYzzGSAHK1BtH9wq7J9vo3qZ7aXUguJfo+fXPPl0pTNncABNlLNXY26fG/Bnle7
	 kZ63ctTB73R3iTjzqSOJV5bcFVORX5Z/Rz/zEEHkKADjbC/1JO9PGaQXJ+0hOZFWf0
	 AQFUJ+pJX4wkk0q8NhaSQop+TzV3mcA+X3720TxBDRHcqO57W03/re6Llbqiuw0r52
	 pwX7kmc5uJ/aQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 492A7C4160E; Thu, 11 Sep 2025 14:20:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220566] Lenovo Ideapad laptops wrongly assign "Cut" intstead of
 "Selective_screenshot" to the corresponding hardware key
Date: Thu, 11 Sep 2025 14:20:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomashnyk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220566-215701-ENoeDblRy5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220566-215701@https.bugzilla.kernel.org/>
References: <bug-220566-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220566

--- Comment #2 from Tom=C3=A1=C5=A1 Hnyk (tomashnyk@gmail.com) ---
This is my first time sending a kernel patch so I=C2=A0hope I did it correc=
tly, I
sent it to the mailing list here:
https://lore.kernel.org/platform-driver-x86/1757599473382.2879968666.227569=
5113@gmail.com/#r

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

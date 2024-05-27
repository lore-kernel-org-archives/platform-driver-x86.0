Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A643AC1
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816357; cv=none; b=n597qA3zb/CYWd6NHSKadiCxZi5FYjVbsHiE7QB5PjPx7hQ2rvKynTMKva3GRYJ50LAkVz7KHuCJMvF/0cPkHelSutfZ7W55vi+7dXyUhMkhSyjjlCGQymJanY6NDnO0jqIiHNa0zGDfu85Ue1Ho7G4YuUKzGl90+ZZdiE0zbI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816357; c=relaxed/simple;
	bh=nBro8H3lYaVtWNukw2UcE0F0Ieohf11UJrt20nU8ENg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=leJDdfz1rKX7dWtfQHxgNwigZuTEe1sl43TiPWDImYiYzWwOfaKdz6Y9Sg2BLeJqNrXXz9sJjDza/EJY2rYxojrhW6Rhvrp7z07W3V9J2sainMWG4juvsHlJOHGUVfrO7+LGD2qtHsh9GgdEAcSCyHB/isPMWK9metH17kDia1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwOHkAla; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwOHkAla"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD766C2BBFC
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 13:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716816356;
	bh=nBro8H3lYaVtWNukw2UcE0F0Ieohf11UJrt20nU8ENg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dwOHkAlaX2bSBLIu0JM20dryGZ16SL6P/F0x9BDgwaUjfU/y/6bx0ll6mvZEArOLT
	 pqwS4m6D1hKrm8XDd7X+K6IgenkFfjiGMOFSKpkIwIXSUJWZupXhsPpyK8yU/eZ5tU
	 zX56LqbP70yhewvru2ayLskeDDiwpbZsjlWHtFxCUYTWeMsQ4Me2SSi6ubxeoEIRGZ
	 ZExm2pppFbZ+SuEVy9/OQiRXGvEBoRbqIV9l2Zy+FjGTFS/ucAlwtoUb6ekbBAQOj5
	 MXfrgbiBFRZ6zXcgqaVnkPKAtpTNpub3CT73F4zPdrp534FfvhFEOevltiUEUNYEhX
	 YHEBv+iJVGSGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C478EC53B7F; Mon, 27 May 2024 13:25:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Mon, 27 May 2024 13:25:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-mxN74BjtVj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #10 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Hi - sorry for the slow reply, crazy busy time of year.
We've not been able to reproduce the issue on our system - can you confirm
which BIOS and EC you are running please? I think you have BIOS 1.30 but ne=
ed
to confirm the EC version too - it is shown if you enter the BIOS setup scr=
een
(F1 during boot) or from 'fwupdmgr get-devices'

Thanks
Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

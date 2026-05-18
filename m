Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93828364935
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125035; cv=none; b=dK4Lo8V1xFNkt63YsQzxXMZRDkaUFYHWh0q4OeMlOd49ThruPFSSmt6U7Q05mPxW802KT6dtVoJfKLCOcyxXKd4kKsRKNAngR4Da/7lUIjtxFl6sgzO6kaMrcNeN4mNZrFrG8GvAGn2DLedWgK03oYA5ircwg42phGKgqzCCMOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125035; c=relaxed/simple;
	bh=hJGGo7iL2/sb8lTs18g8q+Q3OhGuKoKXqUzW6sZM8MA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NETOxbzimu3tixgQchVnQwRUUXCAUT+uhLTVMLh3EQUEeBmffFFKZG1Xd4nUpGu0OdFmbNp5yhXSJZS2GotvYFVYrXMD2IE1SRWtsWOairKbCK4xIp2W/Ki3SuszfwV79ascQIcTVEVl+onL0/b5gM5PlxNHBRY28yarGXpZvTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVRLK6SZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVRLK6SZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FE32C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 17:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779125035;
	bh=hJGGo7iL2/sb8lTs18g8q+Q3OhGuKoKXqUzW6sZM8MA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jVRLK6SZ1fKviDPeyjHMkvTipgT3UMidcRxXAHhlNIaE44LmdZSJTv9IiUP/iX7YL
	 OgI4M1+HvwhbV6t/oOaxn+ThFBU5yqRrhrZ4kcCWsZW5rAV3z5iKzUMtcYoX4iL2II
	 uN47+6JLoKtuSiUw3g27DnGfvZX/RQvkAItWl2jzhwWRh1ghtamj7MwQ77wiJdIm4s
	 2H6T1ZXVuzGkrt1psZMieJZXIKCs8MVHSlm5XzALIq3G0AnxIG1s2kM8jJCEjRbdES
	 IroWZZLWY1mu1PSikW/BaGuS6E+rBsxAcm+vtzXXx7l2HArg+ltTOFP2g1YQj6UZWC
	 Uc9fQen185yYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 171CCC433E1; Mon, 18 May 2026 17:23:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221546] Fujitsu u727 notebook lid close does nothing kernel 7.x
 - normal triggered suspend/sleep working
Date: Mon, 18 May 2026 17:23:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: software@f-hasel.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221546-215701-KJ6it815jr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221546-215701@https.bugzilla.kernel.org/>
References: <bug-221546-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221546

--- Comment #2 from waldwegflitzer (software@f-hasel.de) ---
Appendix 2nd: I first posted my issue in manjaro forum:=20
https://forum.manjaro.org/t/suspend-or-sleep-after-closing-notebook-lid-not=
-working-with-kernel-7-x/187680/9

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

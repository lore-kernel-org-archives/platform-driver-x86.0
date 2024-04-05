Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EF21CD2B
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Apr 2024 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712315730; cv=none; b=NiKe3I+AdTM0oE8XQ0eKJIBo53v/zXn6lZ1iIikFn8EDJQcCLYLl/Rd11x5s0iX/97Cx+ziBwOtNgoy5XWdxp3RFA+lAJTX7ctc1sbGt/cqqxYDqXf0Eh2EZ8fo4zw5cjM1oZioJVof8geAtANoz59dIFjccwY6CGMvIJenRJPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712315730; c=relaxed/simple;
	bh=n40anH9clozWj/MBwxwdyrnhnxMWvE38M7AIZYueX3I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rdpeJHHPsrax7HmDUNOdvKzEUXHAd3fplMPcreE+XrYFBLV2murmnBnSzd6FDd44yUb41qYrojHqRu+XKu6t/afZ9XDVs3RVtOSAx+oJCEWA8t0vWZdlLQFd7TRtzYFk7xpz+33XHXlEMNhLOAW+Q3uCGDfuWJLOPZEJnj1sXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrNyi+jp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrNyi+jp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7DFAC43390
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Apr 2024 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712315729;
	bh=n40anH9clozWj/MBwxwdyrnhnxMWvE38M7AIZYueX3I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZrNyi+jplgKctb2qpaFk70GRh1H9bbNYxO6sIbnu4vPw7HaeMVF1cHUCZ97/pZ3NO
	 nOfAgoJcNuDnpomgIWWcP9Jo2TzQanYfHpz5+uxWaEiWm4eBPpYhDo090OF4evxkug
	 qWWO8jz/5TkO4qYeAGmw7ojuGWaOzilMrwJvE8YCn8mBSRmLwGpQZeLA4E/gdXqb9V
	 ii//nT5a04yoLaezOgzCckD87n1WzDZqk48vk3qqgfXNmHXRDtsWzt4wpDiFedHzOM
	 AGPN+veRwMu6EXXL3HEYJ8sVxKC7LjlVfOuRZg9uZ75YdKyPVMFbhPgftNm4JZJgXm
	 gx7EhiGOPDbyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 952C6C53BD7; Fri,  5 Apr 2024 11:15:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Fri, 05 Apr 2024 11:15:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-7Z2QkvhRWm@https.bugzilla.kernel.org/>
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

--- Comment #48 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Peter Ries from comment #47)
> Hi Mario, sorry for not responding, I still haven't been able to reproduce
> the bug. Just had it once after Kernel 6.8.x.=20
>=20
> I will test once I have a reproduceable scenario.

Please try what triggers it for me 100%:

1. While the laptop is plugged in/connected to them mains, put it to sleep.
2. Unplug it for a little while - 20 seconds is enough I guess.
3. Plug it back it.
4. Wake it up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

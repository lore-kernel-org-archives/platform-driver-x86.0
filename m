Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A12F83D8
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 02:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767839535; cv=none; b=Bq6uactLsgxNVGL6fimlybAVxF8he3KsQPI/4Rng+2TrEq5cRGJrnT8GyAAQoVGJCabtaP/TztyLs/IaLpnP4gbWkELwWL4vJsu4JlfvskgPEKw3XX7Ck95FleuVYW6HfQYBKOA/pNhqvfK4yewzTKD29XbHV4wtNIE1RqhIgmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767839535; c=relaxed/simple;
	bh=/J2Pnc8OpUvXKniyCObnAfsJ5SoEkF9mrI6H8Hlpjp8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L53EU55KdvR0gQSOGOE5D/uPrke5bFTF90kUQoyAk6uldTIYIfKb1icZkxfMyWH4CiC7fsDuZn8aifIgJs2/hmB4gLLs5yV3zsNzcOXxNAJEsJebYLc2vqkJGVKnM0tifgiDlyqJIXE1KxpqK/iQxIn+KfcV9e2FSrWT5yT9kes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAE3GLKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAE3GLKU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87FAAC4CEF7
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 02:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767839534;
	bh=/J2Pnc8OpUvXKniyCObnAfsJ5SoEkF9mrI6H8Hlpjp8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cAE3GLKUNt++urhFjgXIXTlyB+BI7fQn8SqXzI8iuc6UKc9wSCLpCZCTPYrli2H6W
	 pr414LsjG7TAHYPP7Oh3euFlkvrgG/yFLcA6LKZADk10E1NWXYX9nh/6bLOi+mLwdT
	 /gIvP+9Tw8OzXq0EnzZ5AyzZ7cMC/FxyUJu7CogbBlzLSaUtG1IBkC3Q26j6IpGgPM
	 fPE9N3CogmaVKht5Neny5TqY7C6J8kGuUsvFh3ekRW9p/rODS3baDiQbII+O4AT1mX
	 BnJMOEROGMOKZJdR5Hrc1CXGZXRXAoG/1PsHhCarSgzpfIF8M+2lKpyB03Bsbcif9k
	 Boiq52JEeLdJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7BA81C41616; Thu,  8 Jan 2026 02:32:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220945] ASUS Q405UA requires tablet_mode_sw=2 for proper tablet
 mode detection
Date: Thu, 08 Jan 2026 02:32:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.r.blank@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220945-215701-gtReGJHrwP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220945-215701@https.bugzilla.kernel.org/>
References: <bug-220945-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220945

Andrew (andy.r.blank@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Andrew (andy.r.blank@gmail.com) ---
I didn't read the landing page that this is not for kernels in existing
distros.

"If you did not compile your own kernel from scratch, you are probably in t=
he
wrong place.
Please use the following links to report a bug to your distribution instead"

Closing this to file with Fedora.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

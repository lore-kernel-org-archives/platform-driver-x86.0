Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88093C2D
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717344127; cv=none; b=m1w1wvatvMdOmEVGvAfWNfyxqmsiSShF460e4++6/5JoZ6HshjFPHVbv/ZLiGvQelujYi4gos+d51KEyWz6VKfZ4TUbL5oX47c5KthnPbe1vNB5fQPJHw0EBja32dHMrueGLPdKq/nT3pxdd7cURegAxAVlALuAlETM6a4jCnaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717344127; c=relaxed/simple;
	bh=mj/KfJsd7iVJbJ9MlgOm7Vcgjrjt3TkZlGJaufsFlhI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jSHXc0ohxeDntahiuiyw916N9GrLFwmeQQ/GbVPNq6KieRjlSZZkkiBr5zpkiHHaKQ9SrtyagSMcxyPON/aeJcOX0cofJRPUxrxzOTKw3SY7ge3m7gHXpHEnkSi05gZqJ0yl2fFXTgSku2lBDTnsPzE8El8U1bvg2UzmFDVqcj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPkgGx4o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPkgGx4o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BC13C32781
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717344126;
	bh=mj/KfJsd7iVJbJ9MlgOm7Vcgjrjt3TkZlGJaufsFlhI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dPkgGx4oqeHvTJ/nXssWCMqLfutQYsGqwiajYg8YvOoEiOGdCg3BjFI+yzdg4pWMf
	 6LHG0TJi05oYBs2fDgpvTQb1g5srz9WJfnO3AwE7XkFN1bphTmyMbh+DnPe16HKwrJ
	 tC2thAYG2e4/hDhTyrnmhk5+uf0UunFFcKZrR1rP4dYS+gOC4sCCJqEK3hec2Q0v7k
	 YLoQ4bcNrSql58Q+ojAjFSiqaHgFZcErr4cFuxukaKiT2sSt6IiqDRR+NC/ZM+bg34
	 zTBY+r7eSFvkw0zhOX3YohICWesVGdRSQd0kvCErSWPVFSnvKpSYFKiybF66Q6HiZZ
	 5pYxJUPXTKGEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 443AFC433E5; Sun,  2 Jun 2024 16:02:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 16:02:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-esaCeiWhni@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #21 from Agathe Boutmy (agathe@boutmy.com) ---
New module works, the directory is now present.
I was having an issue with the v2 that didn't happen immediately, the wifi =
kept
deactivating and the bluetooth activating. It only stopped after unloading =
the
lg-laptop module.
It does not seem to be happening with the v3 at least for now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

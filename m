Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826083D47C1
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773165720; cv=none; b=mluw1Ju6p6ZRy0nhmAjEGZwYR3Dha8Rv4PkgJQmjnUhXe068anqE/t9KW53EQ6RIPs/qROT0FMtMj29u0MPq19Zk26lEc8WWgi/WfrXW/t486AW7oEcR8F/b9QLXKpzzi541wdOWw4CMTL2mtNy2uaehK/cduFLq1Atp/99mKeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773165720; c=relaxed/simple;
	bh=R8gfhR7dVHXGc84mQ+eIoyB88ZsrpmfjC3nvC4bALpA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mGW6CbVwPvE3kTfINZ+PRLTH8dttRe43Pjg7mAOrVlSeafG1uqepaFbwD/2ex/LyxFTFDYvTJ/kdUzlFsTMrs2YPRdHk3qmG6W9OS5o9vO2+5wRQE7HHpck5CTNrRM2G515EeFOfV7+MDNuBAcHi7OMwyS1dshw2aQSEkkYPr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqXSGB/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqXSGB/c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31C2DC2BCAF
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 18:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773165720;
	bh=R8gfhR7dVHXGc84mQ+eIoyB88ZsrpmfjC3nvC4bALpA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TqXSGB/czrjmM0quEZoC2ULrwBc5GGsa4pq7TqX2ylxGJuVqKym1s4ru+OUOT50sj
	 dvIwvSSql+YSIIWiFje0c7iEoF1DL5+hxTY5dcsgkR6AFYa5yj9p/4CvFeGzhKrhji
	 /GfxkdyNHbxdNqHSM84QQ3C0ustM0UMxr901yUtJ4AcZ0V3pKEqaNDjJ4DCQuvqwAj
	 vv3vnmrvRpxOXW9sP1ppwsZ59knXU8CRFkmjOu/dkB0lfugZp21mOhXEhu4ffeCVL8
	 JuDeZ+562x89mMuQm+2Ac9Ri8i4aR20E4xT+Ef9eO4JH7wkYwvgvkem6BA/2rtiTyt
	 wp8WssyvphYVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 216AFC41614; Tue, 10 Mar 2026 18:02:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Mar 2026 18:01:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-n1LoQvel84@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #51 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Thanks for the nudge - I'm checking with them.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

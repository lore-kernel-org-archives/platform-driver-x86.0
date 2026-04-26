Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263A427A462
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 19:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777230500; cv=none; b=jrIdmad8T96Suyh8lV+LORO1w5N84shWT4M6Ve0jy88yBt0BFR/nuNW5nOUD5CJifNe2SFp4zSbu8cbY514LJuHUyNqR6/Hapw5gsaY/MnedRwsFYESzva027HRsW+IXq54FvPhMCWAg2lTfzWmtWNz7SoY/XVog93ZtPzVaQOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777230500; c=relaxed/simple;
	bh=Tf9g4eFMTRsBla+f0Ag653GUVMEqKEtAiBruSPpbiig=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U48PGN+99PzPXj1maQSco4guVy9hFzFpVCMkDsEA8TWdVR9bLuGocx/YE9ri24iz3KDx1zsfHo4iLE30s1/Ob8Hd+Bxru5wStdJSbmT/mEagK++gg2bYDvDwMacwMIRwtey8HgOhkh8/G1GLXtXXTyN2Qjxev8K4FFXcXEnN8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMX++9Tp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMX++9Tp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9EE6C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777230499;
	bh=Tf9g4eFMTRsBla+f0Ag653GUVMEqKEtAiBruSPpbiig=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LMX++9TpZlJAQFv1d9nX3X3Xf19uCx5+v6g0yecPkEXgBYUzF7LUvmusSFK2rf6Mp
	 4Qz6iFlf09xUenGnSaoRk6WFXkYhf2aWan0Wg0rUfPZiQGfyefs9UXOmaZHyzP69FP
	 dhPylf03IuGmtlZpNSm/4t64KBV4w5JwYAAhe6W5P5yJ0ef8t6cso+hLxwAfnAMqQV
	 My0Fef4AXS6ztWbnIluuCvA+Pl4uAQZXJESQRFw0aYGiVDfl/CKMtnF4gbiFlI54Uc
	 6dVtwrTHHaJI4IRg/3Yw8aI5X5IjoUNpW52YQnuQm0Vd04Z0k9Nu6BNVocQ/ah49GB
	 5KuzJ1l8SBauw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B4303C41614; Sun, 26 Apr 2026 19:08:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 26 Apr 2026 19:08:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: boite.pour.spam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-biPHkIWNrG@https.bugzilla.kernel.org/>
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

--- Comment #65 from boite.pour.spam@gmail.com ---
Would it be possible to serialize the ideapad-laptop and ucsi_acpi simultan=
eous
accesses to a kernel mutex so that it's not possible for the kernel to time=
out
on the ACPI mutex if only one kthread can be accessing it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

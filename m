Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBB321E0A6
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722171; cv=none; b=tlOrs0UsJufuXxCM6W5eDam1RR2sKY1BVQV7sQv/PQ+ZJFe7jbr00Fo+Irfz/3aoIzmRLeiPD6KTUMXACvFnXuH7fkuncAtLONouVe9/qxOaDSw8dmbcZCJfmECswCBNCqtIaMKSTUXqlPrtoKUZzTa0DpnyoWhqQs67P5TMtJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722171; c=relaxed/simple;
	bh=hdaENFAI7KO2TQFG5GXz0g7nPy+JxsH4CHWwfwvEuTA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S8Zem2v2ZB8Q+EitxnvSBLpwfedLSO3JwDjaI3ro+g0W5qcHboPTIySoz8Mrn2AKW8VcreyQYsLy2coJ5eRTHBozE3kJLFylxe5lkQE2t0YUY079VyjoRrkA1rioEeqwAJb0KIn4lSTSVL8Zqd966n9aASMwboW+g9Kay+s5BLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8juYxQw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8juYxQw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0379DC4CED6
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 19:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734722171;
	bh=hdaENFAI7KO2TQFG5GXz0g7nPy+JxsH4CHWwfwvEuTA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r8juYxQwg4JeovDd0Py/QNz+WskFD+nEXAzv5Uh7wKlBWkxUykMD4uVOOTkm5coHO
	 F8RHEHrpWOihvds93+jKhV6ePv8RVFhXp9ZbUjH2xgKCcUZlV3k8Og39WvtLK/ylDd
	 0zVvINUEvpbNzp4AErXpjeyFAz2YEwTi5sIpVnsaQmJagpwRcHbAi7t5Bo43uGNsiz
	 BihjKPmJ1jG9m3wVNshRy4NT1zhvMC6U0Ji3c4kYiBQVRyywJ37d62e4z3epyLXdWq
	 tUiUmdwn4+eHAX+Y5zr5SOycx6H50MZJ5VpSAZJsJ4QRxqPlJNwxhSCW96SDkZ2saP
	 mjz6UNt2NNDNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EF2CCC4160E; Fri, 20 Dec 2024 19:16:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 19:16:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-apNhTQNXsA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #37 from jarkko@kernel.org ---
Errata: memcpy_fromio(event_buf, virt, len) should be memcpy_fromio(event-b=
uf,
virt, sizeof(event_buf))

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

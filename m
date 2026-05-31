Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B7233F5A4
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780218331; cv=none; b=urWLrMCklIsEpclHN6uYWD6CkLsf+pR2iX4lF/KsFxWLTsKF4f3CZpFkL69bN9wsIT0DLWc1d/D/pA74nAFo5BZdj4h+fAwysRYz0VQ+WfwiaZkTj4GiVf+YdYcIJE2MKz4FQgqcLYIs2v+phPSrfi9t3ou9fS18Lbz6TCOgKa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780218331; c=relaxed/simple;
	bh=WUnBVnTf2A1GARGh2+5XoD3WIYWKvcx5GZwVJCmC/MU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lCnr42hb8aWvBw2WD0zbDOYy+wHAxq03YauCoSTYqL7FIgT2pSB2AzYLkRRNRBN6mrZ9zloHDOdRh4c2XgH+fXydU6BMkIg37Zi5uDab65zZ0OGJEy9BumRSEj/TjW15k+GbXOPFCXZidQAQU1yjfJaQ6kv7N/kAh6Qb6ic9/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bqv/Yc2O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bqv/Yc2O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAA95C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780218330;
	bh=WUnBVnTf2A1GARGh2+5XoD3WIYWKvcx5GZwVJCmC/MU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Bqv/Yc2OJLfDVQb06yv2P1dsAYCX2k4z3aD37b2ea1O3uf0x7QPXmY+RCqD9zPUwx
	 ex+oGY0lrfexUodsC0MsCpeKroX6A157LwCncr4id7JExizXxCz5y95zbXWubMrW1T
	 +Eu14r7cU1tPvR4sEWB6TCdVJ3n0365Ur3IIeFuIsngZkft298FG/j1vxwXeN925yH
	 eF/YEpd8tN1ln9I5lzZIJsp0SksZkd7K+JmZWkfxwOfNhjCZOzbRPR+BZOhf9X0+sT
	 b9RWO14i0osHTQBdStWkHr3ReGaZdKZ56rTlnihS6aLh6mz8duidndkG9jqD66m0UR
	 Wqhot/YPLiNng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AFC7AC4160E; Sun, 31 May 2026 09:05:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sun, 31 May 2026 09:05:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-MlhYpt4NcO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #5 from Milan Oravec (moravec@ukf.sk) ---
Sorry for long response time :( I've a lot of work recently. :(

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

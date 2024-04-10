Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C428FD
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712727319; cv=none; b=kpo3L+grTAvFJtSVdmYLICVr8ehxpZhgCF2SI17pCPbfr2UUJ2yrzD8ODVXi8y0ZuB69G/VN1yLZzTmzOHtq3z6hX9W7GYEEuGpuBMTFiQvCp5MGqnQgCBnvLVTNBhqmA/7LsIHJ+U9UQ+/DA3ZneosEnbXq62TJ7tsOjFWNG88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712727319; c=relaxed/simple;
	bh=xWd7CC8LURZIkhf7KxyifdrKqKqksoeK/ge2DQ3fqpM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fayVKRP8/wZ/oYWRevL9SySlBNUWAW2TVFHXi1e/+a7LpssekLje7J39IY9ISQfcirQURX2g7PDqHBfod2bmMWueEp4CXqxyT5IkKsiDyq0yJqA3aiv74w9P+Z2lO5tiReYmXVzY9aNtKLzH4EyCvn0Umqb98D1QhFm3GINvhZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THqCbVZu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THqCbVZu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 532A6C43390
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712727319;
	bh=xWd7CC8LURZIkhf7KxyifdrKqKqksoeK/ge2DQ3fqpM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=THqCbVZuVyKcIYpdOe4/kVZacLCoM6mSM98+l6U9A7ElFaLfA3jr4ifcTxwcoAUCf
	 gAqsSsyL5TQdVLnB4fs11OvppmWD1qp0zyMWJWhxI4esWqn7GtQ6+jhknPd872/fAG
	 +n9OBEfkiMYerldF3rxKPplMRBb6vGHKiec+vMsnWFw4lQ/a7if6rmc05NxNPYWEzT
	 radPZN9VzfnlX0QditJp+SsxwbucymMUuG2yjXRiUiXVWufVHQX9h2mZl6dUkNchpc
	 cJ6JSyH1++ALJ6apZbaH03KvE5ATqzmpzNuBBkjDZHcZa7qcq27Lu0qefpGQumO4lk
	 SfjSjQwdRq3jQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3E176C4332E; Wed, 10 Apr 2024 05:35:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 05:35:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-EMSoSajcSf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #17 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK - can you please do an experiment where you modify the PMF driver to not
register a platform profile but let the asus-wmi one do it?  Try reading th=
at
same file in the different states when asus-wmi is controlling it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

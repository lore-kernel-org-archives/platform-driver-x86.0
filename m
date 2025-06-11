Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A03294A0A
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651136; cv=none; b=X48Aa7uDB8QE92CztbDzCETp3dQi5AZ7nOfsGWjEYQrtdEZnMUDM4TcWbn2EVu6Ky3BNL43L4I1JQP6otxO7clNACooAJ21n+Izvc/Votp5L5erCuFyywXUCQ2kn9t/3BZMgNitmJC8cwjZvzE0na/B4kXzXT0zWU2WusXgjFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651136; c=relaxed/simple;
	bh=CQj762OS4j+H2wg1/QB5R0LbGOSIlgiAuQKWcR/GUgo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lz0BN0Hrm/Z5EleFPdaSl9gwNBUQSsD0Pd2T2WUJ0tBlk2Oy21PJyDl/mmeLHMoVtQfeA5R8kHRrFNSFgzrAdwWPRxLudW9vNhs8eKMBYtVcA1gAmKFWHxKqkyUtP4ERV8JH22462qyKFwabIykMPIT42j/vdCASF7Qy0h+PuY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cxjolk9/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cxjolk9/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 350CBC4CEF3
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749651135;
	bh=CQj762OS4j+H2wg1/QB5R0LbGOSIlgiAuQKWcR/GUgo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cxjolk9/YGiOwHh4mKTtvDkExD56tbWkbZDajt4ABy+gt+UXzxCyQ3xdE/mZRrx5c
	 8mj/D/AYxjyBxAsbSmejhfPxIu0AcNg8ibIrmWspTtaX9tAINSJLhMS7ZyoDlUkpJR
	 LDd7y+BK8jELkM9aCtlfPOe7Rw6EFa7/bwjGNMY73zNnap1W/Bq37lI63dNstv6xI9
	 /FZ0/KE9dJybx1g61nMlU6v4ZHXi2zMUjRBcVCL6MiXtG/NG5UiDx79fnsI2r/dRC5
	 75mOZPa5qzSot81uMEBtOcikUkhGjMxSwhwkBwGqsQlNaG8LmGcua3aAjPLKj/I6N0
	 f/a/JdVL3HiyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2DC0CC433E1; Wed, 11 Jun 2025 14:12:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 11 Jun 2025 14:12:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220116-215701-puDiwy1KVC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #26 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 308225
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308225&action=3Dedit
workaround patch

Well thanks for trying with the vendor, that's unfortunate to hear.  Let's =
try
the workaround that disables it automatically.

Can you confirm this helps (make sure you take any modifications to i8042 v=
ia
udev rules or kernel command line out of the picture)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

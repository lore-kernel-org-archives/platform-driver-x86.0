Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BB736D
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 04:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737347372; cv=none; b=Bt4d7CHu9QILU2K9yLNO/JLf9N8ZolBl2qos7GGdLXLrsF82gX4LLMTEGhE/q8r1gABt+rY8nI7Ma5gbBJX7pt+pEv+w30sekja1aRqZeSubsejNsjeS5B1MMwqw7y/nMYeztRT6U/Cr6TPVmrpX6ucx9UWKCYwnSJZ2SnZBzzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737347372; c=relaxed/simple;
	bh=pkd42SQCcLbkYsQD5lEISLaq9TG4ZNGi6wnHZV8jwGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gdHrW9eBplDZYGWkPxj1X3aWKWqa34XeMBUGRa2/oy3JZSQageFhmuSxXa/2Fd1w5hDI0Zssppn/4KwQ+wG10Al2UelSbFAn2PskcvSwenhB+MzeHF3Q3F52RGk/xTSgoyGrucBDZVCarfuch/hR16HL6KvKb2AmsN76ZDtnjs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ik4FWrk8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ik4FWrk8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38372C4CEE1
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 04:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737347372;
	bh=pkd42SQCcLbkYsQD5lEISLaq9TG4ZNGi6wnHZV8jwGc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ik4FWrk893uwlP5EZ7GWytDEDHVOAP/zy+EW4A5QUjro8vssKx5/uO4Ob84QXMED5
	 IdbqavLnFvp//Ue6j2wcMSY3IpxRYjHQ2r8nebqxmwN3PKoUw8WYlTNhWkGk0nest3
	 T5KDkcjKMv5G9tBRLtV1v9YNAKXqIiCWRcvLnBe/HdcW15T6XfLtauf6m7srND6wyU
	 WQw0z76WPygt5fbH2v2mOnLRybvVMJqx5UmJRJBitujmxCH+12lUeAnagiuGWOjCln
	 35X0rtZUNjmm6Pozz5sxsT5aaqkK5Xd1vb7f+jPZlYO5sppdPvq0BgvUjOT+6lR7Rr
	 ISg+/ms4kZJQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2C267C41612; Mon, 20 Jan 2025 04:29:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 20 Jan 2025 04:29:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-M1BbDmX6pV@https.bugzilla.kernel.org/>
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

--- Comment #75 from andy.liang@hpe.com ---
The test logs are attached. Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

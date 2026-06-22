Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3245339936D
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136155; cv=none; b=VDpLU7KE+9138NIQrCdmBCSSluvY+Ro0eIY2Ki1YDy9JgAjOWpdQgLYV9805OSI17OHWFfktpiAtiVYjHC3sucT5GpUx6CThbU7aAINy01CI+gVFiBOcXP10iT0qPeJa8e3fVBdcY7nBvT2wtcpOexni4b/BCD2rTPIP0dSUmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136155; c=relaxed/simple;
	bh=j3lDTfazEuwsJuLmhc2F/KXgD4+CwCFtQuc4SzMz3h8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CkfqE7TajViKRKfV4oo1r9rPAnfBbpLadEyyKb+f2Qez/ggvLum95bY2lRTQ3QezNErxQ9QJLtv28CClKvfNJ2VsrhUtDozhpzfrBwJ9Tui/R7Uvh53DpsTu3HXbjYiyhfd0ckFtcVBPCMYZeT5gaqwbhULHdDh1vwJNROQ1bVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tImU/PGd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tImU/PGd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBC53C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782136154;
	bh=j3lDTfazEuwsJuLmhc2F/KXgD4+CwCFtQuc4SzMz3h8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tImU/PGdpOB6SNB4Aj1WSzzNpwLX8g2WMssOkkultwGfkAQmOX+DUNVergTiRsqn5
	 YEijw1qjRO3qG334a+IAdsVOY5RVA6NHWrzt56LQbRoZ/CSz3MimH+hwxQHX/T+Z8U
	 x+jl/GM0eI/zLsTDab18f3yCbt0Pyqu0glS8r+uAQQckEzFZwCIOf/PDyy/RWUo6ms
	 YZQvUSCblk0pHwubk/Z3f9fBjN6FS4o9IcZ9rxPX4F+qNq5JnJy8pOpN/PtC9YHgCm
	 J6OMcHGUuH8trHvRkeh6H5Qfy1b9YdOEZ0lqId6h61NLmrVJvofVcIuh+8qX2oo6Iu
	 A47BxAX0x1uEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D15A9C4160E; Mon, 22 Jun 2026 13:49:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Mon, 22 Jun 2026 13:49:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: qwqgong@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: see_also
Message-ID: <bug-221150-215701-9kalIHCc3M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

wudd_maya (qwqgong@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|                            |https://bugzilla.kernel.org
                   |                            |/show_bug.cgi?id=3D221680

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

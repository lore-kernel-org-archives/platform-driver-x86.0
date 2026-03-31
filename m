Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB20A35838A
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942279; cv=none; b=Wtv4B7Ym+X4tf3BBYGaGlosB2H8hvq2qmXOLxi5W8kJw6EfON9g9rVXIIlM0/CmHxb+lsRi2pfHNXY+zlbB6i85QiNtQGKqVZWN/ftCM/0bRf9NZFItoiHZ4bKcJkAJwJ7vd5zLspoM66Ifekse9ZAtEpHB+CHJgOJDdGWtW84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942279; c=relaxed/simple;
	bh=xTIyEE/gxhMO+LZ6yeYO9erj6izM5ZNIscon4e6CU4o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HaEgFIbjkeaHNHbQnIyYXfDUOtsrkBzRJ2B0j7HuW6ieyv9G3LmAIbgeXndEj8c9o45I3n3WEnMq6TVm5PQiIC6OvTFihF8XoQmrh900r7Rc0wW6ctHqv79rFwujOIfAAFYHexheEAJ3J4hzjFFdGmkXGPh9xK3mmcFna8HbYL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcPBKkoS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcPBKkoS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CADE1C19423
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774942278;
	bh=xTIyEE/gxhMO+LZ6yeYO9erj6izM5ZNIscon4e6CU4o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QcPBKkoS9N/xJjYr+ouZswu2O+1iASxZ/1ZCC7LUc516ejCDMYJn5TrCtjBurwqwQ
	 Vue32GkXXczi2LuNJJbDfyGZCfyZGIaqA+4iUwyHgRaH0dLc1QUxsJW1Crt2yN9b5p
	 V1yNAJ5R6VhpknVGomnije52rStZTI80ylkVRgIZK6ahcHGkqvarAHSPnVWHiMjf3W
	 RQcXXOW4haexRxVxvkatO2ZS5tgLggjHdvXrxcf9bPz31/PEzOAQHs8uRz+4msQnXz
	 bNC47UwlMwTLLNeVjo0GVoX4U0KruUsdisvDoUXcPreeht0BJUfc3OCYIZLe8JoFg6
	 Kuh5Yn4RceGCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA011C3279F; Tue, 31 Mar 2026 07:31:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Tue, 31 Mar 2026 07:31:18 +0000
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221150-215701-YzD14g0JX3@https.bugzilla.kernel.org/>
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
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

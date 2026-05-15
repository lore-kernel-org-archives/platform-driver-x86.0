Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6722E48A2AA
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853734; cv=none; b=KB5lVYuj7s7apFDO1S5c90h9OTyIqgnpRBDXKielbeHoDCaDPMCPN7kO3WwTsMDB/s+0vlur19LqOjodTuHy11V8xaqd2uQvGTY/ySHmpLXjQwGKBwuXJr88QVzIr/W1uIVt9zVttIYfpXNBIIjbyRpv09gTiP1iUeOTB9Naoz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853734; c=relaxed/simple;
	bh=vM0ZOOPHSP7U10giHWtr/LDgKkYyv8MQUaoPhe5jw/4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sTndJKcERAxiSULiLnEnOlUoAWl4QUCjdDwbX8WPOZNxaxjeLoZvQYrxcVrVugX83xUJhY4UnmbWs2t3w21EmOogQDZZjuqVlvu4Fovo9Dd+0m9sBnuIU4sbcfXo0vHOASIepSCaXSXaWGYlYMmTwZgIGZFo3QYXe/mAOEgG6TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4wo3OxI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4wo3OxI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCCF7C2BCB7
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 14:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778853733;
	bh=vM0ZOOPHSP7U10giHWtr/LDgKkYyv8MQUaoPhe5jw/4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k4wo3OxIImT/1Uogv2Y0TirY0aW2m3fG0uJ4XeuD0Ng44Q1jvcnP+Py+OPh1tsGqZ
	 Sdxv//UAIYUbYc0tdUfKfnDxN+kg/sEZJlnq8UVZRx3Rk8ZjHNBPj2R/Ttgnwp38H4
	 ot5zqEjPOUOBP2sfgVAYQpWe6VUctHq5HrfGkHYQmNUx6KJcD18N5vl7y3kYULiMgK
	 +WR3Pl3eDtO7h2S0rG4nvnYgFEMqcVEd/n5NOMNYIAysB4NTZzE2AoHrxJscAABHjN
	 xSjRVwRL9dWwl9tpiGDKsbxTbz/FOCBaBemvNZaAztTRrxY3+tUP9I++C7uRZICaic
	 MpjApSbXjYBnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ACDDBC4160E; Fri, 15 May 2026 14:02:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Fri, 15 May 2026 14:02:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-221523-215701-1kKKcQDjXI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

Krishna Chomal (krishna.chomal108@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |krishna.chomal108@gmail.com

--- Comment #2 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Created attachment 310134
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310134&action=3Dedit
Proposed patch for adding support for board ID 8E35

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

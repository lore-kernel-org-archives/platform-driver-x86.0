Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF4225A2C0
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Aug 2025 03:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755055803; cv=none; b=BOoBthKw//gF0BnwhsYXD2RxpmhL6N2MQMWM7W/rh8nVnBTdkAQoc9TLsH+aVp5UYwyq2j4NDgv5Rw07EHFtKpvY7sU0rc/2hMc7C9OPRrTKZW5s3SC27ASP/SKXSlCaR9XH8KW7FmG6/r65yC8Q830XSWNL1gq4S5t9z2wNKQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755055803; c=relaxed/simple;
	bh=DbG1PlzfUncFUAD1VerQUSGsMc9cQ0Tw0JkrttP8IzY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UVrIIBG8JOUeOdbOXVOuUr2HysnMBzXQIZjfJS+7wZLHWwgBjBQgffcqMqddtX0/UhkLSC+AOs3m8h4lJGym1WRBXW5xoGffcdAMlgGNFSCrhfRKe6QOH8qtfyVg/KAD9Ujbe8m97LnCcmnEj85ylm5wvRHVdE0kV4F+CQF+emY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qz8C6YdG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qz8C6YdG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC565C4CEEB
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Aug 2025 03:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755055802;
	bh=DbG1PlzfUncFUAD1VerQUSGsMc9cQ0Tw0JkrttP8IzY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qz8C6YdGhbPkq9BIAWmhNzabH3U3kZjK6CDe7VCwKtky87ScqWokq1TkzfTPcuX6H
	 BhS8Q4iW/Dke6g3mFpaWJUYBk19FA1UylSWp6LlSP7G4nxtAuhU85lxbdPRYXIALnw
	 ZIBryPizZcmJFTL0+wYpqsN3tiqxOdoEMdhlUdy3QOsfre+NJbK12gD6qj1b2z4a0+
	 4COmAspZa/rxQzrpd8RFLEj9S129xC3OYfzbdgDWrJWfdapt0kM8troVZlceKXXFXA
	 A8+v34giZw+ejOtnEJpESFOgkXN08pkTRfy4MQjWHBJ6OUbxVxiWoV48tV6jxK049x
	 GLZLOye9jxJng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B80CC4160E; Wed, 13 Aug 2025 03:30:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220421] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU
 telem endpoint -6
Date: Wed, 13 Aug 2025 03:30:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.e.box@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220421-215701-hsBNGQsMY3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220421-215701@https.bugzilla.kernel.org/>
References: <bug-220421-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220421

David Box (david.e.box@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |david.e.box@linux.intel.com

--- Comment #3 from David Box (david.e.box@linux.intel.com) ---
Looks like the firmware was updated after the driver was released so the dr=
iver
is using an outdated value for the DMU GUID. This issue won't prevent the
pmc_core driver from loading but will prevent it from providing a file to
access the Die C6 counter which is useful for PM debugging. We will send a
patch to update this after testing and notify here. Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

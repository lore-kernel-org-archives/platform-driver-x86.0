Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C0A1369AC
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712677777; cv=none; b=bnyOCBJiBmNJEy0C0bihq94fuAGgCGabcxOHuebjbFnFAlrm0PMA/3tsfdaa/IWbjcvnNbPxx3jLd1uKkHllQLvuRDj1B5XqPu7BqsAKhwY30vyC3LzIHr2VCFmkz4z3Ri3K3G+lvrPeECCNf8rlt1Zublichp8ydGd5oAOKbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712677777; c=relaxed/simple;
	bh=VJsZPS/k151IlbWrLU5CpwTJ4ep2rZqOCa8PQqMHZrs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qW/JE/BsUmG2r+n/Nc1e7rHVGrIdgsLDGdX4TNKNK1RD+dQPWKvaejSTjh0Oy4pP0Ei590pt9KHXBbpxubYT3gnt+nOPiZj42NsAorm4I0K8aR+eWSWnEcSK6NEtOVOW1rSOxua0nscW4W1xkH1AE5ouXLymLSCnFn8QW0C/SHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPBdBHCx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPBdBHCx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2FD0C433B2
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677776;
	bh=VJsZPS/k151IlbWrLU5CpwTJ4ep2rZqOCa8PQqMHZrs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FPBdBHCxca+YF3djWyJza0z4spK8i042HvOAppVndFRY1/m7WyBS9D1Pyfi84b1Pi
	 70SKJUoZHLnQuuqmzIMmWZOcuTw6Vl+ZsPPKDlxGtb49bciaZr7SzNMJoltN3eS7ix
	 vbqE51IbxDCDyqqBCzKCcbAxvBk4griM4koz1tEoutv9yYp1QwdtM+mqq6KUpituw7
	 H+VxWQ7OPAEeJriNkQbKr1I3ogAuvvFeZjwcAn+as4BG7ZBCEsUpG2vhVOtIsr5mRw
	 hXdmxeQTd6A7nhnZkURbuJYXOVYqT0ITP3UwQbZOO+XiV8i0YUCSw1MNTuns4p+wBb
	 ODc9mUxqyQszA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BCC29C53BD3; Tue,  9 Apr 2024 15:49:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Tue, 09 Apr 2024 15:49:36 +0000
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
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-218685-215701-O1EFEIqNOK@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|x86-64                      |Platform_x86
           Assignee|platform_x86_64@kernel-bugs |drivers_platform_x86@kernel
                   |.osdl.org                   |-bugs.osdl.org
            Product|Platform Specific/Hardware  |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

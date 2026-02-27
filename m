Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6853EF0C7
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191354; cv=none; b=RVmRgyiPMhEG3yBnUSJvDIKt3kAwSZ8RNGHWqOr5tq1tMDUlxXSImzYTiik/qPbQBiSTed8Y07RMxr84NmhlqHa7nCiRM7nbbb4ys8Gr27YZHZi8sTjWO/oavFi8jsi/prGrxOl3EPOVl44B9B0fGBEGlqmkKt+RXjn3ugSiqBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191354; c=relaxed/simple;
	bh=hsjOi7nNYOc+xYu6lSQFEchZJhFCOyReA6OyoJ46kc8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PpHhVz5JKOjnxJdmg+FFgbs2lZxSR9HyYgtx0kdO7QYZo2Ppgk3LmCnBc4/feOWQ02BZAYJBZfCfs8RCSTJjUvXYetMgrzvf0tSrfM7HRu8qffrLED3gncDvPNmL2Zg6yFzrTDFbHH1Flr+G7oUCr6ycIA7NZn9R1m7LujEsx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlj3EmeA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlj3EmeA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FAFBC19423
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772191354;
	bh=hsjOi7nNYOc+xYu6lSQFEchZJhFCOyReA6OyoJ46kc8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dlj3EmeAEYwfaIhJrgeWigZOk3YI3SeX2pGnR3gT3kLd6TVJmAKQxM4fEupr6AHdb
	 wONawB3VDrN6fk9L/IrFwB1/lfofZ1JN7bmyup+peBaI12dPL2oXascLuFw4dGEKO6
	 KA+La5RMXt+5ERzUqmNnH1FWCQPoHYueE2DhgD2r3n1LeWIBhppyBn0ZV/BhgrqHW9
	 gkndoeB2nfYfJINVHj59CjFVktCXfKDTTKIU9mBGnkQwtqxPptv6/i46qVUDpcUo39
	 7XeFVep9F64zgyOtDN0Wk8TEMpAXxmDv6t04uZ50ujK8HTJ5uCIIyOhkub7XI8Sxi2
	 SPkWwVyQ7jzHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7BB04C3279F; Fri, 27 Feb 2026 11:22:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Fri, 27 Feb 2026 11:22:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: qwqgong@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221150-215701-zQSRngdmXJ@https.bugzilla.kernel.org/>
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

--- Comment #1 from wudd_maya (qwqgong@gmail.com) ---
Created attachment 309486
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309486&action=3Dedit
Acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

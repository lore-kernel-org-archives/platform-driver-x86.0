Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB92D6E5C
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309401; cv=none; b=OVoTSA7ZgsbOgnqf0o3SyM/VyYzs6cPdY0+8nT+N77WwP7Hf5V9oHzhLDDAvZk7Pt4hJgzN9J3nbz7M9f7+3ap72gGmG4Ex22OE8mAqKXEYet43C+GkP8vaHeVn4sDcNRqd6HmYwqu4CYHIUy0MPgpabxegh+NikBns0k+3si4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309401; c=relaxed/simple;
	bh=SpZvo56QoRzzAMBUQ1lku/ryPtNmcWvk5EeSKkRcy0M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fx7tMtg7I6Tp/HdRBfrJ0chv350TWK/YP8BCwWgHu9E4GhbppWrnX1piugHwdzS3zRMj/XuMPwKPqJrPte3edL93Csn+fyAkaMJ4czlJwswdrbTZozA8suFQAFtm7rQqtk7l2aIgMO/k+q136KH9Bd8I5ain2knsl2pS2L3a8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCO+utvw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCO+utvw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E627C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309401;
	bh=SpZvo56QoRzzAMBUQ1lku/ryPtNmcWvk5EeSKkRcy0M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pCO+utvwJMyF+Ir0my5QaLnJbJlyIlk28I9y+ztT2UCJvyXWks+xS/tYph3r459J/
	 KY/MhJcmjIMUrbsHwV9J1vj8WqEAGFA9vvTwtN+rjwgB7J0omBPmbxvd+RHdoxsia/
	 rAAjp1MqeO5dKYT2kNkE/uNKDQWJn0SueC8FblUsrtxFCnxy6Bt9hbphWqQ6yiifwh
	 RHGJ6Gg55Z0uPxbourAhE96RuGBOU9Q8pBBCLf0V66g0B0slwSCB9SDmUHbl6Wr53t
	 iy6ga+PlUUSIx+qzJ4HGEvMTz/d/VLDohrqZhMurj5g7LQ+qoWhmeOYmHHM5nHpVeo
	 DclAO4+8daNlw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E085CC41614; Fri, 21 Aug 2026 10:50:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:50:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220926-215701-92nOMR6w2L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #9 from Gibs (gibs23@proton.me) ---
Created attachment 310700
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310700&action=3Dedit
ec dump while on battery power

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

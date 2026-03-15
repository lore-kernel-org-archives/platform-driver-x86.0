Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72467080D
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773583124; cv=none; b=inNiA2ONqIhq3RBce+1zz4pludA3ieyjqntzaM0+dkkc/5OZpPuaBw0436/gfe+pvosh0C+o8CzuFeAgumW122jPPkmBcLIErwQeddeL0i4S7k0LDQ6mDgvRlphQGgpfO7InjHsWDqCQb+BBNHrgFKd1054+uh+QaEDvtKVhvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773583124; c=relaxed/simple;
	bh=KSVnIits9CgpbMeAAoaImlvHovNOCLMGzA8l8icjqvk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AlmnQ/wM+CxD1fB/1N7JSfyr8OWoY/eQVhDJPKeUpcdAwPpZ+N5at2Tq+lA5is9EUUHIDiTriVaK1zojr4XeX4TGzFBEl/kPOX1pN6XKsf6GYnS4BMNkva/Bw4lwTqjYigte8IOvYrVKR+oHkEsHcewRWkln7KH8dhGol5K2/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1MJlwSp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1MJlwSp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E559C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773583124;
	bh=KSVnIits9CgpbMeAAoaImlvHovNOCLMGzA8l8icjqvk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z1MJlwSpZy3ky8Ov4viPsQpfED2iZjbLw3GX4U/41EY+Px5l+oy2iPfPdCZYoE4hQ
	 ARZM/ZgIvkEZjYBEZBzAj2Vfgo8dv9/uEIXjquvgH1a3C79FD80p3cyeFwPiQHnOor
	 HOWCI02+YilqtK71ypHsOfaTJ2Lbsgo4KsccesQ5Y54JhkytV8sgX1sEKMm0D+q7CT
	 XPGjMsBc/8T1EGQ6DGbSEvvVSUZgt8vRh+YOA3qoFy6nzgcYwwtU9kKZ57LvXyKEZO
	 FBEtHn4N9C2WhnoKmBL1XPuKQgtsfypmawiYQ4kWI1TXHUH267A7UjWq7ZAWy0nPyu
	 Q587jiPV8ZjCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DD4DC3279F; Sun, 15 Mar 2026 13:58:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Sun, 15 Mar 2026 13:58:44 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alfonso.garcia.frey@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221238-215701-ytDdBHLrS8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221238-215701@https.bugzilla.kernel.org/>
References: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

--- Comment #3 from Alfonso GARCIA FREY (alfonso.garcia.frey@gmail.com) ---
Created attachment 309669
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309669&action=3Dedit
acpidump

acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=

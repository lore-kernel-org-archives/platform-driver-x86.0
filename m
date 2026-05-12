Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BAC3BF672
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617524; cv=none; b=lEmgbTSJ2pCPysrI7YD3/fL1b50LLls6iTJ4z/sdxwXKXuDLmaaNM9VyfJZjek/45fWYh+JWbOGuYPrdGCNZ7rpr4nPxcuSKZmEiO1w3DZLkQm4My5pxvqOOZ9TsMvMSqcIweTUsds4sJktkcPNaxNdK5c/rChbN0dJ5ALH51xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617524; c=relaxed/simple;
	bh=fbLrNcCWNc7OmR4VwIst3s4QushvvtrURqC383e7dQY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G65BpBCGCXt7kY573NcCgdTgfOq++V7sjwfqgpJHyQJPbmwvie08WNb3+jdGaiQUJQgpsh9IKEh0VKRvrSZ4CucJu5vriszMoU4gk6NYY6YswO6N4lxxDC4d9lnLr17R2JCG0zVDsOj+MWkvJFvpjYgqnArwWRkVvkvV2i/7EJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frAX9yIv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frAX9yIv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EFF4C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617524;
	bh=fbLrNcCWNc7OmR4VwIst3s4QushvvtrURqC383e7dQY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=frAX9yIvgHyGChixh255gSJfthTlGaO5xVKQOKsvWJsuOR1JTlqq/ew8ON2NodwSk
	 N7GJP3DJT4bsZZlTal50ybM1cJFv58+A7DlhmdN5F2uz/HrxoM0ZK/QDzCXDVuiJqU
	 o6ydRavHNogugJTobDmNYjs+l34WA/zrFXqX+7+d7qmNmI3zn8Dnbu66YuoxC3IjbO
	 NXdGeuL4Unywwe8zlqxMDbsXqbZdvMozk3KSgUjPG6N8T8r1ol3a76u+nuxvfUKRre
	 QTwBs352O989TbqBSgmrx3cdyx+3JGlagFS690Xad2mHGHN5stKDrdBPmSPWryD669
	 Y5oxLqVh+F3kA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6053BC3279F; Tue, 12 May 2026 20:25:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 12 May 2026 20:25:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221430-215701-z5VmVr1pKz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #11 from floquimaurice@gmail.com ---
Created attachment 310099
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310099&action=3Dedit
i915 VBT dump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

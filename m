Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2273A7855
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777411522; cv=none; b=V+zfFncKRSBHSqFrcTK6V0YlPCSrSswqVjM2dLQWaQ+dNJ0p6zjBkENHm34MFPqzxhAluevALvhEIYGiHiyKmbaDHaBD3o4T/7o0/vipy1dD9S557e7yIf7wh1Tfx6NNlL1iSfkoAQwMGbk8BLgju7N/KZp5QS0Nqa15cEI7gfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777411522; c=relaxed/simple;
	bh=noRVTOT2QRI8uF13bIAtJh3PHT+n+aUH6GiUIgbGWc0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EuKlOebm/KtqbBwBuco01M6B60WkA95GcAerT6M5v1fydVVQQ58bYz0/13cvTiGHyGBxMu2Lmn27ZcDxhlb4Xmt4YGiK6bqfV94E9NYdMveCGQvQuiAL1kiqEQzj/My1NTKsLu5DmfhiDqURkyNoFZg4b2rZMO4Dy+rvAXASt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcjLw5o2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcjLw5o2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C16B8C2BCAF
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777411521;
	bh=noRVTOT2QRI8uF13bIAtJh3PHT+n+aUH6GiUIgbGWc0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lcjLw5o22HykJ/CCTjy4jQegPQmCi3Q+kUlEIPwhePnO4pdGAJLFMNfdc+oonKXyX
	 Xu9qY5PLIx0hHBv+s8QbOUA1FsQDlNYsUvcfAW9JSuIZCKwvrtUWxHaAUua71lWee7
	 xVkkjqiOfsrrVDNwLi5wvHjR3FjwWkwUVBaFBThoODyLpjmRUr8Fm45AMVyRgsS/48
	 fIzFHD6ZL0axjJV29IifWDQHRHWOsgQiGTf3RPekDAazyco7wIqlYxA7Hu7qVgRQbm
	 Xgz6ya3uT5EAcoMVTy33o6woiWFHPnZFQYFA2goqRQYUsfPxoJBZ7sapPBw0pOnDbo
	 hBLiRHSBgFqgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BB709C433E1; Tue, 28 Apr 2026 21:25:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 28 Apr 2026 21:25:21 +0000
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
Message-ID: <bug-221430-215701-zcJZGn3kOM@https.bugzilla.kernel.org/>
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

--- Comment #1 from floquimaurice@gmail.com ---
Created attachment 309993
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309993&action=3Dedit
Full boot dmesg (username/hostname redacted)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

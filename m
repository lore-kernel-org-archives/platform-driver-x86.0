Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2214EC73
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776917885; cv=none; b=XBWZFXE91z9zW0LJA+aFzR5ctW7SoNyBkHDiHlkdplKvof5OKPgh6v32bCz4h3ThY2tvS+BoSGafp1fzGzNH0Nvy5jUVY8LagB3YZFlA4Nhv18xRAuySMAnoUfEGEvMLlO13fN6vSVx6isViq33ERe7LXkr7Ux3aT9mdPqw9m80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776917885; c=relaxed/simple;
	bh=ukI7XdUNceIdiJSd+qGPSLap/5N2kk+7UYk1tBsqHac=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GLd6t5AqmM/LMMO8TAOyIB2UqPP9kAhbe+i8iCuZ7kbw6e1D3+7kZ9T3Cas5CXPHRbDyDvPke+hGYMhcpeq9yoZQmvpxQeRDJvqFxZWQ7iAusK6RjsZHoirb8LYllKIC8GR3yTkK4Rru31pRvEmXrPJIuZMmIaevZhPTnduPmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osPhHL13; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osPhHL13"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E222C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776917885;
	bh=ukI7XdUNceIdiJSd+qGPSLap/5N2kk+7UYk1tBsqHac=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=osPhHL13eqfW5nmp2i6DgPn/BKMkjpQlkW1b9/wTUbDhl1ga/h3W+jHABUv5dqAGq
	 umKrgwtDRBR+ljq3HWoOYez79kKSvKAq6GN2ePXt0K4EEyn6qjjza7mwAdhH7Q1vMm
	 f4kJS8ZEqQdt6A4Q+Pq0E+AyOtIUNOjGotVub8l1cJVlBGbghv8CpRm/E0F/4XrkP+
	 CJMx7ymUppGJUuhBAroHlS7DINJZhUTHBCaj1YXjjInYyVvW90vMLMZ+FOwK2kdDTs
	 faHqgb67OUBsXJtUivRCYMiP1QOtfc+PMu3CKH5D1k7HNEtd8tS193dvtlWnES4pIr
	 iVAq7YNmKIu1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 799A3C4160E; Thu, 23 Apr 2026 04:18:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 04:18:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-Sljb6wGlyo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #17 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309932
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309932&action=3Dedit
Daniels amd-s2idle report

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

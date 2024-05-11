Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFF41078B
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 May 2024 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715423132; cv=none; b=HLUks/XIV8/r9v97KnS7zScQZKQMUDXqv9SZpndybjqUc2ArMzLjHEnxO0tlroh0xoyRkavO9ZFwZpP7c8rr4lS7mtk1nwLk9Ld6SJrctmCbP+Ym6/1kWpgNm8JItMVicJdZrNp78eAbm4RaUn/lQAsAPlWMFWlJk57aZaSXAww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715423132; c=relaxed/simple;
	bh=WgsBuJr+3G1SI4ZEA6m28fjjb0rqP+OKo/iR5mFsvIM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WdT5x9rDHCEt5R178TsUjnCOoaYop+m3EswsIUym0uYHiOAOvDOOPKDxDUEzumNw8I3hkPdQDsxInuRo+KLr+E0jlbWycop5sOsnH9bNQc4jGOHbkfCFWZRca37LvLi3YEJBmQFDdMCDMbA4zwc/fB28GOhX0G+hZ9t0LisqXIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTsEMc1w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTsEMc1w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE3D1C32786
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 May 2024 10:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715423131;
	bh=WgsBuJr+3G1SI4ZEA6m28fjjb0rqP+OKo/iR5mFsvIM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tTsEMc1w2rZGJ8Xt5+WfrsF6a18HKk8k/OF4YalsHZql6+Ym/ewcdfrPQpQtBTcWx
	 V7/Jvn6BRkuLwT0hVq4C5399IA6NWhKvF1QRz5u4hup34vAzkls8JJjaRhwSHyfPrO
	 ubJ5kMca0n/eC/C9NpmR5DNHxIg4o9diEmQLJZ3ivYOJPpzOgkq/aBYxITaLWfyGlc
	 a7IpHcGFjibrO4sQT1ZUoeGR943IZXg3uFEjD0lgygcCHe6oflB+I76c3QMaRzGff5
	 jg4bX22MXduV7s/PK/FqZvWzH8Bbin23pnlifnzbytx862RoFRqCTMsojrFo5mqXNq
	 vvfTFTarYPdlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9EEDCC53B6C; Sat, 11 May 2024 10:25:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 11 May 2024 10:25:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-V4sEVZokrZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #70 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Yes that should work, but the resolution availability will depend upon how =
much
bandwidth your connection series needs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

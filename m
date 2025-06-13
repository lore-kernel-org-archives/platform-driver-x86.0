Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACFE1E1DE7
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827396; cv=none; b=G8z2G4mFHlDDiUBtECl0vMwCYONOxi4SCarh+KuRiAelVz63vcA1+EjzqkwdV/dw2D7PaBalQv4u84xNbAvNg8rBFgsdWgvERBfV30sIeR8r10pUjMnUJ36cr77fpVxiIlpr0RpCJZqbhVQkM/4WZk+oJqA7g2CvX8dKkkis5iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827396; c=relaxed/simple;
	bh=cFE5a4ZFRy7C67+nonh6fzlODTrmic/z2hRHsj3rH3g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=btt8m8JKt6kDNnGfM+V/1h5tCETxM3LbWIHbz21R6UJgS770kFR0Ve/FZjfc8nkbijJcHp5o9MSczCtUGbIvjQQc2SAxE4tFMWMozUMierxq5kqHqHR7k/VAMpjT2Umrk2wIwgB3v0WB1xU5/gR0U1g4D2mwNJkF58ajXJ8jWag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=so7a3LHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="so7a3LHf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 048CFC4CEE3
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749827396;
	bh=cFE5a4ZFRy7C67+nonh6fzlODTrmic/z2hRHsj3rH3g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=so7a3LHfK8eU25ZtyR6zeRAQfqpVB8BGVBEIiZ/VkSnx1kEGLDj6RfJxDUVDeKF0P
	 tTP1IIbQP1fbk1h6PrnL+o3A+b78DCbOJqVh8yUDNTiz7UMS08TaU7hWq5iHgAmCbS
	 SpU94v+n1szo+Cq7etHxvSOAC4Qs10DUjv24roXLxyNj7UF9DfZczDAK17Hli75Nku
	 CFeA1Khlno3kggfHIkPjEs53oKdHETed92hokN2D+92KISB/up8EmFoy6k01xSp1xh
	 tug9Vf/C3YHVKEVaMFdsOTcOyYolzvWIx3c7FQW4EgtYYcoAWcmdO8iTvsw/wvYydj
	 5J0CqcioH4mDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6849C41614; Fri, 13 Jun 2025 15:09:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 15:09:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-efoD5MrOI1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #22 from g.molinaro@linuxmail.org ---
Ok, I will work with downstream and forward eventual results here.=20

My only concern about the BIOS update is about tainting the testing envirom=
ent
for this bug. I will delay it for now, along with other OS updates, at least
until I'm finished testing with downstream. Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BD71DEFF5
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278471; cv=none; b=OKYLND5WcZZGdu+yEm+GiTs/RVHvS32DJ95iYIDw6pAauqvLWia049m6e9SFAEoJVahvnmYlcVwsu6vQBrDtLXYjMJEG29hDiAtGky9SNtT3YL4ilGnl6usJpRVhQV080FycGbFB5ErysUPbIHTJlvfHj8zHdxmq6fbL/n+2Gxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278471; c=relaxed/simple;
	bh=EvGEXmAl0R2AfYHfGRsuW+/bx8ja/FprPcmjxFKpoXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sd9b+Yi0oUGxZc0hzEL72838gZcXfId29asFI6aYW3yCIE9mNpoLFoxJ5itWUPDs76W3zv+Y2NQbCXXjDas1xAdjWxo5B7wN7l5vVzmvDrm7I/oSn6Zp0yN9p6RavD2qQKcf3ybe+9vpwIhviLjY+dQdA5aBXM7nXC+NWPSsr18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWPfHCoM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWPfHCoM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8B06C4CED1
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732278470;
	bh=EvGEXmAl0R2AfYHfGRsuW+/bx8ja/FprPcmjxFKpoXM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RWPfHCoMpS24lBukwlv/OZjPQgjlkMKU/C5CBwLiV2liiJsbU+upUHXb74rbjVHrQ
	 62U1bzDprovNmbF6yNsLQ3XdHni0DsT/aBAFUIq2gaykG6NjHhmPFzwFgD6XzVbtV3
	 xEA38h19oUKoY9bKfQ2zIm+jKKq7OeWK9uX4wQfTYdoqg7Nwm3NUwVTiTTmpq6VQwb
	 tVMfYO45lFkiYpTtK/f7oYzwyb4h54CsvcF/Dgy8gDpbgCbERgN/EytrReaIhGiU/1
	 i4D/EHeJ1N+osu0QDi/Cbl7J44URWhV8NGyCKe+Dj1h74MTm+qN0lGuKPsVlj1GGqv
	 AbWIMKHTVzVWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 870CCC53BC5; Fri, 22 Nov 2024 12:27:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Fri, 22 Nov 2024 12:27:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-qoAZs3ZpCM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #16 from Michael (auslands-kv@gmx.de) ---
Update: I removed the first part of the patch (where the retval declaration=
 was
removed). Now the patch applies and restores correct functionality.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

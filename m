Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26213C8F2
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 May 2024 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715244419; cv=none; b=LOnKhOCEk3TNu6jETc7Ufenr2dc9UW8a77JqiVUjDk+JQinehcqoMbkDGOITJ7WSYstFt3FNmtAplybEPRFOgHMqyFOqbFtv2SpSBICrpAGXM83AhSDpPOBVhwwI4zJPizUBbJ8GFYFmZe1dThAxnlEY2mF5hIaf1MHMZ22FXQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715244419; c=relaxed/simple;
	bh=c8WdzbtIWMSTYyLhtja4DpsnVLMeBXHeG8EFTbzqrvk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=No50DpFpekDD3Sk9pBBeE1rY1qaQSr1OCtflAdP98IV7oBSeOcP0vM/eVHWysb0gsHj4aDiDulkNMMHNaqOv/xi6pdWhpeEBTFugdi5rJjuN4Puck7bIkOxlyXe1icQ+6xDCVtc+1Vg3AiKZzZrOpGrfAW2Tfx1Kn3sljCXicoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdTl7YJo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdTl7YJo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D749BC32786
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 May 2024 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715244418;
	bh=c8WdzbtIWMSTYyLhtja4DpsnVLMeBXHeG8EFTbzqrvk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qdTl7YJoJs2689QNO3S6QKZHOvBaeUAKWR+OdyoiiWrbjSTEaYQ2NFUVlTueh30Lm
	 YO1nMipxsQWznaQoH7ueKJN9gAL1LWitEw0LXAl+dLTM6/JDsE85fwKmz8pGOqvj3F
	 RY0uFlEM5yc14Fc8Wzchz7HQed48vfVFVTTp/1mPBuvY1vio7KNOv5ztGqq+dHrHib
	 dPDdd+o8vENAvskSlfkE/utJSrjGg4dzTAf+a0gf/y2Fg2gX0RamLn7ZOS6QEcBw2P
	 VAwzgzXod5X+nzsO8qZSfqV2Vg5RLLsW+E7JTSg3QsINiLpOqdvLsJRwBjXsOaxNcz
	 NsguqJZJk5GQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CBC93C53B71; Thu,  9 May 2024 08:46:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 09 May 2024 08:46:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-aGOwIneg6n@https.bugzilla.kernel.org/>
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

--- Comment #67 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Mario Limonciello (AMD) from comment #65)
> Especially paired with the fact that different adapters don't trigger it I
> stand by this being an EC issue as the EC controls the throttling behavio=
r.
>=20
> I suggest you guys raise with HP and point them at this issue.

But why does it affect only Linux?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

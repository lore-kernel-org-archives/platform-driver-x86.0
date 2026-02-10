Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20051C5D5E
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770760403; cv=none; b=P90cXBWzuMcfTvvm8qhB3SvtWIukKDpJ3E//e15S1s1Gzx1ywOYcZ68NTSZiIfF41BSborqJhSjLPTFqVhtf9K2nW1xrhbVZ9CmBGbf5Z8S6lBHspfWEGleusxnD3S7GBxuvgU6XwYL+SnEoR8homSicx0kv+ZN3SAr4nkGVBA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770760403; c=relaxed/simple;
	bh=QWn306Df2PE34fjYO4x8Vdt1OURyHQmVY8CdAoW9pe4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ly9HfwLfrObLlCA8lCFx5mFZE9CuGmjuhCioPKThQRO32nuJlXUV16VEBhvNzaOqBh6MOJ5JXupnOiYU9beGhKkxba4D6JWyNnOMawUyz0YISnPcD7zQW2T49jCz/BTlbLW+B710ncjFmsjY5nOj5OEHR6tMnsDyXU6VpaKKDIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfHWLSPU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfHWLSPU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0261C19423
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770760402;
	bh=QWn306Df2PE34fjYO4x8Vdt1OURyHQmVY8CdAoW9pe4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qfHWLSPU7xzusrUwe8+XwfKVRgJsgh8qq+QdyslWa9GP20i5QsLxIh9cVSpuJQvN/
	 69TxeqzTqACnazSB0QiUjKBIRz112KeNzP8kfOT0Li5B1DOrp6DYG5VZAcCn4AfHUP
	 k59ryQt7G50A/EDq4NeF7cptzMciNfZuNb2G6kbMWXEL8SLQCu2/P5SqLNBLXRpJAW
	 MkT1eVdwMIe5xQOV0xmADqQzT8NTkv4v8ldiPpJTJCowiUTklvM2OPnXC4yTmrmbL5
	 bOp6zjwAMV7HauPPcoLkXg7BdDqshvI4itbaaiDeqKUeQBZ4hJG1xMoNn17Vmuc6rE
	 bHSIduCcU0B2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BAF51C3279F; Tue, 10 Feb 2026 21:53:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 21:53:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-42UnUWgcmE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #21 from Armin Wolf (W_Armin@gmx.de) ---
(In reply to Avraham Hollander from comment #19)
> (In reply to Armin Wolf from comment #16)
> > Also, do receive a notification when pluggin in your charger? If yes, h=
ow
> > long does it take for said notification to arrive?
>=20
> Usually it only takes a second, but sometimes it takes a little longer.
> Often times when unplugging the charger too. It took around 6 seconds when
> the errors showed up just now.

Interesting, the ECMT mutex is also acquired when sending those notificatio=
ns
to the charger and the battery. Maybe they somehow take too long to process
said notification?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

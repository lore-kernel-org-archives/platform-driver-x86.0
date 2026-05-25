Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA7B3815EE
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711243; cv=none; b=fSo4hWNji9Tit/YlFipS5F8MNuIvazbI+0yyR+wUFZEnwuHlv82YvMtRNZq2qyKKt6K+ag+Y0BO7zEA5Lfh8ymrhprTPMwmIkaCxSoqxTOW5O6scFemvHi7dNA9x997u5aLuG7KZ/mwmMUWHsABwgC4CWdPC8pboFRRrnck9Y98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711243; c=relaxed/simple;
	bh=tpkSwGxWyhK3/pg9eDhq9xNmFtIy7Yo7eqLZddBJH/E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jj9p4bN2agvoM2hNEkNTDolW0NwmaYXGO8ACHg/BMuK8C1l4liVQpRhTyU2dEaeXWU7lsfsPNMpjOAPwevaVrsW9KefmSYLdc+g4cRjsb3Q6RzB0XkWxNEaEvtZfq+mJ/11s7yRw5w9ek0Fm1G3Qndc4KhQ+TD52NEknLxkgJcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfe2i9zP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfe2i9zP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D984C2BCF4
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779711243;
	bh=tpkSwGxWyhK3/pg9eDhq9xNmFtIy7Yo7eqLZddBJH/E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hfe2i9zPFVm81A6VpLCulWHpjKGod5xwvTFnjPD9JLP93m9Bkn22E11n65zmH13oo
	 dQy9n1A1N8nUjZJiVr9m5Dt2w5eFDIX5rRwWof9eNBFkwj+oF5B3/LCFUgU4wdl+IT
	 w5Qxm5hxI1HwjYzxuQlSMDKWq+0y0ZA7K1N3JJH86i3A8j5nroZ3AapYXdaNDsJ8hO
	 gb3Xulw62jdihwOgXrZqROtU2BtlhAnSn/YVjryOU8R98f5rKEQuCjpnKD27Y0Gdaq
	 tSVmezkePwvWwdr4I2xwynEOJimETrOoemDpADN9SQp0NaXXMDvz1tN2NhVkv/YsmJ
	 EYt5qO4XPAvDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 111E5C433E1; Mon, 25 May 2026 12:14:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 25 May 2026 12:14:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jeffrey@waelti.dev
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-HHdxhFuG14@https.bugzilla.kernel.org/>
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

--- Comment #93 from jeffrey@waelti.dev ---
(In reply to Rong Zhang from comment #92)
> Created attachment 310169 [details]
> [PATCH 2/2] ACPI: battery: Merge consecutive battery notifications
>=20
> Hi all,
>=20
> Please test if the series (this attachment and the previous one) fixes the
> issue.
>=20
> Note that the series requires v7.1-rc or newer.
>=20
> Thanks,
> Rong

I've been testing this patch with v7.1-rc4 for a few days. The warnings in =
the
journal are not completely gone, but they have been reduced a lot to 2-3 ev=
ery
few hours, maybe. The freezing is definitely noticeably better, I can't say,
whether it is completely fixed, since the errors are so rare now, but it's =
not
a hassle here any more.

Thanks for the work!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

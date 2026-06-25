Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B41714AA
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375913; cv=none; b=Hjfw0lAV/GRV5pfvtl89nothu9BtnJEwN5Q6POEqSJ/d3ZbNXD+wXzQFOtUhjaABZwA/1tDci9vm1UEY523uROzY8uQOMX1MQ3TSuO5AUrEAsJEXtFF+ebjxUMzUaIMz8r/edHRh09w5CWgXCaTKBnTjGpCpVeJ27Pnt9hqit6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375913; c=relaxed/simple;
	bh=bhwFEzNrqeVEwVaGhBuQ+MkH9CbdN4TYWfrzLbdE9dA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DZ6Su6YEJsncb6FT4KNBFR3nBHpkPFDPvau1q64FNfE7+CYB6fNpRFv9+tllXoBjvKvkXbvX1E2IcojSIux0CViPvviQAqm10e8aD3J2eamvew7rH/z0f5K+9AmghEahZPKTtCZwdzcpS7hiCBlfBsa4hJmVJxoSPA3ieSYmXY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qldYkTs+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qldYkTs+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0086AC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782375913;
	bh=bhwFEzNrqeVEwVaGhBuQ+MkH9CbdN4TYWfrzLbdE9dA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qldYkTs+s5cEuixZVq5P1nxynjyQGuzkOhCjhqYLRXYhsNGXGH6POfpKGXx1DHoPF
	 5tCUV6KgDJgnOtoPqubh/MdSZ5NLaSFJiuNpJStH3r++wkdXLHpK0Azxd9FwEyrxbP
	 f2tVA9GXdCdzUdC+LelIejLasD4U+W4s2yakO7YN6uuYAG4piGv15WTcQKdAv3liLW
	 DsrhlZfu5KCb3lphs2atoa00+P7lxxs7eoYz3fFqW8dY+1LIS2qpiS88P6DbZw9Pme
	 Yzeu5LNRAmx+c1HFj9KX/DbLicscmLstBw8ofv7Kf7BGxVGAa/QFkGaMfz0xBy7NZE
	 vbsY6jgkay3IQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D19FFC3279F; Thu, 25 Jun 2026 08:25:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 08:25:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-a8M8vb87Xz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #55 from Milan Oravec (moravec@ukf.sk) ---
One addendum to high WiFi module temperatures, they are caused by
hibernation/resume. With system fresh booted the never exceed 51 deg.C duri=
n in
all day operation. After first resume they are up to 83 deg.C sometimes :((=
=20

Is there way to debug it? Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

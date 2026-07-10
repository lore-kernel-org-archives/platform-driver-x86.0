Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43BD3644C7
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706537; cv=none; b=sRV0OQYU9ahT/m6QV302/htFZbAXyRrNS/IV5S+PNw35UOW838o5qz0M89nnBRxrq8ywf8Hps3W7Eb5qPsLEpDZ1Roi5fh1aXXdGFxyEMj9ITJ7x5N++Lowk6i3Gw9+1lSmv0NTdAWXIeQdALZKswhEkOy4/JICDYQWQ76vM2Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706537; c=relaxed/simple;
	bh=JISEQ3IYJQy5XwsjRpuMFGFwvflSjYwAiPMGHUzEA5Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PqpZfgXyDpD1a2J7ht57K9XVvRBTvvv61KD8cOz+/lRAFILoKcKZh93JLDCKEIlPk3Apy3ctTAAkf5/XUx97zbhRHD3ZrH51vDiqdGJwHg5bgd0yaGU/3fyzBrSx4O5icTeKIU2hUYzahAgIHsBes7jHrsEBClKLp/U8W1LE/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbK1h0Ca; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbK1h0Ca"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 504BDC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783706537;
	bh=JISEQ3IYJQy5XwsjRpuMFGFwvflSjYwAiPMGHUzEA5Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YbK1h0Ca1HyNcZ0oBnjCRj7yZIbVEco5467I28SNK2cElUzaZ7HVP1NXf4mNrQnON
	 6mXLtcxmbbimyRqNtkTbMLbARotINRndjVe4kHVIztH8yTJPPxsqnlIUvGs2XOW5KS
	 +VEF97LBJfwlpwCyTsEVoPFjxhwJJfZf2Bpf88PYguHhK3Ov8W6ZB0LZc0LYCEl8nw
	 8mC8V6U22/ByaaVxnePn/MF4FNLWnEMPsTcXaHBblMbOdMLEvSZDgDZpaPXEUWZgns
	 yBw149ggZOEA6hkmx3ULW/CkAXfllIhkMP1sLa3trBEs7oQ8/SC+ZUsgNgOdegIQx+
	 YUHhQTlEGKxyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A110C433E1; Fri, 10 Jul 2026 18:02:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 10 Jul 2026 18:02:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-XzkNUtVTNz@https.bugzilla.kernel.org/>
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

--- Comment #98 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Rong Zhang from comment #97)
> Hi fililip,
>=20
> (In reply to fililip from comment #96)
> > I've been using
> >
> https://lore.kernel.org/linux-acpi/20260611-b4-acpi-battery-notification-=
v3-
> > 2-f9390382c5a4@rong.moe/T/ for a while now on 7.1 and I've seen zero er=
rors
> > when charging my laptop using long life and said conservation mode works
> > fine (stops charging at 80%).
>=20
> Thanks for testing!
>=20
> >=20
> > I also updated my firmware to the latest version (PSCN23WW), unsure if =
that
> > helped to an extent as well.
>=20
> According to the changelog, I believe it didn't fix the issue. Maybe Mark
> could provide some clues.
>=20
> >=20
> > Maybe it would be a good idea to ping an ACPI maintainer to get a revie=
w?
>=20
> Of course. Since you've tested the series, could you kindly reply with a
> Tested-by: tag to the cover letter [1]? The tag shows positive feedback f=
rom
> a device owner to the series, and effectively pings maintainers.
>=20
> [1]:
> https://lore.kernel.org/linux-acpi/20260611-b4-acpi-battery-notification-=
v3-
> 0-f9390382c5a4@rong.moe/

It seems to have solved the issue for me as well. Just replied with a
Tested-by: tag.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

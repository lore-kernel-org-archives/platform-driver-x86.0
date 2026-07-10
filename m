Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A590347535
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717713; cv=none; b=MW2zHPdu/lhyebR6CprOni1Hpch3uAP6CWmfTL+T8VaCHtspV8Zs/s++Y9EBCx3kRh/Rvx4BnmdxSuJOxgjeg1nXXFRs0SAJ3SaiLQErGj9UDgSiG3TfdShwdZ3i3vRi8tK7YUgyzodu1PEByzav97LdTPi4R8vAxtn4VYOHPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717713; c=relaxed/simple;
	bh=FtNUnuqMCnLTIDRiROabieBOPqgCULm85BQ7eUcDWkA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F6kBDEEdI7kcgUQ3OpjJxqTgVTTKw6vwUeQ6eRR8iyNeXI9DjDFldBWUg9kBGdhh+3Nc+UmYjgk4yiAlMiDOGMivlPwQHA88PD/8YCnciYZ10S2jSGQFYRzWiHqW4XFElUEr+hsyVPkM3WppCr59PyEwvGb817Fb5Fix6W0o4YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1CnnkmH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1CnnkmH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56D88C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 21:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783717713;
	bh=FtNUnuqMCnLTIDRiROabieBOPqgCULm85BQ7eUcDWkA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U1CnnkmHK6qH/T5J/OXkpcB6sxcvW0+ZTnBoB+In+lE1DVpIygrbJBm5NHKf27hPm
	 CN0kEvvLpRW62JCZeHhbT+OHy8wpprQ424u4HZ4jSyRxfRJz5TX9uxk1sv3jQT+SOz
	 lsC5HAWJKRiix16FGUN9RlsvpGY3hZAz3IkbK2rlsX0n1VwNW/E5XlEs7xmL+A0neZ
	 MVxXxkA6p9dUundx3uUSRP/0R/4AX9SK+wJXmljC/9c/ynO2gVhTX7G2DgE49fbyHt
	 uFhQJybcVonPnZiNIaM+AC4FpxKD2D/r4WHV/4QxZqF1OeLIVDRkXGDrgjhGZ20V7D
	 OGIiJ60Px7lLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 48F4BC4160E; Fri, 10 Jul 2026 21:08:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 10 Jul 2026 21:08:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-J27NiTJ4nU@https.bugzilla.kernel.org/>
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

--- Comment #100 from Rong Zhang (i@rong.moe) ---
(In reply to Avraham Hollander from comment #99)
> Hmm. I'm still getting a little bit of spam from ucsi_acpi. I got the same
> "ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-5)" as well as
> "ucsi_acpi USBC000:00: unknown error 0." I did re-enable the ucsi_acpi
> driver though. I'm inclined to just disable it. I don't think it really
> provides anything for me other than knowing which port the charger is
> plugged into. Charger state is already handled by ACPI_AC.

Thanks for the tag!

My series aims to reduce the pressure on the broken mutex and hence reduce =
the
probability of triggering the mutex bug. It cannot miraculously fix all dme=
sg
spamming. As long as it reduces some dmesg messages and/or system freeze, it
works as expected. A proper fix will be a BIOS update, but unfortunately we
haven't heard good news about it.

And it seems that whether seeing the ucsi_acpi spamming depends on models. =
Some
folks in the thread rarely see it while others see it more frequently, IIRC.

I actually tried to submit a patch to disable ucsi_acpi on devices with the
mutex bug. It is never merged as Mark wanted some more time for the FW team=
 to
investigate the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

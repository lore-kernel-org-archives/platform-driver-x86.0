Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260FD1E1328
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730149511; cv=none; b=AnoSH8IWkDRu9XQPeLcF5OdDhZQXBSho9dszCkOJzaUgbo3IUsmPEypO7onfeyuwfPj2+edMgxd/VQGfJMsmR+kC8clPaQSIwNp6+wJv/PfmKvjhg9cZPpyyOthjTBXyYIcq0+xQer2zonCl24yvncvcjgr2JsulKD5cX6BDGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730149511; c=relaxed/simple;
	bh=BBUwuRRWSSUeibLOnMqRJEGiLuSkm87lbjMa5Tr2htc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AxGS1MlTLUHcClfPKp5dITstP1CJFp5nh72tjNau+iPBShkRd9UqEHofaXVaFC0aQzQWu2t5AqIggHmtkBGzc5HCBxy78TsV4VGN+3rUSsrJrVfOA2dDzhbdfYAPBaOMmfXk8+uSivbgiBhYwPhlF5vzM1LNelvp9QOdPvIxLo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppyK2nMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppyK2nMW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A44F2C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730149510;
	bh=BBUwuRRWSSUeibLOnMqRJEGiLuSkm87lbjMa5Tr2htc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ppyK2nMWNbPQf1nDo/KNIHgtN7So7R33KPYYs1oBC11gFNMv0aQeTtxUcO8vA4XGw
	 u7q+T0VA4G7nZggADvB2h27MU9z4OfBFFxtog7Z4n7sJ+bkiZL9/dp3tgQQWByB2m/
	 +zTd2g5yWHS6DBmSfCzAw+H78g30L5/ZK868JiZQIxvoE5DO2uKd8N4vR5QCLuyvhV
	 yh77b5Wb69o3KG+TNtEo62EqHpIk+19aNO3fg6ftOU8JHHv4lu/n9XSd4mRvKO7iYh
	 1Mtuw5fTFBEFCplHLu6R48QLJ+JVJq5C+WTmTWZAMI/yGgniT9FR/Lb1UK5+fQLCyV
	 tpyLl65KrYGvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9DFBBC53BBF; Mon, 28 Oct 2024 21:05:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Mon, 28 Oct 2024 21:05:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-HprES7EdB9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #344 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Aaron from comment #343)
> Can someone please correct my basic bullet point howto on building this? =
I'm
> used to install.sh files doing the make dkms etc.
> Plus I don't know what to do without a dkms.conf anyway and research
> suggests I have to write my own.
> Much documentation talks about system.map but that's apparently  ancient.=
=20
>=20
> Deb 11 bullseye running 6.1.0-0.deb11.22-amd64
>=20
> - clone git repo
> - download relevant linux kernel source
> - modify /drivers/hwmon/nct6775-platform.c with my ASUS motherboard
> - make dkms
> - make modules
> - make install
> - modprobe nct6775
>=20
> That's it?
>=20
> Thanks

'MAXIMUS VIII GENE' requires custom lock as known endpoints is not provided.

Previously i had checked build with steps like, clone
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git, checkout v6=
.3
 * apply patch from #327, add "DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS VIII GENE",
&acpi_board_ILPC_MUTEX)," to asus_wmi_info_table, build new kernel with
instructions from
https://github.com/asus-wmi-boards-sensors/asus-board-dsdt?tab=3Dreadme-ov-=
file#kernel-build

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

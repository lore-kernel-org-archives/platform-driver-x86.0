Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19264267714
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459106; cv=none; b=Luqd8eE+fYoCJerqcKVg5AvmjFakoKsLsZmrThw7Ef+0gbwXCinK3dAzUYf8xWFRD618pKYBeEGDPwZc1zk0XIqGg7Io7kQFvYmWWUXOESoS1EG/oMnzWZqQmfTaj6KXXx+wM3heH/ZJo0s/B2BOiDlbrMWxLG+UhcubaEKktxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459106; c=relaxed/simple;
	bh=giHEHrz96sgr2Xb3QaIiH2v9cZnONiDZW3XmscaoJ9s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IWMJXsJ2ZworAD3tsUGdf92/kG5FRtszmWKGO3dtsXdtyrVB4ys+rwIQFROqFsoiT+x5PY1CGq3AdwjowRslm6PqHmL6GKYYO1xu2J34DDj2Rq3YxOurq6Ugu6DstyeZ4b9xQWW4uMAkPkLySk9EghdGpDrDPkhJKNyTdjlG03s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsH3IEmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsH3IEmO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96DC3C2BC87
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772459105;
	bh=giHEHrz96sgr2Xb3QaIiH2v9cZnONiDZW3XmscaoJ9s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tsH3IEmOpfeM66Yju+in5s6V7GYfdRL0TWhoe8xzrGIONt4LRuCaPvKUIoKR2Wer1
	 FOO3/GMp4N50384MaTMXetcPPVoY5DGn2C8/5dGt01I1bD5gV6cmyxF7RDTXe3njo7
	 oT7FADfQsnLjrbF/ISlp53MRZbna0D8vtHd9tyP6X0lpUr22UQHqA3/rZgZ9nn96Aa
	 gErCaffkKf48uVnkk3y6qoy2aHFeZB0jz/vLyC5WQ45X9QftT2ywhfn3tEP/YGRaSD
	 dR8Q4y7wPhZ4BVXZskkfvkHFcA4MiJs+SjQD6O9nvXn0Q+TnLwaggucN0x0cwyMVm/
	 +islkFaJSU8/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83705C4160E; Mon,  2 Mar 2026 13:45:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 02 Mar 2026 13:45:05 +0000
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
Message-ID: <bug-221065-215701-Q2X5EMYBLv@https.bugzilla.kernel.org/>
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

--- Comment #44 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to fililip from comment #43)
> I apologize, I was looking in the wrong directory.
>=20
> cat /sys/class/power_supply/BAT0/charge_types returns:
>=20
> Fast Standard [Long_Life]
>=20
> So it looks like it's already set to long life for me, but the ideapad
> driver thinks otherwise.
>=20
> I'm on 6.19.5, running PSCN21WW firmware.
>=20
> BTW, someone in the thread seems to be spreading misinformation, as you c=
an
> unpack the firmware update (PE32/exe) and use the included ~34MiB bin file
> with fwupd which is how I have the latest firmware actually.

I didn't know you could do that with fwupd either. I'll have to try it next
time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

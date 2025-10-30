Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA493683A8
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 20:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761854722; cv=none; b=cXmCMO9hZOc78RZYY51vN5HfUawqyZ6bDL5lRa2XB0iXrEPc4bo0EJwAs3o9sc2D9f2abyY9xJQo4zAYTXfmsdV+qmuRkYVlKM66CakV7+bAC4rKcAjlHMimR/D6urFjHVAFgtL5kWy2dFUorStOdIVBnecgR5LAfj6slZQtPFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761854722; c=relaxed/simple;
	bh=pakdenrbtlA83/66tW82G3dvGld+Y5DZ1tDBYmdP/zQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C5VxXcgGzPfT2jOXRJxMwanI4/zTvnZdorrSl+TyyZ/mOJJblUgJuJCYtp6slV8Fpx2Ag5EqSlKVPERxend7Dzp8Jm0QmU8qW3u8va1ayPj0iaiNSyOJJMHxomYzNMAQz3Furv5B/0GoCdN47hMrjG/TBUhMKVYc6kYRLep2OSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOXNQXk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOXNQXk+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21D2BC4CEFB
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 20:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761854722;
	bh=pakdenrbtlA83/66tW82G3dvGld+Y5DZ1tDBYmdP/zQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AOXNQXk+XfUGrDs5ACiGI0x1u36K542wCY012UVPpIcXLCHg5R34SD7MRJyZJqB/5
	 6jCYd21lodnC7ND/48VepwEAFMBiNNvhikIS08N4a96wmzLAN8DUel+C/FM3AT5QSG
	 SowthNs955PxnYzUJEzjqLnufCcpfHA79jkCUEnnKNXF1c8iqM3/p4sBwsq0kGm3Rv
	 FdlZc/n52EOmSVg1AMWeJcfZOeeVXTJzB1sd/MTNLkbEmZiCKHtDLoWwO4APJm+pId
	 AQ1O+yloPpnYmrQWM4RojmjfuSIswZ3kIXQDTyCcWUFIodMheAk8Tb9nNO7lY7iEQu
	 6/atAGjkCDfrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18D5AC433E1; Thu, 30 Oct 2025 20:05:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 20:05:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-yseBq2HwyM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #9 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #7)
> This should help you get started:
>=20
> https://wiki.archlinux.org/title/Patching_packages
>=20
> If in doubt; use an LLM like ChatGPT or Gemini to help you.

(In reply to Hans de Goede from comment #8)
> Mario, good catch on the existing quirk only being for I2C devices, the
> proposed patch looks good to me:
>=20
> Reviewed-by: Hans de Goede <hansg@kernel.org>

I can report that the patch fixed the issue!

Thank you for your support!!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

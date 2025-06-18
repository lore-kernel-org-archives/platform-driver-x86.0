Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369121146B
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279581; cv=none; b=Wsf9hvAgDJrlqh7FfJhXgmw1d0RqZUPCjH54Q15vXzmllpvv99strxp4qH0dQCKBKF2nyCC0i83kuMIu8dPie12VeKWFUtyevNikrAZFyfMZoPHdsWMoqD7jxGZfwBnkTuw4gmAa/oklbY1tvHiblFETvDW9nPUrBaq7/+XlLsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279581; c=relaxed/simple;
	bh=mqEn10ebQar3QY4kCpI1qDMNIyOanTvbhR+5+KmPegM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PyV3Zov5LPLJ97YJJhgoF1u0uk2qOeMy5qXTZ49BLiYA3fJI+sx0d5KMmUCQJGkU80CwgPnjVSF51gCt2DFJ0utzH4u5Koti0fdTAxGu5XnLNs6v4cZTnJ4Fehz/9xyBr9P5yNM5A3voEcLDc4AhG3Zj0xNDnWwxI8HaU064hX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CI4Cfbs5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CI4Cfbs5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D395C4CEED
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 20:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750279581;
	bh=mqEn10ebQar3QY4kCpI1qDMNIyOanTvbhR+5+KmPegM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CI4Cfbs5u27HPUUCUiqH5z5Q2k/q/SLDrPdPZV/lG9RYwNggA1JPVlypcCkCUTNZ4
	 /g4BnoDZFZQh+IJ+uk7MuGqM5+VSdKZpR6LBoXcQxxnOQEDsWp2sb7j8sxoQBj6CGs
	 WCdMpYs3+CYWtYCd1BEsQynFfWmfySSuKo57+6itAcav8ZnysIOKb38jlr32NLhCcc
	 XiAYshkB+DvfcgMLQtImxiOsQkWjUi8POVQbo5NrbehbsVodKLcgAUh0c9K5cAEGy+
	 Felh1J7DCd5CzpU1JC4YUL+KQaOTT86bDUv3bopzegsFsHaRIRnchXn/JLD8fk41Of
	 cGnurx06cze3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 27628C3279F; Wed, 18 Jun 2025 20:46:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 20:46:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-a0rpoDLtg7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #8 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
Attemt to insert dell_wmi_aio in 6.15 gives:

$ sudo modprobe dell-wmi-aio
modprobe: ERROR: could not insert 'dell_wmi_aio': No such device or address

and in dmesg:

[  601.475130] dell_wmi_aio: No known WMI GUID found

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

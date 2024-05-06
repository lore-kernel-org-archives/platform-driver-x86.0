Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8513D287
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005412; cv=none; b=QAvSdS0ECyVRI5qFE941lDrR1OSB5Ew1rE/Sxh+GsY66imtkIYrxR21AtAH75WyzW0C+gx2AQ6OpP/R9bsT/eFba3BbV2Vy8BZnh55w0+RW30NT1/ukDbw/ddGPv6S42dmn84a5NHNhBvKkHwOZ7hA7Hf6hQ1frxpBj0D0UR8uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005412; c=relaxed/simple;
	bh=S1oPyp+YObKR0kSmfUcrKuNxmbPWZ2qmfdFxkenjCys=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nklh8rkl/YXIjGunrp6v7/vrp5DFoWoU1IYjP4Ca621Kwnv230CgKRSbIywa/ZwPjggQxKZc3AZ9uCh6vMO6psAMbBVumn6Wzw1zEgUxHIqPOjTp1IhpqCMBEjkSqm+EfBZ/8x+c5/UNP+90AYiBwowArEtwlyva90QTiPsc8Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPiN/DmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPiN/DmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30A11C4AF66
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715005411;
	bh=S1oPyp+YObKR0kSmfUcrKuNxmbPWZ2qmfdFxkenjCys=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iPiN/DmJpHOnjtel0EldXxvpEtlJUh/jAXngyK/B3pOaD4sngzrPyRgqDEb8ASdQH
	 cV1xs111xldKUXudAb8jlPr5ttW8tYw6Ek3yrxttdeq+hbRQys2KpC4lG1KeydTNUj
	 EB8UKdyvgZNmK0e9OiU/rLvMxxBSnYOwWRxnoROXlJyrD5x353RvsPZu1e9oBpAO4W
	 o4edxMu2EooVYVMufC6uSYCdPHO/xxiVvr8M5cHRtNoy13aoL96o0Va4MrOn9kjD6r
	 DTo4MAb87OP3LaichUmZsSpO+nHlasdAt82pu4vkYr1wdVOt9Z7jz5Zh5NbDMJYARO
	 dpfNceJvLBiwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 26BABC53B70; Mon,  6 May 2024 14:23:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 May 2024 14:23:30 +0000
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
Message-ID: <bug-218305-215701-zbCdfus3df@https.bugzilla.kernel.org/>
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

--- Comment #55 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Daan Vanoverloop from comment #54)
> I can reproduce the issue on my HP Elitebook 845 G10 with an AMD Ryzen 7 =
Pro
> 7840U running Linux 6.8.6 with the following steps:
>=20
> 1. Ensure that the power adapter is not plugged in
> 2. Suspend the machine
> 3. Wait for 10 seconds
> 4. Plug in the power adapter
> 5. Wait for 10 seconds
> 6. Wake the machine
> 7. The CPU frequency is now stuck at 544 MHz
>=20
> When I unplug the power adapter now, the frequency will immediately start
> scaling up again. Replugging the power adapter again while the device is
> awake is also okay.
>=20
> I was unable to reproduce the issue by starting with a power adapter plug=
ged
> in and unplugging it before waking up. This did not seem to cause any iss=
ues.

Exactly how I experience it and what this bug is about. Mario said he would
post a patch to reset the EC on resume and that should fix the issue but I'=
ve
not seen the patch yet.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952A1EBA19
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 06:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762671361; cv=none; b=PCSqgEycZ+6uY1CcvW+GJYrFIr/Ll+EWsl7iM/jnh5E2AZiLx35Ii46Cco+OSiTFg0GfzyYLWQ7QIRHgd6jE1pGwvilTxfOVXpTiftEIAAKlmqH7NGlQK3s6XnEKFxhPsysD6G4SKbVFLmEeqM9pD4H047Z8xj3F/vGW8wk9apA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762671361; c=relaxed/simple;
	bh=eY3nxzM2dX7uBnCMrZP2PbUh4s+l+W6mmCNvyJdX9sc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dv0k+ETmkO3xHurYWTwEvilmP0AccjrYujMwoYulIgrLerZWAQZQIy9ZfE2TecKXjiR1q1dBhPIkWZeBlbqHZJ/6ACj97Z7sfiIx958OVdksGMEKcDi/PaonWetJSGVHFdEwIkk5WLE0RNfUB0OW0Ok58KA9uR+anu0tyYn5u4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcrDLLAg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcrDLLAg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2722CC4CEF8
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 06:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762671361;
	bh=eY3nxzM2dX7uBnCMrZP2PbUh4s+l+W6mmCNvyJdX9sc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tcrDLLAg3YJ5nMNBO4cPPjKpkW0w5acHdUpP5XiU+/Y6CtZyHlJ3qeNITxJdBpuD/
	 4XMqwzThsHQMgYkOa5ow0slxQuV2WxONdf9h31SgaqVGxbvBejqGtk4WQZMOn3g9w+
	 EsSAiTmCOcMhnjuKzfwoUrYWDMi2XdRC6uB/Nsragy2vyjnf2VJexY6WPvJeVVMZtS
	 NkbQZ3RAHjRifpV7eK6MldrXBGN5wJ6fRc2G5UKdmZ+T6bXX5h23pKmOKxGJ6QCEOb
	 WMzEAn+8SITZ0Qkdg4KzJKhfe+oPgqLExcW5TrIYCNAx4Y6G/hTwjHjceyPkfpY2Lf
	 GXByv0OV50K4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0AA98CAB786; Sun,  9 Nov 2025 06:56:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 09 Nov 2025 06:55:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-KvVDVX59S9@https.bugzilla.kernel.org/>
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

--- Comment #140 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Peter Ries from comment #138)
> Hello,=20
>=20
> I most of the time jsut read/follow this thread as my testing knowledge is
> limited. For a whilt things seem to have gotten better, but with latest
> Kernel update on Arch (6.17.2-arch1-1) I now nearly everytime have low CPU
> frueq 5xx MHz or 1.1 GHz as max. After a normal suspend/resume cycle when
> plugged!
>=20
> Have HP 845 G10 and EndeavourOS (Arch) all most up to date.
>=20
> Just curious if anyone else has this.
>=20
> I will run my laptop on 6.12 LTS Kernel for a while to see if it gets bet=
ter.
>=20
> BR and thanks for al the efforts or Mario and the testers :)
>=20
>=20
> Can we somehow get HP to do "their job"? Write emails, sign letters, ...?
>=20
> BR
> Peter

If you're still under warranty, open a support case and provide all the
details.

Even better, call their US business support hotline.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

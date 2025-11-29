Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC38256C8B
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Nov 2025 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764411454; cv=none; b=aV+tAtNB+KrujmhWQHh4YL0wOAUvLo0J9uryZLYBq9/BmN1nidLkCfRFz2jO9pgufwHQ9jO3aeOM3ol4SgtYwGePLcVsDS4Zs3bSPXuHtnHzSy1QeMPYEBA1uOgmYMsjZvFEser2tFsWGCMCtkfjoDM+ILiBN/7bdAU5OnzF7iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764411454; c=relaxed/simple;
	bh=cwdvsTZvnWD4flCyeegVvofWsQ3MHrZqrUpQbDq09gc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p0fBTZQfIoUid4+VkqQx+uaI69IQuI4ncGuSChTMi8hVCCs2vpgXJPk7m8O/peh5VW5wngXP1HArX6BUzRlogFPzP3qXF+sBfFkxnBJhNmN6ttxnChRa7Tu/Byu49gtuNrhTrgZGSlstFPw57XPla7yR55P0o1/LxZPGeAdcjFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ym+BHYUA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ym+BHYUA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4782C116B1
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Nov 2025 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764411453;
	bh=cwdvsTZvnWD4flCyeegVvofWsQ3MHrZqrUpQbDq09gc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ym+BHYUAzaVjJBFHis+kKKMIoor7/NVcYgmGF+ZrDGZON4DOiZMKICDMZtE3nRKXE
	 lIXGf0ZU/2hkYcYoKo1648YU+J211JhWyb0To1Tnys2WjT7eq/V44evAgcS6TNt2R0
	 itOJKNgwtCaY7APL9HERQktwyHWMsS9O9bkC966uv1op+i5xX5I2KqNWRh/qG/+xeV
	 bNpM6WG6rpuZeTDVyLDyVP+LYmJdxOtdW9bZZ6n0FQ3vayGFwDv5sVO5if+BilhB07
	 Fn8vTM6C2n4vuoNg1jrW/j4er07/6id6vCGmpaK699pqpe7pWNgy9x9XhWLl+DywDs
	 mfkicbD/X96tA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D0B4DC4160E; Sat, 29 Nov 2025 10:17:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 29 Nov 2025 10:17:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: masterwishx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-KA9xzKOxnd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #18 from masterwishx@gmail.com ---
(In reply to KeyofBlueS from comment #17)
> (In reply to masterwishx from comment #14)
> > I understand that fixed bios still not released?
>=20
> Not yet, the fixed BIOS hasn't been officially released.
> ASUS provided me with test BIOS versions for my two specific motherboards
> (the ones I reported to them, ROG STRIX Z790-F GAMING WIFI and ROG STRIX
> B660-F GAMING WIFI), and those do fix the issue.
>=20
> Now we just have to wait for them to publish updated BIOS releases
> officially for those models, if not for all affected models. Hopefully it
> won't take long, since the fix is already confirmed working.

Thanks, got it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

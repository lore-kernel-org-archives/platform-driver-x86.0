Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E2023CB
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Apr 2025 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743954945; cv=none; b=EhcxnwoLvOS1c4+ox0v0SS1fKNPktAY5Fq/UfT/Y26uqJHwyGwXJCfhc5TCs/q8rmstQSCICABqweyveJFs7CWB8TWe2ITEOvgmFTFA2JwRBJkjuJ8Lv+lcTNv5U5M3GXFRH6p6jIH+71XFFgyj2qAcqtM0IHXm40xQfyA+fdIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743954945; c=relaxed/simple;
	bh=JBENqTzUBd+3w+UBM2qi9jZzJY7AiALIYe1M9BB7lOI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DTLGXYg7iTif+0jai4+NRlYZvS9D+IWCUHaKP0M1IcKjm8dJ5Il47jEjj1T21zsZRiI5XuxGzKoF8P6TSDX4WraFPUvGXpxp/9B2umw0mBgUlKkaI1tj5TYtliYbt5NfqUc9Jv36qhquBvWqmnkzZUJD5lRIpFe1ikgCvllGbIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rk88E22L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rk88E22L"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 588D2C4CEEA
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Apr 2025 15:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743954944;
	bh=JBENqTzUBd+3w+UBM2qi9jZzJY7AiALIYe1M9BB7lOI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rk88E22Ll4Spt3tpJAdirNgyqlFGyNSexx6SiC1ocbhEBJZtYBtSsgJU72EUmW6RH
	 5WeRvnXQ/ZkhsjXKqJKvUu/BRjgtG7NVKLVnqNJnpOFxr3zSx5VxRbUshnwbEuQ2MW
	 gEWOvRWZDynNZVZ0EZDw3q+632XInclssg08JpCXO46xRdt4FkWHBwlZX6U1gB3JEc
	 XyJ1A1iiLQQVTvL25wFNNlK5PqpbMDqoLMmfKHccpEWGkfGQ1Oiu8xnYhJ+QCk2yC6
	 QOGeALGZIQ/Bpe/2tvVB4Ve0TJ8FhHGX1YmWVbMhZi+K26pCTkozysMTgzdtgerGzp
	 SMRYTRKwqJP2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 469D7C41616; Sun,  6 Apr 2025 15:55:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] [BAD FIRMWARE] amd-pmf AMDI0102:00: ta invoke cmd init
 failed err: 60005
Date: Sun, 06 Apr 2025 15:55:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218863-215701-gs64Tr0qQ1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #38 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Tom=C3=A1=C5=A1 Mark from comment #37)
> Good morning,
> I would like to ask if there is any news in this area?
>=20
> Thank you.

AFAIK it's a firmware issue, so no news.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

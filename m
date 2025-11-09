Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91F21D3F4
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762716096; cv=none; b=kDBvF4ppK4m0idqgApoU/q+Aspo5hIWS6VwYeWEIq3xjCjDZJC6IPw6Os5bK4q8FqAGrt6z280zhw8T35HdXmDchAr6m3uMAgYcrUWpLfdsq4Rd4GA/jSVJhHx3Ggcl4aQTR3zlH8haauUDVGlFYS5Twizvzl0HZUTgaWRjeVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762716096; c=relaxed/simple;
	bh=hDS2HGj/c0Is2RzEH8vZGkLEpT8aPd2lXl9i7cnM0Cw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uSSNKIvWQ0CMssmUJXzGAxNkJpZExiP82A/xB0wTnAzohahx63rzoyYDkwC4PkWbktz52ymjDbaJMEZ6mHUc4F1U3O4FYhQX+gEtsZqGVHBoKVFjxgFLuaCCTb6NkpHjQqgebvjUIZ4Wquvcr6U9OODG5lXJviQCgQHcz2H9Hl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkCc/YEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkCc/YEb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CAA4C19422
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 19:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762716096;
	bh=hDS2HGj/c0Is2RzEH8vZGkLEpT8aPd2lXl9i7cnM0Cw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VkCc/YEbbk5ZL7lIPJ6EGOiHeBoE+P9qOkc552rS/+OgbdPxxRP3pcrBgmrjnwHiN
	 xn5YCptcNWE4BMNBG0xesX+0xn516Pm9SFgOrwKstN+raWQKhJ1yS8oA3BBJpOvX4a
	 KAUa2NE2P3iDqqVs1nX0C9H/Rmu2Vz6xtcqP6LoJbAnNr0vrXE1r39YIPt7MCxhJLJ
	 j/h8pp06Zd0tmcJhT09vymcca+487x8BFt7Tachi1RSUReNDXkiKBt6xHssgHy1DAd
	 d+zz/daKuyrwwvdMe8bAsMoRkd1DJpaKPBi4j4ZCge/6kkIEQlHeUwbkkbXIpkbPj1
	 m/6Pe/BrXdQMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E081C4160E; Sun,  9 Nov 2025 19:21:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 09 Nov 2025 19:21:33 +0000
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
Message-ID: <bug-218305-215701-oQ49dtYb5T@https.bugzilla.kernel.org/>
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

--- Comment #142 from Artem S. Tashkinov (aros@gmx.com) ---
If you own *any* EliteBook laptop, you're *entitled* to their business supp=
ort
hotline.

* The web version:

Open https://support.hp.com/us-en/dashboard/cases Find "Business Support" in
the menu -> Click "Create a new case".

* The HP business support hotline for the USA is:

1-800-474-6836

If possible, please ask to be transferred to the upper level of support. The
first level of support may not understand what you're talking about. They o=
nly
know the word "Windows."

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

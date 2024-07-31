Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392816C86F
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433007; cv=none; b=Gb+ZB4zufq+UI/f/lUBi+bEj1YKjicWxxNQsD6LIGo4X8XjbPQUVd/J3qAqXCHXFjsr4nDPGmYYMdRqKFrGhOK3ti7IbphZ7B++B1wyAD0wmoc74GxZ0p7Ma1KrO3oNExB64ixUnWW85mHOFdv4EtNoD+OjL5B77GfPceU6/tU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433007; c=relaxed/simple;
	bh=Mb/G+Rh2xKchzQ/VG4G/9wiB/BItIFrEeCtqyEECaL0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K6PnExsft1WTtBtxNyH8amV27g7tYtk28D3hkdoY+6sYV4Q9QpFi1bwXh+3JIs1+8i2+QnfeR2GYnE+5C3JPvBeuGs9fVUvhXXgP5cFDMXHb9sPrd4O9pYTQRaqmwXSTQj7Yh5ywkW3b5y3yMykWgXTdO8chIS2/PlxwlPWqcAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P95kC7Tz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P95kC7Tz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21416C116B1
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722433007;
	bh=Mb/G+Rh2xKchzQ/VG4G/9wiB/BItIFrEeCtqyEECaL0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P95kC7Tz79MLT3F4aIQoMe+uaxAWxgUdFSCa0W4o13/F0ZPdVYK0iN7139IPvwPiI
	 gfNlRo61YX77o8Md6deU8FR4m8etu257siJt5WOpQHDH7Ek20RQstRGMsK/9syKxcM
	 o/nfInu2pVEBYYBCS3RuLNWaF+tFH9vqaHOuL7ptpR1RQ1PlJaGQlZ7HLG/+aYqOIq
	 xiMpZJAnlUNSi42z6HqHnq+KsjRxaKBulxh71eq/t5nn3W/krSsSSZaNuW+7xv/rPG
	 OIyGxbPxScla5wve4OV7bcntKsusqvEYv35cywEr19F1DmH8Tr699lxNfgu5ubBiL/
	 Rj5iK9mFZGcQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0B926C433E5; Wed, 31 Jul 2024 13:36:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Wed, 31 Jul 2024 13:36:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-LWcsWwXuk5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #14 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
I have been remiss on adding updates to this bug - sorry!

We found a system able to reproduce the problem, and the FW team have
investigated and have a fix. It's related to hitting a thermal threshold and
then the EC FW incorrectly generating events.

The fix will be in EC version R1YHT44W - expected to release 19th August (b=
ut
please allow for some variability - it's under testing and dates can change
etc). I'll be monitoring for this to be released to LVFS.

Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

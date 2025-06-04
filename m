Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6B139D
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749060957; cv=none; b=VezDlvxxyHJL2W9oeaw6knrI0dbxETfTODra+kkexnOGal+x3TPI591H3/H8rUjBgomGbc8E6YMBn/PbXY40HT+XG6zK6ig7OvGD0isVNQvcFpYSmYQ9K+EbfM+g5pWYomRAXiqh7BOjCyfpPyL8pE+89EzRwouJ16JZXG8oGaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749060957; c=relaxed/simple;
	bh=Ot8g03WK3bVqL/l6chauaXS2SwcQHlV3OEEZUJrW96I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PkbSCPh+Qw1GmNBMgU8HDJuzXpsP+v6kr8I92uN41sY6cCrKYWmd3IV4bcJhJqcgKxU4dhQWLWAz5PvEStYjYqN5Gs+gOOFJ5GvUtjenTuGqD1L7tKuVXhfH9rAo22SB03zYIchYYRVZ/kp0xfg9nDQeei4yhxk2i8GGxeDh5V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ler1rikT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ler1rikT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A1C7C4CEE4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 18:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749060956;
	bh=Ot8g03WK3bVqL/l6chauaXS2SwcQHlV3OEEZUJrW96I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ler1rikTtz7vMzGV9wiHQpYYCHKJMi28/3Wfoyv/VxCfnCfrICgzzVAmwYx3VuoQb
	 NQFPK3HJEcyxbXYZYVXZGIoGqrJ4RGxj+cl/MkLYux9PN6/bJzw268GmbhJ1pA7lW3
	 g+45uwwthFaVWHac+inauLTYszJAL4HS2a5MLJ+EwprHlRwT2d5gwBlZmCJLGfd2W7
	 kLg1BAV8Pb6Jm5U+K5cNu9C/L5Gk7fbHUxDbQzdUOPoyRtNWrdg03kZ8UHnAZE3Fv8
	 O6pFnvarolf570WOcJRQgCTqOSWapdS9B4GnGe9504/hbclqlGWKwmrKaa2hRjWHRF
	 bO6zOQDeEEkew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 607F2C4160E; Wed,  4 Jun 2025 18:15:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 18:15:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-UJBtAyB15j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #14 from raoul (ein4rth@gmail.com) ---
I didn't press anything after starting the s2idle command. I can run it aga=
in
or do other tests if needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

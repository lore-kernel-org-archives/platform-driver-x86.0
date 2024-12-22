Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5F944E
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734856485; cv=none; b=gBWgUCkvqzroAG61cMBxJMqF+KQBkkSNmPUG9h1zWKVLdigdREUaHb6LRtYb2bMBslb1FQcsGAYz2aNo1jadfci9I+v9s2Na0TmYA4W67eIUwydXlWRU0WC1E7E0+o8tuy7IWyVjmAF5GTotsopX1ZKbrK4eb9B/m77+dVaaUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734856485; c=relaxed/simple;
	bh=3Ze+o8Yejb+JgWBM8N78IL3Y5d3cfVt/HUCS7CE7Cxk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fPD2VKo88GxlksZswMvtXcoZ+8sHFJkT7dp1LQ5p31PhH0zX2IP2Or0xLe5HUpLwyAtHgOszypJUmQ1i9bfozL0WBIBwEwv1mlfOLnQobQJnAsFZgJ1qqcMDaGRT5WBGD1D64w93+OsgZCoeqcoMSdq74N+qy5sMeyPKDe7WFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euWoeyCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euWoeyCh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8B2EC4CED6
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734856484;
	bh=3Ze+o8Yejb+JgWBM8N78IL3Y5d3cfVt/HUCS7CE7Cxk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=euWoeyChI/0Q92ZLohi+fDaRVJnwGE7QcvpIspGqt45Aa+rolwJSkkR2sNKTcAQ8z
	 GPQPIWW2kvi51SrbP2FfsCC4Z+02V5C/47Azl7cGuVRZ64dEponmGeebMWkPsOhein
	 gFC0DLG5KobVJshkRrUmT3waSlMKo+RyrHBol84Jvw1RnZ4hCdQkSh0DWIpJcUe5hO
	 3p3pBfNo6zDGzf2J20Ei6hue+slWsWeKhJKaRMI4hg31NCfvdWiihudlN+2EPlbT6Q
	 BQvZ+GP3cwOhYLrIJ2vvcuJoXTKsXM1GN2DWhP+xK3oqWevpQnnVPqVozWiQS3iCGP
	 hvbjBpzt6Ajvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF3CFC41612; Sun, 22 Dec 2024 08:34:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sun, 22 Dec 2024 08:34:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-PpfXQOwqM5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #48 from Takashi Iwai (tiwai@suse.de) ---
(In reply to jarkko from comment #47)
> That said, obviously requires testing with the actual workload.

Andy, FWIW, I'm building test kernels based on the latest 6.12.x with Jarkk=
o's
v2 patch for (open)SUSE kernels; they'll be available later at:

=20=20=20
https://download.opensuse.org/repositories/home:/tiwai:/bsc1232421-v2/backp=
ort/

and

=20=20=20
https://download.opensuse.org/repositories/home:/tiwai:/bsc1232421-v2/stand=
ard/

The former is to be installed on SLE15-SP6 system while the latter is for
openSUSE Tumbleweed system.  If that helps, please give it a try and report
back.  Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

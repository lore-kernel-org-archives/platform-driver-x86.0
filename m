Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFF3BBFC4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 00:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780618317; cv=none; b=jlyKE/yih492cOhbsDSnozeO2xxMTMzQSP19+TUAqhZRv7RkjpCumRxtrTvCsaWILfrjt7oke+MBqFz5UmNsXV5Dxv08RXgU+kmYBNkofbpuY1DAK9AaUbUTQPET5v8quWczjzKUDFutJ0tiP6/oHICbSJTZ1H3jPggGGwu1Qjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780618317; c=relaxed/simple;
	bh=9Czok7V/SAK5aiRLioEdS5AE6g/HsflTjdAqdz8VCsE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IJSGLbBeVXYf0BTAI6/ZGSdR/QZjyhVbU48VAg3xeeHqbztd05Pctpc/3QNuWH14nux7nGw7cj1QQ1NsRQTnHBIyQN4l0kbA2AjqcLc3sTZl12CGN1HNHPLnrxxDrE40U4w6rJUpaQWS1iV/3R+wdJlFCn7a02DRB+YQOofV8rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPgUk3+0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPgUk3+0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D92A4C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 00:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780618316;
	bh=9Czok7V/SAK5aiRLioEdS5AE6g/HsflTjdAqdz8VCsE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uPgUk3+0QWBhsNGWqVmT25JgwbZegGzwLpkoLVKdhxC0qBYcssYd+NUQ4wnhgNk+X
	 bXeaYjQtmn3tMBxQbutUQ9GL6OCeAHfEBI/oPKJsP20vIrkufyJOUPJxXMBHYpZdob
	 p7XI9SjRo+GhAfwVTTuqKwmdz/ZRAe8RVAZjVvXYSFxbKxWsYghussEhrKKO6eb2m9
	 rpjPaFOY5BmmkVfwwdXsuIsozWQQejl4c5mnrIWTW3ViLvlD7CKnI9vPpAyHVh1pw4
	 +oKiHe2pNET1gItrxUXCvLRgpF6GJnBcmRurO5vusVhb1utEY2p6I0yC+PTFajTbUZ
	 mYQWAZKmFkCYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B8550C41613; Fri,  5 Jun 2026 00:11:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 00:11:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-8gRQ8BrDo6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #8 from George (george.stafilidis@proton.me) ---
Created attachment 310267
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310267&action=3Dedit
Keyboard showing up on quick settings

Hey, I'm not very good at writing ASL myself, so I asked Qwen to help. I
managed to get it to a point where the OSD popup was working and the keyboa=
rd
button showed up in Quick Settings, but it still wasn't changing the keyboa=
rd
backlight.

After some more tinkering, I got it so the Quick Settings button would swit=
ch
between Off and Low, but it still wouldn't go to High. At this point, I hav=
e no
idea what's going on.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

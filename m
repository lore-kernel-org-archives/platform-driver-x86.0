Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792518605;
	b=tCu1rg9SU5ClDS8sgVtyNgO4ol13nndPZ8ipVy4C/p1elalr0Z1V9QRaqmaquROpUhFn
	 u4P4BbNHBTMgXHvRUKMVPKs46/lgQYwy4bqH960hzjOME8QQsuOfa58T80f/FAdxlPVyd
	 IQLfoRiiqmjlRf5lqK1+DBYRwb8KAm+HbFVChUhFpIBzHuIDECY0+k5ElBjjIJvf+axhL
	 zWeB52K/xvh1OxCG2ZVea455j55a0+3HdLgNKbtXWT1BXscOC6FylkKHTBnlYYQRQ7rSB
	 fIUjS3BELthdbFy9xl9Nm3Z7q+ZjY9rYJ5TJdRSlh4hbC9/9MXa//9Cyn0TkANl0Ngg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518605;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=gpECaGPjTGXzdU65UvQHMlf9Vwtk362Ychv52+h8ONc=;
	b=mx3O9Tsw5J2hQ0bQfRGIZM+2Jv8QskQnpXE2ie9WJisemSxiSqeY3ObUxRzy+fzTVFZ4
	 rbz8yikThABCiazktCmHfOrv0IR3iWEmlwDImo+udYhgFSQ3a+YeInqxAQ+GdjERwB0r5
	 9D10hfuUGeCGIJJRrUUy2k2tgjDnvumJwju09PW+jb7fAOmL5yPKw3tNZoF1ocnuq1olf
	 pLooShXuRjK0tsioRsE45G4jkZtZ+cwVOKgih8ji7sdDGfFdITFTTQBgPWs3Qd+YHtsLf
	 zSAREomZAuC9+8VZmwrX8H8usy4+14kbwtXYlCwFc/6B0elaiYjXOtUBfVjwW4bD4ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pTWuN5s2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC35C606A31C
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pTWuN5s2
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E4B25771
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792518605; cv=none; b=nCuIzcY0DRsmcDlmT2I3hCf0yOlUHnQPbTFaYZLHLiweqKf1dRds8yh6xn23RuWnc1Q92hJsIr2e9zNuC3Iy9qC2SRbYuNv/+NtAEjP8dElhWFJ9kXL7/bpJFB7HJekH4rIYn43830HcCQKaifo7wFZvck0XTc/MSdMjE/gupa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792518605; c=relaxed/simple;
	bh=wno0mZgaNajrRWri++TBtK6sM5dOdTs+SAC1UWvaybU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=s7Vy2DtCL52pYBBzKtYBYpJ/Dx/Zig8PWNV88H54vTruBS3iEaizpt/uf5kfEs51wRbLgezPRVShCbrg7tKbaib+SfJmsqKmA/pBy3VAKBxilNM2bFRE9prk3dPO5fc3uJRYQZsB4uRkO+5YfRoFWw3V7Q++dGpj48/FFVwaX+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTWuN5s2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2429C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792518604;
	bh=wno0mZgaNajrRWri++TBtK6sM5dOdTs+SAC1UWvaybU=;
	h=From:To:Subject:Date:From;
	b=pTWuN5s2F/v9+x+nn0XIYoWDitkyZByTnebk01QsxVQS07W/3Ssy3R3j1HBlkzTo6
	 5XW0mzIDRaniMRnlvDOzfH5Em3xZfL7x0iCY4DkxBfdYu+OpS9rkDkk8pKvCNEdp8G
	 cBOSEV+rftu277NQUoMbrjYlOzaLCwpQIL1kzbNgOfxJ39J2mTdaBbYg8JURI2otxJ
	 cRPtuDMtuR1mObwuF1KU97GYVfBlFssW5Lb8CD0jB/OpL/DKVswxbXJfLewJWVJd4u
	 r9Gd3QQy0lvFFqMdd0jR6wNJMdJLY6WEtDWgv0G70ieoZcyWMhmnr5YmCVhjvTPCVF
	 nNJ+EBhWhflcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9BB1BC3279F; Tue, 20 Oct 2026 17:50:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] New: platform/x86: lg-laptop: Double input of super key
Date: Tue, 20 Oct 2026 17:50:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

            Bug ID: 222161
           Summary: platform/x86: lg-laptop: Double input of super key
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: helian.caumeil@clever.cloud
        Regression: No

Created attachment 311202
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311202&action=3Dedit
the fix i applied

It seems that catching native ACPI events cause the super key
events to be handled 2 times:

- by the lg-laptop module
- by the keyboard driver

It result in having the input sended 2 times
when pressing super key.

I don't know the input system to tell if its this...

I have wrote/applied the following patch on my system (attached).
I don't know if this is good enough or the correct patch to do.

In advance, sorry for if my english is not fully understandable,
this is not my mother language.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA872C0F9A
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Dec 2025 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764589119; cv=none; b=m7Vd9u9Bz9NIhJ9kJIinv2CnAScbujXdkIF937tQZkC+LhVYFo0wdQpDTLb108+j23Mh0tKRNkvECqclSCxCyWysXMpKeZXuKQb6xhPazf4ISiCMR7g8BM1aD0xeWIyQVTY3PJpXe3XvaVghw8g60shwiG6mRKtbYmcmPVvmWeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764589119; c=relaxed/simple;
	bh=M2hvLR0O2s3vDr4XtET4ZSOdB7xmB7FGpPxMztUp7oY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OVZm/oojDIxbK8COyvnNen1vNpV51vQnCGqRZD8DZWil6UU/qLDjQDaYA1L6EKfpAUx2a031eQC9X8h2ulKOw7G034wYS+0o3CDXC/6DzUj35+jNpDRmTY0e1nVbI5mxQsj4XwYkFBAjaM0aSp8ipSb6VpdFCEI5h/0VEK0mGxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6pnsEQ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6pnsEQ0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB00CC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Dec 2025 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764589118;
	bh=M2hvLR0O2s3vDr4XtET4ZSOdB7xmB7FGpPxMztUp7oY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k6pnsEQ0ViY/gkEezSbG3chHAfNgKt9+tzWJUqRjIkrZ7yUFxZVPp0cc4ZxEiREVL
	 u7o3PgXDEvQu8zKF73svpmAI4Lb5fZ3+jO90ntODF/3apLCgMOLwvKGA3ubgsoBhec
	 3uvcQTPltKCiKjZNRhanHSnhSxMITJONAF5dD5bW6+Zg3CHfmrlZ0wFFLywXDD3N41
	 9bu8EbCCW9DAZwAK5Seccrv28qyfllSm5LMdTOb6ZD8HvhjIou3n4SOFieVFktWnj5
	 mxiAy+9bIJEA2nIMPbVbJbjcLVv8V0MZWz9vp9SnlMeRwJlFOzp//JmGg9qZKPxjec
	 8QpXdx5fOQv+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD321C41613; Mon,  1 Dec 2025 11:38:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Mon, 01 Dec 2025 11:38:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219904-215701-iHHatdLW8Y@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61836C598
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191406; cv=none; b=BRmB7Et9L1rSJ0VJL4kT0lFWNgNqTTRP219xzn1OGywAHle9XuPZyTiPNCVa+GbeY8/es3JpjTbj0q+vVRrA3hQIakqVYPw/BT6EnMCCitnl5hIzl8U7W/wqGdNDOiavGgNHfXZOfFxpJYkO6fsa9fYHUHZ96p/S6IVIhJFSG1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191406; c=relaxed/simple;
	bh=JUyXC02aVRC2WM5j3HCVJajCqdxuJ1pws+Y0ZAvjqDs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YDHBsBqOxvbxFH5hsc87UXI17h7ZHRsJnLM0J98QvRUUhjRsDCPz+HqJv3hZyrrv93iZDLgrOuWuLK1lSSdbJZlsB3093tLozRnbpSc0hd7TytLC8gqi0y+/aqFEfIOvgOqAitqWckJpliPhZFLP4ZI234LbBVnGWTG/LCNrYlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEhFt2Dj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEhFt2Dj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60B61C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 11:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772191406;
	bh=JUyXC02aVRC2WM5j3HCVJajCqdxuJ1pws+Y0ZAvjqDs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CEhFt2DjghTRfeznZVD7lYljFkiZ4nmGSlr0QwTncGkVuybXGfo4IV+hhbUgjLGib
	 y5CX+EF8LyADd15w8a9demT2r2JoZKYrPpZc5iDB5jKKI2V428iZiSMDgOSSDuv612
	 ttSIvneErevI2prHkn4NeY1Kv6AfQr5ndzgGm1IAqhX64baOSvZhuTtyw23l+YLJ7M
	 EX242zUh6K2pGDGWb9xjyXE1afQFdqJ3hTSipOZwuBGNlje7bBNU6wGgChIJB6CBZb
	 ZlK+JXhs+qCf6QNCq84848WHhmfu2rnOzrZSOMfDSLmg+pO3ywqoTszGuWAxuCnN2C
	 9Fa+oCSRwMqZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 595FCC3279F; Fri, 27 Feb 2026 11:23:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Fri, 27 Feb 2026 11:23:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: qwqgong@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221150-215701-sGlCCqo03n@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

--- Comment #2 from wudd_maya (qwqgong@gmail.com) ---
Created attachment 309487
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309487&action=3Dedit
dmidecode

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

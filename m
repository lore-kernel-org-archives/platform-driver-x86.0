Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9367019E7F7
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Feb 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771768455; cv=none; b=gZKJGc+M4seIJoUKJfoKe/su4ODaabHVtWJgRUYpu+zwv8GYKf6vk4cGumk2wMmWQBBpdlorIWZnF+Oai5mkhUI1SkuDcUn/KGsKCOZE+BIRt+zCaVyKD2RNMWKGAbEtnElGdQhQajTpwz/G/KA1BAe4TIL4PO8HyjJe27YQRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771768455; c=relaxed/simple;
	bh=r0ea5y2fS7DmNa5svEqe4Lipu67FNcUgSUuUuGWpknE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gz9P8AdLbDCqeYFlF8yGiJE7IyH7MPKUCkFYEAFIJEP9K1C9ptHn6Sg0/ClZz2+itQUn5XLkC81UZ1Gwz1rHgfkOSqk+Dc0goVs8kTXYWzmDesxgEnuR+sJlabJIESqHq+U6jiwm2jnxxHFAkgXMutg/e/gQ/P4uXXonGh1BcqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zyf+OC4n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zyf+OC4n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23552C116D0
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Feb 2026 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771768455;
	bh=r0ea5y2fS7DmNa5svEqe4Lipu67FNcUgSUuUuGWpknE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zyf+OC4n8N8otYEfToFfBc8yqVQ2w8jW4rbUyoU4HnaFJT0n3402Ba3xxCKDLEEy7
	 6NNue/Yn7lTNeNScCzT+fzNZRgk8PgXoJdOmog9yeQEhb1Bpb5XU5pUNksBz5WZhrN
	 bze8Zv+az4h3ze6kiry1WI1+suOGrC/q9B3eWAqiXKAJYyjGjgMMTpagG23Ocrni2z
	 KTrJNUJmZSLtADLTkQpMMSZogemYk8ndTtXFFbFOcObKS/H1oT3OrY5hJVO3O8sdKx
	 KSOnHPriefv8PdMfICjHOBp+5RB79T6rRrI/DxknappSSiqKttDY3AwXW5s9JPd3ho
	 dkUeamCXcUyyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1B861C433E1; Sun, 22 Feb 2026 13:54:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Sun, 22 Feb 2026 13:54:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ggrundik@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220722-215701-e6RnuLfS9n@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

ggrundik@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ggrundik@gmail.com

--- Comment #10 from ggrundik@gmail.com ---
As I stated in https://bugzilla.kernel.org/show_bug.cgi?id=3D221118, its no=
t the
fake battery, its the pen battery. All you need is just use the pen, touch =
the
screen by it, and this battery level will update according to the pen batte=
ry.

So now you removed that feature, and pen battery is no longer showing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

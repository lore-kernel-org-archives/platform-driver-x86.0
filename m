Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A7C42A83
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 23:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749252717; cv=none; b=KqpA9OV6oL4fPx2tUwe4WZ7wmZ8a0cwcBqt3cxPF05YDKt/sdaDbbi1Pk3qzzXrxAjuiPShl6TrOz3MROHMiSf49egx2DV32V40bpaIMujNV0Pi/IXfc3ZGnzFZGVLFExRT0PtZvG8FI3JBi/BTyO881TMhO6pPhPL3AmMK0tPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749252717; c=relaxed/simple;
	bh=tv73O/cGczuRgGM/71c9XODAKqKOUAoOrC8bW53ArWk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fCM3OgBkOAZY+ST0d9OoAyiluJXNPCahj/r8gUErl9TvtbwfeJK7LLWxby3kHT2m5+6pBP95oi940xDsJo2YAihM/rKazjFoxxw93vOBvtl6rBWiwHP9Nwl8dw39LFzrB30aKKSQViszj+8LFfnxP5ARDAFa7X7yEwbpLMY3WjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnXpAncx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnXpAncx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48E5AC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 23:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749252717;
	bh=tv73O/cGczuRgGM/71c9XODAKqKOUAoOrC8bW53ArWk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fnXpAncxrpwy/kBxnGkEvVU+SFxArujOcd5YjVt+c/m3hwUpPmiSunQlVf/48hKEx
	 8XyNehZ49EvOpNar60ULWF8XlY+M4Q78jExdqrCE6jas9hV5euvbRK0vxpOJfvQbKt
	 5inYtXf6+m/McJCJ4KkuPlpjv3N0EV7jcreRQJpvQxsk7oZ9QBOgoldwNXV12ft2qC
	 1MhuPkpJrDRVUwS8EDuX2ODxD710OmQ6ATY5RhsG1RfM5IG/Lt/r672FOvvE32it5q
	 Sv4PoY/6ijjBkJ8t9HCJ/Wp6ulXbNfvAocFo3J55I4PX89jourNfhs0nfghigQkn9U
	 E8AcgfR8zAJng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3F6F6C41613; Fri,  6 Jun 2025 23:31:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date: Fri, 06 Jun 2025 23:31:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrenyman2002@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211741-215701-eNmPQouShE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

Andr=C3=A9 (andrenyman2002@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andrenyman2002@gmail.com

--- Comment #11 from Andr=C3=A9 (andrenyman2002@gmail.com) ---
Still a thing in 2025.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

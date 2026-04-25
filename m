Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED63211CAF
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 01:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777079220; cv=none; b=BWvTyULoYzvtjNoJ2Ys3Jq6q3glnWxq0aieKj4XfvJG2GUHrxyjP+Kyqqm0x0mB7FCW4iS3nVNm/jZktL5JfZahKcTekbYmLPrZekYRj3Bnja6uGgFTOZNfkzoIL96LBat32qF+tvmOe/VKAOyDWGA+iI+FiPXKbBGndYlQLv1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777079220; c=relaxed/simple;
	bh=LDnvTSnPgv7cSE3Vh+M6yUaPTb6dqwWwWHw4fJl/ZyY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q2soZdIDCw5D9TO3rcQQ/gtZ+Bu9i3Gp3ZBDTHwNoIEJYGcoiNsp72a9SkowiNsSwLbzMZGrcaeccO2wIWVrePSluO8+zUBSB9T8oPBdLQGsjQZhJTXNOG+w6zjw5V8m4oGJtrwphdf9Bsu2sj2rZ5OFp5QOb5FxwCaRl1BBUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEogg2GI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEogg2GI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 945A8C19425
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 01:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777079219;
	bh=LDnvTSnPgv7cSE3Vh+M6yUaPTb6dqwWwWHw4fJl/ZyY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SEogg2GIzp9XjQ/X/uUMDye7Kp6+LxZElE71U0VeTNA6CX3uE4g2hhUUq0XagdfGi
	 X79K+hnkxFCZexXVVTc+M4zimU9r78eppSlbvfufg2Dx/aB8D3I/QaJHW0nUKdkUxh
	 +1h4g3CUQ6yU/GYwjx0NpjsCjSFRrqLBoa7FbF8jJYmZ0nt7vD87ib77wtjvFzvdKC
	 HQ2uJ9oWQGkFtUqID5/tG+VzeiMZFs5LnEASlgfvJ0Pf3C80vAH9/vqJOCbPfGDTQb
	 bXM7yrTyVtBrD0tP/dUjkbIua0/E8vmwfx/gOOkwtIbUuwwl5pY7CN+hPHN72qHnSn
	 iYmGruo3fymXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 856F0C433E1; Sat, 25 Apr 2026 01:06:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 01:06:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221383-215701-hliH3owQmF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

Daniel Gibson (metalcaedes@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #309943|0                           |1
        is obsolete|                            |

--- Comment #36 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309946
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309946&action=3Dedit
revised patch, still rough, please test (now only sleeping before suspend)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

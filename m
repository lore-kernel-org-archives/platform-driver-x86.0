Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C451823BCED
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777172360; cv=none; b=NT8WzjWfBefCDeBmDnBEzNE1xT0/2BqrFyq5LyeK8wSAOJX4kIVgB2EU5AGw11ufpI/jGg4ECic65zs5ntqeZ6yiQtwgUn/BxqUMvm98auRU4U31qaMlZBSk3ywsAigs0IZUVDmdfeXQskX4XU7EMpvXykqMLm4r4R4VOMijPWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777172360; c=relaxed/simple;
	bh=XrGZmAcuvo8Abr4HWxCoMNBHq45ixqnSoIbkwT/ROeM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kZaUyZVI+s/7N1i+79UnAwmSBGLfy4X9+VzLLlhxNc3B64494UNSwm7eVqBuu5i0SmpoogX0Ky8nwrrhhyslWkuIJv5BgFNxRcUTDKr/patUOyYiZtEa6PgGcNyB+ANvVGxmhmaxgg9+zz6wD0lGJ77WZo48Kr1+y14Vwj9lFQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8zqM2a4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8zqM2a4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F094C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 02:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777172360;
	bh=XrGZmAcuvo8Abr4HWxCoMNBHq45ixqnSoIbkwT/ROeM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e8zqM2a4k2mNk8HQtYBTXQDT9pYfqPXyuN7Yhu4pFGqpkKAoP2UqTjywQpL7W88EM
	 RnVOXrWLLOb761rNq5ON6j4ugnjnzXuXrd26jVjkUiuPG2LKS4cddzszSR4oTDxOxb
	 7IkUiakuoV8JnXvEy4Vs7YXp8H7JH/FGnLyWwSQQKrEaEQfxWAKzTlMTXICrlYlkFa
	 Ecy9bxtlgk6JljljvdXEmJrNvCfbcA8bfsQK+BmRYqR77yaoxgNyB8FAQMbROGCldC
	 zwB4ObKxbr1EiOL+aVGbSwsXk3KHl9VntImF6WyL9CS+rSXCvbJVNy0/UOZzDOXSb+
	 L3vzLSrr95uxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5C76EC433E1; Sun, 26 Apr 2026 02:59:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sun, 26 Apr 2026 02:59:20 +0000
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
Message-ID: <bug-221383-215701-zF5Yv3z26w@https.bugzilla.kernel.org/>
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
 Attachment #309946|0                           |1
        is obsolete|                            |

--- Comment #42 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309957
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309957&action=3Dedit
patch that adds sleeping for 2.5s before suspend for IdeaPad Slim 3 devices=
 or
when setting delay_suspend=3D1

Now I'm using the existing quirks mechanism (fwbugs_list[]) to enable the
workaround on most devices that identify as LENOVO IdeaPad Slim 3.

It can also be explicitly enabled or disabled with a module argument:=20
  amd_pmc.delay_suspend=3D1
to enable, 0 to disable (even if device is detected as affected) or -1 (the
default) to let fwbugs_list[] decide.

If this is used, a message like "Delaying suspend by 2.5s to avoid platform
bug" or "Delaying suspend by 2.5s because delay_suspend=3D1" is printed to =
dmesg,
so one can easily checked if it is active or not.

@Sindre: Please test this, and please disable any other workarounds for this
issue that you may have on your system while testing :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

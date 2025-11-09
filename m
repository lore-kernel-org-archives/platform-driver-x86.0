Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F61494C3
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 03:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762660572; cv=none; b=WlwmN6Fe1+lX2wkGlQw67apO9F3qb8JFWPQogKhC7k+AikiMMX0fr7XjY1dP8C59Mg7p3zBp4R78PLIAs7doJ4pHgezUZu+EkyLhqUjMJH7W2YCDnklRV+094K4KI4AGdQRZ+8ii7f9NJSFOmvv8lcfXMSboCFvb8QM5dKzKe5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762660572; c=relaxed/simple;
	bh=+pMKMRA/nRVsUE4tRlux0wMs/ze6WKUIqyEkWj1aKrI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nnip/zbor2/CQKKAMmZasRncYaMm9oFOJ4q5ulSZM1L9kY0/08zm7nd9ljquH7Qwf0Q+zL70Q3H1odmnAt/cM18o+5yNigMcfvVnPieRe8cEXEn4gFQz2ry0/69K6oQ/nJL1F2AoXIp1+B4beFTBw7ZHth88wpRuSdK4eY8C+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwkchMir; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwkchMir"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80AD8C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 03:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762660569;
	bh=+pMKMRA/nRVsUE4tRlux0wMs/ze6WKUIqyEkWj1aKrI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UwkchMirCNydVpKiZN4QEUjdMe4XeYSeUtgLQ64qlYrR8s9SOYYAXJuXmc+3c8kAB
	 jrqOhhTXKbWOUp0CL1NjU6H8WtPDLmdCsSz6+follJBrdX/InBxp3H9428Q7iNH262
	 2/Rbjicxm/TPvz8lVLnzpuDQN8fQDQj7czu6rnQpihQa0oEz739Knhx5JAzavyhYpk
	 F85y78LjiLI8QFfdiqSD6yLmHdNpyaWoR3FTwhtGKjZfLhpS6cJ4J+2ycEuKZvFDu5
	 nBZTOj40wXMOEegSy0gPWUFuT5hMWtCPjgnxjQl9bAJTBGrwQRFbR5XlZzrd4zpVTV
	 dUmR3dtKamgig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6F207CAB791; Sun,  9 Nov 2025 03:56:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 09 Nov 2025 03:56:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218305-215701-Cq2KvANh2g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

M=C3=A1rcio (marciosr10@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #308672|0                           |1
        is obsolete|                            |
 Attachment #308689|0                           |1
        is obsolete|                            |

--- Comment #139 from M=C3=A1rcio (marciosr10@gmail.com) ---
Created attachment 308924
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308924&action=3Dedit
amd_s2idle on HP

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

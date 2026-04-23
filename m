Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C057313E24
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776917820; cv=none; b=avCcABTUodSuXsFFOoCj5kNXlB43UjH5QmKTaflJs+x/rTTXOa4/uODva7Q76gYbIctSsC5BYnjmUlQQGawQfqyF9UPERHO/Ocg8hisVfjTY/9IZTcgW2asMKhNSonbUFJrKPJndTzhOUfYW2PFvU1EEJhyA9us3H1ahDcx70fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776917820; c=relaxed/simple;
	bh=grSmZzucvRnA9fj9OAaWyMsgUsXKpjNLxxVAx4W+894=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iGAy66RV0Ly8GiUTintcb9XiyG2niWWzTTacjnoNtJPLlNznJD1jNyRUjlp38YYd1IrQVZNVgG2EZsLDxvTPc7Y59lqvlC7AciLN9exGbCQ2rqN+/V0fqRMYGxHTkpNz047F3AsVuWwsvTX7CrfaxQhc6XZOABYst8Suli4fmVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjtZMbnM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjtZMbnM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7C9BC2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776917819;
	bh=grSmZzucvRnA9fj9OAaWyMsgUsXKpjNLxxVAx4W+894=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MjtZMbnMlbNJ6NgCLbl+hFBjIP74+nSzEF7qo8lyPyO7Lq3heZbKvpKAnLpSXPY68
	 I33zolKQIbnO1Tg92mnhoRm/Cx4fPwanFmKuke/YXMxLVANo8slb4jyz+cuAhXhNAf
	 fsPkmUhEcz9p0iPjK2mNw1nGL9Xzx3W7iLZbr5bnYMb/F6zstoXoNJqfcoEkO1iunT
	 33V4gMgeXqr/kNQ5GIMTKAJB3J18a6Kd+i2ron9h/cXLXWstGpbPUxZggeWCgl5MOS
	 NpMEELAY4RJ5cuQ+iNNu0RXrDHYF8sstlQGkKTNoBOwHBnqOvBcsF3fvuWBR2oxf9M
	 Xr3e4SeD3f5UQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AF7A8C4160E; Thu, 23 Apr 2026 04:16:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 04:16:59 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-HqoP3lDpnQ@https.bugzilla.kernel.org/>
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

--- Comment #16 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309931
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309931&action=3Dedit
Daniels dmesg when running suspend manually, with patched ACPI table

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

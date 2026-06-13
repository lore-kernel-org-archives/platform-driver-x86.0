Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12457175A81
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781337319; cv=none; b=PmU0trbaqzsv/n6mAEkLbDCv5BKigSdME2o2h2I6QWwNP6NsyRiaFyFwgv7mKvSWoSWHx+cdwB1XUcLvFwSudIjNUBHSVq+77cSM7hueAcCbow1/pUTTtPSZibk5ZIV1I5+5VW3787UxcMJUvkJPLKJjBSEoenzufAuM1AzWVSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781337319; c=relaxed/simple;
	bh=t8TsivKkOPMrvjdQ7s0KIOpA83FjvXg1fz9Jz4554bo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DnTxB3hJ0WHAenOs7pUgPSEK5Q8sDM7xivj1mDNUrSlerCdk8L+3x+YricqDDXv0vzw8IS/uJS/4iu2btD3pm84LfeU+3g+tCZMqGbyCrYtUhHGUjKvMtYigkuXswMedWPgXlR+XAGbzFlAUmlHew5AqKulvmpKYnRE3mdfR8u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f20cnoN6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f20cnoN6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98D01C19425
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781337318;
	bh=t8TsivKkOPMrvjdQ7s0KIOpA83FjvXg1fz9Jz4554bo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f20cnoN6qzsEBzC0jzziYbBxo/I78tzOiaL+5wp+fuqAF2NYDjYTTdIa/pLBQU2fM
	 ZclBhGvky7Z+2SR/TVWK0OYt9iH99QC+V20vbk7g54rhE4K1y7GK6pRX9cY9Lj3/Qw
	 JIYxBrSQCxB9tZ6pUDtefYc9axnDfqqwf5QFsB9EwxPF2uui0vmJke2nRvcr7o9Vlc
	 0rBDXeMG7FbfUx0JZmN17JlcuKLE3nZ8VOu4Njs4v3ovo06gNhXsBlw2CXV1cHIXWf
	 XntOPQooHx8LkA4X/YajVdCsYK2ovFLI7R67SVuQx0W7LLEWCxbl2rtn/ASk0YFFTR
	 Kfkrl7KAyhD5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7B8C3C433E1; Sat, 13 Jun 2026 07:55:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 13 Jun 2026 07:55:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chgenn.x@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-BVFY86uirg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #98 from Evgeny Ch (chgenn.x@gmail.com) ---
Keyboard hotkeys for brightness and sound still work correctly and show the=
ir
Gnome popups.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

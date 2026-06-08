Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E836680F
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918309; cv=none; b=rxwNUrnl8U5Rlek8BEV5shqZP5Xc1q8fyGCFWPqwo24KHD5WyG8EEZf1tDUhpxSKDfAUSnEj1EqgpXBX+/sTl5oH2JQ4Xb8mHkr8sX1dVCk/jbr4mkC0GRyyLuys7+AB+Du0uclTCQ/+dwnAro4w0AppTkmOy0PUXr09w7f7RYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918309; c=relaxed/simple;
	bh=2SV4lh4cPCVDYGmnmBsUoHXL9ee6sv0zViEx09CKHjE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OZp8Tg6gJiL6Mp97CHtD+xepARW4C8VZTvWnGgkNR2WyjK0RMkpzTfaBKi2t/F+/NGcIWa/86A+VDJZzU71RfDpap2BYoLWml2+z8hKyO7M5Efi4hPg8OXqRP354JStjIqSU9ANhH/iNw1sKZohZBVGRBTh+x3UpuVtB2KvOFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjQpKDFH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjQpKDFH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98F64C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780918308;
	bh=2SV4lh4cPCVDYGmnmBsUoHXL9ee6sv0zViEx09CKHjE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mjQpKDFH7yekHOGjEUnLx4/HfMHCAt2Y3saRFkHAlJfCy7c8eGU1CT4QJlWAGWjLd
	 HBhxszVh9hS4RRs4N6XsDSp+iiDa5rRLdkXz3uwGt3OTbEz2CWctbM7+fpGYMobQYA
	 actz5CQtxLsFBjm9TSEZFZZEklPcpEbznQIji6KFibZr3MV8b/+6fuOw8rk5e20kKN
	 J4XxMkqqP7E5oRePxkbDN9agouDZEbRctOyl06oX2nIA5gQQBzKO6ZwflijcP/O9Qs
	 SdMjhbV26Ibboc2NPIU7nqLZuiyTxnKjqemIgeD+EBMVLGIeMzVRlPdWdXBfRxzu61
	 nnzt6ZJQa+sQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 78F6DC41613; Mon,  8 Jun 2026 11:31:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Mon, 08 Jun 2026 11:31:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221430-215701-eaxB0Pkzb7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #13 from Hans de Goede (hansg@kernel.org) ---
I'm afraid I've no idea how to debug this further. You could try contacting
Daniel Dadap <ddadap@nvidia.com> who is listed as the "NVIDIA WMI EC BACKLI=
GHT
DRIVER" maintainer in the kernel's MAINTAINERS file.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

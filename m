Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF22594AE
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734780905; cv=none; b=DFcL9BYjJRJ3TCW5MkQqoXtZLHS7dUyXxwtq3l59i2xGUfNsMqqQXVbDQXOF4+zzi0WR6A4k+smbe/Ea7VHFxImA35mw6LVQh3/yb2s24APt0cNxkGTO1c8WtOMj22Mar4pqyXcMDF0d8GglV5CpfPYD/hczrLlmV5/jPbfp3pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734780905; c=relaxed/simple;
	bh=qkRv4MZTfY3+tSxA3jZdaMwsMCYldcDWO9tdxSvK3r4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dFp/raVcE5baj7x2J2kIuKCxBO6HAqnKhXsz7qh8vzZceErBOSMqvhNUStgxQh6OsDhDKbtR8NT5cOYL+63uf44yg1sb4HCcuNKHqXNdiW7YSFVgkBnDzCfWa3ojO2tI9jzh6BnZzZVLOI/hlQcCpNAsQLvloLvaVCTAFzkDzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZcvD6Ms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZcvD6Ms"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 662BAC4CECE
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734780905;
	bh=qkRv4MZTfY3+tSxA3jZdaMwsMCYldcDWO9tdxSvK3r4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BZcvD6MsgdcrpRElj7xfCjx4LLE5hPoVmP/QEQWRISG+HIlJw+pBJYfy6tdsMkp1W
	 cALNCSDJ9m6HQzSD0DDFWsyxd/bq3losF2X0wtNZw7Jd10+U6CkpcLBRWj82+owH1X
	 dKI2shWdmU+wZgoZzddgao8sq9WZDNyFvV+zmnJskSoT/OYrx+bs+28s231g4GTeED
	 44ZZDKfNTCFS5b3RiUpoaF6qzJafEdh/p8V0qI6qemKbUikap8zRx0yM+AF+ZYlJ1b
	 lXVfjyPazfcfaL482av0ZJHKimRGutNyCN9fPyQivqeH0dTB9bxFkSThNS1VsZVYnV
	 4WnZ0vIfy6bCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D01FC4160E; Sat, 21 Dec 2024 11:35:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sat, 21 Dec 2024 11:35:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-219495-215701-hNSqBSQ9iw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

jarkko@kernel.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #307381|0                           |1
        is obsolete|                            |

--- Comment #44 from jarkko@kernel.org ---
Created attachment 307383
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307383&action=3Dedit
[PATCH] tpm: Map the ACPI provided event log

https://lore.kernel.org/linux-integrity/20241221113318.562138-1-jarkko@kern=
el.org/T/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

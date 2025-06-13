Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740D78F5E
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824996; cv=none; b=ccJxkujwKn57b5TivHyP71Ltm8pjrSfCQrWyCG79qitQQ6stVeWTbGEZNGQreBavKKZ6rSIgaKxLI8VVH5Obf5DZClG76xzfljYTfMIT2DCiBe/VncZ+Mws2l5EmlxW9sanfOOesmHacqwTQYmh7EcF0gK0DLmnQ7y7OWth2bgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824996; c=relaxed/simple;
	bh=pGWNtu8eGs5DkYIhCYfeof0zz6dzL4kMkBEtJPyavDo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oPCFNr4nVvOXXEzAi97GhsM4HzMGvPfyAsb6sOpnPwLHNnYUZHcdqpmF3GE8RBTCe+OZAtB5KoyQbdRGAvafEluiaC6kUnuiH5Z+Kw+cMo62QdXwbQvaOgEbZWTECvm5Ofxc+J8EHnmL/8CXlSK5XoKI7IU/ngxRe++92iKN9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ru7BsQXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ru7BsQXM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1FC5C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824995;
	bh=pGWNtu8eGs5DkYIhCYfeof0zz6dzL4kMkBEtJPyavDo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ru7BsQXM8h8EFftYUjWb2x8V3cUbzTRJovK2E6NPhO+BNzuynSia1F5ObQheKjlzg
	 5eRt6wCxWBfNO9sDoxhmLWeDP3N4BaH7WgUZCjI+1GDYhS1TI3JYljlA6uXnolj/KD
	 Klgudf6gTsSqYPJszsJRk3gJ08lURQdizBtivpqo8QI9wT2NNXEh8vLsLgWMXJXajW
	 XoURjdvqxb/SLV9aQvJCh6zvR8vwvAx6lpkhyrYdBKWR9eccdTh/MzYReEfDFbIgLU
	 i/HQq6TXsZIRgo1fC5iBpAn5+44SE2n6i9/Tf+UMQQc39iCPL/mqP9mbA2yOFPeDMJ
	 XjElWFoRAI+9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C5FA8C4160E; Fri, 13 Jun 2025 14:29:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 14:29:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-cy2drpiFed@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #15 from g.molinaro@linuxmail.org ---
I will ask downstream about the eventual patches.

For now, I followed your instructions about ssh, the machine went in kernel
panic soon after the modprobe.

I managed to extract a dmesg before the panic, and have the output of
journalctl -k -b-1 after the reboot (into blacklisted).

I hope these will help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

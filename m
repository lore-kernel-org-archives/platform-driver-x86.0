Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89701288C81
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302706; cv=none; b=NVYXeaFbAkWWCvFtX5B37v5vPTGx8Q7DSYYRPGfWAWSOqopeONLLiD7FVZX/AsMtIeLSLLyAjvsqhYNJr7KltKOEh01eguwUEwF/+AHWrTfkyQGvXiQbIYacqpM58CPq9Zb3a0lhjrGsWyV7Io+6yBoM2J3iKr8tmKxYIPfA5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302706; c=relaxed/simple;
	bh=3/WpgtGOSHYTEvet9vqKBr4bwU8gdQJD+zh0gJQlI3g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ImTKXgyjpL6Q/YUZ3SQUZ3ibNmcAxK3SwStVMzRp5wTKkLE1eCG4WQcA1uNKLGLk/0RNsdngz/5vthpk3v5KMJlxydnBzp6wT7b9qdJ44Mce4dKgHuVZO75diTG3M91rrQ05kiDZ0acMUHJWctFhkdoZ5QKTBT6hRa0EDR8NM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQxV/Pa2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQxV/Pa2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CE73C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780302706;
	bh=3/WpgtGOSHYTEvet9vqKBr4bwU8gdQJD+zh0gJQlI3g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eQxV/Pa2WBsUUFblskNZZJmSAg8YteAiKhL/X7OkP8SmQ4jbDDEYYNLWCaaASLJXC
	 anFtTJAlySAaCXHfeDqJI9SUA6yWhVDlo7Yu3h+l7V9b/AWpj1HPnVncwKi9ZvQev0
	 +okHKs1BfYlIx0SDJ4HaX/ZX+n8S0twUE9O1hS+J56v8JBpYpvgfqn1yJPV0mX5rhG
	 pQJYUXcn5FUpqo6mQ8Cc0tGvhG0pZbI1q+WwObI7/IWTRLqnzA4YRYoSWhmL2HlZhv
	 y4KP4pIR88RuZNaq9tZI9XTuO66Kcjtpsdq2YoQNfBs1tnnwVEkQqgiyVVPebw43aP
	 laaZKQRRYMWvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00B96C3279F; Mon,  1 Jun 2026 08:31:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 08:31:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-h41v3sAQ9S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #11 from Milan Oravec (moravec@ukf.sk) ---
I'll try with 7.0 tree after the work. I'm using wifi as only net connectio=
n,
so blacklisting is not a good idea here.

Just now is reported wifi temp. OK:

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +47.0=C2=B0C=20

But FAN is still 2100RPM :(=20

load is low:

migo@migo-HP:~$ w
 10:29:37 up  2:37,  1 user,  load average: 0,19, 0,25, 0,25

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

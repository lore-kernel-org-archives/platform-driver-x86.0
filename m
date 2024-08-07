Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9391558B6
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 18:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723053696; cv=none; b=XsbqoeC/GZRj96R1Pj8EvHUmhYB1GPpnhk8AeX6WRkE597baiNYLLtyiUzzfw06DISuSK4wDxJPAQVYgFq3BR3FUkX0HaGi96jQ45ok2FwvOzrvAEHwqY2y69BYsX1y7XWM2DzWNKvreoUHq2MRJY7uifSnDW1DBbzo+HnbJ5Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723053696; c=relaxed/simple;
	bh=v/kxwduCm0i/fbkeBbZP89b2VsbIh85jo+Rd5yaBKIQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=olLSI/leXHBEqAXmlvEjNSEtUP3h0gWrsBGGmS1CqpaTmJPUjVOIih3i1fisysJ4MQjtkc/UBpOaz4Gq9DVp24Z0V69Ma3Ssg2/JrO1ZUe3shLitdGPTPqsPT1vcjuAcLPAR8BwY44UtcI6PxoKznap2H2iQ5aRpctc8Q7IK2Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6ZqRNKZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6ZqRNKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A496C32781
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 18:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723053696;
	bh=v/kxwduCm0i/fbkeBbZP89b2VsbIh85jo+Rd5yaBKIQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r6ZqRNKZk1VLRAfKUYElSaNDQRM8h2y9rebE9fR0hC/uFl9Q25ldvaURHo6e+s63W
	 Ta6Q08+wlZQmG06mCuJxGWMdYjplxHIG05yiWs2PquxHqokwgS8NUwXE7Ye88k4oOv
	 RRjP3C5e0Y66rg8AcVceHno7vT6+4EwC+8A2uIOp8RXa954h27HOTQmzWAjdodYaG9
	 EkGOw6n3ZU3esTJTM1k5qFtlx0IseODHwqfRUJtJ40TYsDkzCQWva1gmbRCR1EJXXq
	 HMnaswFFO1LMEj4S5oweZo9R9+OHJ1Nsv2pAD1phmEm/JUzN8NDHJ7ok05ZHDcY6qM
	 6wHa+Uq1bOjHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 029B9C53B73; Wed,  7 Aug 2024 18:01:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 07 Aug 2024 18:01:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ghostwind@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-eVU0k1jewz@https.bugzilla.kernel.org/>
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

--- Comment #53 from Chris (ghostwind@gmail.com) ---
Created attachment 306693
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306693&action=3Dedit
DMESG DUMP 2

Here you go. I also had to manually "battery", "sparse_keymap" and "wmi" be=
fore
the module would load

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

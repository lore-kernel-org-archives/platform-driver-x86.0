Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208424;
	b=XAsNtPTUEWQ5jwZdScQt4DjE0qxSnZwDMwoHaLLMdqyW6guQ1M78CD8/fe/jTdfvlBus
	 Qx4iPW5p9yF9EY2pc+g4P5U0YFBDOfmDfc5sdbwq7sDfDSrs8aqzMDBOQpscVR6CcAkFA
	 Fa3JZGDuFkWDRh+UGmFx5Dxc+O8vCia5WB7le+xFL1XLX+cD/+NZ1neHf7PD2fy3V9a0x
	 9rFwaTo0UU4GOmOSTmvKJatsuh/yCa0PO5NNHUekfuugswgkQmw85VGuyInpMT2mmqeI0
	 NRJqjuoVNT6VkgkbYHfoSES+9ETdpwNShuI/yQ8+lQQotu6yRB5lH1E1tzvesosg7ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208424;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=hJ6RozSRUw4ivHBTA8k+q5gM1fF1Y1lZwF60YuAm90k=;
	b=4nxsF1l6jQ8V5gJdblbXpSkv5syufOWMarOog3UAw5owUX+0xX0i30OJvbX828jeLp9O
	 BL9VFF4jYo/8+tegS9B7Q/tw3DWhWjobLSQaV7ZKpzLVfReUfTJx4PzNp5lSMzJdzBxiw
	 nYftYrwZimbOg3qNj4MKXrTQ5NbtBOGIKqhbnqZiUQGQoWEc/u8HgDbBER+6rgco5D9EA
	 i0whlqJxDnlMcF29qDqo5K0Fkuq9GUFe5w+UocdL9D1QAlI7ofO+MbFfvKW4eSI1veEyc
	 O7iPk8mZoUsDGHlIS/Bw8V3kX1cYJcgufsx2YcF+vqOTPSvCklVMrFVxjyEInMEzojA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2CKvJvG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B05606A331
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2CKvJvG
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47A6F1F000D4
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 21:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795208424;
	bh=hJ6RozSRUw4ivHBTA8k+q5gM1fF1Y1lZwF60YuAm90k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=P2CKvJvGQWPuzviI6lrR+xjeeD3xSZpvsfrXQBJ5VaPUWjaAlJf0CdApedABfqD12
	 c3xMzcXT/1XnbCzu5mvgaUbYkqxOU81KeKzwpfUw+oUP4jYUABITx750Yo1hwQNHOX
	 Tu7M9yIRVtSqF1g4oJCCxKvAEJdYP1hNzhZrtPLJOkMfG1JejK+jkai3Ikx/Zvq20Z
	 HJNwZTYedUdnguSGJXN9F95ppHLNgLvfRYhO40dIjsMyMOl3ERvXj0kyL+ekWkeKfV
	 pixniysyqqIGfw4agb4t/dZLyhzJ+F+j8oay7FaWILgFFvIAyYIuFhLYBX062EUtLD
	 eYTXrdHZPcUng==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 44242240040E; Fri, 20 Nov 2026 21:00:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Fri, 20 Nov 2026 21:00:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daxter1992@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222275-215701-RzmzO3qJHv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222275-215701@https.bugzilla.kernel.org/>
References: <bug-222275-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222275

--- Comment #10 from daxter1992@gmail.com ---
Yes! My name is Carlos Javier Alvarez

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

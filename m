Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792530441;
	b=dP2VDgjJmg5m35x0erR39aXK8a2lSm8rTlgm4UhaqCaDRSuW20AYvNOviWYpZ7nW7/P7
	 Iu1i3It8RcsCxKieAaCyZWmQr+AeQZNTTEc9IAXM1LJb3zhvLzXKIKziR/RTljNemqZSZ
	 7w5wlqS95/1n/ktctlThklehbL0OGZLYuOsfL6xw8BCHLKu5K+YqhAbBSY0Xn74KsONEg
	 vnSiaK8glRDabnbNwstRE/Hxlo/7s9790yIpeFinE8ie+IWJWcYCFuKXa78lsCjCPFswB
	 I6L6lyLG/pbdMfCzWIY51akFnWxYuBXH/eOkmCggspw6J6U/bcJInm2hlXoPxziGxCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530441;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=sgxWc1f08SSE6Dg1nyfy+CfnD9JMMFeBlkwCq4ueCj8=;
	b=wQiVh9kFdC+tjBzo9H/GfVcKHRYP5F0c6Gsuoy2Y8AI1v4Y8TfyONa4FWExWhMG9Qvt4
	 bl3EXDMXbiqxulnOGHe0FOTJ4qHzucuBWaqspXQDgsY95BwlvTljDwdUV9hhZi2s9lEou
	 v3J5q3rlOV6Vd7YMAT8PEMiYk5uZpGCks1C8BGrdPuELKVfx5IdfrN/W6ZMpDef72cFo/
	 gCC5YyDYj6fDXM2YwLonVkRhpgaO9XIaQXBD5hc+/CaEA3BpwyD9q7LBsDau9/5t8XkDm
	 UpFLyWcUV3+4EPV7lFZCQX3xsx/8L6fVLMl7vgV4aTbRjJldYCRKrW5brpdSjTSRaJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SfGjXc55;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3996606A31A
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 21:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SfGjXc55
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEEE25771
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 21:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792530441; cv=none; b=kFu0oA9vR1DJkptsxtXVDvtuGpinNSuA9q0RR41TmMHMrqmMCjUM7VEtQs8TJuJCqIAbPCm9MQY1NFKnuyZiwsQH97AOiYh/Qy+PCzL0OH1gI2cKOdcqSDsDDTshqYbwC7YsosnL19AvcoyZdfxvqv0cUu+Jiow2EWg0D20a3rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792530441; c=relaxed/simple;
	bh=sgxWc1f08SSE6Dg1nyfy+CfnD9JMMFeBlkwCq4ueCj8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E2Sr0Uo6BNanUx+o33IKSxFFzbsr2p96P9l8ec4O3U9p0zv5FuRAiTbwRsvHtYTA/sUX4rNU3dF1mr3h82FwyuKBJGcAmLh+xMQ1+1wiF3T3G/0MkwM6WEbq1aZnDzhrGS4r3yF6TX6FoZhQ5GU5iTvB9ZVKWqr3mB0ddkC3h60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfGjXc55; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C515C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 21:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792530441;
	bh=sgxWc1f08SSE6Dg1nyfy+CfnD9JMMFeBlkwCq4ueCj8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SfGjXc55TKtW9ttRJr+f9zFuqZydjlaC/y0MBKR41h4BhRxz1wgdMH+7FhVccL79T
	 eDzj4Vrn/TlcyicdeXgc67wyUyesYSMXS8aaes5iDh34pqtfDFA1q84HdNPnfQQrHk
	 nyKlY2QppxWp/HDAoFVwNnMqtRB07dHpJuRpEexPWbPtRHN4T/JDrVTA2jSe2N6Osb
	 rieCRWJFZxuo0BNnDg+jMz13zyRg+4SrRtw5GqCmRrKPI55QXIkutoCKgua1FIHKMw
	 dH/shoUuiZdLgsSfx3IHA2xJ2jVRpweFoLUxkjZOxXYAwLBgMVt04T18dPNHn7jehv
	 i7kNXoSJdzcFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD68CC3279F; Tue, 20 Oct 2026 21:07:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 20 Oct 2026 21:07:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-um7QrVKK4s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #2 from helian.caumeil@clever.cloud ---
Yes,=20

before patching, i had key combinations with KEY_LEFTMETA
sent to the system two times.
For example, i had two terminal open instead of one opening normaly
using KEY_LEFTMETA+KEY_ENTER in sway.
Same for all other key strokes.
I confirmed this by adding lg_laptop to=20
/sys/kernel/debug/dynamic_debug/control.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121602AD11
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Aug 2025 20:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754164993; cv=none; b=Y7oN14tsgutRGUZ4UhPM8UCcKSUbb79l5KYAlE5AP+Zd/QoEbzzdGi7RaLbPT2f4cZa8czpiKRKw0jObLkzQqgIImCCZnnVcJfYkaE7TX+F0FKSYqGr7ObepuFsrLuPP7E7JUVlvwAsTahRWeJ76As4IgHBBXVkZ4LmHu7U0wDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754164993; c=relaxed/simple;
	bh=05n52PYg+xGaYxWGvw6P2D0RLqhvjSk3fv22Caa9X+U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tnmkfPcdmOuv8Dkw8MbBKejwIc1sahZLKadhzBuQg2o3+LFEz5Ft9Bt35wZVVVJrn61GsKgHUxel8WC7de1/66Y+lX2kzbdS3CrVmK+KHqogej3yQmGtlds0oVJ2udH0WY7GpT1/UTg6J94XLz5awIvL5bnjv/ZDRhOIwYRUAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baFRXG5p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baFRXG5p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CAF0C4CEF9
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Aug 2025 20:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754164992;
	bh=05n52PYg+xGaYxWGvw6P2D0RLqhvjSk3fv22Caa9X+U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=baFRXG5p7hU9VkNoA6C08szAifVPOnRAvpkZpxtFPCI2MnTBPUY5JS/X0he2/kSss
	 5xfqYSZ419kAEH1nXbsk1YIo/HwXwdxNS7UmqipmKukF1XM73wuKgDPEV9uGpToeaq
	 LV9dzqWwJkcncqzBvWTN1g+Pzo5e41CrBeYUOkf+yp8AzBZjJztMRmQWt+Ac+glM8u
	 Py4negpBbL+WCUcQbnM+NxDDo+t8o0iwexMElVGUhM2eVPYLy0/MyuFaWTONnY+266
	 RMgMULkXmATpkkmAlHPK+Ion7GmPCqWytHooiQJzEv2a6Mpal+Trk+xZTI8YAodRXM
	 y5HSc5ahdq4UQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7C1ADC41613; Sat,  2 Aug 2025 20:03:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date: Sat, 02 Aug 2025 20:03:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux-kernel-bugzilla@akraft.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211741-215701-Kd7PiL2oZ8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

Anton Kraft (linux-kernel-bugzilla@akraft.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux-kernel-bugzilla@akraf
                   |                            |t.org

--- Comment #13 from Anton Kraft (linux-kernel-bugzilla@akraft.org) ---
I built a kernel with your patch and it works now. The only thing i noticed=
 is
that it takes up to a few seconds (1-2) to switch modes (On my Thinkpad X390
Yoga (Intel Based) it switches nearly instantly).

Tested it with a ThinkPad L13 Yoga Gen 2 (AMD).
System Information
        Manufacturer: LENOVO
        Product Name: 21AD000EUK
        Family: ThinkPad L13 Yoga Gen 2a

Thanks a lot for your patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

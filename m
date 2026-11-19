Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119778;
	b=ltC8uZ7XSr2lBmuZu602TDU+zdy9X5SuQxUHdJRPay0VcvOTMsJ9z4r7lVw4qLcTFtKr
	 LE4+eWWb2Ww5uj3Kg4NSA1+pt9ecC74/k4MHaFtze0dBmYbAe/iMoZFaGs6+em3WVGrVO
	 zl4CY9jmNk+CIxeJPuLIys8VAnfNYZlr4twTeywWdcqREG0x2AkrjgvgsEuNsUhoGvlPA
	 P0WoCE53IPtZ8crngRexq/mofQBhJoMH57lf22Vm05xWlZyJTFwpmEsrMohthHavQQBIc
	 yLHwuZztumcO6Q+PMTSR7j369n2kiuFsDWQ097GxOe0PGpx/hk9XLvaF9OMQr7cL5jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119778;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=NW1Y9iusFPqV3bBFE/vtoR6SlOxKgbmxarzyii9vMT0=;
	b=1kItzvEeRyM17DnAoYabrSF48b8NlP0F2ZDiYRc+lKFDGKg3ZH39ZucNQw6tr0yYjfEe
	 spjfoOfq7MNhTjNBeg42xdDbp10bZ20tHSK02ExXl9abkTiml+FsEtH8/F4hdOFi9sjxB
	 V3KE69hWAiyNzPRLvc5u8zZAMhm/jlhATzNJixGZNzaQgz2FzfQ6WSenjmp6JxImKVX/G
	 KjuOp8O+d8KEsyPUTFwW6DQnBZCPkkmg5JhKOB76j28cxNlv+M+kLxgigUNB0uHPnYEsc
	 5a0NNSQXFIEdAlkRmLnMcn5Oi5BorRFt3+5Mubx+9e5HhAjBtoz7pu93+JgsbClGlrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iq++8A0h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7CD606E4CA
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 20:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iq++8A0h
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FF541F000D0
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 20:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119778;
	bh=NW1Y9iusFPqV3bBFE/vtoR6SlOxKgbmxarzyii9vMT0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Iq++8A0hXw3G5+yNJy61vNnS8vcULvblZi2336ZHDH24v8BpxJXpzdBkAUlZ5x7Kz
	 IvBZucJfjKgrogn9Zs2pawQ7+TuR/XTyM0AYAFo0dU9LNKLYJsrnBhd2ZDeb+lkE5Y
	 QbRxCJReRLYB5zHrZ3rOZx5HTHmgr9qdkLW2CkB4ziqKhRQTKnE3qSHcB/4h68cj8A
	 E6g9pibKlINmMQzFfhw+/yKYLX0x2tUlpNrqNasLjl6Sg/ZMP62VhNZsLMGsM2zuh2
	 XGOybnYBJlMO2Yc4yYCwi8JLk8cqvoRZCj+0T9q4DxTusDdMzKIXvoVne0+MTFqCe3
	 VVynID0P8Kerw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 39071240040F; Thu, 19 Nov 2026 20:22:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Thu, 19 Nov 2026 20:22:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: deep.seat6734@fastmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222161-215701-PUTu7Pxqy5@https.bugzilla.kernel.org/>
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

Nicolas C. (deep.seat6734@fastmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |deep.seat6734@fastmail.com

--- Comment #20 from Nicolas C. (deep.seat6734@fastmail.com) ---
I am following up and can also confirm that the Super Key does not work on
7.3.4-300.fc45.x86_64 (Fedora 45).

I just tested on 7.2.15-300.fc45.x86_64 (Fedora 45) and it works well.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

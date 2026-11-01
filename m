Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570945;
	b=WcIhMx9hKF42+y5ygzfEWjklP/V4OeiGlQeVwi//XAqsYA81taT53gxG6U84JU43gzNZ
	 FGM+LN/76HoFRTQhPqpBWmKsOBKKN0S0pCXLc1oNcv8WrVX+VD2lj/CuhsuWtmBnWtN2E
	 g/0+s54KNbkYlmUgRsZ1i9DZmy3WzA2Lx2dp41CAKN0brx9a+OU4PBXdnJE9nMbW4Cm21
	 33MmB/Zl+BM1oHBw1BaqcIBjOUWh/C6W9DpjIK7xdzE9QbSRnktFsE/4ZrIY0qvF2u8b0
	 UHsDQ0HYrQCuy4hSMloEFkPg0+Qt562FtUWbbirZ2UDyHgQYBDd00d3VRLR20mURvYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570945;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=fVT1vxhY/d8CXXRju15fybLMkI576C+YUiww6jewAOs=;
	b=M0+Dulx/jGuDnGE+t6C4fxkP2gPhUgfM1aQIS9TNgIwe2FRZdASPuLc4q1+6551F1HPm
	 zimBKSVCY3CRZ52DsJIBnOT8NnFV3q7tVF4ucf4VjdrBLsGIg1k0Jw0T7K0fDwZ9jedHY
	 lWUhEydBt3uHYkZJl7QoL8iaX5mildD2T9vVmNIDOy3BdDRPhJalyqg22ok1oiIz3H3Wt
	 sjTk7Wf3L+hSAvdNUgJzEJsqXkcFbO+WZgsL7AvT/QnEUxWx6OHTElNLXOaIB4C1n0/tr
	 FY4hUxYq6ANhdPx086Bzx8ihODqfBj/EUCOuq5+sMrqS8pBA/zjsdtMg4Zs2vRINOfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qlK6S7Xn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B8D606A326
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Sun,  1 Nov 2026 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qlK6S7Xn
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925616513C0
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793570945; cv=none; b=Y9l5tWX5iFdvByGdygcvyuFlWeOpS/u8Re1P+gbIQL+eBKXj/ceo/CRMui5KCjmVt4FoLzv3LVDobB6x0xc1ko3ySuLAs3P/smCsOf8Xzdrfv9Ax6DPqFwo0jRu+IOxHBsLu8qy7tt5yMoLo55Lzi9dxSU/vh5QjG8KFZZHF658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793570945; c=relaxed/simple;
	bh=fVT1vxhY/d8CXXRju15fybLMkI576C+YUiww6jewAOs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pG3TDOsKW5X7Ovr9rZ0VAdhXEdu2+jXZjERvIl4JJzr3ep35VzlhWCVL8BL4xj4Vldua6qIsGf6uhR1qEYh3uzGkMQhci0TCkYLGMuQXmfkMiv1hLEwcsteypdknIQShNk/GD8+BroWw9Nl1CRtJMTpKnJ/r3v6m7yV3kwX/LBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlK6S7Xn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C57B2C2BCFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 22:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793570944;
	bh=fVT1vxhY/d8CXXRju15fybLMkI576C+YUiww6jewAOs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qlK6S7XnMG5qc1mkfPRb8MaBkd6lkP8LX8Wen1q+4iXihuIZiSVrtomMSUTk2pcb7
	 RORKh+PsWzV9wXlASRIf88kUH6iWk3esjZ4yGkk7GzRJ67gsmLRQiFCLOVQBsv5Jdz
	 rKwJs6BNcfYWA8rrvuHBtK7OmuOZiDWOr3lvCUt4d0oNWQo5gwFAzSF2nIsG5n3VMq
	 d7lizNNOB+ZtPlLPany9rNw5qnnFjjGxo1nWGxPcAgrH24elvHJmyBtnf8xDW1If/d
	 4jINqUZTIOKJWC/L0zcToVaY/Bf2Vuj1eXgO170WYOYrMPjgtlWAer2Ri14zTcLI+I
	 Bt3FWGp4Yg9+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9BA97C433E1; Sun,  1 Nov 2026 22:09:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Sun, 01 Nov 2026 22:09:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-AqQoFGLvlK@https.bugzilla.kernel.org/>
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

--- Comment #12 from Armin Wolf (W_Armin@gmx.de) ---
Alright, i still want to try one last thing: please share the output of
acpidump. I want to see what the firmware is doing once we reroute WMI even=
ts.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

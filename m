Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E809219A86
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764356293; cv=none; b=JqgZkDxmV2B7UEgCsirW8g2NVVo46dDATMjynjD63oMH1sy13fVZu6uDKLN4xHradh5a2aXlrucUMiOHxQAQk9UJ58QhhX4W9LEG8DnCBZPsV2XJuXMGbGODyCpYS6gD5ud35e+ZbM8al2b1WUUQ5lB211nKqs+UeFkhoLFIDVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764356293; c=relaxed/simple;
	bh=0p3mX0cXF7eElwAPxaXz2S8Rfx1PsZgYe7xzjDxsXCk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N8GEOH5r0OFOTGXE3zvfszYVKloWt+MLY4zK/7GmSERIz0zbG7Et4K2708JraqDhAeR5yKFFRmNeeM3iqqgYJxIJvk9L/+auojYsmsqioXyZo8SYNB7IBFczbtDQpk9AZLR6mJBNE8glJCR3tiy1lmxiB0DuDMtUq9GuX4xSgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tgth85+p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tgth85+p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFCF1C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 18:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764356292;
	bh=0p3mX0cXF7eElwAPxaXz2S8Rfx1PsZgYe7xzjDxsXCk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Tgth85+puMHayrjdnofhpNGVCNm6zWmoRwv5rkrLiMG43AojXeiIfNKuJDKK0tnKZ
	 EBNCaxOZIwmBLp5XnIdLrxaw2mr1r6CgD/30MBDVOa/lFfvIvFvBQDDEF226nVK6JR
	 SNPXWrCt977+98s4kugr02MCZ5mxCEJNx4cDKu4T1htNNqOMJx5liT2lgwOiQFivWs
	 E+XGBZoSsWcqzOrOViZjm3JXUQ9lHYXU9b/PZ88s/0lniCNQul47PjrZN+z/NPXwH0
	 34ZY5r4TiCoYpvE/2BZ8npxoUqPsCxJi/Kv72PWY4M95zwKlSlbY9pBK+9kbI7v9AM
	 KB/Cg03rqBmXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C7F89C3279F; Fri, 28 Nov 2025 18:58:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 28 Nov 2025 18:58:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: masterwishx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-n1tuIvsVX2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #15 from masterwishx@gmail.com ---
Ohh the latest can be the fixed one? 1825 2025/11/04

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

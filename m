Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C558014BF87
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732188525; cv=none; b=cO6ZZxdo4bmXTI4/6rXg3khq1+5ng6FVLWk1pOHiz2sbIxXT6qiBUW4ZdpqHp2PltRvYWFxiTaAAPd1tHwUy4z0UeRAi9WSpjpHIiaV5DYmCmiWhDo6lWb8LP1k5qNdL/QUtJpxfRNFSjAEC6u0qft4KC5XmzPE2FnB7E1b58X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732188525; c=relaxed/simple;
	bh=6Np8donRVwGWOowNnawsaf1/lQO+TYyaYiyXVmSgzf4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B/k1gYbC5yN5boiiLyh46/JHPmTcLxwlXOMBrDwvH3ZPntYKZMU4bgc6EcdrbuLOSUEbD7Ync8Mt+jcE2eHWejks7c0+T7D5squnaNz8FPN4LIusp7c3wtuGGWly7TctQJQnMvrppXzgGvvlD6vkfNf4jdcT9yDguuOcKdSkVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzDNfgG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzDNfgG+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5738EC4CED0
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732188525;
	bh=6Np8donRVwGWOowNnawsaf1/lQO+TYyaYiyXVmSgzf4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tzDNfgG+VUweld4D2daYBBGslA/M+0xf3jR8sapE8Ws3nlMUnbTeRM9hGWnHdMUmK
	 OgQy4apD9OuYJoz6RBjYUJVFxmyk8zh7hGYdfYfE8Hva3lfxG1HsX8dtPztvUM+bqp
	 dQJtiRi9EkhGSWyy4VAk19tNOKvfouKISJesXIZWr0CaFLR1L+c7+n8MGa40s9Ta/g
	 GbYyu1VTjC2HaAul0Sv6r0md4vg8ON8OnvhgRTHpof8awoGiZaV2uIGNhEp8d9gO/Y
	 DtdiXKER+0m1Vtgv4Cj6C9m8oX9Nrkv71UGb32W3/Zqy7U8DF7zN01QErTJw+m4hVe
	 Vtn1CKDIM7XRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3F0ACC53BBF; Thu, 21 Nov 2024 11:28:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 11:28:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-TPO7x6kYfo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #9 from Michael (auslands-kv@gmx.de) ---
Yes, sure. Would it be sufficient to build a module or is the full kernel b=
uild
needed? (The latter takes significantly longer on the laptop.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

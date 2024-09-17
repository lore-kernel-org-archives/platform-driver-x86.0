Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC9BF510
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2024 21:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726610199; cv=none; b=YwdURd9tQw0HNO5Ehwq15WFLq+3ajqnuCV2iikffnjGQT8xDRFtD3/L64JJt3eSK9iAUw+nkdhawz2SK6Kc0+4h1ReGlHkFUpkAC9PJ7yVzDDB10XJRDcksQiVYHHKHIEmqhXZDhhBL1pjorM6YQMocix+L/j/Bo83NFIYq6nLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726610199; c=relaxed/simple;
	bh=w/paDTfOM8FG/fw6MnPU3lNwQLdrMJLuPsMRMRUYaR4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TBeyCdxbW5/q8qpWNo8Fu6+NpoB62c/C9rX4rGt5+vIzAcm2jpY0IrA/Z/8UhTds4mSbP1YcCaS6CgD5vTw99ZVzTrUohUrRw2ZkRAMGl3uLryIC5MRhD6NAeL5KCcaIzINLU0saxutTGtkxoa9hB9XuajORsmG0PqASaZg5fH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHel9l7U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHel9l7U"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E8C4C4CECD
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2024 21:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726610199;
	bh=w/paDTfOM8FG/fw6MnPU3lNwQLdrMJLuPsMRMRUYaR4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SHel9l7U+CLiNu1+nGPqZiWo1zqlOYqx7GAx0yk8eiI/GryRTQQatph3Vsp6G0+4R
	 4xwBlSu0UepvxwIx1g15P8I8drc5RURx7MdRjhBgFo0HANePlmVoGbRt594pgpURnc
	 Ht2v/MiibpwVSSKiayMF2k6C7+uLzobYnxbcyFS2vYt8G8gp2SC5YSfe9y6MU1YVsE
	 BEybcGe5L2cDQhKfFcRLVj79+IJ4YIClSpLo8k3KgOduFicd4UTkeTCsjoEk8LOpwr
	 firsT4AdxKSWdQQIIIN0JoPIWtIl1Quf84uj7awLdp3WzXsRtEe78fxjFQMVsHa7AC
	 KUHVoE9WDZoPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0878DC53BB8; Tue, 17 Sep 2024 21:56:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Tue, 17 Sep 2024 21:56:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-w36PTKytkn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #16 from Lucas M=C3=BClling (lmulling@proton.me) ---
Hi Mark, I've tried searching LVFS for that version but didn't found it,
fwupdmgr also shows no updates for my machine, was the update on 19th of Au=
gust
or September?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

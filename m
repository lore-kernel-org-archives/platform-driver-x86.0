Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479447;
	b=UYJ/xtroqRei9EF7ixQXLOe1LZ88PWzWyxsFaKLJpzt9gr3Ds8+8VVb8FHVqLkZ5gWIG
	 bIItSYSHkXF7QIITbc8wpwMwq5J518NuJilmyBefxBCJCH2Kymhq1XcSBRDth4xDmR1u6
	 f4v4rG0HDz/Ai105Lxc3FjdsRo9nQdIqbPvny6eX904gh4bSv383TZSUAGP1DMIOHuprD
	 PPkumjiKEUaS+YFmzPRiP8WJa79g4Qi8PfiIr92UDsY0k4ipJxrevv8ANxGh5xI6l/o/+
	 4aoHMrL12Ebgym8ixLVhcIiOmmtxt0s1IgAuv7ap2RMHIBO2lk1qQNwcttxBUr6GgEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479447;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=K+IP7PkVDHjrzLoknlhU+6sXmJV2vVm5GTPOsvuQZ3M=;
	b=KJvOLAQ4/6H14brEWa/eP4eSKw67Oe814O0FwIj5jkL7fWPUJ9XrPsWuDwj3kuqQbTwz
	 YhXdiHC2Yvx2IlmifKEib2suBeg7tvAsngmnmVyEP+lUboH6dnuWFhwuLAz16r669gPqN
	 ZmbncWYKpCr/e2fWHxVGtH3UYbPyCfT0cHgp3O6EeblQ890ToP8xGM5ABBEvuKaZHwNjh
	 krfiWxusg/bW7eV13CbZ3uHl65uH4HVqVT1FnipgPrnK8e4qoiWa9Wnt7iTew3W7pfGD1
	 bDgT/JV1ovJwLTL+Gl5prdo0Mm1E6/+fXGkYlogE2exRMsIaV4te1gpqhGyOhn1a+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SoK2WxWn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F5606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SoK2WxWn
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC70D1F000D8
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795479446;
	bh=K+IP7PkVDHjrzLoknlhU+6sXmJV2vVm5GTPOsvuQZ3M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=SoK2WxWnuDff4MiXWV4vbQBhY5v/j714QogdRAUPYKrzMdMx4O+mGeXZlmYZ5T/CV
	 C6aaSrCnUvcE9rR4fOvLe3PKzNQ1B8D1HPEnt2tcTOVjLpQSFfQyD3I43dr5zCM+4Z
	 RyB6+rlVO56goKvzp0c8AGVUyHpF91ksRMkteRC2A8KTaorirIYdZni8CSW7BrZQ9l
	 rqlHPQbKSPcGTukHL08N2iqEOldna/lYHREb1kVBr4OzSehObGp8/TRxoYNxZztm5B
	 4tEqrB8Nv6RkAn+cc4POk73MkJigmipmAD+sg5XGA7iMmJXdl2qRoe9sAlU1WaXwrx
	 TxgwJseaaNinQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 9DB0F240041C; Tue, 24 Nov 2026 00:17:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222323] acer-wmi: WMID set_function_mode(devices=0xFFFF) powers
 off the Atheros AR3012 Bluetooth controller on Acer Extensa 2511G before
 ath3k can upload firmware
Date: Tue, 24 Nov 2026 00:17:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arthurstarkit@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version cc
Message-ID: <bug-222323-215701-snZmeCoyTG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222323-215701@https.bugzilla.kernel.org/>
References: <bug-222323-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222323

Artur Sultanov (arthurstarkit@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.8.0-151-generic
                 CC|                            |jlee@suse.com

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

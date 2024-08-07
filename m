Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9436E1D1756
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723024179; cv=none; b=sE6UkMQbed0KVSSMTXO9Nyf2NIlZ4pxgC+flNvcUogKbzO7YL3LuQaNiKVmn0qYfgWh8amD0y9FphysLC0uvTX26n64I9Jx48kv2JmGHyddQ+M4WVku5Es3zRHAGhgE5/VrcdlpdIN+MBLxWxAdo89tTc4S8KVPv88G2+4xPgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723024179; c=relaxed/simple;
	bh=7ZceLuz+3rAWtoEfG1Sk4umNWRPO2zvpI0yQo4FWJMA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q3V1gAe4q6FpxLMfCSUNE+Lj8MMVHq5ASppYbPVz5YOlbQwXstITrmBqj253Zdjc46krq/YXIqDWR4VgRKRFgX2+qGc/MiAlKd+x5I2kbEQLiTxC536Cu5U58oVeiFbGErJ/ILwgjgdjGKTDqzCmhtvSrs2QDUJGQKxXtnJ0aUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/JErRJ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/JErRJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AAF1C4AF0E
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723024179;
	bh=7ZceLuz+3rAWtoEfG1Sk4umNWRPO2zvpI0yQo4FWJMA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i/JErRJ74ZT9/1O7/VbsiGjyFco0HwJVPGpHKYeSCR66gg1x+8j1yovS+SWjLz8aJ
	 KEIHTwpfAyvJRVg8t0u5QkOe5Qmh6ZFwA3YruELykiWE4/g0EyvF9jCzQz67mrhpuP
	 vPi88mPRHzQQOmdV8EKXhgB04axwl2+mdmLULmE0+0L2ijc6aYzBF1lHTgmWePdjFM
	 y5/3JvLI4L97Qf+PSlthINuejp5FQarm0B5mAm2jZ2WrryMxeDpwGz9Gir5dW4xwq3
	 MgLwKZdrxOLUpgbZn/BUU14TUL157Jlxe3kfyQMXS6te+pvU2tU7/5i/M/s8KnP4mH
	 LZ8U4pdId/ppQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 062AEC53B73; Wed,  7 Aug 2024 09:49:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Wed, 07 Aug 2024 09:49:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: blunted.tip@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-fRbyeqXE7D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #29 from blunted.tip@proton.me ---
Comment on attachment 306679
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306679
elitebook 845 7840U policy binary dump, 6672 bytes

The output was created with:

grep 'kernel: (pb):' /var/log/kern.log| pcre2grep -o1 '(kernel: .+)' | grep=
 -v
'ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff' > /tmp/pb-1.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

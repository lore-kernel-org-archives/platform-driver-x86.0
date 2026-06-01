Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9B34C98C
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303218; cv=none; b=BARelTCGIFL6/9LqMFshn7oSSkit9sYVIGEY/7aRXqNcR1bnKF1PUavYMSSjpshnHHjubTBPbAfcw3JZ318mptlHCSkJ2iUn6CxC5kWUv24jcj5iudD+ePxR9XQoZCcF2g6eGi9T/JnREyOULqks+pyz9nkRzzZSycJlioxjX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303218; c=relaxed/simple;
	bh=10vtvG9P3+9oJ59ZKBa8yDqJpsraVk7kAUl/hL6yESk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oHC3Dq7LurI2M7xjCqklFxkPUqVtD3vxvIRIvQy7djiUqmX6ImzSb893YvXgRyg9hcf4G1Xo/wfWMBGvSNUUWAoekb/c+9Hgu3Yauos2zmPjCuIoDK5Z4S7g/jTETy9Sb0azNdJFMq/x3HUlaEO2RZ/U0NZS11xJmhVi9LFywxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZW8ggvI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZW8ggvI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C9DDC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780303218;
	bh=10vtvG9P3+9oJ59ZKBa8yDqJpsraVk7kAUl/hL6yESk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jZW8ggvIyaJn5gxA36CTXNrm4fTYGmgye+pqejdCYmRKuAcAPxD0jtjNKoLKxoDrm
	 01P2leMm9J7UwavHuG6ofsgQMShwR6O20szMnEXT8A4C/r2w6M8LpQLnA9ySfBM1As
	 DRwAyQvFxfV6jg3CmGmLo1v+zpH8mBUETy3KkmV5i0IuhGoALuEff25P0qx7eGIu2q
	 nFflaj9rcJQ5RObpdIBYxWfpymJHid57dqxwUne7uW5YhxqrXIuLufcuV7nBB8WeOu
	 SvSZdq4kRhwtSraI1rPQwiJXCRbJr2tWmPPGqzQUKdomXX5uuFSgvMIGnKXmdq64MX
	 CbVtA87uTyS8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21255C3279F; Mon,  1 Jun 2026 08:40:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 08:40:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-XYFuQ58LRO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #13 from Milan Oravec (moravec@ukf.sk) ---
it seems that enabling Power save mode triggers that high temp. on wifi mod=
ule:

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +70.0=C2=B0C=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +79.0=C2=B0C

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +82.0=C2=B0C

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

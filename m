Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7434115A4
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711958448; cv=none; b=LDaKBPVzJ2sQ+dowNOTGHgd09kGwVkm1B2Mqi1qvY8CUlFybnVPdmkoPkhB14tDpMzMC1a181lJ8FBky0MamdSE1A4mDdZa8hVaKSFjnZBCFJ9anCnDLUtgOlxb2uOcfD0zmiO26+Qm6LQnvbv+7gyS3ooUVjSojbFedZB5C+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711958448; c=relaxed/simple;
	bh=ax+e7SgtbWWwURBN/iIkK+1h0FQNLoOEBJMw6w7lwdw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cxk9EBZqSY3Z6enoc4rXKUk3c5Pk20sjhcDWs2vveiJVIemhLwXH6JeQ3jW0FiHPtLdBX7GwkJA8k93g57tzENJoG12oF84V2dOQOIeeMx4Ujzi1tw1qhzLBT1QaR4X1ruqwi3dGFMzb2dk9X5rdlsii43xMuueB+0Ivv/OcAfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uaT770zc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uaT770zc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04C05C43394
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711958448;
	bh=ax+e7SgtbWWwURBN/iIkK+1h0FQNLoOEBJMw6w7lwdw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uaT770zc2uTBeMpyI4hzbpsHJ4oUz5woDGG0iNa06vu7C9FBhquLLBDaHhOq2RrSo
	 8Sf1tcN8EB0kPJTIie5eDAVAeGnT5VTu4AKZUlagoocObR7r6LbgyRjzvxcaqog++s
	 HO/dstnZD5tFz7F99GqffWh04UhXwLxZojmqc+QBeJB6jgcoZILtEpVuoSpTdMupKz
	 bPVAojDlzUnwQHg8ZmZLNg3sfKxOK3TsGTB78l+yFDgeSjrQY9q6m+E49KYKRyVTxs
	 utSPIDEDzSbbB2fwWbXN7YC5WPU6D9U5sEDlYOHpdvWmZfZ0F0tsMiJVFLJt/l7iPR
	 TheURYLUaF7PA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE459C53BD8; Mon,  1 Apr 2024 08:00:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 01 Apr 2024 08:00:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ries.infotec+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-xQKnRNKyfN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #40 from Peter Ries (ries.infotec+kernel@gmail.com) ---
Hello everyone. I just read through this bugreport as I have the same probl=
em
on my HP Elitebook 845 G10 with a 7840U CPU. It randomely gets stuck at 544=
MHz.

I'm running Endeavour OS (Arch based) with the latest Kernel (6.8.2-arch2-1)
and Firmware (core/linux-firmware 20240312.3b128b60-1).

I thought things would be fixed now, but I just had the hanging CPU freq ag=
ain.

As the bug is not closed and last comment is nearly 4 weeks old I just want=
ed
to know if the fix is not official yet...

Thanks for an update and to all for investigating here :)

(Meanwhile I'll try the "sudo cpupower frequency-set -g powersave" workarou=
nd
to see if it helps to circumvent an annoying reboot)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

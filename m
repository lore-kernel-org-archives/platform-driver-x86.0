Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0CE555
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782550650; cv=none; b=KR1axk+f7cH7CoMqTNXYGDvNTccAztna/Ei6DHO371WcagJUgkUQCTsSmbW5v4OXgZ+TvKJl1+FtjxeG/AXMsOMjrZguCRuTwnzRwG1cRLnw2DCVJEI7fr2fJn1Zn8hIk6KJbv493AJW92sLLWLWdr9xT5mmQwhmhB1+ECsoALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782550650; c=relaxed/simple;
	bh=l3M546NF+YvWHL/c7WUmf17G+QRkW9dE/6K7hyrLH8o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NMeXrrHWJQ4QMaPVXX8szfRqz3vy8pi8GcdIKr+UQ3jF5OU1BJzSer2jMo9RkrWHaCnH56d9eZBXgkRaW2Z8QUbtAci8GvXjXH+ZEmomAEm5VAWZWI5/Ko3PdxIn+6ucWBC5gifO6JwXIrJhNaPIJRPsnRnXdIBh77VNS3QMgeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqWSUwJv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqWSUwJv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2576DC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782550650;
	bh=l3M546NF+YvWHL/c7WUmf17G+QRkW9dE/6K7hyrLH8o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KqWSUwJvrM3utz5EpFy70sG89btLWhNoKtAdUqf95l9geqL6u2uAn7+kuvEuQc5Te
	 IeGCKZ1Qr0KwcmMA3PlvLHiXkVppbrBk+Sof36u8jY0rMSwKKaDZGkfnhjx1bguC+0
	 IwGC+s3Jb7Lfay5QpyHv/A7ezE3aUzeGQCN3ZmNEJNPLg51bmp0J4ROnvLeTn2CifZ
	 k/HtRcMrTI40A88K3kW47bOVcoGQ65Fq2dolMUxJN4keZ4BJc7RBjhKmSY3Q4Wy30/
	 J0si/P13ZcGa4MDBG56Gfe+F7hvbOSz8t3XPe5KJM5zs+CcggrFhoEfhu/oBxrK8UN
	 +eg8EMajE20ow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 03B78C3279F; Sat, 27 Jun 2026 08:57:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221694] [regression v7.0->v7.1] AMD Strix Point (Ryzen AI 9 HX
 370) intermittently hangs on resume from s2idle
Date: Sat, 27 Jun 2026 08:57:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hongri.cui@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221694-215701-EsZfGKAOhU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221694-215701@https.bugzilla.kernel.org/>
References: <bug-221694-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221694

--- Comment #2 from Hongri Cui (hongri.cui@gmail.com) ---
Created attachment 310381
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310381&action=3Dedit
amd_pmc.dyndbg=3D+p trace on 7.1.1 =E2=80=94 PMC<->SMU mailbox, 5 clean cyc=
les (all
RESPONSE:1)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

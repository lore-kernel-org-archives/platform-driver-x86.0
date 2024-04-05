Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7503E2C1BA
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Apr 2024 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712304542; cv=none; b=mGjYv2bFatwE2snoRcJgRAUM8YkZ2Bjn5NcwqPQy4AQXj25LsYjzzQudix0lueOvF842NWmf7JBPUmw6rHNwDhyRnGLUIeuaMsIZAq6PqtTz0IY/CxyrzLqOGoUEKYmdLv+Q7xNKbO+TNILZmyL6OJ6Wa7vt9ywsdERwkojrVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712304542; c=relaxed/simple;
	bh=x4GYH11+rKP7nsrrUfUgSpr807fQOU5SiMmyRn+TiB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M2u51C5ja4jrXpumtOTgRvYiu4wiEi26V7KvxEoYICMP0G2V5Z7HgTPkoc+tx5SmYR9RBHRBbV8CIRjiVT+0s+ReT3FqmA67CD0cfnB9EHvcYM36o2VxlOME21x2q0TlinRKTOxCN1q9AUyQ985xtOR4JclCZ03tXzwpqrSjq48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmqJOy69; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmqJOy69"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9408C43390
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Apr 2024 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712304541;
	bh=x4GYH11+rKP7nsrrUfUgSpr807fQOU5SiMmyRn+TiB0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MmqJOy694A7D6inynAaYscV7iPaYYzuJclQOgcbyAy39eTTb8R3hbDz2NETQSX4wa
	 vXDHUBVJgx4PZdqAMD2dW3cvVgr5kO/NNVALYf0dtRViFQ6PLjudd6Vdnn2WGT1K/+
	 l2uFTN8tmSMiVy16botN1FhPvmZQzXw7PYHew5R1FtU+0HqBK00I7MIZ5OmBL8HqvV
	 vg5HiZH51UumBi+OmW8kReN+T3E17U7idLN88oYYscykFS7xcCjXQiBwxxx167qkhZ
	 PRcebN/LdXvMvQ6jMQw/mzG3Q0/YUIIC36TI3oeYQNHajYDKfY4At1MOMhChGmrChl
	 A4qIJ5sZYfhsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D8977C53BD2; Fri,  5 Apr 2024 08:09:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Fri, 05 Apr 2024 08:09:01 +0000
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
Message-ID: <bug-218305-215701-HiN2ALKHWQ@https.bugzilla.kernel.org/>
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

--- Comment #47 from Peter Ries (ries.infotec+kernel@gmail.com) ---
Hi Mario, sorry for not responding, I still haven't been able to reproduce =
the
bug. Just had it once after Kernel 6.8.x.=20

I will test once I have a reproduceable scenario.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

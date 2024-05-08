Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCEE76037
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166899; cv=none; b=AUvZtUrohgiBplk3JnNpV1HthRYfQ/BMmYzSm8vNEp6Gt5ywvmGzJOUrQHHoXpgAWjcFfUeBB06daClVdBbUd1JMO2NMT25mUxY3wm9ypxDiMQNCMRtPQBPWBPHzZhZ78oRPrruOmg0yKmKKqI3mDCVu84XJPqW1OKK5kZO/GT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166899; c=relaxed/simple;
	bh=B4WQSgYY5D1vtKdtWOG4oqgway4XS+BgJGuZAJDAq3o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mIWgJ+ziz+VMCZyMYEVNGiCHciMG79fRZlB2eXCyhFRpheHviSFbbEDrojYRv2OKmoEu+YLDHJLl83o8kNRAWnGwW9XB3ggHInwMKaatDTgLWOew32niHVs6jTXlXEgTgksPK0y4XpaaNSMJwxe0rEF5sDdk1mHWvmcTyw4PIqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0cJD7nR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0cJD7nR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 209E9C4AF17
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 11:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715166899;
	bh=B4WQSgYY5D1vtKdtWOG4oqgway4XS+BgJGuZAJDAq3o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o0cJD7nR5KSmF/YotucYK5ecQdAqR1q7rZsv3kNvLdR2+9lokHk15OKv4smVmxwmG
	 o5lUYq4+2VEvMR0PWE1xCLS84nUo8fse7wt+e+nwuNN8e8FJchi6hHqR1VNE5ZSqys
	 6JeNg3w3ngtX8f5nMqclBp6NC7z7TlcO0eIbMIwVwvxCZApy6UETNGANQqrivXNfvF
	 4qoQM5DzJ9PUSdxULl6IW+k9zntZw8zbwMoumXdgmfsxone4QehAaQlGqNaa9LboeU
	 Ub44bNOA1UBmZRt+/Vt2C/QCGQpEN379TeUkoD1j8r2ZIHbhxKJWFbDDbXukCJII/H
	 47wzP1DZKPO9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 145D0C53B6D; Wed,  8 May 2024 11:14:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 08 May 2024 11:14:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-fCLz2FqKNI@https.bugzilla.kernel.org/>
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

--- Comment #62 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Are you sure you didn't mix up 2 & 3?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792530734;
	b=ll5Vmbsc+gxD12CC1tZH7/Y96ONmYWrNEKQrcPRg8stSwMK6t0vhIbJ0BbmcUt5Oppum
	 CtdR+cVXcLkbzeqg10Ax+aKHLkluWtCnKMIgGKZAQ51qdKg1g7kPixQRqMAhRFb03hSOY
	 TjsNb6IxuNw88+pe4/4yD4RPymWPrEvH7L718g/pF2FwyCEPjJwjw27Vu6lBbr//yJVcW
	 iB7lfI901Fll+xZdy5AbyioFIUoMSLJRgI3ATWLwqqohRAW9qrP9yp1qh0D3tYKMm1ElR
	 EMTqfP3GLTBkV0psbOW9dzAU2dZL91iYhgssvN3vxXv5EYj14VxFdIA58nvIFJmiRnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530734;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=OKJlx7sEmqXBLnKry/aJvXEGMCuQDYbJfQL54eGZEIA=;
	b=HWtT1SakNn1ybQLPGwP6Qid/TCR/t9du5rxd1iw9w4yinhROoHJge48LsqvxJbnt20ax
	 jOK5ykdkYJxL5Z+lbTC/7PHhaGo6EZAG+WKZ1KeSzZSiz0Gj1CGdXFW+YEgGWRPVNcpZ2
	 SXNS7Y0mQSK+JtiYfUKSpPKvG02YCnXuRJEBFfU0g1iltN+z3xmSOo5pEjXhgb+DsjGVC
	 NiRzgShzWOqDdwALPjk5cCH6uxD7le2TRyd7LDn8bcHR2lHIzxIFJiQkT/BiyIZTwuluA
	 yG1wH5SuuJLT7GXpSQipykqs8fwB2VZLXWVwM6ood9scCJrCuFalyqkMGIMqACRvxnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b="Btgin/5H";
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44800606A319
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Btgin/5H
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26825771
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 21:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792530734; cv=none; b=jj6LdDggAHiHTMJmYpQ4yXUHl4EV/ERaK27B/E0NOH39UO86oxuFtKCpOXlkIGrKnRJXs2JeZ6yBtCSBGtt5UFawVcYs0Zr3UUzXHCdrNHL/fFiiCuWvtiSCq+08Noka24VK1zsQUMsJaAntAFvt1qSpb8/JL4XmJmcfSdCK3ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792530734; c=relaxed/simple;
	bh=OKJlx7sEmqXBLnKry/aJvXEGMCuQDYbJfQL54eGZEIA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n7MtCzkGi4p+U+ItRzi/nxtvnoU4NTqUkzpL6v7SqAZjyNWSU3sUlymL0cWZENp8P8NwbasoHipFBQjqulZMDv3cbR/8r8EgUfIxWOpiVoGacxebLlGbFQCdPrku9lTS+rS8qd+D2c5aAQyeMk3r3nThM3Wy4k7UsJcBCrBl9Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Btgin/5H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23A04C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792530733;
	bh=OKJlx7sEmqXBLnKry/aJvXEGMCuQDYbJfQL54eGZEIA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Btgin/5H8ASba/kSPG+7kMGh6yuFXJImjys33goI1RnJk177hMUEMknC6usMAMIDF
	 VqX7pBjwnwNj1GErj+e6h8FhqfUSamNlGhKD9I6i+prfzxB+nuMz8A7ilkoM5Katib
	 8NRU7tdQx5CI9r0kTq2ZICNfOmCJ7KO6JAh3BQ2bMeCUpx+I6ZTepS2VBR50rHWLux
	 4JXu9TfyjkWmmcGXxkm8FFGRVzXUCWP5tjYQMkYYzE7UFTv3wMTz5g8zo1Z+kbiICs
	 CNPEPnGmIxGJu5oDk78Xwso1ya81rCneVH1J/RTg6/VSUm9fDFZQNt3ZRDUZSxhwrc
	 8O6mCN8ZxcZHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EDF4EC3279F; Tue, 20 Oct 2026 21:12:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 20 Oct 2026 21:12:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-bUqAWXl8yB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #3 from Armin Wolf (W_Armin@gmx.de) ---
Can you use "evtest" to check if both KEY_LEFTMETA come from your keyboard =
or
if they indeed come from lg-laptop? AFAIK lg-laptop should never send
KEY_LEFTMETA.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

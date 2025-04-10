Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB101EFF9F
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744311578; cv=none; b=dB4gkDtr4s6PmkWq9LkX2+F9rTyuFQ1v0z4gmcJRJmLg9m4g8x8yd9NFNJ1LMGQ3n4atSS04u0+wfwK3yPkHlGsGD5OBK1zGvFkoCzn6agXPiPt/JkNYs5EW0ORRIWuNUmkdXPojmPKGgusuzsIuwIxf/bGOzSQ3TUFRsvRrezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744311578; c=relaxed/simple;
	bh=gKejzeqBQ34YhQ+fJ8dA3w1KobGWnqoy9QZlD0yYJ6M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J55Ow6r6eFUmOOB5je+paRfXXZonvv4wL/ewNwwOvMzP9IqwJSB3Xz1vq5bEPIp6wCyoP/lKuJY2Yp+zh8wxozryLzJjMaZYGSwXbmzxuE1JzWStlbpR3HAjsOmHjs5pyDRXyr8YrTnXKjLpGphf6EGJkPowA0xZYbINGwCYPUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwY6Zpl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwY6Zpl6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D528C4CEDD
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744311577;
	bh=gKejzeqBQ34YhQ+fJ8dA3w1KobGWnqoy9QZlD0yYJ6M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fwY6Zpl66KnY7vszMSlYNbcC/KQjAEOTtBrPeFBQRe6YMqiWV3RTKdYeTBxavKb5L
	 Mf4N7ZCvo82k3gYMA+RV4TYnlOjTVATLyC/BQEDVwO5r+Qp+JmgkbdgTXgC1eOzFv+
	 VLbTxURU2lpI1oR4k/8joc6uQVqpWNNmiKUCwRGSamyDgUp/HTNgioVVCcI9Oe9MSs
	 awTnMxJinWklKhCBnbkAL8Dl18nb6HnVQA+6BMNM/nFv2Zj+sXuXamy5+aIGmfQk9N
	 BnYKuEFQ5YE4iTzRxY3xj7bJumPo2c3Fy3s1oXRRK3yei4v7HMDq3PEEvuvNCBx6sF
	 KXCW9qr4fbFQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 58020C41614; Thu, 10 Apr 2025 18:59:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 10 Apr 2025 18:59:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mail@dmewes.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-eiu1FWFtly@https.bugzilla.kernel.org/>
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

--- Comment #88 from Daniel Mewes (mail@dmewes.com) ---
I'm not 100% sure if this is what you had in mind (let me know if not),
but this is what I did:

1. Ran the script with a suspend time of 30s without performing any of
the reproduction steps (I did this while on BAT - the measured power
consumption looks high at 9W, but I think the 30s is not enough to
measure a reliable value)

2. Ran the script with a suspend time of 30s, and performed the
reproduction steps that used to trigger the race condition *while the
script had suspended my laptop*.

Both runs were done with the kernel that has your patch with
msleep(2500). Let me know if you wanted me to test any other
constellation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

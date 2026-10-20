Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792524268;
	b=IKz+FLZH4sreZK9uiwkb0671jAZrzBXYwPCnhPLy0KRs4Kp1aepq0DVwpwnSE6ICG0ri
	 2XEImuRTGnKN31E/ZxE+LXTj8sO1ikBsKN3WJxkytwTdsFYXL44FKDNIusd2WP+4UvwbV
	 BMRQekC+MdZA/1+jT7xHa34zDNxDI0izBQu8IipLrmHSutxOnFrQjj1RYrHKlgIIUps1g
	 xGCVgDDUMNB1gTwxHvkhPjn1ZP+4gVsrxjEJpLerm8BcZ/I2ls2fS59h9bsMXjk3EPoMN
	 olwnWOyYrNEl2O6+gtc/1Uc5U6imK7Hiv9f8e9TciKIZ3g4RH72cG8W0/YIM9jsqhyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524268;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=/RyWlWATbsITfNWiqHDGZTYqKwaGBNsgNjxO0Ty7W90=;
	b=UaHyvCy9pxLnmEXe0B8kpRtSMdACSEhC3+svIF07awjaC73IpMRT44mLBZ+RKc3XO6n2
	 EpgjaX8MK13tPBqy6DyG7lBnQOnTmjOPDQ16r2x6JEFbj8kuRo6OMIb1EZHdcoj/Gt/uY
	 n4W0izUlR4fa4dU37+MZRDI023o6ikhN1DnfqILFYP0Fw2msEUPcn67q6vMNiwAF0CVKC
	 F5a/qsjD2zqz/dnw/BN6IFE/oF240TLS8sJpGaC7cVn6re/PN7JzwR/+dcN+z3WNZIb+f
	 Q+zGAnEhXZEEWg+HSwIDJMGYwAYJvn4jMb2xhnQuY6GkTS79kbyx6ilYK3a9xhzNh6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZiwtKfx1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F27D606A319
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 19:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZiwtKfx1
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5656E25771
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 19:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792524268; cv=none; b=M7NKCAf4hwhLynXQwfO6u2Gk+ZJof2RWFVYlY9F8Cec5XQ2RFckfoelwsn0s81U3Y4eNUFK5W2RxaHmR2XLLj1QKT39dWSPNwBRg1RuZwodwFJPjIIRkMkMLkiMd/FR9vR56r2PSkJRVEztXHMTp2Wo//ahj+yv+7JKEMgIQ+ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792524268; c=relaxed/simple;
	bh=RTxbiD6Axc12q8hoEyeqSnw8UUfWso7UWhCy3xb/REk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=itKsSI33Sl/WNGb3gLhs+zeXBilb01RG0xCxf0XTD869uB5zypST/uqUpeMa5Pc+VWkRDKOYd+glNf2xAgep32KAkzbo342/munvfcN7AFzuFR8m6yPiYsIoft78kVdlGIw5nJWzHvzhMKOHe6ap3724SgN/hIqT+MXNfcX7gbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiwtKfx1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A54BEC2BCFF
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 19:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792524267;
	bh=RTxbiD6Axc12q8hoEyeqSnw8UUfWso7UWhCy3xb/REk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZiwtKfx1O1R/ySrNr2ir1e4Lz847dNlJkIxhyX+gxc1BBtzDE7BWjTOAEKzmY3gHH
	 8O3i+5Y2lcSS3P2LEJlphVdri8gWTB2uKcPGuOtcR8Mylnh32/qPyxIx0OzPehQZvl
	 AxQ3Wfy1FmChY7P38u+JKqCUa8kf6qvor7+n2YJy900OYNBV919dkbMlNCPjwV/t+G
	 EIjyxBrBMB5EoDduQwuWaohSNgvTbM9YJS8FSbwvcmgvRYWEPdeA1WC9Vur50d1YVi
	 xybzmCERRv2dNs7kWaowSSsoo0FmLH3bm1rTc8lfTP6H85pQeTBPJWDo2XubcMa7aC
	 DPsWE7rORah8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7C259C3279F; Tue, 20 Oct 2026 19:24:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 20 Oct 2026 19:24:27 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222161-215701-hSxGI5MD3X@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
Do you receive KEY_LEFTMETA two times or do you receive another keycode?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

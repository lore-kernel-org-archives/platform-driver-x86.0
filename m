Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5828716E86E
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716903368; cv=none; b=oY/3AO8vcEBuSuqa80iUU8J3ssU0QeeZmwCqHV7FAQGmDXpSrTE8mEo7iOjtrRCn9c9uMwwhBO60yCqJMx5ZM3RWUO9nR6UgAqcEkAodNLEYOrK2QTsY6iPbg+xpX5TK+9ekgHfp21hLCjTdJb7ogkq2VQq4HpOf6XtoROCVg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716903368; c=relaxed/simple;
	bh=MKAS9Ak70DXFfCEXxPYLEHFNZZEOfiL9Q+0RyoKmVu8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YyGczJyZ8mBlqMq2shY3/D6eVGG6PTV2sSl6cTNFznwTxvv3lEARuuvbnRsvIERtGTq03qRErEDVMOyJbmJ0F1ho3FrNANt1224e0sGLtMMg2qASymcvWeBve71GwJct3xvX4b8qQq7hBN4I5/RtoblB510prjSHGAOjVxErN2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nszHjZYa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nszHjZYa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D075EC3277B
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716903367;
	bh=MKAS9Ak70DXFfCEXxPYLEHFNZZEOfiL9Q+0RyoKmVu8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nszHjZYa/TGsFv0G9hp0Fko+BkW1kGp/MZt1echB+i/Ka/4dPmzsAR/uuQaU6Rp6D
	 Ib2VCAwsRFqmjJF64uq4I+3v/3Sirf461zLRmTAGtrumUmGNXKfaHNb41EWVcBMuW1
	 CsJSKje6SELSM5+0+YRAWNCCiNexLygB2PNI+Y2C/bWMTwmfUdoPmrQ8VtykoGT7D0
	 A6RUIiYD42bjVOUT8mCRh/8QCzW5I9uj4MgLqm2B9D+NMbh4BshwndyRpkDJegJcBy
	 XwabNFaPMTA9iW+uGh47EZ4xStPpCPLqxSoM0NUaAG8s9aJD9TxlozwOfiDRyLfYEk
	 n1MnWAzBdOs7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C02E8C53B50; Tue, 28 May 2024 13:36:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 28 May 2024 13:36:07 +0000
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
Message-ID: <bug-218901-215701-V9oCz4rsZm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #4 from Armin Wolf (W_Armin@gmx.de) ---
It seems that the LGEX0820 device used by this driver is not mapped at \XIN=
I,
but rather at \_SB.XINI. This should normally cause no problems, but it see=
ms
that the driver is not using the ACPI driver model.

Can you compile and load kernel modules on this device?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

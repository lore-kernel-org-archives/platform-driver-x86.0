Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ADD28C849
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 18:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764355271; cv=none; b=g9wgOKUNSIRU7D/BnirULPXeiKq2LY4Dc5ZbTablhSi9AjwVf8i9dOC6l5BEVeYnJMMNTH8QuzlKZAj+c17+bHzz+TVq7GrEIVeTh+j9m6W19UZaW2doT3cbgTdMM92C0P1otGPg93xUj4jLRY2XPx331kpdCkj59TnzOD265ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764355271; c=relaxed/simple;
	bh=FfBfY/qUDb9wBmg0//JBVrhRMFB3SGOGJPURu7Ohqtk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MtGRoxzBHRJOvdPR8fdW6QpAroZ4xsRylJu2tN34ECBQknxfr0QWTyMknV5W86kOTSmayJvS18Mmh8vwUJA34wEFqEluk5r02djbfBRl5WrZA/tSfctqhF1NtpMXNBTC5mSZWnFHd29pfQCTphqOqligxUbsNweUURmIPYSUtBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFgfr7Tw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFgfr7Tw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13315C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 18:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764355271;
	bh=FfBfY/qUDb9wBmg0//JBVrhRMFB3SGOGJPURu7Ohqtk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UFgfr7Tw8lO+1Cin8fPvZMZXKtn0ElHC6TRVyOUc3zkdtJ0t/U948N/j3Tn3aOJ8t
	 ADDvuwE5RI3LizotgWFo+Kvj4tURPrvwuO85Sj8Wzpvv4pJU0IVX6OuMiSSBBKqX4M
	 VHb9KJlIoI7zHDSlJF/MkJp6L0RGlWg1kxrN2S2obCtlewoOab7S23l/fGsccZVrv7
	 bbuVV8FQ5YJhamgaOAwzxNRkHVQx4gnwMQ1i5DEseYZ2V0K4mJxGfHWAwf0GH+MEvd
	 ZJu3hT3BLuGyTVYiFQwa2KWJSBs873CRpnlXtH7R6SlXVl/ZtTh+cwdvhHivzEyCxi
	 TcsivSSw1mshw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F1F6FC3279F; Fri, 28 Nov 2025 18:41:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 28 Nov 2025 18:41:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tobias.diendorfer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-EsM1FLbZcR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #13 from popy (tobias.diendorfer@gmail.com) ---
The gigabyte support is so frustrating!
First, you have to wait a month and now an nonsense answer:

******************************************************
Dear customer,


Thank you for emailing GIGABYTE.
We would like to help you on this Case.

Sorry our BIOS team could not provide BIOS with this fix due to we could not
support LInux


Regards

GIGABYTE Team
******************************************************

I will open a new ticket and refer to the old ones and also make them public
here: 1818413 & 1935079
Hope someone, with the same issue, will throw the support id numbers back at
them :-) I will do and add:

The issue is also present on windows!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

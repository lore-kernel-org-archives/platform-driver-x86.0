Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3E51D8DEA
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728993539; cv=none; b=qPJSBYyZjb6tmLLL9IzQ29jE630OIQ81uurTsAu4ZpNqQ3oK9lh860VH3a85BgZysM1f6bVPFn64JJIH5lGjFD+AGbBypGCmav8TpjRYhnDSZpemQwslpBrQl27QaaVZEnbHPyqHim3ngGGJ7KAU1CKAeOEQTEoFeT2AyEr76I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728993539; c=relaxed/simple;
	bh=m5olDE5yikqkCoMSm2Dq8bAfCkpnMo4Fx3icF00EWlU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bOvzFTZJt56mfYVHnJWjZCIa8tRMF8yxbFFhGHY208Zihdf0YdtomZxjk8XesHWpgpdUVnXpDWe4N36CYgWeol9PxQJyTANC5GvQ4JJr9Z6cKM0p4QOuFv0YVhwu4189oj/+PlkWqt3THs++exwj1bAL68/tdRYfnXirosKdT/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW30wX+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW30wX+a"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EC0EC4CEC6
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728993539;
	bh=m5olDE5yikqkCoMSm2Dq8bAfCkpnMo4Fx3icF00EWlU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LW30wX+aalq+onNO16uOKBG8rp1mm6MRe9rzhknHKs+lwAYY2O2m0i8BR4lh/hLWQ
	 5FppUtI6PYlsMl0tarTWqQCxWnyFVOQ34WKsOVi8mCHWt5TFDXJjFJjQ28zH1gL3w6
	 JvDDvUSbjB5RogKuAtL38PSexFF+AfpONxiH7XmxufNHfLlhEEbYJbvFh/56b7DlOd
	 NL2nw4q4f4pFrzqJARwI8qNV8RqO9rkR29MsQ1QHkksX7qqa+/UEQIHYAAR78qfr14
	 FoRhXOOr2H0NiBx+e6yrus6RgZTRvbTOtagnJiR4OF76CU2nnESIDLZehrrBxZ3eow
	 Q3WSzWCIc3qQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 95E4BC53BC4; Tue, 15 Oct 2024 11:58:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] [BAD FIRMWARE] amd-pmf AMDI0102:00: ta invoke cmd init
 failed err: 60005
Date: Tue, 15 Oct 2024 11:58:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-218863-215701-9q6HPaQ9gn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|amd-pmf AMDI0102:00: ta     |[BAD FIRMWARE] amd-pmf
                   |invoke cmd init failed err: |AMDI0102:00: ta invoke cmd
                   |60005                       |init failed err: 60005

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

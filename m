Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9781D5146
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770758884; cv=none; b=DI0a6wt4Kx3/7iWqPxi8ajcVqSnwbSVrBYGvK6PEmsmS5dWcxns6mDTHUoQx5G0L7lj5xsC6Ek31pJ+X+AkSomkil+Nr4OH2Aj9QKsHKU5HmuAFWKW0oINMRkkgdSsCEr4G5yLg7oF3l9cTX0JvVMH1r3kZpyzhbS1Td6uYDyAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770758884; c=relaxed/simple;
	bh=qp7SmXtdxtThltqYCcBNzbb5AmIe0I6hEc2S7u7SZtM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rOJtESWvCEzkcyD9Ifh9I8hIZVwNkzyHFPdY+dc9CG3+4AA5rXOk0HPPUVY/opiYZ+qTUqfac5/5H8xmkRjhEigwGXR8hvScOrjiaPNUFc38QIBNpANLgffL+59jxMLYfieOwm+XYZij5z3LBXy64fyyUjqlfqLVB4b7V0j2cOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk348udn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk348udn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C850C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770758883;
	bh=qp7SmXtdxtThltqYCcBNzbb5AmIe0I6hEc2S7u7SZtM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sk348udnagotdSU9wRIUMGURZwrkgcrPGUo9+vJ6aJLX6V9vWE60acLLvMVbpkGxW
	 BrUeMRA8hbYMx4/lAvg/TJSOcuYPQjjMX2JGWro6UnB0j0AYhZnst4+LDMDXWx4wlc
	 JEyzXOH2h/H0WDXU3IOBL8krGdyY2s2Qzl5Esm+C8H0yx/z5gNSVPBQ5VC67zfgNVw
	 4wd1wbwGG49d6N7z2vnMAqljBIDz5Z8wkLKC7DZlnfa7wiPEXZUoSnDTCZUXNFjlGt
	 ZYQwa1pGWqKHjQ0jPxm+TAQka0dkkNQSPRmd6mmuEuMTW0hkiK+Tpuna+dCXblH4pd
	 0ryuoeknFmHSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 298C5C3279F; Tue, 10 Feb 2026 21:28:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 21:28:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-aazLxDXpra@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #15 from Armin Wolf (W_Armin@gmx.de) ---
Please check what kind of device is mapped at 0xFEEC2A00 using /proc/iomem
(needs root privileges). Also, can you check if the thread number that is
holding the ECMT mutex is always the same? In the ACPI error message you sh=
ared
above, the thread number is 2188863744.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B29C3ED3AE
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409610; cv=none; b=VzfEgwurJbVl6nlTRejM+J5dubA/yYeql6lnMHuj5lgMrNHlxbqrafLlxEtxJG6UV2PRi+EMeCVCjbay2jTBE4/7daxG1Wo9edF/jA6QhBnsM2CoeNRph3z/OJ2ZDJoYkzN33qa80Tl/vP3ceIWfKBj8y/vHJzcHfzQ9MVn2X40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409610; c=relaxed/simple;
	bh=D7MI23kefkBd2TzV8pwb6no6UDBQnjQVhC+JTKyppuU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sCGci1M9vNFL1BqL/g6N5NPxExxZWDK9rKlkfege7YznbXpXuQelKEZZCcTu2XjSc86oczVp7E+bW/HdRvCOS9jOVvjIazgp4enTEuF54mCVlrNZocvlwxQsXBfpXMW9nBxtTQwPBPrluN0p/z/cPUL7EhpB3Z3aQobT7ObTM3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPWvK6un; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPWvK6un"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD17AC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782409609;
	bh=D7MI23kefkBd2TzV8pwb6no6UDBQnjQVhC+JTKyppuU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KPWvK6unQu0NXsg9Qb+gV82Ujfwx72gTSP4wExrDotj/ttbVmzsJswbcr2eDKRCH2
	 JyajYw8MWMTtS7H75deX7xi6yp+vqhnt5LqwTLy5sWYcLVUSmM7iZt12RmxFXH2q97
	 bQu/UMSvhKm9zjaQP5ogsH0X6G5gv2kkYtnbj2sNzkHz7/EqS6T1poxe4VLJgSHOAd
	 kALy7pA3/Y8paivlOMYIiXrQHAXYhaZ7AcEUt/MW2pdFS6ONRjk0kCxZi8doCxycrh
	 kGP+ivLNOpj8+Z87LDEbU8/fYXm8x+jrTR+kHWmNMiunWGpDtgM1ZbHl/5upt71CAs
	 jSk3np7cuRVVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A9940C3279F; Thu, 25 Jun 2026 17:46:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 17:46:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-HQVxQVtp9u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #62 from Marco Scardovi (scardracs@disroot.org) ---
(In reply to Milan Oravec from comment #61)
> migo@migo-HP:~/build/linux-stable/linux$ patch -p1 < ../mt76_resume.patch=
=20
> patching file drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
> Hunk #1 succeeded at 2 with fuzz 2.
> Hunk #2 FAILED at 102.
> 1 out of 2 hunks FAILED -- saving rejects to file
> drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c.rej
> migo@migo-HP:~/build/linux-stable/linux$ cat
> drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c.rej
> --- drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
> +++ drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
> @@ -102,6 +103,7 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
>     idr_init(&dev->mt76.token);
>=20=20
>     mt792x_wpdma_reset(dev, true);
> +     pci_restore_state(to_pci_dev(dev->mt76.dev));
>=20=20
>     mt76_for_each_q_rx(&dev->mt76, i) {
>       napi_enable(&dev->mt76.napi[i]);
> migo@migo-HP:~/build/linux-stable/linux$=20
>=20
> I've applied this too, maybe this is cause?
>=20
> https://lore.kernel.org/all/20260528033814.46418-1-liujiajia@kylinos.cn/
>=20
> this solved crash I've observed:
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221661

Mmh it shouldn't as they patch two different files. My patch is made against
linux-next-20260623

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

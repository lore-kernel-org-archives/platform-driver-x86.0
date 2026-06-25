Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BFC3E7BCD
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400422; cv=none; b=l0dtckiLGcRpPcrnXAmFRT9bFS0n7jqkZXIKoCO6GvLPa01908SQyzBI+RDZRkEjlp2FUH552LCWvYJdHfFnJ3pKPTH9VO5XeLIPYd7it0bmz+HM4fhx7oMuYyVmNwKAPzVngXnqK8F4By+dctCHDwzK6Igxc59vXF092xzgZgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400422; c=relaxed/simple;
	bh=yMysszeG2Yh8rte25cSfjhiS/mSL1G22vtMpU7qQZSk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JOq7L/F7K/P3VOD0GKMYe+XPjb8KdsTbZcidVAkvAvthCjln4JdIfqef7thuoM1CWS4PkCjbf3dq9V6RuZpb0rsPwo/gnbN79O2iCwNPlMuysVcAhi10Kbc44G1q9zjuxL2yXcaa+EjvWQEHbwyg2M7gIMNylAwIyIxWDc3mPrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moTmItQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moTmItQd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2C8DC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782400421;
	bh=yMysszeG2Yh8rte25cSfjhiS/mSL1G22vtMpU7qQZSk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=moTmItQdktAawr7xYJT9DOAvrsg7ru7XQgax2vMv8kJ57Ovcvov9WwxRD9t+nA/g4
	 iF9M/kngwqZIMWkModfP3q/buc/ZmV48n0NqvCVlimGodDDA7b5EjzJiTeXAmVYf2u
	 1Oh5aKNjDDpN/LVwue8+LtEPTJIC+L2Tts6QgKA3yDnWdk3FRUIJ0E0aeat5wMIPAy
	 i792/REnLHiyDeyDPVl8RxZZmS1JLC8Iwxq7Jynd27waVO0pTfukdlwLB6/FGu7MnR
	 7Qzof2PquKZvvuHVCadzcbeIJds0FPwIfgR2NCiBxoIl/FXf5ckoNKNAqfkRv0h4jr
	 tvn3leaWhbE8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CF81C3279F; Thu, 25 Jun 2026 15:13:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 15:13:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-pxKtt6kwKH@https.bugzilla.kernel.org/>
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

--- Comment #61 from Milan Oravec (moravec@ukf.sk) ---
migo@migo-HP:~/build/linux-stable/linux$ patch -p1 < ../mt76_resume.patch=20
patching file drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
Hunk #1 succeeded at 2 with fuzz 2.
Hunk #2 FAILED at 102.
1 out of 2 hunks FAILED -- saving rejects to file
drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c.rej
migo@migo-HP:~/build/linux-stable/linux$ cat
drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c.rej
--- drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -102,6 +103,7 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
    idr_init(&dev->mt76.token);

    mt792x_wpdma_reset(dev, true);
+       pci_restore_state(to_pci_dev(dev->mt76.dev));

    mt76_for_each_q_rx(&dev->mt76, i) {
        napi_enable(&dev->mt76.napi[i]);
migo@migo-HP:~/build/linux-stable/linux$=20

I've applied this too, maybe this is cause?

https://lore.kernel.org/all/20260528033814.46418-1-liujiajia@kylinos.cn/

this solved crash I've observed:

https://bugzilla.kernel.org/show_bug.cgi?id=3D221661

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

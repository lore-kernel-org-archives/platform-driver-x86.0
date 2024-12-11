Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1731FA8CF
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908030; cv=none; b=UARWifQHH1O+FfDruo1pEabBj4cocgvv1z1adDQD1do14u/es3yhg8oGx1YMaOncxB1mEwFFIE56WYyiRnvF+HfnVw+04OMX3tXETZIJISCoZHJVYDhus1nlUKmn+Wxb6E2vC5FX4MBVHOYlZ2EgZ5Pyef5Vaij4/8QO5BdWmhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908030; c=relaxed/simple;
	bh=tVagoTXpCtP/daKh/dhafk0IEo7LEEdBO82r+2Wl25I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bNr3I/ge+2S1OsA8S29twJHLQT/gczFFo8IU7LM4pwPsEJBh/7zXJVRAA5CqXfp/0hNfFcRmw5rCMEoAd04m7yYnb4CoxO5Dl1HJ+LMlXTfXnKvVvIhUkyJS/oN9jFZEawXz4NmB3w/oSX1EsCHehB218zQwt/HRgcqAeATTl4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JY52dybB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JY52dybB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9496C4CEE1
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733908029;
	bh=tVagoTXpCtP/daKh/dhafk0IEo7LEEdBO82r+2Wl25I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JY52dybBKpl79tHvFcgfUxOnmhjJDRZPfR5PK6tKEuSAClO4yaWtRmI7ye+FhuXKg
	 e+xLUeg35xfZ2tJnzf8axJzgy8QjUI+NfEtlK4bOdY/nBaxXSIrQvw+jKE+IdwHiJq
	 xbckOQ4EfsPLQ8esFzHfmh6ywE5F/MiwfzBKh5Rlll/EaiQDJig0Wm10/CuBq9LKGM
	 TKyS8R9qJ3BSUOjMQTaocy77HBU0ckzyTbbbeVmXZFL/hkvGce+3Q46HSCYWBx/L1b
	 HNlIjShSh1nBVBhGBltHb2DkYdYO3J/tH8xCfMmy+Gz9wraLek171AQysjpxigglKT
	 zhQnPwn23zfNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9475C4160E; Wed, 11 Dec 2024 09:07:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 11 Dec 2024 09:07:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-ec2DfyzKDd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #20 from Takashi Iwai (tiwai@suse.de) ---
I saw that Stefan submitted the fix patch to the upstream:
  https://lore.kernel.org/20241210222608.598424-1-stefanb@linux.ibm.com

Andy, I'm building a few test kernels for SUSE systems on OBS:
home:tiwai:bsc1232421-sle15-sp6 repo for SLE15-SP6,
home:tiwai:bsc1232421-sle15-sp7 repo for SLE15-SP7,
home:tiwai:bsc1232421-stable-backport for 6.12.x kernel on SLE15-SPx.

Please test it later once after the build finishes and report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0041DF267
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 13:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731503102; cv=none; b=We9X/hiOoapZPpD6Ka5SfqWOd1lQHASa8bep7N+eiG5nNc04b6zL5CNJmyF7/eSH20RhEdaEdaSDU1umNFP8DKWMpLAE0TpyP9l3AOb8v6SAgCVZjCUIpa9KTtdNVPerx93lUNer0rjeE+nM9xUqxKTtTiD9+XOzqqGhMRxdXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731503102; c=relaxed/simple;
	bh=TABWbYjY3vNzlcGv1LfmD9gj41R3CFYP+WGIX/w+vdI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jtevd6tPuMSIGZGll49JsJW8Vs08mi2T29LeAgfGyYAABG+MS6ICQbZoA3kCVlbnOlUDCQqYSSeryS8jUpiAAsJBP6jBsyXTzQ2uXD1Fwg79no8G2+rKA3VB7b8kQHX9Oa9T5fm4XbNvZKHE7Xw+co1QbdNZOqQjv6iK2qMJ4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh1+pOjM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nh1+pOjM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C93B9C4CED2
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731503101;
	bh=TABWbYjY3vNzlcGv1LfmD9gj41R3CFYP+WGIX/w+vdI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nh1+pOjM8y0XS6VCygoD/uILisS/safytj2SnGnOTWUJgswLE2UC/0+x7YrwPsIct
	 aGGLZvoQ4VhuULlMYiy17tfJz09icUrdVyRx1hs98q+JeTlH6iIYwMpB+vcWYdSa8o
	 /Ixw+YMsgyVR1ikdaLspaBq5bs3IUnYh2ZLS/7BXkmDxrq7GdvFx5QyKXBl4zfPIjL
	 mVdIu4Fe+YN/vs50oeihAepqS2vF1z+vTr3aq4Pjw6ci8/myB1/y6QoD1XHu+Nb1Ou
	 h2fmlimP1F9Dqr9eudRTFGoZVWZg0jGhZ5HJzpL6iy55HiVIa5yB41mh1eW/KsO1gA
	 bZDS5/yNqorXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C31BACAB781; Wed, 13 Nov 2024 13:05:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 13:05:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefanb@linux.ibm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219495-215701-c2uGKh4HEo@https.bugzilla.kernel.org/>
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

Stefan Berger (stefanb@linux.ibm.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stefanb@linux.ibm.com

--- Comment #7 from Stefan Berger (stefanb@linux.ibm.com) ---
The attached parsed contents (comment 1 attachment) of
/sys/kernel/security/tpm0/binary_bios_measurements are 476kb. I cannot say =
how
much this file would be in its binary version but I would think it would on=
ly
be like 10% of it, so like 45kb since the parsed contents also display whole
certificate chains. I don't see why 45kb should be an issue.

Can you attach the plain binary file?

> When the TPM2 ACPI table sets the Minimum Log Length size more then 4MB, a
> call trace occurs during the boot time. The reason is the kmalloc limits =
the
> maximum size to 4MB for x86 arch.

4MB would be excessive and I think would hint at a buggy BIOS. We should ne=
ver
allocate that much memory for the BIOS log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

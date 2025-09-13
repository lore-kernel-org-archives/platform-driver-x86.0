Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8C1322A
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757788258; cv=none; b=hAbvcDSvLpO9vR16MRJ6p0ptgkjkWiCCAQLCz/kuV3nRlJNNZPjRnAWGmCGK07wTe4Izojf2eo32X37BvdkE18OCrgZDyOWEnxnwDi7xYswWJVs50LwuFVc95xe62xVcnV9m4h4bbvqYxza2Ba7OWuRTv0h0YqCdMB/FXPfilDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757788258; c=relaxed/simple;
	bh=TCaOyjkXKEfsx4BgN9p9G/Xpku7p2IU/8YuYAlQ4gFw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=us/6Gu3jdj2PtlEp0VnZOQIJcI/XZYUlCsOnxRRknZ0q0TvINtfF3XQ2bJaXXHaLjm7G8hZueuEVeLf9Dy8Gl3VQrCMyezIx5z0QMOpPriam+Bn8jqroQFSi64fZQq0gquT2k+H+IhedPQBMFF0XKS20Yn5KvsjFPl2CJRmL3Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvj2/ZpQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvj2/ZpQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D341DC4CEFC
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757788257;
	bh=TCaOyjkXKEfsx4BgN9p9G/Xpku7p2IU/8YuYAlQ4gFw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pvj2/ZpQBQP+GDrMuGb9FzW7p3Qo/9xI3yDIZxmY+SCLibK33MzpGeEMqIFe5QnUs
	 UtnzPlNgGEj1vB3tH7Y8V8cdj6iTlZwWgD9u+zeWexz32g38XVTmg7jsNI7eusHnmy
	 I/ZXAnwutvOxqIrEAJ6ilxdVuICB/fY6e2pUtnpYdltLgTH7mpOtmuaEi1XCvr32GI
	 mbitACZNFUlaa3lXnw/o1+/fzfLaCVf3GOaDb+9TOZnEU4CyKhqKr0bngqjd4fme8u
	 T5hvB1qFAd7sfaTuxjh73AHzo4cMLz0Y1U80rdcQgz6XQvldPp5l6BHcIFAtxCAY+2
	 /oThPfWwK0AUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C86EEC53BC7; Sat, 13 Sep 2025 18:30:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 13 Sep 2025 18:30:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-62QWvwbUrB@https.bugzilla.kernel.org/>
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

--- Comment #113 from M=C3=A1rcio (marciosr10@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #112)
> That's quite an interesting result.  Let me ask this - how quickly are you
> unplugging / plugging in the adapter?=20=20

More than 10 seconds

Particularly after you've closed the
> lid but before unplugging the adapter.

More than 10 seconds, just because this is the use case where I first saw t=
his
problem. I close the lid, unplug the adapter, put everything in my bag, go =
to
another place, plug the adapter back in, and then open the lid.

> Without the revert if you follow this (specific) timing does it still hap=
pen?
>=20
> 1) Close lid
> 2) Wait 10 seconds
> 3) Unplug adapter
> 4) Wait 10 seconds
> 5) Plug in adapter
> 6) Wait 10 seconds
> 7) Open laptop, check frequency

The frequency problem occurs:

- 544 MHz in power save mode, with some spikes to 1101 MHz;
- 1101 MHz in performance and balanced profiles, with some cores occasional=
ly
dropping to 544 MHz.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

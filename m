Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355334DCD6;
	Wed, 28 Jan 2026 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603364; cv=none; b=KrDQgyATiAK37wiFHhpIjwZf3GCZc6U2VeGrXwN8NGYrMwSFP5ciAEbSBHYtCLTw14y1sTc03PHxqAF5Nqi/foatUCiUeEY7CQ5ZHxE4XOF5a/v0pEcUDyHE7H8APRlC5SNinwSi0qZR5jYB6/Vpg0v0rxd/smibZkE6fwFy0Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603364; c=relaxed/simple;
	bh=HJaAldQ5OAd5/6budRzP1re+tFiIPXBWI+FnDDoBaAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPyMCSHs4E1i2PWd4vYuoHwwFjILNkVLTQ2nt7oghE3KnkTxgs0Z8WsGXdYpCg/Era4S8iqGaNZtR2dn0vj/5++hGk5m5mxrhMRLkoA4fy3dV61pEfc5RA0BjxFnmQRGWk5sG8Yr29c//Q4RqFF1Zn7U+ZFFkxOW8EncnaigU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=dWB0RQY3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="dWB0RQY3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C2AB540E01A3;
	Wed, 28 Jan 2026 12:29:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aC62yG-BgbMN; Wed, 28 Jan 2026 12:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769603354; bh=21oKX7E4CzvSTNURnMRPNo4RcWxsII9wz4d/qnirgAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWB0RQY38A42R/2DhYPom1lNc8gCGdd0K9AXtzpaTroP4dyQDVh8sD4uX24J1lz31
	 tRnXkFA3wSpn/yJWgrsgZreTVupYTZlG3+eOSradnXEsYDZSOu2inheH4/7dFBLfZj
	 pfNRmp6xgIM3sls0XwOTkjO+T1pXYeMkWCXFtlKsztBScsK3Dm14Ev9Y6TCvrByxMr
	 VALn9KlJZsVelPP8K7+L7qJsqGdd27nNIujdR46hYnw2ZNdZBbOly54PGjmsz8ODNx
	 Jo2DRiuOu+gIx6ij/XTKApmUVFC647pvjvVZH90PkNdcKklG8qTz7LUJHGZbDOlFKt
	 97ogSjE1g7oE2bTTMo/psTljeATGL+xEtfVfuhIlGcCSubm/fhEMnd2ZYVVgltHZVy
	 eDfFD2a3dzue9mUBWNwFPlM01tNKM8eQijvAI8AyQtSDDXokmPgdYZIanpKfUynzW9
	 5nczzCm4TEzp7e9noXIdJRsw7/7Lg+ZVlc3hF4m5hAML02R7Tmb9Ne6kw28OFSdCeZ
	 nbZwPp3FWiMgQlpBouCnO9rSAC3Erl+h57h9R8ALpmyp2mBs3V+TTrSok94N/+ei2j
	 JC9qwZtQVnsq035eXqXPEALBpwBxO7J3mllTG9ywh+Y43qzj0WknwCUXUJXj3ZXabU
	 76voTUgnCk8/SxgrPSUBWdd4=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 692E340E0028;
	Wed, 28 Jan 2026 12:29:07 +0000 (UTC)
Date: Wed, 28 Jan 2026 13:29:00 +0100
From: Borislav Petkov <bp@alien8.de>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	bugzilla-daemon@kernel.org, frederik@frehi.be
Subject: Re: [Bug 221019] After s2idle: amd-pmf AMDI0107:00: TEE enact cmd
 failed. err: ffff000e, ret:0
Message-ID: <20260128122900.GAaXoBDDwHHyIkk6Wv@fat_crate.local>
References: <bug-221019-6385@https.bugzilla.kernel.org/>
 <bug-221019-6385-GcFBcW3deQ@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bug-221019-6385-GcFBcW3deQ@https.bugzilla.kernel.org/>

Switching to mail and adding people to Cc.

On Wed, Jan 28, 2026 at 08:20:27AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221019
> 
> frederik@frehi.be changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>      Kernel Version|                            |6.18.5
> 
> --- Comment #1 from frederik@frehi.be ---
> I have an HP EliteBook 8 G1a 14 laptop. Sometimes when resuming the system
> from s2idle, I get an endless loop of this kernel error message,
> repeated every second:
> 
> amd-pmf AMDI0107:00: TEE enact cmd failed. err: ffff000e, ret:0
> 
> I'm using Linux 6.18.5 from Debian unstable.
> 
> Complete kernel log attached.
> 
> -- 
> You may reply to this email to add a comment.
> 
> You are receiving this mail because:
> You are watching the assignee of the bug.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

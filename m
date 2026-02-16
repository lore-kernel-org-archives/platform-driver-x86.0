Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F403D544
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257856; cv=none; b=j1Z/Tj9hI5RA+tBgDYBPCQI9qBTePyz6Kg+5ExArcYJJnSymDS1tSkJBomPzv8YRZg+UmgBiOgnI7EozLoOvvnlvRcS1Gxn24ussi2sbPkHoDcL8+YhNKU17xeZq4s2TjtlJhZXjITYaO2CCpHA20kJqJCpbnTf5Fn9YxWyFEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257856; c=relaxed/simple;
	bh=xAEiCEGy1ukqJRRjd5pyKMCVGPfix/yhUFowP0rVoaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iScV9HwaZ5NhIPGK14yYQk8tfOrnHsCTXf6SRuPza0XYQyJQHTU3Lnd8FU7lv2YYkDAA8o8Owy9lOiZpi57Upddfme+VO9q/lD23jQ6QOCCOjswD8C3qB81sk3OtK+PBHvsi1ZFuxhJwPX1J2cC1OBVXbQ/YSPfxsDdsiQM3aRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=rijJVYcY; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="rijJVYcY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=FW8csEJNcE/VnBJ7ybDkpUlbyzrLedHDeU/cuXm6UDg=; b=rijJVYcYX9UCXMFEX2m8Ifmiiu
	U5BWvBT0vo1N9scP8SP8LB+pIq3XcJG0DPJisoBSsIL5ouFNoVYMn0Ymop1J5v5IhFzRX2tePaMph
	rZ7bB2yTD3P4SSPyErIsSPr+jpGZLBAXMpaOwphx2aJ8Cp+MFM4V8V49WWQT3JJiiXT+IypAIDAGB
	+r2bEiVNoJGjm2AmenIuU50inxMB5jlpq5OCLdqIFrU+62puDDJg1K3XINtuWafKqsONeAxQspzGW
	vVv9nHPCZDhlv3pZmU/tygSXEpmoJlFTdnPvgmH14TqVOacjAz++8UXJac6iopjbJXZ8HumKycj3C
	QfIu09GQ==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1vs0c2-0093O5-0D;
	Mon, 16 Feb 2026 15:34:14 +0000
Date: Mon, 16 Feb 2026 16:34:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Paul Kerry <p.kerry@sheffield.ac.uk>, 1127612@bugs.debian.org
Cc: Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
Message-ID: <aZMt6sSlpKK_JAdT@monoceros>
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7pcynfimjzdg7ckr"
Content-Disposition: inline
In-Reply-To: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>


--7pcynfimjzdg7ckr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
MIME-Version: 1.0

Control: forwarded -1 https://lore.kernel.org/all/aZMt6sSlpKK_JAdT@monoceros

Hello Paul,

On Tue, Feb 10, 2026 at 12:19:45PM +0000, Paul Kerry wrote:
> Subject: linux-image-6.12.69+deb13-amd64: hp_bioscfg mm/page_alloc.c:4802 warning
> Package: src:linux
> Version: 6.12.69-1
> Severity: normal
> X-Debbugs-Cc: p.kerry@sheffield.ac.uk
> Dear Maintainer,
> *** Reporter, please consider answering these questions, where appropriate ***
>    * What led up to the situation?
> Booting a system into the recent debian 6.12.69+deb13-amd64 kernel upgrade from 6.12.63+deb13-amd64

Probably the relevant difference between these two kernel versions is
commit b2e79963525205707c87391a01435cfdc9fc2d1e
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.12.y&id=b2e79963525205707c87391a01435cfdc9fc2d1e).

Can you confirm that when booting the older kernel, running

	modprobe hp_bioscfg

will break in the same way as the new kernel? If so, the driver was
broken already before and just unused. You can achieve this behaviour
with 6.12.69, too, by blacklisting the hp_bioscfg module. Either by
adding:

	module_blacklist=hp_bioscfg

on the kernel command line, or

	echo blacklist hp_bioscfg >> /etc/modprobe.d/broken-hp-bioscfg.conf
	update-initramfs -k all -u

>    * What exactly did you do (or not do) that was effective (or
>      ineffective)?
> n/a
>    * What was the outcome of this action?
> dmesg under 6.12.69+deb13-amd64 is now displaying the following...
> [    3.346704] ------------[ cut here ]------------
> [    3.347194] WARNING: CPU: 11 PID: 606 at mm/page_alloc.c:4802 __alloc_pages_noprof+0x2a7/0x310

This is

        if (WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp))
                return NULL;

which is probably triggered by

        bioscfg_drv.enumeration_data = kcalloc(bioscfg_drv.enumeration_instances_count,
                                               sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);

I manually determined sizeof(*bioscfg_drv.enumeration_data) to be around
20K. I have no idea about what the driver does here, but it seems to
request more than 2**10 pages continuous pages here which suggests that
bioscfg_drv.enumeration_instances_count, is bigger than 200.

@Jorge: Is that expected?

I dropped much context (mostly automatically collected information about
the machine where this triggered). If you're intested in that, check out
https://bugs.debian.org/1127612.

Best regards
Uwe

--7pcynfimjzdg7ckr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmTOOIACgkQj4D7WH0S
/k655gf7BYwadASf0/z9WnkbUgSemPpovHXczhrSVMORilULBVZntwMijweu1QQJ
B4JDDRu777kdrkfLcW13LKDuzBa64bFWGWSv0qk9xQuF28CVLKVj+z2VjSzGR1fV
l9rVV51pw7fvRtHdg5T66dqTsORILC1hpHxW/CXIFGThhTNfV+bDKITDAFYAvjpC
1lDuUtD3yhpfJZKKGqBEKtDNqDBzCAQ1l44oEEn70ARs5EEhAx+Ob7XBx6bguWU/
x3Vz7HeHvsBlk6ksDEqCniwwm59/v8fGQx6/UVSd2/Qge4nZFWZk+Wc0LI0SKKgK
tw2l414dKBpzZK9IBADzugCRd89t0A==
=3xX1
-----END PGP SIGNATURE-----

--7pcynfimjzdg7ckr--

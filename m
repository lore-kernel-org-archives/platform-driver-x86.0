Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796551E50E;
	Tue, 28 Jan 2025 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738099044; cv=none; b=rlK+PgDa7B4oPWWtgc2RonQkYfhETy3/UDObxLL/Bxd2vqo2x8Jmt5WQLh0UjqYpV5/YgoSVvhDp8I3QPRXoDOnqcQJzkvGH4/GXABURf3aER59SWAaZkp8RpGylTCFcYsfw9X4fzagTuC/9y92QUadUH0oPh0lPHRvRldH4wZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738099044; c=relaxed/simple;
	bh=I3OCB7E5f3b5De8XkNNPCLkp0lXOgj2B4g18+47DLd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g50A6F99Bpbvrmj4ekmyZM7gxpWkbAUPcRTZPJddCheRjgT5K4i6SRSQQdjmfRCmLYjeQe5K4/AobMuiI6tZAGo8e27a68UzCY/EVwylEwXR5QzOakcRJH9voPWsmC/bESeqSGdb2x2jtAFCJAmFglyfZxB7PjE3Np7RbP4pi1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FqZkNZ0l; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="FqZkNZ0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738099032;
	bh=I3OCB7E5f3b5De8XkNNPCLkp0lXOgj2B4g18+47DLd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqZkNZ0lJPMqnzqYdpDKphpfeAqfKSbsbtDIf3rD9KuIzuexL3EU9vqR5HkfKawAq
	 5Gsg0bFZpkpCYMyaQIPgZchI3l9mNok6bG9gLVTiUNcggk//W/DsdSKEMsUCMfGkJI
	 OzDsAbeRy7diL3D/+0HzfgRNnphgeviJ72BmiJpc=
Date: Tue, 28 Jan 2025 22:17:11 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Kurt Borja <kuurtb@gmail.com>, W_Armin@gmx.de, 
	ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <628d5725-2d20-4298-862d-ad0e47782d15@t-8ch.de>
References: <20250118202632.8352-1-josh@joshuagrisham.com>
 <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
 <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com>
 <D7B8WVUD7F4B.1BL2WE2BNRCX6@gmail.com>
 <CAMF+Kebx4sU+0p+pFaH1Lz4q1xApM8iS9UAYP=sZnE2GDa32ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMF+Kebx4sU+0p+pFaH1Lz4q1xApM8iS9UAYP=sZnE2GDa32ww@mail.gmail.com>

Hi Joshua,

sorry for the late reply.

On 2025-01-28 20:17:53+0100, Joshua Grisham wrote:
> Thank you Kurt!
> 
> Den lör 25 jan. 2025 kl 16:06 skrev Kurt Borja <kuurtb@gmail.com>:
> >
> > Now I understand the original problem better. I didn't consider this
> > possibility when designing the callback.
> >
> > While this is a fine solution I believe Thomas' EOPNOTSUPP solution is
> > the way to go. I think positive err value would be the safest but you
> > should wait for the advice of someone with more experience.
> >
> > Aside from that I really like how the whole platform profile sections
> > works now. Good design choices :)
> >
> > ~ Kurt
> >
> > > <snip>
> 
> Regarding using this positive error code internally within the module,
> I thought about maybe adding a comment to galaxybook_probe() before
> all of the inits which describe this a bit -- do you all think this
> will be helpful or is it clear enough / does not matter and can be
> skipped?

To me that sounds reasonable.

<snip>

> If this comment (you all are welcome to suggest wording tweaks as
> well, of course!) plus the few other small tweaks make sense then I
> can prep this to send as a new version. But I am holding a bit in
> hopes that the 6.14 stuff gets merged to pdx86 for-next so that I can
> go ahead with implementing Thomas's new power supply extension
> interface at the same time.

Nice :-)

<snip>

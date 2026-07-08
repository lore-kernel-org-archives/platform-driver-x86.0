Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [144.76.133.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600853AB262;
	Wed,  8 Jul 2026 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503771; cv=none; b=jY3aaAurcVXQHH5OOZBQDfycGyAJmp9tXPDWP+Fv2aedhzMEBOUHMytMDsG0KlJ3f2oLb3yVNdVhmCrQm6lVLewa6UUUHClGhlUcGA7dSJBHK+qKvVS2/gS1QZKlYDAtawPmDFJy2aq2dc9Se3offvEw63LdkouHneVQQZWlHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503771; c=relaxed/simple;
	bh=BOYisGVCk+iEHi+C0T2zXdedHdSUlz6rvTNVRLmvURI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLuzPPI0pUa0JM1KftZbH4sxuhUZI8Xu15OYVdz9WJVtunSxh53c8FwBf0vS+RyseXd/YDGkYB3Mdkk7y6AsonU7y+FNbJZMKnuRiVLf2DjiliMAE19DVda8rPCfGPSoYeU3X9l2rEWMLnjep0NykhUaFjmB1KQfdK205CvschA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=144.76.133.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 708DDC88;
	Wed, 08 Jul 2026 11:33:07 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3DE4D6022F23; Wed,  8 Jul 2026 11:33:07 +0200 (CEST)
Date: Wed, 8 Jul 2026 11:33:07 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	"David E. Box" <david.e.box@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/vsec: reset state before
 re-enumerating
Message-ID: <ak4ZUw92pn_F7Z4u@wunner.de>
References: <20260708032647.712412-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708032647.712412-1-lgs201920130244@gmail.com>

On Wed, Jul 08, 2026 at 11:26:47AM +0800, Guangshuo Li wrote:
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -51,6 +51,13 @@ struct vsec_priv {
>  	unsigned long found_caps;
>  };
>  
> +static void intel_vsec_reset_state(struct vsec_priv *priv)
> +{
> +	memset(priv->suppliers, 0, sizeof(priv->suppliers));
> +	memset(priv->state, 0, sizeof(priv->state));
> +	priv->found_caps = 0;
> +}

Seems fragile to selectively zero only portions of struct vsec_priv.
If the struct is amended later on with additional fields, it's quite
possible that nobody thinks about zeroing them here.

It's probably more robust to zero the entire struct and re-populate
the info field.

I also don't think a separate function to reset the struct is necessary
as I don't expect additional callers down the road.  So I suggest
zeroing the struct inline in intel_vsec_pci_slot_reset().

@David Box:  I've asked off-list for reset recovery to be tested,
I'm hereby renewing that request.  See section "Software error injection"
in: Documentation/PCI/pcieaer-howto.rst

Thanks,

Lukas

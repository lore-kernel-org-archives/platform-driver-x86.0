Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF473EBF06;
	Thu,  5 Feb 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281031; cv=none; b=Wlt5k7at2jqDjIvPCECtT+y7CkmDpzlt9sMaDcUohifW8Dv+NmEOJZg/wdCU5a6oOi5yn4R9RrS0lI6UCMrzaxQBDu/OSJTvjyktMvKpuQkiCc4n0r8m2R5YJqZgxpMET4omecJm82uS4oYhEnDUy+/Uk0OY1OvrUIcM/xCNfh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281031; c=relaxed/simple;
	bh=PdYIIsPMxuBjYohRNyT6FXUUked3xC1w63W7NqYsrcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQxajNr50ee1QWiNQHyLQ8JeP5/76L3hC/EQzy70ol/sQPc3xfdZgLChzVgnkaraC2Z/SDqs0SDRovtpkYZrR4pWWTSKYr7NhGP85InRRTsY1IxiPzk8nsr3NO9qMdUmmBJDdbQSdr6ShT7lpjc0sXyUm/3D3H+bYX1UeV5GkRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 84F462C06CB2;
	Thu,  5 Feb 2026 09:43:48 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 715D0355F2; Thu,  5 Feb 2026 09:43:48 +0100 (CET)
Date: Thu, 5 Feb 2026 09:43:48 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] apple-gmux: preserve brightness using EFI
Message-ID: <aYRYRLcf5fgWimDJ@wunner.de>
References: <aYNjob2b9MTusPvO@wunner.de>
 <20260204182816.1179-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204182816.1179-1-atharvatiwarilinuxdev@gmail.com>

On Wed, Feb 04, 2026 at 06:28:15PM +0000, Atharva Tiwari wrote:
> > Finally, there are Macs which don't have a gmux but which do have a
> > backlight.  They usually control brightness through i915 I think.
> > It would be nice to save brightness to the EFI variable on those as well.
> 
> There should be something for Amdgpus aswell for mac pro, but i cant
> test i915 nor amdgpu, as i dont have these devices. so i think we should
> currently drop this idea.

The ask is not that you should implement something you can't test.
The ask is that you should implement it in a way that is extensible
to be used by i915 and other drivers once someone comes along who can
test it.

I'd suggest adding a new drivers/firmware/efi/apple-bl.c which contains
all the logic to update the variable using a delayed work item.  It could
provide an API call which apple-gmux invokes.  Then i915 and amdgpu can
be retrofitted later on to invoke the API call as well.

Assuming that the new .c file is gated by a new CONFIG_EFI_APPLE_BL symbol,
CONFIG_APPLE_GMUX should "select EFI_APPLE_BL if EFI".

I think there are other EFI variables to store backlight brightness
of the keyboard and so on, so if you anticipate that you or someone
else may later on support those as well, then a more generic solution
would be a drivers/firmware/efi/apple-vars.c file instead of apple-bl.c.

> This function actually writes 6 bytes, which is u32 efi_attr (first 32-bits)
> and u16 efi_data (last 16-bits), but im confused about the fact, that the
> hexdumps show that ur attr are different. the attr should be 07 00 00 00
> but its 07 00 00 80, i think we should retrieve the attr in the probe
> function and use that for writing.

That could just be done in an initcall if you pursue the architecture
outlined above.

Thanks,

Lukas

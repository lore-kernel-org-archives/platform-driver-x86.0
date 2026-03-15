Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [144.76.133.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73962940D;
	Sun, 15 Mar 2026 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773585308; cv=none; b=UUqlO/ucCpkZnkPa9YqFfqCFVhoTP17JScB5hAJM2eI17yO0gGP7U3+YbCawQqjHoHeEQlDLE7DjB0vN6w9bxmePi0R6RcPlvt0f5FOYKIxEPYPqW7iF/ZllAgtda5BxJYQxCISd6vs4OSvmV0jt5iOZ8pEslovSucxnuPJECXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773585308; c=relaxed/simple;
	bh=3Z/vjdHZR7qBz3E8JNKq3SvB43/YayIUhuWTHxQe4SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVbLF71vgKOnEh6e+8PmsqDGuck0+pOKyWSRY9BvwSe6v6bA/rbTimJ8JIXLWE9NmArdxksQu4lOsUS0gJY+gwSBZAUcwI2gUne1hTdgL3tD8fwwmZKjp1CeowBKCnEIZEpthyUtkeYZewVrjREdJfaxQu+ZFl++EGZi4edRODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=144.76.133.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 7371EC1C;
	Sun, 15 Mar 2026 15:28:00 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 432E46031F6A; Sun, 15 Mar 2026 15:28:00 +0100 (CET)
Date: Sun, 15 Mar 2026 15:28:00 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Message-ID: <abbB8F9WE0kUUzrZ@wunner.de>
References: <aYx6ocvaFHunfP5f@wunner.de>
 <20260314224503.12022-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314224503.12022-1-atharvatiwarilinuxdev@gmail.com>

On Sun, Mar 15, 2026 at 04:15:03AM +0530, Atharva Tiwari wrote:
> > This version moves the EFI handling back to the gmux driver.  Why?
> 
> Because the platform maintainer just NACKed the EFI backend driver, so i
> cant do anything
> 
> https://lore.kernel.org/all/c2d14818-1c34-47c7-a210-1f7c737f0bc9@kernel.org/

The NAK was only because of writing to the EFI variable in frequent
intervals.  I'd assume Hans is fine if it is synced only once on
shutdown.

Splitting out the EFI handling into a separate component in
drivers/firmware/efi/ as you did in this version:

https://lore.kernel.org/all/20260206125641.12983-2-atharvatiwarilinuxdev@gmail.com/

... is much cleaner as it allows code reuse by i915 and other drivers
which may be controlling brightness on MacBooks or iMacs without a gmux.
So I'd really prefer if you went back to that, but sync only on shutdown
and only if brightness has changed, per Hans' request.

BTW, I did another test on my MacBook9,1 with brightness set to maximum
on macOS, then booting into Linux.  The EFI variable as set by macOS
contains:

07 00 00 80 ff 03

... but /sys/class/backlight/gmux_backlight/brightness contains the
value 110400 (0x1af40), which obviously exceeds USHRT_MAX.  So I'm not
convinced that writing that raw value to the EFI variable actually yields
correct results.

Thanks,

Lukas

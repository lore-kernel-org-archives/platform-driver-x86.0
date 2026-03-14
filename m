Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2D383C80;
	Sat, 14 Mar 2026 20:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518809; cv=none; b=eXTihB2YvqU53U3yQsJMmJocbnBL6r9LLiis1jUCE09cvrqp1Ju0oFZb3zCYAryTYc3yuv6dCjhSChzbtKAQ2dh7u7ryv83F44a5ANwF5AUxQA2Fg+Xr7q/i0eGneBDSVwjILIq/tWhz+yztFJ08nkMaKDTWYE4pWkl33fIv7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518809; c=relaxed/simple;
	bh=EHZ0KO45qloKT5MPtjsT8zCSzkoI2lJNqOpLyV/YE1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTUXBuZR6RWm0CaTIvJ4K6lpYoE1KHBBKnHKxLvtLSPjL1+XHzPTTXtNCNrIEB5aoaLa5mhHUSGdwYkw2N6YuO3IExyL81mYdaBJBmIPqJRQ1wdi6bsHaiW0tPbIUoWITtyg6rXHcRvd3MWNTx2fjzR2i+TMgbhDRd3Lu2vX5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 052D52020125;
	Sat, 14 Mar 2026 21:06:45 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E580E372CE; Sat, 14 Mar 2026 21:06:44 +0100 (CET)
Date: Sat, 14 Mar 2026 21:06:44 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Message-ID: <abW_1KU7KSVwmZ_6@wunner.de>
References: <4ba400f8-34a1-4f00-a500-2775a09391b4@kernel.org>
 <20260313193956.1375-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313193956.1375-1-atharvatiwarilinuxdev@gmail.com>

On Sat, Mar 14, 2026 at 01:09:56AM +0530, Atharva Tiwari wrote:
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Sorry to disturb, but its been 1 month since the patch,
> and it is still not applied. can you please apply it.

Kernel development is consensus-driven.  Patches are usually not applied
as long as there are outstanding unaddressed comments.  Unfortunately
you did not reply at all to the comments I offered:

https://lore.kernel.org/all/aYx6ocvaFHunfP5f@wunner.de/

Moreover patches are never applied as long as there are unaddressed
0-day build warnings:

https://lore.kernel.org/all/202602120036.rVaXQsI0-lkp@intel.com/

Please resubmit a patch which addresses the build issue and comments
you received.  If you disagree with certain comments, explain why.

Thanks,

Lukas

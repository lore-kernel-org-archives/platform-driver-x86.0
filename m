Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12933263A
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968580; cv=none; b=m+vLtEG3SFYGHAqeSm7BHYiQspOQrGnnxT1Qx2GY7s25BKhHtSRadYLq1K43a3S+XBS9qNYtVJ6yqtDp92Ee/fn5jfIFW9FKgZqQug2vcZjEZh83Imr5EdN6homQsLVzZ8eneBNQoSYiooQBoLhF95MxJlWyOQM4wz1EryHVLDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968580; c=relaxed/simple;
	bh=xAB0iAIBSih7aLQsWH2HK/w1MYOJAWQFp+gHbnFkBXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAAuO0Bj1/fcmUkgAP74Jb1HW/pCYguyP1tKKiUrHjd/TXU7lOqzo9v2HB5YWPItFrsFRObuY+BQJf+rCwr7fh5zowOP9ZMmnxHMOUx2hdh3J56k+Xo46TlummwbN9pg2Grs3HG2gJXAIfZ8/PukCPFes+r3lMz6XHSmCpYaV5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Awe1Pm8E; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Awe1Pm8E"
Date: Tue, 31 Mar 2026 16:49:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774968576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBqIbnoqh4kpCd4oLDfpFXKK+0lEBn+acfxoBptm8yA=;
	b=Awe1Pm8EwHIhRXW3xTxf7MI0rQ+bbHm+jimBp2DHk+QH+ytjsuoa/mRjVoOoP2IdWflJFt
	pP5csjRB0tpB5wwl3rqEfcKV/2CmP3VtbfExgFiAVnVTgx/8Av2aA4abrPzcK0mZEjFXOj
	IZ1hauPgCVdBQdMpzy0fiBHWuvVF0oQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>,
	Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Clean up security buffer
 helpers
Message-ID: <acve8iuIuycAtHyS@linux.dev>
References: <20260309211811.82403-3-thorsten.blum@linux.dev>
 <ec9be8c3-6946-5edb-0879-53b150c95ddb@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec9be8c3-6946-5edb-0879-53b150c95ddb@linux.intel.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Mar 31, 2026 at 03:46:11PM +0300, Ilpo Järvinen wrote:
> On Mon, 9 Mar 2026, Thorsten Blum wrote:
> > In calculate_security_buffer(), call strlen() once and use ALIGN() to
> > round up to an even size.
> > 
> > In populate_security_buffer(), also avoid recomputing strlen(), rename
> > the u32 pointer from 'seclen' to 'seclenp' to avoid confusion with the
> > new length variable, and drop the memcpy() guard since calling it with
> > size 0 is a no-op and therefore safe.
> > 
> > Use 'const char *' for the read-only source string in both helpers.
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  4 ++--
> >  .../x86/dell/dell-wmi-sysman/sysman.c         | 20 ++++++++-----------
> >  2 files changed, 10 insertions(+), 14 deletions(-)
> > 
> > [...]
> 
> Logicwise this change seem fine to me but I wonder why is buffer char *
> (again, this is a pre-existing problem). It seems u8 * would be more 
> appropriate given how it's handled here as something else than characters.

Yes, I agree. However, using u8 * would also require changing the call
sites in biosattr-interface.c and passwordattr-interface.c. Happy to
change it, but it would probably be better as a follow-up patch.

> Also, you don't need resend if your patch is still listed in the 
> patchwork, it's not lost as long as it remains in patchwork and I'll 
> eventually get to it.

I wasn't aware of the patchwork instance - is it this one?

https://patchwork.kernel.org/project/platform-driver-x86/list/

I see 67 patches in total, but this one is not part of the list, afaict.

Thanks,
Thorsten

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336145;
	b=F3SCpkhO3LBrt15lJ9Q/We1k3ESfliXv+7gwMEbJBLXr9twLzsvwCmUCOBnjIxwCwcYI
	 eHtk3BTB1DUPfsDBRAU9sBfUBkHNLzEYU0C+nBuGZhllyL/xp0CeZ3d75oklQs2YxqjyC
	 lX24qZvltVTEvNs+0wP+7rPeKnO5eAN6/QdJW2rne9nT5r9mO4UW/AX8isOUfYIfk5gbO
	 dNFABzrVnmQyhPlx0jRze5qgNInJJw7Ll2emPgJBlaT4X3k3sToM82t5oXvwHMrICnhGx
	 9/kUNX17aVelr4ma6q8MCKtFLHu1ARoI2bfoIWUW44yrlxErucIWlsakyk8CU8L5Iqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IJxn3qo9bR1YiWbsVjx6fmfUIW8eyV5FFrf9nDql2TM=;
	b=dkZHj3BQNJtIYbA8TMIQPEkL9u8xLdD9JG1dC/oRSRahtEnWJZQ2rOeikCHZ1AU5ceyJ
	 eumHArTCYBf78xJ6UVBuvoFiA2AERv66BNYxfuAeRj3oh5OnrT3Cj3eI5xYdR3bwFhrq4
	 +t2SYyZ0GQjxIprcU2qNYeKXeA4SulcbGeteN1CwLiu54jLsuBPKlxBqFxHatcKImyVHm
	 aPJZEjVvmPZyUuUqCxdaX4s+40drOJMbr1lbsr3GLB8chxkM1uqjxrcNyMrFfn6w43UP8
	 1vP+U7MkBraIRg1518U2STuUuH6oPMoZF2IdNLRfa1mvbW47QFFGhj8453I2miknSqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOzPl1L8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84304606A92F
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 18:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84304606A92F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOzPl1L8
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843a4ca671eso1027351a34.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 10:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336143; cv=none;
        d=google.com; s=arc-20260327;
        b=h9Sjzf7NSzh7lVipK53DoznKusbOCv4ROFC8rqXVax1eh6/5/zD15KEn7R9zc7pru2
         Uap2pZZoHekkhLL591xinLN7N+v/6UBKnU3+8uFTH0iTScCrM6kjY0b5TLv44aU4m4ix
         cZLAivRLNXOcuAF6HPZLazcZZ43ydHLjF9AR5F/E/dW0GJwBeCymtLHkbsvXLwBa+dVj
         TMERWVDjB1Y424IeJ5/8qUvAa4bIaYK2MqSjxwtayvTlbmc4k7bWfbZ1eYBEme72XUHv
         LaGEBKUdCw3mTJ/yFec8ZUZ0UcZnbtbLWaWeWSdwAI3z/ilc15ywo0k8BkAopWw0ouAN
         4MWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJxn3qo9bR1YiWbsVjx6fmfUIW8eyV5FFrf9nDql2TM=;
        fh=amJUuyMKwStCUX6PBosinRuYPa4JCdqe0FqhiRPuW7g=;
        b=b2BovBYgwgxTWfX41kArBpXHXkLi/8py3e7lnHssUA1+D0EIdT8T4lKI6NMR5ycgel
         yJ8JY2idRiszVhXL48V1WlD+edzeJDsSbojwRgLCOr70uOotvapdXr18eAiypIdJnxH9
         rFDeXckBZRzZhAhGr7PuKSzCEFYOlKTLG/iGYzCm59gU3z7IWEftnjTvosO4H3nZx95U
         e14x3Jb049J+I0rHUaHHFvBKgS4d+2PYV+m/aucC6RJswxTgTXwZ9Fc2oIYM5F4O5MHQ
         UXI5Nl9LNVse5uwnKd9nhrhQ45qWAX73BMYknaYfPKH6OEj1RaNCuozsNZ2UhY9F+j2X
         j3cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336143; x=1794940943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJxn3qo9bR1YiWbsVjx6fmfUIW8eyV5FFrf9nDql2TM=;
        b=GOzPl1L8hRVjkffAQOxToM40LGbUN6J+NDsUfwKw2whmCy12nlhxMqTZrIffhYz6c5
         82raO4rO5Z/Nnur8vQxYLPRuFWegRL9LQna+/16U/qixg+cCYrO84k3opaOnz/z9f//g
         OvMmuW1l82/aqZBPhPkF/MRWD7wEOpc///gPqgv0Z63wprZeqEw9aafEjqB/YLKAkFAu
         uEyg1Gh3mrFddj2nVel68LgHczYj88PuhW38WnVMmW3rfQkBPIuaO2p/1W3LAYjQmuEX
         edsXx3DSwbwWpPfNXsmEt6yUl2iQfN9PXb6PoQkNB767Ud9sIdMaXNoOmZXinAaskBPI
         dGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336143; x=1794940943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJxn3qo9bR1YiWbsVjx6fmfUIW8eyV5FFrf9nDql2TM=;
        b=CPdT7gmxb2tFso5AKL4s4zxg6YXDboEhzyayWnVki5ilpryLVwstDeTYm+l0EifafL
         wUz5yE0I9HNpeCyBoz6Thv8upcm/DRS6ieLNPgpqUGJ//aRtulylE6q4nmO+EA1ho0L1
         SxaLQasZBF0qJVWb0hxN9Xx+OVk/rxwpTVkdrR3tt2c3569fusA71nqRC9KG/6vSN2vX
         Y2civwN+M/VbA3n3AJDVxaO0h62HIpA/1jAr+ib0rVN7aTOidk1tgrOM53toXbzQArbw
         5Dq9LxkcXhGucs2Da5XYjGZ1uT4qd1vW3y32Oee/acIU8zIik7HFGWX8Ah+o3AwqVDoA
         YZtw==
X-Forwarded-Encrypted: i=1; AL+hErEYurdwQjw7YArRSYWt7/CgNT2M+o38OLYteZKC+p9iAZu6usfLw+yA7TqwMcxr5s54Dy3o1CR8syC/w8udgM7LSQ+q@vger.kernel.org
X-Gm-Message-State: APuU4Z8BdfGIwqlTLuJHWYevJXAdMId8cw175wj7mGJ/7z9GXP9X6LkK
	0za2lfiUygWMVIaH9/eA9mvF78LMAOO9FubGyy8nokpyAKzfHF2lDEHbuIOQVKFM2y6nya0C3iV
	xma6AB/v9UHUFEdljedfrURHo7Tq2xsc=
X-Gm-Gg: AYBFou2uVEs3RvxQciGrQ4VNJUDotSm81QXWqUAoICqIGlbGgwi9RQqq7e+ujya/zNU
	1svIS98RWwfnpzWldh2yPBFn6zuMDMkexBeObLN/ZMVzLR++1Kq4wk/rQec072xm18/GQduIUkP
	UK/AO/T/31kOY5wDK7U7zWWh9IAEggaunBuLe2HzneeSM+r1ZjW4Ru6w40SiC67CTGa18bbMLe5
	c88IVCDedo7fHpgxqVunUTAYzRUJkzZClFEgpRjzhQQGuYfVA6bEHi2ZpIPA6KMDLhKwBBbI7Uu
	R4f8pcBbkk9NVdtFS2D8skJoPdOoLOn6YySHpokld23wd/W7JGtgIrMHTFl3sZk9rIsLjsQyFDO
	KRttgIStnaG+/QLMYs/NpxVfN6E5b70B5o6dUs3cPZvrTFPUMVlGqGeWqocNFrzjC
X-Received: by 2002:a05:6808:2212:b0:4f3:e133:c574 with SMTP id
 5614622812f47-5683cc0efcemr2798420b6e.19.1794336143447; Tue, 10 Nov 2026
 10:42:23 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110164222.698745-1-andriy.shevchenko@linux.intel.com>
 <avNb_7QmpPkxa8xq@yury> <df77dcec-08ea-b307-53bc-d52078fce7a2@linux.intel.com>
In-Reply-To: <df77dcec-08ea-b307-53bc-d52078fce7a2@linux.intel.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Tue, 10 Nov 2026 13:42:12 -0500
X-Gm-Features: AclHuK9zAzIBs3yl4x2cgqpMXprPRNOqAyrkGsucmnU2n3m4faNlmxAM7HKEc8g
Message-ID: <CAAH8bW9ZT-D6boyM6qWLj9DpYwi1CgFXcfJk3Q9mtnNGqSYQDA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] string: Export strnchrnul()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Yury Norov <ynorov@nvidia.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, jorge.lopez2@hp.com, 
	Hans de Goede <hansg@kernel.org>, Muhammad Bilal <meatuni001@gmail.com>, 
	platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:39=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 10 Nov 2026, Yury Norov wrote:
>
> > On Tue, Nov 10, 2026 at 05:41:50PM +0100, Andy Shevchenko wrote:
> > > Export strnchrnul() for users that may be compiled as modules.
> > >
> > > Reported-by: Armin Wolf <W_Armin@gmx.de>
> > > Closes: https://lore.kernel.org/r/1969fb5a-38ef-4b4b-9d2f-cb9a4348b96=
8@gmx.de
> > > Fixes: 0bee0cece2a6 ("lib/string: add strnchrnul()")
> >
> > Not sure that exporting a symbol is actually a fix. It rather looks
> > like a normal development. Also, I'd like to have this patch attached
> > to the PDx86 or whatever series that uses it.
>
> I did put it now before the change that broke because of the missing
> export.
>
> I dropped Closes and Fixes tags as the issue should be non-problem after
> the history rewrite.

OK, then

Reviewed-by: Yury Norov <ynorov@nvidia.com>

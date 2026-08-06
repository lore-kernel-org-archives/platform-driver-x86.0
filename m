Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0890E6FC5
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997219; cv=none; b=uhujOOjKLotmRV4pb0PLAAcl4jTfBrYez0caAZy8Apshko0NfCjHIN6UKm7os2T7RHm3+HVPPcvk8nN6ZLFJDXBZzalhx5ywIS+sctVp5B8hoHG2nKUcs69IgPJIAAO167dK3CjoZ8ZsDvOcNcQRaN78d7wsaqd2kxMQiAfZziY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997219; c=relaxed/simple;
	bh=vSRCWOqiLkmC/g4RK5nfPxDTazh6Hk/YJKhItLoYs8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlyDsJ7anrwA+U3fVTa57/ihXG1VoK8a8Qweb9qSiJuNdhw1aDgd+ub2SvF8b+GlcNwrH8g7aRQ2jmMNt3KmXdddajjitWY14YVGi668PG+8V1guFp+3E7fHeaGab84z0jebl878Zc8Wt4tHnOxR+xNziNaClTpjv2hQVmOmy1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxquwDKh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxquwDKh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e347638adso2016559a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2026 23:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785997217; x=1786602017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqa2lb8jz1k6wRMwAtf53torsTTbREIMvGm7sGyYSQQ=;
        b=UxquwDKhsKjCGwtuPacNsfLa4i3mMXeFWh7sXr1yiM75Kh/Bg9JVB3wZL6nGNTXy79
         T8W4DiiEG+EOvvtNfaNNQ29fzE9M8LsMDI5DDavcfRBOxbWU5t6YcM31JkmysQMUXc7+
         A1o+KSmqSOep0GW0urEZFUHsi3e4zz0uC9bkq4eE6OomCb5AMyAr6Wyp2Z2YGrh8WoK3
         daV0cY6nUNJ2RgKOiVJPGS4ylYu+5t3DBAnJBR21oeNq+GgMSHepJ1hySUtl6CApGRYQ
         GheE/kGYWHGrxsn/ISGZdISdAjYNpK+Hgibla9/hA/wGtDNlYW3dMdqvC3vYewz1QTVT
         HpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997217; x=1786602017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqa2lb8jz1k6wRMwAtf53torsTTbREIMvGm7sGyYSQQ=;
        b=JuVM+iWm1KUapLZK3tfLObNMihyATMs6zyQdQt117ddY4vSViPeAV1vkg6GA57704b
         ZtMm6hyLOdp39eI3qJ5R5rwqhuMpW/xhavNdsV8gxDUhe8zBgavWtoBYx/BAlfMStITN
         Tg3SxRZwdLQcdyAXmcglwEMK2mRxOBjvXdQ/xjX1Pql1fg0Otf2EgtB3MOf1o9/68C48
         NpoacVK0nUno+kWkEa3aXSdpVSGL6M8OrpoCRvFj4v0ixVYGakMTLA4fexsKg+9f8XzQ
         PZQwgZkX7mCnayVlsdhhz59wtP5nXeewEEwaYNwHr+KK5gTUnDZXIrI+/0rol0ZvqwNT
         fVKw==
X-Forwarded-Encrypted: i=1; AHgh+RotbQam1W5O4/7Slb86YYoy2NPQONqMS8TWWz1+nv7e7ddBaJcdDMnC3Jp1/EWi5K67IMLQZ99AJhtpK6+4ZzsIBmJX@vger.kernel.org
X-Gm-Message-State: AOJu0YzRKUmFRgsDLOoH4ad/dx4EpCEH9euylmAaCnMFwmrd6PyiKW/U
	lBffJKrVAYfYIbFil8XnAMGoJJrUgN+Uoqocr1o+g6FbLjNN3ZSXEUvnFrmRVg==
X-Gm-Gg: AR+sD12nwu4c2dsOtz408ZhfH4gP3G74unDhz5IJIi6mS1JK4ctM56LD7lavBfuN0IN
	LP2JUGgXxQJpXjAMNub+SNBCsxxzpxXO4vNTTI7Y7M9/mHvtMW88IHOQN07/vxI0iEyAPaYXE5C
	ep5oCD5jBueS6RJmb9xCAgO/NNCkxuF6MP4otrdgsTCIs9UNIIUEeB1PVYHjMXl0evKPWx7W7n3
	ecGbfHY5n3j1i5RhX25d/nPcjEeyWHkx0/eBuuQPz+nHkyu2v2NnzsiJOI8KlaAbmvKttJdOpFF
	+CEIgREQNcHaaf48gvTMLEGBuz672ViyQnOh/PFAeSo/Tn0CZXwVsscKlyzB4NC18LCweP5v/IF
	TyTkgGqJbQ0BdtbBCsCnbzxRaTAld7l74ukcahIczB3rQeBb33bbeyAdXrEp9kJCJOb8M6EnSU8
	4ZQ4ayCHTAPREinSIQammHe8j7NdkpsKMzqYVOFNy6zyHHNkOzuEWZs7HKQb1EmPzZCi8ie6iXy
	kkoTNuSBS1j4f29cBDbPl9uQ8N4
X-Received: by 2002:a17:90b:2807:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-3903c5ee958mr13890625a91.19.1785997217050;
        Wed, 05 Aug 2026 23:20:17 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d081:36b2:965:e66f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc341sm36974257eec.27.2026.08.05.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:20:15 -0700 (PDT)
Date: Wed, 5 Aug 2026 23:20:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Nitin Joshi <nitjoshi@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Message-ID: <anQneQWGrvSJoY_0@google.com>
References: <anK1j7hbMyFHGBUS@google.com>
 <4ad479fa-8465-4d00-aa73-ced177254eee@app.fastmail.com>
 <anNa7i7HnJW476bK@google.com>
 <7f1ead83-532b-4546-b6c9-ca157a0286c0@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f1ead83-532b-4546-b6c9-ca157a0286c0@app.fastmail.com>

On Wed, Aug 05, 2026 at 12:15:27PM -0400, Mark Pearson wrote:
> 
> 
> On Wed, Aug 5, 2026, at 11:52 AM, Dmitry Torokhov wrote:
> > Hi Mark,
> >
> > On Wed, Aug 05, 2026 at 10:51:53AM -0400, Mark Pearson wrote:
> >> 
> >> 
> >> On Wed, Aug 5, 2026, at 12:03 AM, Dmitry Torokhov wrote:
> >> > From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> >> >
> >> > Use the new helper. Inspecting input device's 'users' member needs to be
> >> > done under device's mutex, so add appropriate invocations.
> >> >
> >> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> >> > Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> >> > Link: https://lore.kernel.org/r/20200608112211.12125-7-andrzej.p@collabora.com
> >> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >> > ---
> >> >
> >> > Not sure how this got stuck in my patch queue but it is still valid...
> >> >
> >> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 4 +++-
> >> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> >> > b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> >> > index 445e1403308e..f8e116e8a65d 100644
> >> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> >> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> >> > @@ -2547,9 +2547,10 @@ static void hotkey_poll_setup(const bool 
> >> > may_warn)
> >> > 
> >> >  	lockdep_assert_held(&hotkey_mutex);
> >> > 
> >> > +	mutex_lock(&tpacpi_inputdev->mutex);
> >> >  	if (hotkey_poll_freq > 0 &&
> >> >  	    (poll_driver_mask ||
> >> > -	     (poll_user_mask && tpacpi_inputdev->users > 0))) {
> >> > +	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
> >> >  		if (!tpacpi_hotkey_task) {
> >> >  			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
> >> >  					NULL, TPACPI_NVRAM_KTHREAD_NAME);
> >> > @@ -2566,6 +2567,7 @@ static void hotkey_poll_setup(const bool may_warn)
> >> >  				  poll_user_mask, poll_driver_mask);
> >> >  		}
> >> >  	}
> >> > +	mutex_unlock(&tpacpi_inputdev->mutex);
> >> >  }
> >> > 
> >> >  static void hotkey_poll_setup_safe(const bool may_warn)
> >> > -- 
> >> 
> >> Looks good to me.
> >> 
> >> Only note is that can you use guard(mutex)(&tpacpi_inputdev->mutex) instead of the lock/unlock? I think that's preferred these days.
> >
> > If that is desired the whole driver needs converting. I can do it in a
> > separate patch(es) if you want.
> >
> Ah - good point. Not worth it for this IMO, unless the more experienced maintainers have a strong opinion :)

Well, I went and did it anyways in case you want to apply it.

Thanks.

-- 
Dmitry

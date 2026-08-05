Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C4535F609
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945156; cv=none; b=fkaVaebsCJphxD/PnNuyiC3eK2xpAhks+IIKsSS77hJO0fV8qDyTcSlXjIjmhaSycRY5X9UdxmU5s+g9pgacOUOU/K43vbxL+/DxaurhXkZwhJXjSgudzm0BAKxf8ZXnFB3JLgQLfBMkuaKdC7lmGcCM8x2Eumg0Bc2zzHwdCIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945156; c=relaxed/simple;
	bh=4iQhXtM3wBlDP3iTDZXeDcuQMd9KFElLNHXs6a6M4FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKeGO6hD+an1uJU+QHw/dNuC7nPqCJGgSD659HUK9TYhsBPyR4Gl27jyJkiPyrX5fpsZyQQq7NMftz50ADWB7EAtamfZsjYHc72EJW7Ts4++sVrPTbmDClTjz9geq1s2V5sQZI3p20whxRuGIuh8azHLwb3qOEvhzSp/uHVmpuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpQMD24J; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpQMD24J"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso976080a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2026 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785945155; x=1786549955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cgf0kMu9tqp0Ksra7TtyhrKQCoqib4RLVTDl85SSveg=;
        b=JpQMD24J3MaVw4EewVtLi+JweE5POIax0Bl6Az+LC9yCwrKvss7PMQjIcmk6KeB5Dt
         UiAEVGHA0Ypl3X7h+J9i96W12BBnVfQkZbcQRHbFYNmlUTIJbDZYGz/fYHYJUnF0jc2+
         eEYksx+KLG/F2ejCjQB4pESAXqngQOtutpPbG/UvN4moa0THjGKTirfZqc/jaQxlCy24
         iqryZRp90dAZFEyCrpih4PkSlXvTvEpNi+RE53eKr2H97/cRzD/WU5fg5SGjpdFoLd6p
         rF6QLxdwXC5rBDWpvzOny+DwAQa2Kn18f633WXMC898ijYymUyqE6DUr9c1zoBbu221I
         ReHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785945155; x=1786549955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cgf0kMu9tqp0Ksra7TtyhrKQCoqib4RLVTDl85SSveg=;
        b=maxYHEhSWe1W1vZT9kXKVqV6TooKRgGuvyQ6iAQyyCu4utD3znUBy8fCckvAwfuEGp
         lRlTdbPSif2X5GruFhV8Zi40zpsAVqGsGzh7taQzFEvupbSEwnJeppz0+g8acFwpCSq+
         O+1pJMRwG5xx8d5dxTGfBkUtXdgLx4Wusf2OavExiI8+PxGAjqC7lj+Aw62i3OEm84Ql
         5cJfJ2yvHEYCUAzvbmnKL2T7dahY9AqA5Q3j3fNjiHGptfzHT4toUYMkaml+kL+khmnS
         S/2YBRQYIS4iKNBc/aaaBPyyqDegbOyVz90t4+/B2qEnt6VkAswtXY8chiNvHFWKhQL7
         Djtg==
X-Forwarded-Encrypted: i=1; AHgh+Rqw1dZSEuCng+qs8RHZPNcuTrBTvi2v/C8k1jzi5O8zHcs2nT+SIWv/DXOYlqKDb8W/plP7sNwf+tVFi5/qm1xhkP++@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp3hpNtdaKR2fkbOo/2JH5czQrQ/Yx+fO4qrVXtzJYMKqlqxO7
	O+t3ZrjHYrDwFSa+0Umx07FH7CnPOwTS8yoCksQFoacOzRu6gWiciibA
X-Gm-Gg: AR+sD109x/+lp+o0A5A2J+QxN56RLS2IiGP8q+MN242vWpoqGijGrXT17AZd6T36HZM
	R23iccwSl1rnDptK170iulwG8a99VvZiAeNGHk0ONV6Ehcbre7tIQdtYJZMpvnaulTyyv7bFws9
	L5S8mSJAfFihTqPXxQqQi9zlq3N64at9dftF1DGW7hVwhRnaEk1ScJ9BrQgLOvfjlrjt41Pyf3C
	ZMFueTuUROzi3TSBMpU7wq3uHECTUYUPplMoVgnZrjmJ2uZvP3XvA1uOg6C6wZ1q2q/QMk+TpOy
	XqOJG821Ywh4vKZjzvWIc4+HWAdRokbCVF1LvN8AGTK7bd3q1VQ+/keFsfQsM3r6cyuRfFrYHUC
	xDD50HwEfbohxuTDrN2KPz2AyYvdhcS+6UiR0CE0m6MszNfamCnbyZAxy8MV2r+aQBhmNeNZT17
	diad5MG59ioQ+UcoRXA+AwCeh+/ePTbC/4KdNXtziPgtRL4oH5pUBtN298903lg4wMGvlIIKRQ+
	GRmLeImDh4bVQ6gekI2jFwyfoNq/Ya3DIdbokxU
X-Received: by 2002:a17:90a:fc47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3903c599361mr8837360a91.1.1785945154677;
        Wed, 05 Aug 2026 08:52:34 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf3a:ac93:79c4:84fd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca9111b6sm15094060c88.13.2026.08.05.08.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:52:33 -0700 (PDT)
Date: Wed, 5 Aug 2026 08:52:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Nitin Joshi <nitjoshi@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Message-ID: <anNa7i7HnJW476bK@google.com>
References: <anK1j7hbMyFHGBUS@google.com>
 <4ad479fa-8465-4d00-aa73-ced177254eee@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad479fa-8465-4d00-aa73-ced177254eee@app.fastmail.com>

Hi Mark,

On Wed, Aug 05, 2026 at 10:51:53AM -0400, Mark Pearson wrote:
> 
> 
> On Wed, Aug 5, 2026, at 12:03 AM, Dmitry Torokhov wrote:
> > From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> >
> > Use the new helper. Inspecting input device's 'users' member needs to be
> > done under device's mutex, so add appropriate invocations.
> >
> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> > Link: https://lore.kernel.org/r/20200608112211.12125-7-andrzej.p@collabora.com
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >
> > Not sure how this got stuck in my patch queue but it is still valid...
> >
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> > b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > index 445e1403308e..f8e116e8a65d 100644
> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > @@ -2547,9 +2547,10 @@ static void hotkey_poll_setup(const bool 
> > may_warn)
> > 
> >  	lockdep_assert_held(&hotkey_mutex);
> > 
> > +	mutex_lock(&tpacpi_inputdev->mutex);
> >  	if (hotkey_poll_freq > 0 &&
> >  	    (poll_driver_mask ||
> > -	     (poll_user_mask && tpacpi_inputdev->users > 0))) {
> > +	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
> >  		if (!tpacpi_hotkey_task) {
> >  			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
> >  					NULL, TPACPI_NVRAM_KTHREAD_NAME);
> > @@ -2566,6 +2567,7 @@ static void hotkey_poll_setup(const bool may_warn)
> >  				  poll_user_mask, poll_driver_mask);
> >  		}
> >  	}
> > +	mutex_unlock(&tpacpi_inputdev->mutex);
> >  }
> > 
> >  static void hotkey_poll_setup_safe(const bool may_warn)
> > -- 
> 
> Looks good to me.
> 
> Only note is that can you use guard(mutex)(&tpacpi_inputdev->mutex) instead of the lock/unlock? I think that's preferred these days.

If that is desired the whole driver needs converting. I can do it in a
separate patch(es) if you want.

> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks.

-- 
Dmitry

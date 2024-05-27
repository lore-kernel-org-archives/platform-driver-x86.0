Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E766C79E1
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716806341; cv=none; b=Ec1tg4ecR3hMq7Lu0AQhIbh80F6Lbf0FTU++RMS1qFfK60/oX2GZ59R+8Dex4E0/4G+C/s28A01957O40Hrd55ECAucePWzrMwFmXcxvs89ReoZNz796Y1KKUwvj2ndTABMhwuGyMWcP9h7ilTgSPfWovJ28s2aMFp8a/kM6zCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716806341; c=relaxed/simple;
	bh=IkwzgdfTNU+klIMnbkfTrq2KFgzEpaYiBSPhQKWeC18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gg44HWJlTM3mkaeHeUTqvd3nFmw5HXSVQ1u14r0jO35OV7rOGl4H9TbiQUzUctD4p98ixEAJIyOzTnwC+K9kmyBqPqjc0GhSn7Rc6/zmDEA1LPrUrJAN3o/eanBHIBWfym9bhyNvfvqmcHP1wIYe52/PCll+fxHmtQIjfPHEdGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3dAV3UR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3dAV3UR"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57857e0f45cso2977037a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716806338; x=1717411138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcLzu4LJ9QZeVn/MsZTmbDQWrB/tBNmh+KmvIiHdD0g=;
        b=S3dAV3URpEeeh+kAK28/WStp5EO2XRakJ4DD2Jo+s4fm+ABsEjVsiga7+hSK36DSCh
         Ve+e9r/doqHufS73QoGmQ1+uEWF/RKXV2J9rDS8z3Rx5Zm8X151ibFgbiLOGMFLYc52J
         TU8TZkN3sMWKOFFURfOtX2ZnOr6Hqa9soRjl8SWxGUhnJfzLS8Zb0GM2CX3afXic0OXm
         /bun8zvVcfBEjO9CHkF6L0Dg6I1t/cYWVheVfYDaLeMR1d9T0LZCSDEkxlmDdzq5BnFE
         503SwuH3DeC4MY/v+FgIWVfjLSOGtAX/K6KHvjP8dD93cBx4ODiJVnxB65YC70DOgnAI
         LkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716806338; x=1717411138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcLzu4LJ9QZeVn/MsZTmbDQWrB/tBNmh+KmvIiHdD0g=;
        b=nBGcbLZlq7E35YnJ2FyVXKgjWJo51FT7EmMs3ft0OJ0MvN27gdEb8CR0htr6CPr519
         7lcX5kDB7RiGXGiWNe2E0Fqh0Kw7Bs5ngJgTOwXxP9+jsx0741YeHA72/b7AQNV/KNTj
         lWXr2CpwGFmtS6FNHfaDGU8a3xcJzD1PbYxhTXJsj3eOMUX9SbwA/uPLfY3ZxJETM9eF
         dUIhD68p2JnPYHxp8zUcip2Yd6g+bqNxRkfYxFvAO7ZVtTKaMrSNolm2LV+lMbtI0zFs
         /Xd1/vCdlYcVhRZ4n4lN1PI/Eb6pfNbLtJia7pNGFIYycW9ApnU+mzBitERNOHQucJ08
         4Sjw==
X-Forwarded-Encrypted: i=1; AJvYcCXshDhn+4Ui/nXPrDPi61K1C9MTFRVZmg9KUSB9MzkWP4D94ue9/h6RfKXERsfsBDp0tKrQeQ+wOS5yODybWrfy5gTkd/e9ZNoG/NKAWm3VJ0RjVQ==
X-Gm-Message-State: AOJu0YwUaxheYsgUsItc9ARBE1JFp6r0r/kp4M7WanXY0DaRzJyXCHqR
	7rYp7bG7R6hdPVUYOEeuupv8VCPImyDgFPeC18Rl42BsJhVW7jIXGpagCmvDZBI=
X-Google-Smtp-Source: AGHT+IFvBQngBXOPW4ETq9VVybyALDmbeyIBaNOM9Vy8P40JUkXq/WTpcP2GigRERW9VwEVl6tOalg==
X-Received: by 2002:a50:bb41:0:b0:578:3336:92b with SMTP id 4fb4d7f45d1cf-57851796edbmr5061953a12.0.1716806338089;
        Mon, 27 May 2024 03:38:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785238d355sm5635915a12.31.2024.05.27.03.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:38:57 -0700 (PDT)
Date: Mon, 27 May 2024 13:38:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: markus.elfring@web.de, Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Use memdup_user()
Message-ID: <4c2c8a76-17c7-4dbb-96ff-8488c8e953ff@moroto.mountain>
References: <50d10f0b-d108-4057-be9c-a90e2398e810@web.de>
 <20240527083628.210491-2-thorsten.blum@toblux.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527083628.210491-2-thorsten.blum@toblux.com>

On Mon, May 27, 2024 at 10:36:29AM +0200, Thorsten Blum wrote:
> Switch to memdup_user() to overwrite the allocated memory only once
> instead of initializing the allocated memory to zero with kzalloc() and
> then immediately overwriting it with copy_from_user().
> 
> Fix the following Coccinelle/coccicheck warning reported by
> memdup_user.cocci:
> 
> 	WARNING opportunity for memdup_user
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
> Changes in v2:
> - Update patch description after feedback from Markus Elfring

Markus always CC's kernel-janitors even though I have asked him not to.
:(

> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index b438de4d6bfc..1b53cabc9aa2 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -301,14 +301,9 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  		return -EINVAL;

This -EINVAL check could be made stricter.  Instead of checking for
zero it could check for the limit from amd_pmf_start_policy_engine():

	if (dev->policy_sz < POLICY_COOKIE_OFFSET + sizeof(*header))
		return -EINVAL;

Also this check isn't great:

	if (dev->policy_sz < header->length + 512)

header->length is a u32 that comes from the user, so the addition can
overflow.  I can't immediately see how to exploit this though since we
don't seem to use header->length after this (by itself).

regards,
dan carpenter


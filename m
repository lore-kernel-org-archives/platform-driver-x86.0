Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562CE3A7F50
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532295; cv=none; b=gnI1swKat9yQPw2TxgBNW2JnaYnipFKSY4s1f+ZP1pNH2zoKb9Wpoky6zK3RI8sl4ZXMUr+Lv8hgMTpdUqJ5aAfo3tTrSiOc2wuyqztC1uXX5Qe6vLS8AlKPqw3In8EvQKjoN8IMk9wUrZriNQaIUjat31bm+vv1d/DN4KJcc1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532295; c=relaxed/simple;
	bh=J2YENO2TVWW+8sJGr3R7YA7i7Y7rhN4VghdY4KV4OtM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WnE1C2km42tb32dKv9CKGuEUWuyrSvWpsVfuoA9EOoiwbnQG7K9gM63U7JoxWqM8dN0DOx6rltHnJDUtQxbiGWwioBEVv1tl6HoEETu2e/Qt9oHG89tMltwhomdpnvabFAZ+uzFgy3OvoAzye9DxqzMurO8H1Se0NGT9xH0C2yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ+ELj/0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ+ELj/0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891b0786beso31402195e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778532293; x=1779137093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd1+y9v/6UFfoNSm6G0epy/UyHr8jG3NH3MUkNERA6Y=;
        b=ZQ+ELj/0tOLIjjcMN/GCNFw3Pq+6bh21USTnQHzVy9E4Cn0dm2v5zx3/MFCX7AigOs
         noI8dahk9GeFDEYpbNicRdq5L7Msjb8dUIv4MOmoJ2ztwKdpwoZGB3fZsm03cMDy998X
         ZckHi5CI15ooGEQZAPj2b/qbfIaKtMHKq8hapgE0AsKkXHPk5nfKznzGwjcbgzVDurut
         /Y5g63h+t16asmjSbtAKGCYJ6b0aMJBJJ7bxUqT8kj9YSiOKV2dxRxaLp0rUzX2BzCmP
         ts1zHY4S8dADCxRyr7u+vMYMEVgl2yrrTBgIo3CAzG4Nh6gRhObBMkTuznFcIdYIs/yi
         M68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778532293; x=1779137093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wd1+y9v/6UFfoNSm6G0epy/UyHr8jG3NH3MUkNERA6Y=;
        b=rvci9NkMJ9DuKfW/myc6qeCLQXNf/1Jt4FQwPbUFnPVZGE8aI/KFX09xKDy1CNNBmp
         QlStcMQFqmRUp4j7+QAmnTP7d6I8KTyzdK1bn7t8FYaxK3PAUg499SlPWaq+4XKFlNMz
         D1Wd+LG/nB+wxayVddafmVMq6dmJWbtmO13Q3+XTBCbat94WYqYSvqEoaTiy7w/Epch4
         y29nJuHLReR32ut/iIpZzbTGblO2Qp/HhoTRHcbtsOklJlg7U5Of7ybXP0T3ys8uAg+K
         gHALwSapieTxe1VZedCGc99oMbLZvghliWB8zxEJdvKysSM+mYvS+xkpzAnN0WAbe4jF
         9PMw==
X-Gm-Message-State: AOJu0YxkEJzRLlfaeUSv22bqoKGgMfhx6zM99S3is0NaIAngOAXGcpE1
	TCzomvD50xT4yizwxsWJn+hgSr5Ayihf+fp1x/LfCkOjVOFFIBcKo85DbXz4e+LR
X-Gm-Gg: Acq92OEyMVZ8LsSzR6f5r6hKiHCRIWOFxy4qG/xlFkMtS2U0lZPkSbVt0PIxziZ80lX
	gCKZ1KzHYs+ZluC2vd5iUjJaRCBMtSfAddatd3E8WtRLhfcohp/Rpf835IADTJMSlGjnd9eB1TJ
	YNxF4QvB8W7S4eoSSafvojpIZoG7FslVaeuiDf0PtmOkU2W9aRG/+J8RHLzPeGLKRJgQmKywl8T
	HH8p0D+hZg4xsUkUAF26nn9imtvErVZvtG7YU/FwrYYT13WkKFeK+N6fm2gOOujijHIz56DEtzo
	Kbs4bLpibfNQZ0w2Q4soYsZ+tjyHBM6160avr7ESfHhDXXmNBdDieRSTQ+OaMskuu4clO5V1o46
	5pu+FiQMiR6gTE5BhA/wSmkMA9WWf2Zw6BYeAHCI9eJrCL4MFhXGh/Y8XA+6ywfmxAojDAXmAZP
	yCF/V1g3nWnGWdjkOtfuSDR/5zwz83WgtrHatFkjD1pE8JvI2VSeZXq/K1RkAN
X-Received: by 2002:a05:600c:4996:b0:48a:5363:8cac with SMTP id 5b1f17b1804b1-48e51f487f4mr266094835e9.22.1778532292725;
        Mon, 11 May 2026 13:44:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e042dsm217158625e9.5.2026.05.11.13.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:44:52 -0700 (PDT)
Date: Mon, 11 May 2026 21:44:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Melih Emik <melihemik@noirlang.tr>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: replace strcpy() with strscpy()
Message-ID: <20260511214451.5741692b@pumpkin>
In-Reply-To: <20260506175031.25337-1-melihemik@noirlang.tr>
References: <20260506175031.25337-1-melihemik@noirlang.tr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  6 May 2026 20:50:31 +0300
Melih Emik <melihemik@noirlang.tr> wrote:

> Replace strcpy() with strscpy() in dell_rbu to use the preferred
> kernel string API for bounded copies.

I think I'm going to find that recommendation and change it :-)

For copies of constant strings into arrays it is actually slightly
better to use strcpy().
There is a subtle difference if the string is too long.
strscpy() will truncate it whereas you'll get a compile-time error
for strcpy().

Normally both calls result in a call to memcpy().
Which can get converted to writes on constants.

You are much better off looking for non-constant strcpy(), strcat()
and strlcat() call.

Once all the 'variable' strcpy() calls have gone the header can be
changed to error and new ones while still allowing strcpy() of quoted
strings into arrays - so there is no need to get rid of them at all.

-- David

> 
> The destination buffer size is known at compile time
> 
> (sizeof(image_type)), so this conversion is safe.
> 
> No functional change intended.
> 
> Signed-off-by: Melih Emik <melihemik@noirlang.tr>
> ---
>  drivers/platform/x86/dell/dell_rbu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
> index 3fa9de9aa47b..85eea8898fac 100644
> --- a/drivers/platform/x86/dell/dell_rbu.c
> +++ b/drivers/platform/x86/dell/dell_rbu.c
> @@ -562,9 +562,9 @@ static ssize_t image_type_write(struct file *filp, struct kobject *kobj,
>  		buffer[count] = '\0';
>  
>  	if (strstr(buffer, "mono"))
> -		strcpy(image_type, "mono");
> +		strscpy(image_type, "mono", sizeof(image_type));
>  	else if (strstr(buffer, "packet"))
> -		strcpy(image_type, "packet");
> +		strscpy(image_type, "packet", sizeof(image_type));
>  	else if (strstr(buffer, "init")) {
>  		/*
>  		 * If due to the user error the driver gets in a bad


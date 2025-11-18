Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0562DA753
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 23:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763508009; cv=none; b=hdcO5o/xEApTf88GIlxYwSYgEmApLICK26Fspbh+tVa+ZlKApiqN05lTdynDKnfsFEwNTnfXMvoYSbUbun4ZGdU1sVtF2sCGNXhGUzX89TBpZOSCx9optMILAlVxJv1KOvO6RLaKAckSNiSG506FsKUQ7VGgBJaXFrT56mlew+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763508009; c=relaxed/simple;
	bh=fb5/owsgtAXIVYWAYWUDjXTvXh92XGrGE7WgKwPpm0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JloLagbSf64u/52bYABHws7YETI84zjM036GLcQZ/vr1+hKfzaT/KPkdfLp2Dqjd0c5nVEvrDiodMo3ZNnNHqx+v2gaT0z1HgaGgK8QCUqTdRWuyhzc9ucp+Ohsh5FCpT/bIlZAPNYUV27R6ODBhz8If69/saXcOmPKjDEZ1Yoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce4T7l23; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce4T7l23"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so40757225e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 15:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763508006; x=1764112806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PzqqnoDdXWWHNMolyasI4kCpWUg/+xfxBfopUxHg9XE=;
        b=ce4T7l23YZnEGuHSQLk3vfBGbkdbsZtKyN1op9s9tAGecdeKGHl6zeguazqrzEnomx
         wOEnvtYu8fx2QFZm6z0OJkW0Q0hWMc9llMHsJGEYN6Z4JnPZ4mDRpeHpl2yQC/n/nr3I
         ag44GJ7E8klHv4O0nYzGpLQKjoC7RtHo/+B53NuwNgiA5SzFPKr20bhxc3GoDBCUsR5p
         P1Fkhag9o0xwrYdSBOCa5VaNawjy05NMjbudvzQa2PdRvvgxOFW/cw29/vnH7u1Nk6aU
         2VMACGZPVWdwr+ewD0tb8PgQic1WmzzdlYmC4TNZmyhLLnos10LhSobcdZ+GbGNBV3q6
         9lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508006; x=1764112806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzqqnoDdXWWHNMolyasI4kCpWUg/+xfxBfopUxHg9XE=;
        b=IjY+eEBQsG22+VzsxxNBFXXMM3XKW1qysustNFIR7d/fmhd5zrjALkHJefOtlSiLW9
         sYgz29NtSDi7vXNbJHtKh9K6qjXv/kLYJLnFwSFw5qd85IQLOKee4i9/dwUL4GvDpzrP
         0BFD+dwEI3NgcyHxs98wKG9NyHdUNzcOnjuZ2meoMgETybNk7Evst9ZPOGmwQuKbo6Os
         ujN7y2WC604qgCaNElAAq2tVSHK8SqeUPQLt2C5JU5nwBZLa0VOyUGatuQpcfuXSqHjv
         yPpByzXiXaWPXyAZt4By8X+Sbnu/H3gXbSf1i4WwbYhfnPLIxuT0ovLOJSxqhd0C4GDI
         dPLA==
X-Forwarded-Encrypted: i=1; AJvYcCUPQ92eqaS/s4AGtYObX8ip7zbNpuQAn0ysNVXWlHShnh2YyNX3jZjZy3CK8VD697FstF+ExJ5HNW51N/plkLZF2KrE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Psp3JBIS2eRPLX/WGXsnbwYYxoAmcdKhzl/PI2nmdBmPQz0X
	nzsZU+hwAxe/ngWXOSAhtQ9lfgu8K1lzXO3IQp1UgiwW9JKa6Feq7IdR
X-Gm-Gg: ASbGncskFYuaFM2YZx3SCWnNMaTQu67GaeF0apRIyn7vAXh+vW65RSKR5C3FsUJ0jj4
	2aE0D8dWmS9yJ4eQd9PBkMiQT4VNTOoqXB5oaHg/bSkFAFAZzecz2a83WDe5nEPM0t6VHm2NF7L
	PZAwJXmmii/4i1zYdQvH6Yw+waXCPXYJopVnJvUrlvETWamgtkisqDc5epTxInt6AezIGwNY0dp
	4cOAhR/wWuEcOnPUNHz8pgwQA68IXfm9iAvdOuJDsE/d5/pkykGUFA/z6HfFmalWRyFzBR5Zpqu
	J8WcH2rIaxRo3wlza4j/RzPZAdwIlzxfJqjYwD5xsvHMnILS4safU3Q7Z7lUYirfAWH5RhjpQB0
	4NCwgAlaJVnoopUPDsKkJt/lEoqFYLpx/mu4LnH1PkMKLXOYnzf91ph27Q43QT7qxIGtgbRQEPp
	OtMhjSKXBvZgUlz4d8K2a/EKs=
X-Google-Smtp-Source: AGHT+IFrZYsH7ugR59NVWvTYdlBeWWMeFulVZI3RcRVYVNUdpIZcURUlWhDyX59TBxf5WrPixV/zBw==
X-Received: by 2002:a05:600c:c8c:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-477b19ee67emr1627475e9.36.1763508005670;
        Tue, 18 Nov 2025 15:20:05 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm35014605f8f.3.2025.11.18.15.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 15:20:05 -0800 (PST)
Message-ID: <773d1033-bcc6-49f0-8da6-4a90ea31ce45@gmail.com>
Date: Wed, 19 Nov 2025 00:20:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] HID: asus: use same report_id in response
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-3-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251101104712.8011-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/1/25 11:47, Antheas Kapenekakis wrote:
> Currently, asus_kbd_get_functions prods the device using feature
> report report_id, but then is hardcoded to check the response through
> FEATURE_KBD_REPORT_ID. This only works if report_id is that value
> (currently true). So, use report_id in the response as well to
> maintain functionality if that value changes in the future.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 7ea1037c3979..4676b7f20caf 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -422,7 +422,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>  	if (!readbuf)
>  		return -ENOMEM;
>  
> -	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
>  				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>  				 HID_REQ_GET_REPORT);
>  	if (ret < 0) {
Why is this patch even here? This should have been sent as a fix on its own
months ago.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>


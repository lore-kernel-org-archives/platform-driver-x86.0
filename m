Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47067A95E
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701097; cv=none; b=HT34ig0XnN9sOu0EDIgY2c3Vw8PWY0SsA1uQ4JAoTOLV/A8/mFzu3kwY0Iu64iRYlXExNP1xvOwpmhECG16EBz5yrdkfVs/C7u9Xw3/2cMyM5FezLumwRK2TXTcb/lmQsrjFXbe2IcAu/cXZGTcQixCFqw7GkNcn+z21i4iHQc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701097; c=relaxed/simple;
	bh=fIPso6GbRnch+OqdR//KIAap+mwzo4oPaeBvI5gLNE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQ1KjcEhEX95CqDkDY3wGLcBNV4colck2H0RO4T59NRhNSSW1qKI7eDMWsu/gJ6mT4mW8L1M96qhG+FoJzOr1vRAB7CNcR0EuqtKe51pzasc7df57EENemPxRj0+UmCNrDWKzyDTuX5xNC32GBw7WBvQb21Hd+7OjOoorAZxfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bBsoWDzx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bBsoWDzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732701094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ+nwHlx1HUbTfHANttGBaGi6lZVKaH4mP6U1ovs5Vk=;
	b=bBsoWDzxTsjDQ6ewpg+GaK3Tcx5Etu+bPjAnx9tYJOrRHkQUszDffc94c2Z9pQhP7kKLcd
	4QteTapPCvDwX3PvAifVttbpZxaMQVM2Uzq/0AaP2AqBdCO7bCUDM1+rOzoz7M0+pUiEGt
	mEKAkjksxUcz5dU+ZU/jL3cslf5S/gg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-Rsubzlg2Nli717cBie_9BA-1; Wed, 27 Nov 2024 04:51:32 -0500
X-MC-Unique: Rsubzlg2Nli717cBie_9BA-1
X-Mimecast-MFC-AGG-ID: Rsubzlg2Nli717cBie_9BA
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa52b4b6962so317086166b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 01:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701091; x=1733305891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZ+nwHlx1HUbTfHANttGBaGi6lZVKaH4mP6U1ovs5Vk=;
        b=NpYMGaQkZzTb5CR2pw98MD4cmphfLHTRtSNJUL1cXUPmRQwmOuWI6vbOoXjmqpx8Wp
         WVhFtZ/2EFYOeY8XWT9E57gEfFUhbjEh454aoek6m/OTfBcnq7uHRUt/mtdWTgmFKe++
         HcdtMszWXQY8vwWIB0WzFXC/Y/viKImBpy0CN1OHOpyZ/eiwEdsZDaSKl6Um0BAAqWIk
         aRyajh6rrk6BgaK06e5GgCMEeav50EzfyYjvKJo5dnr4zjHeZl1ny0lmr5mwr3m8C2nd
         4ySoI04xqNuirR6DTk/EnddC/IRYowTnDpbcoakS3U62nQfn+PsP2MBzigxpmygnUrHG
         ZHkA==
X-Forwarded-Encrypted: i=1; AJvYcCVf7lrrO+HFxMoGHBFYgBsYFunSC0XPkfBDntR6PLmO4UGbrvwLbgBjhJ/5z0c1aSJ6aj3ZZjic9r42fydNhcrOO+Dp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zqHYDfa+NrJ+caRM03YaJcuj2qn7CYjuZceRdaGTTWXAS5oq
	HGCPKxwfpDPusdJoCtYsUhbjuGg4+0KrRYXCtVk69BSDhwukcJC5YE9R0i9dTIbtAKbPm37XP1v
	xAhco2oqDUtpTxB9SzEEC4x/FhEUuAqU00RvOiAR1UC6Vo18zgyHv3TAVUGZY5o9yTgMuGtI=
X-Gm-Gg: ASbGncvSvLXGOy8Xur3DM59x/SH8Yy/1d7XGk1ABOi8KYEOyyl4jR3uPAyWIsV7uh1K
	VDmXvwawPRor9E6gvtnYVaWMN0nivzTBYJAlaOuMwo5ccZt90Fh7bP8GdLIaZeWF8IfcAHYUTL3
	oxhKSOliE/8T/Q0qQ63vQ+4UNRX9fuBZrD3PRyvZQSYNt3PvuokluyvDyy3pZduQlqO343NlTsI
	IOhFisSWrEKn/hcfxnR/1O7FYvXDMcoxGWSy0N5wDGtf6RvXmxoT5FQDeZdYdoXv0PBz+7RGYZG
	qfaTICF5hULuA4XfGjR2IAPlN17VJt4tL4EmJwPzECBYI3LCundyKcLpU3CpGN3y/TwYd3z7DZ9
	KOGWC+7cASoXRCUObqQdEWc5X
X-Received: by 2002:a17:906:2921:b0:aa5:1a75:dcdc with SMTP id a640c23a62f3a-aa580f58dffmr127551066b.34.1732701091109;
        Wed, 27 Nov 2024 01:51:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhbrdAA6wzSbbZw5ydJDIsa7NnQUU/NdVhxZ2ks7hTIPUR1HrigZs6/4wfXXXHajYVQs7WxA==
X-Received: by 2002:a17:906:2921:b0:aa5:1a75:dcdc with SMTP id a640c23a62f3a-aa580f58dffmr127549966b.34.1732701090743;
        Wed, 27 Nov 2024 01:51:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5b9040sm692395066b.186.2024.11.27.01.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:51:30 -0800 (PST)
Message-ID: <f2346173-cd36-4669-9c0b-24fe075128f6@redhat.com>
Date: Wed, 27 Nov 2024 10:51:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] p2sb: Fix unexpected P2SB device disappearance
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com, danielwa@cisco.com
References: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Nov-24 7:00 AM, Shin'ichiro Kawasaki wrote:
> When the BIOS does not hide the P2SB device, it is expected to be visible from
> userspace. However, the P2SB device disappears since the commit 5913320eb0b3
> ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe") [1]. This
> series addresses the problem. The first three patches are preliminary
> refactoring for the fix. The last patch resolves the issue by caching the P2SB
> device resources only if the BIOS hides the P2SB device.
> 
> [1] https://lore.kernel.org/lkml/ZzTI+biIUTvFT6NC@goliath/
> 
> Changes from v2:
> * Renamed the global flag from p2sb_hidden to p2sb_hidden_by_bios
> * Moved P2SB hide and unhide code to p2sb_scan_and_cache()
> * Introduced two helper functions which are called from p2sb_bar()
> * Separated the preliminary refactoring work to 3 new patches
> * Link to v2: https://lore.kernel.org/platform-driver-x86/20241125042326.304780-1-shinichiro.kawasaki@wdc.com/

Thank you for all your work on this.

This new split out series is much easier to review, much appreciated.

All patches look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans





> Changes from v1:
> * Put back P2SBC_HIDE flag reference code in the rescan_remove lock region
> * Do not cache resources when the P2SB device is not hidden
> * Added the Reported-by tag
> * Link to v1: https://lore.kernel.org/platform-driver-x86/20241120064055.245969-1-shinichiro.kawasaki@wdc.com/
> 
> Shin'ichiro Kawasaki (4):
>   p2sb: Factor out p2sb_read_from_cache()
>   p2sb: Introduce the global flag p2sb_hidden_by_bios
>   p2sb: Move P2SB hide and unhide code to p2sb_scan_and_cache()
>   p2sb: Do not scan and remove the P2SB device when it is unhidden
> 
>  drivers/platform/x86/p2sb.c | 77 ++++++++++++++++++++++++++-----------
>  1 file changed, 55 insertions(+), 22 deletions(-)
> 


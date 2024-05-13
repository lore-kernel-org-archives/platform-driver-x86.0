Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0D814D2B2
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715601808; cv=none; b=movCdX4loivJBA12Z8eeJnX3F6KLb3cMDMagAFKnwiIxEZZKro2vO9ef74hQy18XVCaW6UpGCQCrV7Inzv9i3FKEAVCO3WVGCQio8OfUIO4yonfOWkGFQyTwT1ZTr2boqShPH2x4QnDi1wlQgokqkWtOCURNVDNJkK/hoEv/UD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715601808; c=relaxed/simple;
	bh=9v46DOtoCtPx3deO2gpdg8ipRFMAGh1txJKl+pUtw8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfAg9+gcRYZVbyTch33mg+QkHFv8yUoudGT5iOP/cHPaELxhK8KVfVt1yQ9Uqocow53Zf+LUf2vHF4B1Ygxn7sr04cRRS8NX3omHAF/zFe5dJbxIUHFsDvPPUHfo8l2QnInFu4L9sPfhp+5H5uyTRnmKeDL23OlbE3GJsUJrUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G95b4L9H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G95b4L9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715601805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmXU/OebYF8kESlWqWUxls9X3mxoHXPcTWE7A16L9IE=;
	b=G95b4L9HXhG3iOw7xb1vsvNBJGtdaE+QlCRxBK6+eQ4SsQ3tdWneOr7JFv0v2IgVi+AlkR
	UYRymQQH/f8Kx4ptoxjNn/EWTjpdW2BC4f9P6RKiGPvuIKymLQG7BUlo4WDEoUBgIegCV3
	8Q6J1bZmjmTTdUUE+ti7TAZLAHYawnE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-YTjZ4yYEMtyBPTTfyzu6KA-1; Mon, 13 May 2024 08:03:23 -0400
X-MC-Unique: YTjZ4yYEMtyBPTTfyzu6KA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a599b55056bso261215066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 05:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601802; x=1716206602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmXU/OebYF8kESlWqWUxls9X3mxoHXPcTWE7A16L9IE=;
        b=kmdKFdxT1HWC2XcMNWDFu/ghcACgZbE5pxJYjxPHg+wB1T13Vg5yui2T8gT2V2Fz9H
         WnNbHIHmbLGIECV2c17EWsonhpo49tiP1YmRd2gKTCmO5V/esDF7wFSq3K+VAwd8DjTa
         G4pzzA/ZrPrz7p8sWCvzpvL0bh4KpGc1CTQz2K05TftPJctYE6YNWlXK7wNbPm3LTbJV
         NxhDe5OoklxfoE96Xj3BKN2TjWtZNwuqNdAfpNGQ2ImNquIgi9201qEHdZDPMxDOd37I
         u5lCY1N5CPWsdUdOW3FKb7Th8rk10dMoip1UzP+v0yv0zWsC4+gTMa1SNNjP1U31Vae+
         bmZA==
X-Forwarded-Encrypted: i=1; AJvYcCWKm5Nkcz0SIfsE6pkz0wU7fMiEIU3ywAZOJ5K8hkh5Z05kppn4Egt8rwOKmyf3ljhxP7InU0yH1eePBhXfSFbk4QaVg3LAqvPzfWEi0I+LQQgckQ==
X-Gm-Message-State: AOJu0Yxlll+LYg8VBTwUgjhRojj16YvoqJxTMeR66ATQOvDExeXOB0UN
	UK+k96/74O8SBrd5GJYsAGnm0aaYe9tGXMy13PRJQneV142wlltZDTeUbOJRKCbaOanH+p5/5Pr
	8w6Dhd8Xtvmmix2d+FOK/WAtSAUnlViT9jfnMXTX6808apZhEfnjdUUDQTO8TOL9nxMyTsS0=
X-Received: by 2002:a17:906:aad0:b0:a59:cfab:50d with SMTP id a640c23a62f3a-a5a2d536daemr632207366b.2.1715601802734;
        Mon, 13 May 2024 05:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOSYLzF/c1ldnDEBTul+Z4tWR29hhou430+Bl6cslc7jUse5ojohz8EKDIm2rZfXZU31xO5A==
X-Received: by 2002:a17:906:aad0:b0:a59:cfab:50d with SMTP id a640c23a62f3a-a5a2d536daemr632205866b.2.1715601802334;
        Mon, 13 May 2024 05:03:22 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01785sm587479566b.164.2024.05.13.05.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 05:03:21 -0700 (PDT)
Message-ID: <7867b308-7cea-4282-82e8-551d88fe70c4@redhat.com>
Date: Mon, 13 May 2024 14:03:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] p2sb: Don't init until unassigned resources have been
 assigned.
To: bcfradella@proton.me, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ben Fradella <bfradell@netapp.com>, Ranjan Dutta
 <ranjan.dutta@intel.com>, Yifan2 Li <yifan2.li@intel.com>,
 Jonathan Yong <jonathan.yong@intel.com>
References: <20240509164905.41016-1-bcfradella@proton.me>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240509164905.41016-1-bcfradella@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/9/24 6:49 PM, bcfradella@proton.me wrote:
> From: Ben Fradella <bfradell@netapp.com>
> 
> The P2SB could get an invalid BAR from the BIOS, and that won't be fixed
> up until pcibios_assign_resources(), which is an fs_initcall().
> 
> - Move p2sb_fs_init() to an fs_initcall_sync(). This is still early
>   enough to avoid a race with any dependent drivers.
> 
> - Add a check for IORESOURCE_UNSET in p2sb_valid_resource() to catch
>   unset BARs going forward.
> 
> - Return error values from p2sb_fs_init() so that the 'initcall_debug'
>   cmdline arg provides useful data.
> 
> Signed-off-by: Ben Fradella <bfradell@netapp.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/p2sb.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
> index 3d66e1d4eb1f..1938a3ef9480 100644
> --- a/drivers/platform/x86/p2sb.c
> +++ b/drivers/platform/x86/p2sb.c
> @@ -56,12 +56,9 @@ static int p2sb_get_devfn(unsigned int *devfn)
>  	return 0;
>  }
>  
> -static bool p2sb_valid_resource(struct resource *res)
> +static bool p2sb_valid_resource(const struct resource *res)
>  {
> -	if (res->flags)
> -		return true;
> -
> -	return false;
> +	return res->flags & ~IORESOURCE_UNSET;
>  }
>  
>  /* Copy resource from the first BAR of the device in question */
> @@ -220,16 +217,20 @@ EXPORT_SYMBOL_GPL(p2sb_bar);
>  
>  static int __init p2sb_fs_init(void)
>  {
> -	p2sb_cache_resources();
> -	return 0;
> +	return p2sb_cache_resources();
>  }
>  
>  /*
> - * pci_rescan_remove_lock to avoid access to unhidden P2SB devices can
> - * not be locked in sysfs pci bus rescan path because of deadlock. To
> - * avoid the deadlock, access to P2SB devices with the lock at an early
> - * step in kernel initialization and cache required resources. This
> - * should happen after subsys_initcall which initializes PCI subsystem
> - * and before device_initcall which requires P2SB resources.
> + * pci_rescan_remove_lock() can not be locked in sysfs pci bus rescan path
> + * because of deadlock. To avoid the deadlock, access P2SB devices with the lock
> + * at an early step in kernel initialization and cache required resources.
> + *
> + * We want to run as early as possible. If the P2SB was assigned a bad BAR,
> + * we'll need to wait on pcibios_assign_resources() to fix it. So, our list of
> + * initcall dependencies looks something like this:
> + *
> + * ...
> + * subsys_initcall (pci_subsys_init)
> + * fs_initcall     (pcibios_assign_resources)
>   */
> -fs_initcall(p2sb_fs_init);
> +fs_initcall_sync(p2sb_fs_init);


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B357717E473
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723472997; cv=none; b=UxVD4HZp9RdW0X/6tD6RCDiLBqaWyOmDg44rHpYCVprXawIoFkwvXwNsjQdlZJwPTVEC2/feS/0b+tceenoKyi8dsTmUSCSmHy66UzTXHV3YTqBC4qwilvdhjsvGuSh2HFm7VlOR28kW4ny/+3WQYIiyMfGTkTvBDnMN+IULC9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723472997; c=relaxed/simple;
	bh=id+cinWoh0HX1vNZVJENoaAqLpfhtEodxd9YXluVEIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCuc4s7c1SyscenCe0QUHjrKQiB2Na9Krn7ObmMhkvOeX6cDJdO0r3lIhVj8SFmjoOH7BbLHShgoKC0q9jWRUfjCiP6OmaTwtp6KWhJNugr0NpdKnyxuNloKcj99GWqyDY/WYYciq4hKRDTE7EwDMJz5iKWleP9IA99LEJOPLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c+uTLQlO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c+uTLQlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723472994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nowmtH7b9dRQxR0SqMGGItLP2W74cRVJT97tMEoitUk=;
	b=c+uTLQlO6fhCGofS0RZbbNDPVIBp8SAFPT08WgBQovuR0epVzwR1P1rPZ81LF2YkkAdcLg
	7u2WQ2PfqLcFmnfik2ZdRxxLkvvSe6NyoOBB0RkEIYaO0N+vxFqoMoG/h7SIwNJw+FDApy
	iLBSPVA266srsJVRF4C6XzSWeAf7180=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-weLaqu_TMLO6kKdalkVSKw-1; Mon, 12 Aug 2024 10:29:52 -0400
X-MC-Unique: weLaqu_TMLO6kKdalkVSKw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7ab50e6735so203916366b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 07:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723472991; x=1724077791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nowmtH7b9dRQxR0SqMGGItLP2W74cRVJT97tMEoitUk=;
        b=cPGqnzLlEmEEdzPQWVvVOFOaDKLDJ3WsPK02QkJtGSNfftBGmGt+OLCjpTwfT9t3RB
         G3kX9un50fGhGVOpGLD/KvvLnod82RQ+ZsHUIQN754Sh7suLTWtSjWQWm+J5ozVSncKz
         QLPfllQuatmnBERPMr6uDMhVg2AzF1COU73FYpz8xFDp4e+eWS50V2Azk3/N5NRbHjjp
         q3Z9EIntyygpa8gXqS7mt9II9blZuSa6dSnfNFTjJlsOeDWgv53MV/UX54ySSB6RbGze
         c5lDCmRRHRg6xjbHJI8Zwtgx3d7e9EQ4ubNCvuI76ApDCNwvF4JiC+/sXiOP2M1OSvuu
         5Ibw==
X-Gm-Message-State: AOJu0YyJfHY79feg2rISlHSKW0w9NFX//qxHiCPA6i6NBWaSY+nb/RUg
	bg2bAvURe5fFY9Q4DfPF5OcZm1Vuwrt3HkwTtUbrqHG6J+TVO2aCmhKcnZ03HAu9t2p9oXpqxU5
	igh2XyobaLs4fCVaMGXAFastbotHPFkImW1akDYY2sxxBqUd5HoG6St4sRwCGykZKHMEy3uk=
X-Received: by 2002:a17:906:6a0a:b0:a7d:edb2:220f with SMTP id a640c23a62f3a-a80ed2d617amr32927766b.59.1723472991050;
        Mon, 12 Aug 2024 07:29:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3ce01ffkOj4R4jJIKBNnGjeGJxL000i2dwMze7FlQ3NqttbVoJYHDOL/8zlsGcsJx7f/kRA==
X-Received: by 2002:a17:906:6a0a:b0:a7d:edb2:220f with SMTP id a640c23a62f3a-a80ed2d617amr32925666b.59.1723472990474;
        Mon, 12 Aug 2024 07:29:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb2421b3sm234785666b.194.2024.08.12.07.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 07:29:50 -0700 (PDT)
Message-ID: <3c1fad80-e0c2-4bc2-bcd5-4409ed1f0c4c@redhat.com>
Date: Mon, 12 Aug 2024 16:29:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] platform: x86: Use backlight power constants
To: Thomas Zimmermann <tzimmermann@suse.de>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240731125220.1147348-1-tzimmermann@suse.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240731125220.1147348-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/31/24 2:50 PM, Thomas Zimmermann wrote:
> Commit a1cacb8a8e70 ("backlight: Add BACKLIGHT_POWER_ constants for
> power states") introduced dedicated constants for backlight power states.
> Convert X86 platform drivers to the new constants.
> 
> The new constants replace the fbdev constants. This is part of a larger
> effort to make kernel subsystems more independent from fbdev code and
> headers.
> 
> Thomas Zimmermann (10):
>   platform/x86: acer-wmi:  Use backlight power constants
>   platform/x86: asus-laptop: Use backlight power constants
>   platform/x86: asus-nb-wmi: Use backlight power constants
>   platform/x86: asus-wmi: Use backlight power constants
>   platform/x86: eeepc-laptop: Use backlight power constants
>   platform/x86: eeepc-wmi: Use backlight power constants
>   platform/x86: fujitsu-laptop: Use backlight power constants
>   platform/x86: ideapad-laptop: Use backlight power constants
>   platform/x86: oaktrail: Use backlight power constants
>   platform/x86: samsung-laptop: Use backlight power constants

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





>  drivers/platform/x86/acer-wmi.c       |  3 +--
>  drivers/platform/x86/asus-laptop.c    |  3 +--
>  drivers/platform/x86/asus-nb-wmi.c    |  4 ++--
>  drivers/platform/x86/asus-wmi.c       | 17 ++++++++---------
>  drivers/platform/x86/eeepc-laptop.c   |  3 +--
>  drivers/platform/x86/eeepc-wmi.c      |  4 ++--
>  drivers/platform/x86/fujitsu-laptop.c |  9 ++++-----
>  drivers/platform/x86/ideapad-laptop.c |  7 +++----
>  drivers/platform/x86/intel/oaktrail.c |  3 +--
>  drivers/platform/x86/samsung-laptop.c |  5 ++---
>  10 files changed, 25 insertions(+), 33 deletions(-)
> 


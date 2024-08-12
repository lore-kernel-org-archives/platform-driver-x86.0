Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC01474D3
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723449828; cv=none; b=Qj9nMNVPHYqlPdRt90OOFtnKINsu6JczJKVIjSmFa3Ll9aRgHLGecGMnKxsaWY9X+X96plv3F+qR5oshKEeuhEOSR9lYhg6FZsdvHJp5+bcgj/71/iaoEUSyASb6SA4HUnmRXJscbUqiToLMYMypeHJDF+Well7d5E2SYwG8COk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723449828; c=relaxed/simple;
	bh=3+fW38DLysNHEeU/bB/JOYZMIAeP8Gd2GLrupAClr6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIhDry7SmAXHmrWYyITBAVg2pWBoHPwNeU3WvvEk36iHnJ1h7ZDR86yKzwO00IVt1KFNvb9teHxgoM/rFWCDNhFvABC/q7WB6u0YFAleUII0TyikRP/ObZJ2cWESu8jDOQm5GW5zKk827hhtJR2j79TOsq8KBBH4z4hChxbentE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JLSuQ/F5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JLSuQ/F5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723449825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bMEWCZfGINWIuaM9V0hQWZlxuCPLotKRt3xJNGAE10g=;
	b=JLSuQ/F5C7SOfBOdXAuM8Tz+Vt/uT3dkTyHLvpcMNoxhTAKHt5tPX3gqVadK3cXIekK9yr
	uXwSDOb2+q1TWipLwCwycV8XgM6xNZelnhYxK3uZ2R3t/oWdYEts+U03KKrTNi0WDgeBc4
	Gnfde0jVZnlpzBxF2mC/fc1CjKObmiQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161--qXESafPPxOBZbfu3Geb0Q-1; Mon, 12 Aug 2024 04:03:42 -0400
X-MC-Unique: -qXESafPPxOBZbfu3Geb0Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5a37b858388so3548669a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 01:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723449821; x=1724054621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMEWCZfGINWIuaM9V0hQWZlxuCPLotKRt3xJNGAE10g=;
        b=eTfGvAEnJ3/4cJADTxDHL5hr/v0S3DY6XMoUk5Me7rcCn0RBwMQ+gNxwDomRmEHAQh
         zGYgUHQm+MtsR50li60Vxz4jXW0UYAlJSia4ZzaupHE2SLXQyY4P0Yo95pGvRcajyJ7O
         nkzWRlN/ouxJV30Sikn8/M1K7A4WtxQ8oPylFaK/guibXxvzL0WxManioS5GR3TKrLfn
         tBL/ty81Ya4Pt+bYENiPbSGsP6m38sVfz/eHHVvz4afTeJEn3r3QCOeUaiXXoi0ghSIQ
         nj+a6kGLmmbUerOQgh5rCn3QN1uoljuae8cfDNsQv1PpkTS95n8X7p89HPMkmLY4VxTS
         MsAw==
X-Forwarded-Encrypted: i=1; AJvYcCX874Thc3OHGfC0yF+n2VpUAk1G0jjitiAh1i3LCRKuX3PdW7/ajH00rNoxUsSjmJ6hpO6APURch5T4uRQCZVNxLWtfgVzif1jAJIS6vLEkxfyFhg==
X-Gm-Message-State: AOJu0YyLrYn00IEwBocpHvlts8KTD1848xO9spdRfpsBaZReplO1boFY
	mQmC8+F/1q+selWVWAZ8teMHJBKeUHr7/5iq3ur8k1/N2RCi5u8xbz0w9th9nz915+hJvuyWM5a
	MQ3/jfOXyR2jBr8KcOicDjweVwp0V0WyZIVNeo2oFFFRxvS613DZUFfStS18k4H7IrwATQpU=
X-Received: by 2002:a05:6402:3596:b0:57c:a422:677b with SMTP id 4fb4d7f45d1cf-5bd0a54f3b4mr6742453a12.8.1723449821216;
        Mon, 12 Aug 2024 01:03:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyibtTth1qSsxtaLdq8WoHrOHerIA8cn4MSfTUClG3qoc+ETcalaGZic8/99onwFWG45Pivg==
X-Received: by 2002:a05:6402:3596:b0:57c:a422:677b with SMTP id 4fb4d7f45d1cf-5bd0a54f3b4mr6742429a12.8.1723449820612;
        Mon, 12 Aug 2024 01:03:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd190adb45sm1931869a12.32.2024.08.12.01.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 01:03:40 -0700 (PDT)
Message-ID: <935e8c82-3c91-4c9a-8e43-e6045b28279d@redhat.com>
Date: Mon, 12 Aug 2024 10:03:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] clocksource: acpi_pm: Add external callback for
 suspend/resume
To: Marek Maslanka <mmaslanka@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <87ed6xtsms.ffs@tglx>
 <20240812043741.3434744-1-mmaslanka@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240812043741.3434744-1-mmaslanka@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

On 8/12/24 6:37 AM, Marek Maslanka wrote:
> Provides the capability to register an external callback for the ACPI PM
> timer, which is called during the suspend and resume processes.
> 
> Signed-off-by: Marek Maslanka <mmaslanka@google.com>
> 
> ---
> Changes in v5:
> - Rename acpi_pm_register_suspend_resume_callback to
>   acpi_pmtmr_register_suspend_resume_callback and move prototype to
>   include/linux/acpi_pmtmr.h
> - Remove the acpi_pm.h header added in the previous patch.
> - Link to v4: https://lore.kernel.org/lkml/20240809131343.1173369-1-mmaslanka@google.com/
> ---
> ---
>  drivers/clocksource/acpi_pm.c | 24 ++++++++++++++++++++++++
>  include/linux/acpi_pmtmr.h    |  8 ++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/clocksource/acpi_pm.c b/drivers/clocksource/acpi_pm.c
> index 82338773602ca..fab19b7de55c1 100644
> --- a/drivers/clocksource/acpi_pm.c
> +++ b/drivers/clocksource/acpi_pm.c
> @@ -25,6 +25,10 @@
>  #include <asm/io.h>
>  #include <asm/time.h>
>  
> +static void *suspend_resume_cb_data;
> +
> +static void (*suspend_resume_callback)(void *data, bool suspend);
> +
>  /*
>   * The I/O port the PMTMR resides at.
>   * The location is detected during setup_arch(),
> @@ -58,6 +62,24 @@ u32 acpi_pm_read_verified(void)
>  	return v2;
>  }
>  
> +void acpi_pmtmr_register_suspend_resume_callback(void (*cb)(void *data, bool suspend), void *data)
> +{
> +	suspend_resume_callback = cb;
> +	suspend_resume_cb_data = data;
> +}

The intel-pmc driver which is a consumer of this symbol can be build as
a module, so this needs a EXPORT_SYMBOL_GPL().

Also the pmc driver can be unbound from its device, or the entire
module can be removed, so this also needs an unregister function
to match, so that the pmc driver can unregister its callback
from pmc_core_remove().

Regards,

Hans



> +
> +static void acpi_pm_suspend(struct clocksource *cs)
> +{
> +	if (suspend_resume_callback)
> +		suspend_resume_callback(suspend_resume_cb_data, true);
> +}
> +
> +static void acpi_pm_resume(struct clocksource *cs)
> +{
> +	if (suspend_resume_callback)
> +		suspend_resume_callback(suspend_resume_cb_data, false);
> +}
> +
>  static u64 acpi_pm_read(struct clocksource *cs)
>  {
>  	return (u64)read_pmtmr();
> @@ -69,6 +91,8 @@ static struct clocksource clocksource_acpi_pm = {
>  	.read		= acpi_pm_read,
>  	.mask		= (u64)ACPI_PM_MASK,
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
> +	.suspend	= acpi_pm_suspend,
> +	.resume		= acpi_pm_resume,
>  };
>  
>  
> diff --git a/include/linux/acpi_pmtmr.h b/include/linux/acpi_pmtmr.h
> index 50d88bf1498d7..a5262d28b97e0 100644
> --- a/include/linux/acpi_pmtmr.h
> +++ b/include/linux/acpi_pmtmr.h
> @@ -26,6 +26,14 @@ static inline u32 acpi_pm_read_early(void)
>  	return acpi_pm_read_verified() & ACPI_PM_MASK;
>  }
>  
> +/**
> + * Register callback for suspend and resume event
> + *
> + * @cb Callback triggered on suspend and resume
> + * @data Data passed with the callback
> + */
> +void acpi_pmtmr_register_suspend_resume_callback(void (*cb)(void *data, bool suspend), void *data);
> +
>  #else
>  
>  static inline u32 acpi_pm_read_early(void)


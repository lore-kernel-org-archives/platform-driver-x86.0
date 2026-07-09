Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009F5B1EB
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 03:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569162; cv=none; b=l1clQH8y/TxNbMPfnBZI4yizt23AMJc30Ol4VvtlImryWTCG/w+rrJW45TT0Rzh35it82jQL8ZQ1+mJJmXGMb3djbcuo/WEa1sa1ZnLuvHUm6j0DGaKKpJnzx8ov8SCHx+S7O6OgOsGUW/oKxoq80DGmeBNTZgUMWN+HOGy1qTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569162; c=relaxed/simple;
	bh=T22WlFV9BXj/7lt8yZnDD+J8qdeOeZznO+4KCjRo9GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyxD0eGYk80oKlDBXJVgJIp+ZtigOSJoELRx3HvYoac6u5GUGhMq0CefvnZHJnWQQQDcIzpwM31OjHljJJAFPTTdCUlDyADRn1YF3oQODq7PkSM4ohq3vpC+gYAO818jVzeIIaw+VA/FfzlR4Q/sQivMq5qLFfIED7k2R9VYSDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RmGWaaM1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RmGWaaM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783569160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0H8JF3mhLhF6haw2AIvFyd1HlITa9LWt9oFByBfJwp4=;
	b=RmGWaaM1rHJL0gRq1XaicHYICRl3T5QlFXcMacAhbWOxDAgVrGKm4UaIqEoSVhCT4dmH6F
	60ldY9PU18TegyzVzDiMgDHnvNInYgONEKxP/Zn16Q6lWAJI1Zf4Bv2knCBJDA+C4TLGur
	BJ97+rpt1oDgkGqkZyna/jGHBF9EVRA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-383-aV5FGsHkP06RLhWDkSSyaA-1; Wed,
 08 Jul 2026 23:52:38 -0400
X-MC-Unique: aV5FGsHkP06RLhWDkSSyaA-1
X-Mimecast-MFC-AGG-ID: aV5FGsHkP06RLhWDkSSyaA_1783569157
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94F9F19560B5;
	Thu,  9 Jul 2026 03:52:36 +0000 (UTC)
Received: from [10.67.32.20] (unknown [10.67.32.20])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C17F418005B8;
	Thu,  9 Jul 2026 03:52:32 +0000 (UTC)
Message-ID: <5db117b7-aad1-437f-a3d4-ba7b29fc68b3@redhat.com>
Date: Wed, 8 Jul 2026 23:52:30 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: temporarily revert to setting a
 charge limit
To: Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>,
 Travers Biddle <traversbiddle@gmail.com>
References: <20260630230940.612532-1-denis.benato@linux.dev>
Content-Language: en-US
From: Kate Hsuan <hpa@redhat.com>
In-Reply-To: <20260630230940.612532-1-denis.benato@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Denis,

Upower 1.91.3 has been released, including a fix for issue #347 [1]. 
This release addresses the -ENODATA  encountered when accessing charge 
limits on Asus laptops, which previously caused UPower and GNOME to 
incorrectly report charge threshold support as unavailable. The fix 
updates the udev rule to verify file existence rather than reading the 
attribute directly. The corresponding commit can be found at:

https://gitlab.freedesktop.org/upower/upower/-/commit/83f86c75d28a57854a4b5986cbfb701249a5b6ad

[1] https://gitlab.freedesktop.org/upower/upower/-/work_items/347

Thank you :)

On 6/30/26 7:09 PM, Denis Benato wrote:
> A userspace regression has been observed leaving the battery charging
> threshold unconfigured, so while the situation is being sorted revert
> the change keeping the infrastructure in place to return to the
> preferred behaviour whenever possible.
>
> Link: https://gitlab.freedesktop.org/upower/upower/-/work_items/347
> Closes: https://lore.kernel.org/all/CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com/
>
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>   drivers/platform/x86/asus-wmi.c | 26 +++++++++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3c9ef826551d..e835779b6f5f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1618,6 +1618,8 @@ static DEVICE_ATTR_RW(charge_control_end_threshold);
>   
>   static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
>   {
> +	int ret, rv;
> +
>   	/* The WMI method does not provide a way to specific a battery, so we
>   	 * just assume it is the first battery.
>   	 * Note: On some newer ASUS laptops (Zenbook UM431DA), the primary/first
> @@ -1635,12 +1637,30 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>   
>   	/* The charge threshold is only reset when the system is power cycled,
>   	 * and we can't read the current threshold, however the majority of
> -	 * platforms retains it, therefore signal the threshold as unknown
> -	 * until user explicitly sets it to a new value.
> +	 * platforms retains it.
> +	 *
> +	 * Setting a negative value would signal the threshold as unknown
> +	 * until user explicitly sets it to a new value, however to avoid
> +	 * regressing userspace, we initialize it to a value of 100.
>   	 */
> -	charge_end_threshold = -1;
> +	charge_end_threshold = 100;
> +	ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, charge_end_threshold, &rv);
> +	if (ret) {
> +		pr_err("Failed to reset battery charge threshold\n");
> +		goto asus_wmi_battery_add_err;
> +	}
> +
> +	if (rv != 1) {
> +		pr_err("Error in battery charge threshold reset\n");
> +		ret = -EIO;
> +		goto asus_wmi_battery_add_err;
> +	}
>   
>   	return 0;
> +asus_wmi_battery_add_err:
> +	device_remove_file(&battery->dev,
> +			   &dev_attr_charge_control_end_threshold);
> +	return ret;
>   }
>   
>   static int asus_wmi_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)


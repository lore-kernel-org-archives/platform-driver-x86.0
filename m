Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055F5166F34
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728210702; cv=none; b=pvZ30+ZeNOEGzK3KQqzFkJBF8Kn4Xp1pea5/ztgj4jT59lGDqtQqDT6stwKEux13cdVsfBlWJOBPu73JtYldJ6+yyiZM2sew95goCriLDJk/UpzHb+Ous9MNBJiDBJAwZEvtIs7sabpv8pzbqzims+bQcultkBR2tRmThDeX+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728210702; c=relaxed/simple;
	bh=+1hMTw3yjrhtuWg/B41NsVCZVs0eLqPm2W6ekE6WIWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcJ/1cFMzLmWShOoOLDRnkG1ws6dkp/liOYCIPZnkglTxjR7vcp77lscTziNuGtGEnQBbCUZ5uwapFtXMxtwOflM4NKDdJXJsRpd94Rip8WhpzwkN6guyfE7/ZN5Aop5wmLA/jB0130gnnb6u+v8GsQnm/xnBXZV8kZzZeh96BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+yOCOO7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+yOCOO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728210699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCGr2POOT5uxbuD68RQ0lpX6z0IGw4KIWstExrGNdbk=;
	b=L+yOCOO7ksXHrOwzZFsQCvHkQ34P10dJeuawEgw1zVjv35+TC+wXTXlkiKuPcYbykGYKzy
	rr1VLRyxiM7A5id3DQYA+HEs1fzSLX0tLcfe1iQ9y+Ec3Oi5/d2iCBYk+aVMRIY56d1N5x
	rqH9Od7LOigOAixL+EUI4OfUmIoTvTU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-YysJIU0bMYKywUMzENX5_A-1; Sun, 06 Oct 2024 06:31:38 -0400
X-MC-Unique: YysJIU0bMYKywUMzENX5_A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8711c48990so369938366b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Oct 2024 03:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728210697; x=1728815497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCGr2POOT5uxbuD68RQ0lpX6z0IGw4KIWstExrGNdbk=;
        b=R3jZyvio9Qx72s/2jQJbR39ZAcetOcinqwpG34YFNfonjNh8XOn0yxtpdXWXG+vuCi
         NQCXz/xdhfQq5aHN8mUrF7RACHlA+23v67V1Suo+8pJfJBdaClyB3zjPGrDgKusec/m+
         QqyRe9XNJkKaky+QzrWtE6cCYJwIS06Jqt2HrbDjwnN7UEGaZLKDHWLQw26FORJSqo13
         dNvhAZykfI/1P+9OCyednvaxnDeUtA7sZeLr7XpCtC664XwQlmPm6/itiw0J9NfzTi3p
         2BBXgJ/TQZIbnZ8j/cdcFiAONEjPyRYncJVZlQ51C0iOnhwvh9BZk2dZgwq2M4VRKRFi
         p/jg==
X-Forwarded-Encrypted: i=1; AJvYcCWEmnpwnXxOFRodsvCSxxN/jAFfsonAatbrY9rPRu4i0ZYH3E8exZRhv7xSSZWwv1u48J/asUd8qH7cZHlv5cZxPt2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzcQgt2vVaK3lUVL9U0mnb3Dj5MM0hmPwfUEGrkpbIm4J6R9Fua
	c5eBFKd4TQn0P42cxLZlpOvgXPFrYgr1ZFOSZnZVTWQws8iT4KSMzZBhyF9mK6DINRontmmk2WV
	RvkXeXQQazpvEXkonyUX+Y4QC7cS39rlCwwJGHzZeNVEmW/8k125rnNbyL7X8w4XUl1cIlr0=
X-Received: by 2002:a17:907:745:b0:a8d:caa:7fee with SMTP id a640c23a62f3a-a991bd04d9fmr915433466b.7.1728210697264;
        Sun, 06 Oct 2024 03:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSx1R/LgYBtLI5vnf0Pf3LDe+dvGQmKU2skfmJeTA+eT0pHsSB2e/ggYoF1agP+LPkJ5N0lg==
X-Received: by 2002:a17:907:745:b0:a8d:caa:7fee with SMTP id a640c23a62f3a-a991bd04d9fmr915431166b.7.1728210696829;
        Sun, 06 Oct 2024 03:31:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e0598947sm1867769a12.11.2024.10.06.03.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:31:35 -0700 (PDT)
Message-ID: <9cfb6e26-e3d1-403a-a894-4a0902905407@redhat.com>
Date: Sun, 6 Oct 2024 12:31:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/3] platform/x86: dell-laptop: Do not fail when
 encountering unsupported batteries
To: Armin Wolf <W_Armin@gmx.de>, pali@kernel.org, dilinger@queued.net
Cc: rafael@kernel.org, lenb@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241001212835.341788-1-W_Armin@gmx.de>
 <20241001212835.341788-4-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241001212835.341788-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1-Oct-24 11:28 PM, Armin Wolf wrote:
> If the battery hook encounters a unsupported battery, it will
> return an error. This in turn will cause the battery driver to
> automatically unregister the battery hook.
> 
> On machines with multiple batteries however, this will prevent
> the battery hook from handling the primary battery, since it will
> always get unregistered upon encountering one of the unsupported
> batteries.
> 
> Fix this by simply ignoring unsupported batteries.
> 
> Reviewed-by: Pali Rohár <pali@kernel.org>
> Fixes: ab58016c68cc ("platform/x86:dell-laptop: Add knobs to change battery charge settings")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/dell/dell-laptop.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index a3cd0505f282..5671bd0deee7 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -2391,12 +2391,18 @@ static struct attribute *dell_battery_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(dell_battery);
> 
> +static bool dell_battery_supported(struct power_supply *battery)
> +{
> +	/* We currently only support the primary battery */
> +	return strcmp(battery->desc->name, "BAT0") == 0;
> +}
> +
>  static int dell_battery_add(struct power_supply *battery,
>  		struct acpi_battery_hook *hook)
>  {
> -	/* this currently only supports the primary battery */
> -	if (strcmp(battery->desc->name, "BAT0") != 0)
> -		return -ENODEV;
> +	/* Return 0 instead of an error to avoid being unloaded */
> +	if (!dell_battery_supported(battery))
> +		return 0;
> 
>  	return device_add_groups(&battery->dev, dell_battery_groups);
>  }
> @@ -2404,6 +2410,9 @@ static int dell_battery_add(struct power_supply *battery,
>  static int dell_battery_remove(struct power_supply *battery,
>  		struct acpi_battery_hook *hook)
>  {
> +	if (!dell_battery_supported(battery))
> +		return 0;
> +
>  	device_remove_groups(&battery->dev, dell_battery_groups);
>  	return 0;
>  }
> --
> 2.39.5
> 
> 


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2CC4C9A
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716404512; cv=none; b=Ji3t916WjDmUEmblpmfYX/a5RZk57xCZNgmClUw554/xYT0FxV/L+IoFzcl+sFU/9oh85mxiMQZmiAA//zY8qxtHj5lYL+xj6VakmyhdAD+4juR12lY67yEK67CCmP0QfX1KLgRDrlJhrWahjeRDRIVOvtKw8t7JsLsTUTQMmvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716404512; c=relaxed/simple;
	bh=43+j57OyIBPkAd9tWTAdcokzhh0q4VbgnhyzOLH9sTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5pFvfXAFImaIvjz0/4SP1ilNPjqpELZb9vJIfgv/jEcR5TrJO+Dg1WpDeg8RxQahconhlpxEJMhfhYyZ6mceyFkMyfpY/pVkC5JAYf3aBcFJGc2GutYL3XBDvlaeY3UYfb9UKDbkwkzNwh2MG1D17AynEN2AIUXcyM8+BkkuEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iEAArnve; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iEAArnve"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=AWQJfTxKThPd1Kw9RxnPkyRADGWldfGmgYFyRLRTMC4=; b=iEAArnvehlFWBSJD7XXc6M2jU/
	dNW9UZTmNchRTQ+D5+QlXHTHSoyKwy6d0kXuCskdMNn6P1cOoIB7MuDJFwmCKqUJD0GNlRO05COPk
	g+s5RUrug9TO1EFSydcP8US7UhnVpYLP2eWBfFoaVaYvKx4zoswYsEptyzm/rWwTQ6NsAp0FD538S
	y31MQw9Dyql/V6wofWZWoo5SlQXh8yYh0oxNlc6a/UGuKf7IW/fDq4dxc7W1iXe+cokVMD1XQq8w3
	EiA7z2jKmPwZgQheqfscDt7LRSkrhPTn8Snyt3lvP0UOlm1duy5RmHUGY7tQR8WCayfqNrbelEraP
	HTquPoHw==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9rDi-00000003seB-2T3S;
	Wed, 22 May 2024 19:01:50 +0000
Message-ID: <9f4f58d6-a269-4c4b-af7f-fb4f2cd32185@infradead.org>
Date: Wed, 22 May 2024 12:01:49 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
References: <20240522164807.28936-1-hdegoede@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240522164807.28936-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/22/24 9:48 AM, Hans de Goede wrote:
> +static int __init ts_parse_props(char *str)
> +{
> +	char *name, *value;
> +	u32 u32val;
> +	int i, ret;
> +
> +	/*
> +	 * str is part of the static_command_line from init/main.c and poking
> +	 * holes in that by writing 0 to it is allowed, as is taking long
> +	 * lasting references to it.
> +	 */
> +	ts_cmdline_data.acpi_name = strsep(&str, ",");
> +
> +	for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
> +		name = strsep(&str, ",");
> +		if (!name)
> +			break;
> +
> +		/* Replace '=' with 0 and make value point past '=' or NULL */
> +		value = name;
> +		strsep(&value, "=");
> +		if (!value) {
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
> +		} else if (isdigit(value[0])) {
> +			ret = kstrtou32(value, 10, &u32val);
> +			if (ret)
> +				return ret;
> +
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
> +		} else {
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
> +		}
> +	}
> +
> +	if (!i)
> +		return -EINVAL; /* No properties specified */
> +
> +	if (str)
> +		return -ENOSPC; /* More then MAX_CMDLINE_PROPS properties specified */
> +
> +	ts_data = &ts_cmdline_data;
> +	return 0;
> +}
> +__setup("i2c_touchscreen_props=", ts_parse_props);

__setup() is different from early_param() & its family.
__setup() functions return 1 for "handled" and 0 for "not handled".

See include/linux/init.h.

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

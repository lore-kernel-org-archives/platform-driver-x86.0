Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5113D295
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 May 2024 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457690; cv=none; b=ppElKOSIhN332o9w4bfTAdB6cM3w1hO2Q9zHYqtWYqPMoBZXitHCR1XlKzZPQFmorqO3CtD+me9+uyntd9VD39j3tuQQADPhPLExE+Yq+mnGMrhSA1JvEusIBY2hnFIrJKMIOCgcCWfLgbv6c1dLbTIphBsQgPqV6Ts4uhrM9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457690; c=relaxed/simple;
	bh=XaDQD2+Eqtvw90vKfG3Al0GZG4GRnd+dNnzss9i9Gak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+loXNPC5N7zMYIj/1MUQLKbdeNud72NiuliajmMynE/SYwwLrlrm4BfD7eWt691w3R3BJzh5v582MsM/bO1OFvQ8HRLx2vX9Q49s6PFOXc7iKvjA/Wr1LsI69cBN1LhOcXG2nZ9TlhZxJgeApJcQZZrFvhu/PvLh8/5ZomnJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gYp9ynyT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gYp9ynyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716457687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8OV6LXt85polpO/8dH/h9asZoGYnxGyTeBZ8NdqW5go=;
	b=gYp9ynyTBbO66qnl8rZoUFVAXJ5AvaXJXUvG2rTloe6gFWtQDJ6FjE+eBinEw/NFQeI/cZ
	47Hv6jVBduSra3CsFaBe+qjPLuR8aitLFpgNUJXbARvfTsWgWjt/YCYhCjUrMxUGTdV5T+
	iZqoVBzlRn8lTj6b1amvFNdzdiCh2fw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-YgBvRMXENuWjhqOax_uXXw-1; Thu, 23 May 2024 05:48:05 -0400
X-MC-Unique: YgBvRMXENuWjhqOax_uXXw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a59bfd32b8fso106910166b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 May 2024 02:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457684; x=1717062484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OV6LXt85polpO/8dH/h9asZoGYnxGyTeBZ8NdqW5go=;
        b=Hb1hmyXWyupQa8KFUChHb/J/eRZpx4G8wbafFtv1o4pNbIqJ1LtffLpBXVwN5yPgaP
         OHBOByt+GqqfUYuZm/pAg08v+BwFeZcJ0A71/Q//CkWlQFdVEKbzK9ATvxCmXFmwR58N
         btPcT9qAYmbW+yRnkwToDxmYCOfsXaAwviG+58CmLC7sN1bL3pGmlhcJJy1vYUvO3YpI
         nLzum680eAaYu2HPV0kj+EYJhgeNPnGcX+Em4cogzx2CHzykT0KXtrDFuwpQrmrhv0Af
         8oQ7eJpWkHvT4wjpM0OIxKzWGANMNjP81lZ3BqiSZslTIvQyHDirc7cdDLK6fmxCaEGW
         ZO6Q==
X-Gm-Message-State: AOJu0Yx1nvTJGLqLt2+yOLEguCmJnw3CgTLpS9e6AR2kQrOR0GBjyB1R
	5EOLmf7kVBAE8Od2TRb8kwl/8RgwvJA3UW+YuNJBVhM9w6f2xfc5hzpZQuxS4s9k1ItyqUeO6bq
	LsRW/sUFkG7ZmhRW+G+GhP48ze8C6LWpsN6MH88KDKVo1aJH5lEgYjxeUKlAVqdmzQgfBU2Y=
X-Received: by 2002:a17:906:b10b:b0:a59:9c4d:da3c with SMTP id a640c23a62f3a-a62280a26efmr288104166b.40.1716457684191;
        Thu, 23 May 2024 02:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9wn2GUWEFj96/Pq4wk1d/A92LhbXz7f7psP7FWT1hpx965X+J6q766ta6uxju8pJAmAE73A==
X-Received: by 2002:a17:906:b10b:b0:a59:9c4d:da3c with SMTP id a640c23a62f3a-a62280a26efmr288102466b.40.1716457683734;
        Thu, 23 May 2024 02:48:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7d9dsm1906936766b.132.2024.05.23.02.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 02:48:03 -0700 (PDT)
Message-ID: <3c75af35-8a8d-4c51-b7fc-fa0b074434e8@redhat.com>
Date: Thu, 23 May 2024 11:48:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
References: <20240522164807.28936-1-hdegoede@redhat.com>
 <9f4f58d6-a269-4c4b-af7f-fb4f2cd32185@infradead.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9f4f58d6-a269-4c4b-af7f-fb4f2cd32185@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Randy,

On 5/22/24 9:01 PM, Randy Dunlap wrote:
> Hi,
> 
> On 5/22/24 9:48 AM, Hans de Goede wrote:
>> +static int __init ts_parse_props(char *str)
>> +{
>> +	char *name, *value;
>> +	u32 u32val;
>> +	int i, ret;
>> +
>> +	/*
>> +	 * str is part of the static_command_line from init/main.c and poking
>> +	 * holes in that by writing 0 to it is allowed, as is taking long
>> +	 * lasting references to it.
>> +	 */
>> +	ts_cmdline_data.acpi_name = strsep(&str, ",");
>> +
>> +	for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
>> +		name = strsep(&str, ",");
>> +		if (!name)
>> +			break;
>> +
>> +		/* Replace '=' with 0 and make value point past '=' or NULL */
>> +		value = name;
>> +		strsep(&value, "=");
>> +		if (!value) {
>> +			ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
>> +		} else if (isdigit(value[0])) {
>> +			ret = kstrtou32(value, 10, &u32val);
>> +			if (ret)
>> +				return ret;
>> +
>> +			ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
>> +		} else {
>> +			ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
>> +		}
>> +	}
>> +
>> +	if (!i)
>> +		return -EINVAL; /* No properties specified */
>> +
>> +	if (str)
>> +		return -ENOSPC; /* More then MAX_CMDLINE_PROPS properties specified */
>> +
>> +	ts_data = &ts_cmdline_data;
>> +	return 0;
>> +}
>> +__setup("i2c_touchscreen_props=", ts_parse_props);
> 
> __setup() is different from early_param() & its family.
> __setup() functions return 1 for "handled" and 0 for "not handled".
> 
> See include/linux/init.h.

Thank you for pointing this out, I looked at parse_args() which
expects the parse_unknown_fn handler to return 0 on success or
negative errno on error. But I see know there is a layer in between
which indeed works as you point out. I'll fix this for v2 and add
a pr_warn() about invalid syntax to the parser since the core does
not do this.

Regards,

Hans


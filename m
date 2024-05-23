Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378C13D246
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 May 2024 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716454045; cv=none; b=uhoplHJfrRb87bKSXxjJ2/qxfTlyO1JvBU9ejHnygs0axC18FzfD9CDeeIsOiBYa9n5f/3uS6xK6NIdb0SHP6mPy3fiomBLzl2TyHToAl3QpL2XfPEaLNGbEXo+ZmizKj1+gEwl+oTdLmZ8K7yiHT4R5L2gQHUQ3RhR1ZK+SGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716454045; c=relaxed/simple;
	bh=BFZrIrzWSw0aDz4R4T5w9EPsz2r6Y3eAZKTcx7fmBLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHthVaw7fpJ2GfiqEMPvGwGPcx6dKObdnhxeXjnv6I0udVFcitTFhsVSQ9xx3JpSiwmRblXyEusX4HzYImzNHxmLlaQK5RyBUMTfKT3lCYQbM/GrpVkZ+mAnRs0amzaSYIMXFtdfXqwNFdCOtvH3EIeyCcPvxHK5rYbejGv5S9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I8u9wRWz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8u9wRWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716454042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKHXEEZapN7k60vu8CdsZsjhHGaV+Fh2PZ1ocvZEpAw=;
	b=I8u9wRWzmtc1GLSvxM0DUB1nfV22YEmZumIp3JL7c9vJ5sc8z6g0m+E3Noi9LQIXM6j2G1
	e6uvxQbkA658eDlnlXJN2JHgWKBC422BY75+VErAfNRCDwP4XgpzEPJNziir2UtqyIuVMh
	PtqI49fjh0Zo+6q5bnrXRfu9e1eBEe0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-V1TuuUWwPC6Zmxc3c2FqVw-1; Thu, 23 May 2024 04:47:18 -0400
X-MC-Unique: V1TuuUWwPC6Zmxc3c2FqVw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-56e645a8762so1265571a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 May 2024 01:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716454037; x=1717058837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKHXEEZapN7k60vu8CdsZsjhHGaV+Fh2PZ1ocvZEpAw=;
        b=sKUCJyOlaAGOHyhWQOQZvbRSX9lUz5ZfiY3lfBLyhT4OVta+WYHu/xeSWdD3GrA/UZ
         wIZKhX8dFAytU+sv/YWi3+qQig65ECI1ZqnZLvz8TXiWnYDULusYNf/1m0lgvE1Rb0d+
         g0b9WRvs3pF82HwbX9kNzBsVb/MNNQu8HrHE8OJK5VZDhWw/3vEoT3TPrG47bvThSQYv
         yDB+WLGw+5JADtJZwk1FjDM1HyVOSNHbH8PTkJKamzjdPwtHon1qDdsULRxfcSbljg9w
         QuZkJQyg4NyuL91PdRpIqeohg+c+/dR3KNQP/+3otjjepBDd6ykBnj/7fiUHvM80DIlK
         9h8A==
X-Forwarded-Encrypted: i=1; AJvYcCWwGpUHAL/Uttq1L/RC3omTe50yM+4JKvvtLUfDQu1vvaFiuStUctc3OgeTb2Yu+YmhAV23QjQRBvZPWIjPZcLRy+E58aKLUlPEIoNoCBHLM2vA/Q==
X-Gm-Message-State: AOJu0Yztu1gcDAGX4aeVGPgNsm2dG1Kw8etim1B4u9uGvILmG+QAWhOS
	s/n6nm7l2f0bNeKFgYFQaK+3tfkj8SmFP26ybryRXdr4vIrMEyd23+uxc7zexHOCntuWhTqPvIh
	uXqfLO94sVMTFBOtoTM6V2aHLHHOkKWFUvk41uzVjTzZ9iJLwMzVbOZ5HCyjad8ALgNSpADU=
X-Received: by 2002:a50:cd0d:0:b0:572:9b20:fa with SMTP id 4fb4d7f45d1cf-57832be3235mr3108302a12.33.1716454037468;
        Thu, 23 May 2024 01:47:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPXIp+roKvtSrEEXsVhUCyI85Hjmk/jp3I7KefqcXlhA58xnX4RNT8DQW9O+amMcIWrWIikA==
X-Received: by 2002:a50:cd0d:0:b0:572:9b20:fa with SMTP id 4fb4d7f45d1cf-57832be3235mr3108295a12.33.1716454037129;
        Thu, 23 May 2024 01:47:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5784b637102sm86774a12.41.2024.05.23.01.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 01:47:16 -0700 (PDT)
Message-ID: <376bd875-e4ab-403d-9265-e6833ccb31d9@redhat.com>
Date: Thu, 23 May 2024 10:47:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
References: <20240522164807.28936-1-hdegoede@redhat.com>
 <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
 <4c14d61f-dc0c-4495-a74c-fa0cef4362d5@redhat.com>
 <CAHp75Vex78gE+e8kaUvvNjVUtkv-3GGgcMFZ3tFFqK49WRQDrA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vex78gE+e8kaUvvNjVUtkv-3GGgcMFZ3tFFqK49WRQDrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 5/22/24 9:32 PM, Andy Shevchenko wrote:
> On Wed, May 22, 2024 at 9:40 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/22/24 7:19 PM, Andy Shevchenko wrote:
>>> On Wed, May 22, 2024 at 06:48:07PM +0200, Hans de Goede wrote:
> 
> ...
> 
>>>> +    /*
>>>> +     * str is part of the static_command_line from init/main.c and poking
>>>> +     * holes in that by writing 0 to it is allowed, as is taking long
>>>> +     * lasting references to it.
>>>> +     */
>>>> +    ts_cmdline_data.acpi_name = strsep(&str, ",");
>>>> +
>>>> +    for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
>>>> +            name = strsep(&str, ",");
>>>> +            if (!name)
>>>> +                    break;
>>>> +
>>>> +            /* Replace '=' with 0 and make value point past '=' or NULL */
>>>> +            value = name;
>>>> +            strsep(&value, "=");
>>>> +            if (!value) {
>>>> +                    ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
>>>> +            } else if (isdigit(value[0])) {
>>>> +                    ret = kstrtou32(value, 10, &u32val);
>>>> +                    if (ret)
>>>> +                            return ret;
>>>> +
>>>> +                    ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
>>>> +            } else {
>>>> +                    ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
>>>> +            }
>>>> +    }
>>>
>>> This reminds me a lot from the next_arg(), can we not reinvent a wheel?
>>
>> next_arg is meant for parsing different arguments on the kernel cmdline
>> split by spaces. It has space as separator hardcoded so it cannot be
>> used here.
> 
> I believe it's not the first time I hear such an excuse for
> duplicating Yet Another (Same) Parser.
> If you think you really need another separator, we may patch
> next_arg() or add next_arg_any(is_separator_fn *fn) and make
> next_arg() to be a wrapper of the other one.

The kernel already has a generic parser for most things in the form of
include/linux/parser.h but that will not work here since that assumes
a list of fixed keywords while in this case I want to allow any keyword
and change it into a device-property with that name.

Also the actual splitting into key=value code here is maybe 5 lines,
the whole patch itself is not that big and most of the parsing is
figuring out if value represents a bool, uint or string.

And the kind of refactoring of next_arg() you are asking for here
is way out of scope, so sorry but I don't plan to change this part
of the patch.

Regards,

Hans



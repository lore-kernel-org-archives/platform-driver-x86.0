Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7676E25B2F4
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 20:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475905; cv=none; b=cBF7dP3Wxc72+z0LkfaQbcXJnHAfMQflnwnjVuCglIrfmstTnILh94RQWRaNt9CoaRkT+UA1NFgGWLRxim64fmf3wnWfQjYD+pOoywy3a2BXY1Lkb/vGM52xUu3KoGifrll2dfA8Z34zUbuLMNACUSDTfvBTvHsd513uVpzmF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475905; c=relaxed/simple;
	bh=7YfCJ8B9uTfFFfDZwKiUS3AHSDl1OR9sETL2cEV6mp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8v+qTAmU/OCZ0fCIctzJrWOyJt0gTYm882I2X2CH1h1hxSmxhtIg075ECrO7Z5f69/qwhLPHWEYdXVlXo6ueTTxZqN8VAbrUBSK9DYROvzomPAIQP13nEC8kukULQBmsvmBDLSBMxCGbY0YZVnnR0rOt0GrM/HWUfYHJax/dEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KN6cCfUE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KN6cCfUE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6CAC4CEEF;
	Fri, 25 Jul 2025 20:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475905;
	bh=7YfCJ8B9uTfFFfDZwKiUS3AHSDl1OR9sETL2cEV6mp8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KN6cCfUEr/3H3TnUSwqNShgcIjl12mOg4mjjuJXAfpSOlWv3RYRC/qsgvSILTuQ/z
	 NEe4DL6wLYVZNfALnnpfkzipaaExSyi91X+TtULLGBGnb6zk9Jai0eN7T24m/g92aU
	 w1NiGVFsK44bqgZfMt3nL0yYfZ2s8MwkLX4wpCm9ZVxoItbl9N85hNQCzV8oQM6nUP
	 +awJIhrEp0+/nIf+JV+H9WHEFOXaXKXkg7YEJ8QJMekmJU0v2SeP30qXwSVeHQZt5e
	 Dmcp6Lb68yBI1xTLHaC3UbwG+IytldWR5QlCiNsVRDTkvAseEP+KS/1Jg5IexHT7V5
	 OEf714yK+6c9g==
Message-ID: <1555f313-6dea-4e42-aca8-936379fc31eb@kernel.org>
Date: Fri, 25 Jul 2025 22:38:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: int3472: Rework regulator enable-time
 handling
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250725144444.210043-1-hansg@kernel.org>
 <20250725144444.210043-2-hansg@kernel.org>
 <CAHp75VcftCLTqRV-s3LNEHLFmy359CHx0XDDcWpdV=eoe_C20A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CAHp75VcftCLTqRV-s3LNEHLFmy359CHx0XDDcWpdV=eoe_C20A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for your review.

On 25-Jul-25 4:49 PM, Andy Shevchenko wrote:
> On Fri, Jul 25, 2025 at 4:44 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> Instead of hardcoding the regulator enable-time for INT3472_GPIO_TYPE-
>> POWER_ENABLE and -HANDSHAKE, make int3472_get_con_id_and_polarity()
>> set the enable-time.
>>
>> This will allow overriding the enable time through quirks in
>> the int3472_gpio_map[].
> 
> ...
> 
>> + * @enable_time: Enable time in usec for GPIOs mapped to regulators
>>   * GPIO_ACTIVE_HIGH otherwise
> 
> Make it enable_time_us, it will immediately give a hint in the code
> without going to here to get units.
> 
> ...
> 
>>  struct int3472_gpio_map {
> 
>>         u8 type_to;
>>         bool polarity_low;
>>         const char *con_id;
>> +       unsigned int enable_time;
> 
> Wondering if this can be moved before con_id to save a few bytes on 64-bit.
> 
>>  };
> 
> ...
> 
>>  static const struct int3472_gpio_map int3472_gpio_map[] = {
>>         /* mt9m114 designs declare a powerdown pin which controls the regulators */
>> -       { "INT33F0", INT3472_GPIO_TYPE_POWERDOWN, INT3472_GPIO_TYPE_POWER_ENABLE, false, "vdd" },
>> +       { "INT33F0", INT3472_GPIO_TYPE_POWERDOWN, INT3472_GPIO_TYPE_POWER_ENABLE,
>> +         false, "vdd", GPIO_REGULATOR_ENABLE_TIME },
>>         /* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
>>         { "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
> 
> Can we actually either use a macro or at least C99 initializers?
> 
>>  };
> 
> ...
> 
>> +                                           unsigned int *enable_time)
> 
> _us
> 
> ...
> 
>> +       *enable_time = GPIO_REGULATOR_ENABLE_TIME;
> 
> _us
> _US

Ack,

I agree with all your remarks. I'll fix these for v2.

Regards,

Hans




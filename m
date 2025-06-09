Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BB11FC11F
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465651; cv=none; b=sib+0OxjPKTUBXLes/Pmzoe+22VF7rYf2a/SnwBctw4WHok499isMpznpQIVmpcHeYIA61yYy84ivFWfH2bWFLNRUdmdY8MocgYUiEeu9yuhCTiw8dPmJNr54wS5ZmSA4ZhSmhtpPlUpE4x4IPqsHtEsSnV3hlClu4wn5ZxILVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465651; c=relaxed/simple;
	bh=V5rVgK9wi7Itm/JG4QdYDGot9bwNxhMbr3uvMEZcSeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQCIx9KvbAcEGCbfAPmJ7XapDNZP8TWZyN7cV8OlyT/ZAve+FVwtgHwp66dkAUW0vMcDZ0YU9VMixAYbeGdTbj1BMUt0ox6Dxdt8ghk7Rt7quMLJcFAVk2Nybd7l8RIOWTd+vEqTZKbfpzr/NVxcLtu7onyBRx+iBT77XZ1nGVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNGKejoy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNGKejoy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F311DC4CEEB;
	Mon,  9 Jun 2025 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749465650;
	bh=V5rVgK9wi7Itm/JG4QdYDGot9bwNxhMbr3uvMEZcSeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CNGKejoyQh4GM8jHkVIoz+ld1JJ8uvulHi0zNG4TowQm/Q3QXQNWmtVvDDvWpvrrh
	 P1WagqHyN6lTfhRQVKjVlBafvSv0cGDCEpFeTtm7R2Bx7JaHrzIy4AB3CsicCNi/xh
	 wnIYDy4z60VvDJWU/riaAt4/QgO/kxA2K6kRGszBGtbz9FLYKWaa4hytdn4iPzrOrp
	 xSoj0kyP0zmA6QZ6TtV7rYtqp3VzTPwrPpg8roRKFoGVGEZzrBX2OILKlXJWEYOipM
	 MywF0xMxIrWaJtQl64QTNmBVwpgv/AltrnxgriKPkrQDUiBP85YvIKOMXUCU4egVrG
	 jnyQkI2quoKxQ==
Message-ID: <1e4b5ffb-61f2-43ef-811a-eb7769e6e616@kernel.org>
Date: Mon, 9 Jun 2025 12:40:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add
 ovc-capacity-table info
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250608204154.37605-1-hansg@kernel.org>
 <20250608204154.37605-2-hansg@kernel.org>
 <CAHp75Ver6pu-7PQePbUP4XMZxKBX4tTgwWzH4LgLK21E+aCpng@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CAHp75Ver6pu-7PQePbUP4XMZxKBX4tTgwWzH4LgLK21E+aCpng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 9-Jun-25 11:34 AM, Andy Shevchenko wrote:
> On Sun, Jun 8, 2025 at 11:41 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> Add ovc-capacity-table info to the generic battery nodes.
>>
>> The values come from the ug3105 driver which currently hardcodes these
>> values. The ug3105 driver will be modified to stop hardcoding this and
>> instead get the values from device-properties.
> 
> Both looks good to me,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> One minor question/nit-pick below.
> 
> ...
> 
>> +static const u32 generic_lipo_4v2_battery_ovc_cap_table0[] = {
>> +       4200000, 100,
>> +       4150000, 95,
>> +       4110000, 90,
>> +       4075000, 85,
>> +       4020000, 80,
>> +       3982500, 75,
>> +       3945000, 70,
>> +       3907500, 65,
>> +       3870000, 60,
>> +       3853333, 55,
>> +       3836667, 50,
>> +       3820000, 45,
>> +       3803333, 40,
>> +       3786667, 35,
>> +       3770000, 30,
>> +       3750000, 25,
>> +       3730000, 20,
>> +       3710000, 15,
>> +       3690000, 10,
>> +       3610000, 5,
>> +       3350000, 0,
> 
> To me it sounds like a percentage and can't go below 0, meaning that
> this is actually a terminator, so no trailing comma is required.

I was already wondering whether to keep the comma or not. I kept
it since this is not a "formal" terminator, like e.g. NULL at
the end of a variable-length array of strings.

Anyways I'm fine with removing it. I'll send a v2 removing it.

Regards,

Hans




> 
>> +};
>> +
>> +static const u32 generic_lipo_hv_4v35_battery_ovc_cap_table0[] = {
>> +       4300000, 100,
>> +       4250000, 96,
>> +       4200000, 91,
>> +       4150000, 86,
>> +       4110000, 82,
>> +       4075000, 77,
>> +       4020000, 73,
>> +       3982500, 68,
>> +       3945000, 64,
>> +       3907500, 59,
>> +       3870000, 55,
>> +       3853333, 50,
>> +       3836667, 45,
>> +       3820000, 41,
>> +       3803333, 36,
>> +       3786667, 32,
>> +       3770000, 27,
>> +       3750000, 23,
>> +       3730000, 18,
>> +       3710000, 14,
>> +       3690000, 9,
>> +       3610000, 5,
>> +       3350000, 0,
> 
> Ditto.
> 
>> +};
> 


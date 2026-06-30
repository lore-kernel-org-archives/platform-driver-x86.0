Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7FF157A5A;
	Tue, 30 Jun 2026 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826405; cv=none; b=M6Rn8C+BVeklVncDjZOQ4Nm8ZIrpQXZFhI95319w44vL6btec7gcpOjvJbwxiqIelvA0U7CqehuRj0uCZlTZdiPaR4Bei8TIXP0PuxvQ6MCI2f9VLhUdXqHJ8iW6Hoxc8G368dodX7VLxhf8tKQJ82iNe5DR5WXG6sXpvsPzFjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826405; c=relaxed/simple;
	bh=nvP9pPOsEbcV0ygovhaC8WOiCqL57Sj2AlsTc6bMVqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fyhq6Jil++q/rILCpEZ54Ce/GbUbwnuGkEAo87GOfXWJGna7L8qMO2Im4ZVRrWCX30clEKf961K8b+amWscZq1LJeb0hM1y2/yH+bu2+Ok/kFVyP3hHhwG59I9IR1GDktLFDkNOh8On3kuMOo9LAQd86Qv4Esl+rOMUmeV2jqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPL6nsKa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPL6nsKa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DE71F000E9;
	Tue, 30 Jun 2026 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826404;
	bh=4GBM6+2OYGVsKPN+pctdr1rHEL2ufgXo9pPyh0m9Wz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZPL6nsKal+vHibFnbtd3rmEB42nIfD8me//GAveLd6VEv8RUB+jCcoHo9HXCvMEUw
	 BMLV37PaJGcDCGU8B8IEuKDUrFzQC+uB4CLwzZKTbxcJR8UafFS0wmnFL1KZI6/JJr
	 Ps6PRSrATohnZ4xz5xOWZTAvWzPWjIdmGyKeIIN/+nprc87xDwV5eVpqIug//rDyoX
	 ys2IVq1L0Z0Pbn7CCmFeAEGqfBb1tC8GtjvnmXXMIF+Vvz7zJzGPT6/bRdEengXty3
	 n2ABQLciSC2PQXFlqCMaLn7LGHA/xQZZDLLsHzifh8SFJgErEmb9zApYFyS4oCGOKM
	 HeLL35xZU5/KA==
Message-ID: <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
Date: Tue, 30 Jun 2026 15:33:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
To: Tarang Raval <tarang.raval@siliconsignals.io>, Kate Hsuan
 <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh
 <serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: computman <anis@talbi.fr>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20260629074026.35490-1-hpa@redhat.com>
 <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 30-Jun-26 09:32, Tarang Raval wrote:
> Hi Kate,
> 
>> Update the con_id for the Sony IMX471 sensor to "vana" to serve as the
>> power enable. Additionally, the HID values SONY471A and TBE20A0, both
>> associated with the IMX471 image sensor, have been identified on Lenovo
>> laptops.
>>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> 
> Thanks, looks good.
> 
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>

Hmm, the imx471 driver is still pending upstream:

https://lore.kernel.org/linux-media/20260629074026.35490-5-hpa@redhat.com/

As part of this series.

Please just use the standardized "avdd" in that driver instead
of "vana" (which also seems to refer to the analog supply vdd,
which is what avdd stands for).

Then this whole patch is unnecessary and can be dropped from
this series.

Regards,

Hans




>> ---
>>  drivers/platform/x86/intel/int3472/discrete.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 115bb37577a1..adff564bf3fd 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -164,6 +164,24 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
>>                 .con_id = "dvdd",
>>                 .enable_time_us = 45 * USEC_PER_MSEC,
>>         },
>> +       {       /* imx471 expects "vana" as con_id for power enable */
>> +               .hid = "SONY471A",
>> +               .type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
>> +               .type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
>> +               .con_id = "vana",
>> +               .enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
>> +       },
>> +       {
>> +               /*
>> +                * imx471 (on Lenovo ThinkPads X1 G14) expects "vana" as con_id
>> +                * for power enable
>> +                */
>> +               .hid = "TBE20A0",
>> +               .type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
>> +               .type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
>> +               .con_id = "vana",
>> +               .enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
>> +       },
>>  };
>>
>>  static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
>> --
>> 2.54.0


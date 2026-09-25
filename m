Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF153630BF;
	Fri, 25 Sep 2026 18:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360343; cv=none; b=cfMhSGUttzkeIDJ5cS225L3g9ykBqlau2ZOdpmZ/gm+8HjayQIa0OzbXox/hbjwr0B4XNV5mjHghTH8D52VvHsOKJ1nf7T42dkAZ8v57AwZCCOmqRS847Kp/ZdxVaP0AdQOPFO9JN/10/no19JnvmeQEGfGnz60BG1DmokV+M2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360343; c=relaxed/simple;
	bh=Mtr9DHf6qb1fuQ568oJxyjTxnFBxnm/CsRZQgJ9QX60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6wHoy8PoyzwRc5DPuIBNRSBxC/MlldYXcTATUZn8Zg4WOV8zUU2t8XxzS363kM2QmGIQMdD+xvovhq1fOVm/Xi46zSUNwb+Lvv2khAsq58I9e1JQO2EqDUFokwTDtr9t0K/c4+hTBy8noh2SxBi8fH/Ek+HsKViwgQZrLCSuoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Y6nJ877/; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Y6nJ877/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790360331; x=1790965131; i=w_armin@gmx.de;
	bh=Vu0rI6okVm1NIQeznTGwsmmjbRciEIOkuS4p8BG+mow=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y6nJ877/h9h00qAuRfI0cw3kVGiP2oEInT3f7cBbv6tZaQ/sQsAwy6XSKb9dCpTP
	 FJdGAwWxjVPLJ28ojSsQ4j3iOSDdHPA768+vfFMahy7BN6jNp6KH2soFVYz8Gz7PY
	 MQoLkO8HL8aYbTOmxON5sbRa7fXv/ic3gZVJXo0TLAlTV8DTzJeu3u6+e9m000UsY
	 iy2xFSX/bx8FIB3D2dYGa9YpbT6VFd919z2yJmtRY7cbfsljYzhFqLsgYOjg8LIwS
	 NkIQVw0KIeXzl/0Gfy90KkrkJFmUXYfxC6C8AZ2WBQw9nXxkWK74aq01DdE3kN3I6
	 a8A8OwdeVTr/dfdegQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmULr-1wSH3D3ivx-00jHiQ; Fri, 25
 Sep 2026 20:18:50 +0200
Message-ID: <341b9495-0b42-4c94-bdf5-41e8ca525ac0@gmx.de>
Date: Fri, 25 Sep 2026 20:18:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Fix profile handling on
 Redmi Book Pro 14 2022
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 TuteMthCD <matias.civadda2342001@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260925032001.111062-1-matias.civadda2342001@gmail.com>
 <6467163f-8978-1c20-c7f4-360a3762edcc@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <6467163f-8978-1c20-c7f4-360a3762edcc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nv4D2qug8oP8yysB+LYrZnZPJPtEOyUbS/+dTOWqHuVBNx2hNgP
 n8/kIh2c10bJYD39gxIHWnzIs26jVM0yhCVcHsdV24kdumiuZBriqSAi6YeOHiriuGYkVxa
 1Wq8EmsiiRLzVj1lPXCdAkswfR4/NCdZAHzFOFQFMlykdDPuMhqKuh+k6/hFUNFPV4C7GE8
 NBef4XOlSACkVhSm6vcNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2OLoGvl1tjQ=;QZ53uQKltFkHCKuLlxr5d2whRmF
 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
 ne0o7pUbmzvjRjJYg==

Am 25.09.26 um 13:03 schrieb Ilpo J=C3=A4rvinen:

> On Fri, 25 Sep 2026, TuteMthCD wrote:
>
>> On the TIMI Redmi Book Pro 14 2022 (board TM2107), the firmware returns
>> the current platform profile at byte offset 2 of the WMI response.
>> The driver instead reads offset 4, which remains zero in the observed
>> responses. Consequently, profile reads report balanced even after
>> selecting another mode.
>>
>> The generic performance capability check also requires a barrel-jack
>> power supply. This blocks performance selection on this USB-C-only
>> machine.
>>
>> Add an exact DMI match for this model to read the profile from offset 2
>> and require external power without the barrel-jack restriction.
>>
>> Tested on physical Redmi Book Pro 14 2022 hardware (TM2107),
>> BIOS RMARB4B0P1010, running Linux 7.2.6-zen2-1-zen.
>>
>> Assisted-by: Codex:GPT-6
>> Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
> Please see Documentation/process/submitting-patches.rst for how to
> properly sign off your submissions and what it means.
>
>> ---
>>   drivers/platform/x86/bitland-mifs-wmi.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform=
/x86/bitland-mifs-wmi.c
>> index 3a373184519d..c132902bc5f8 100644
>> --- a/drivers/platform/x86/bitland-mifs-wmi.c
>> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/dev_printk.h>
>>   #include <linux/device.h>
>>   #include <linux/device/devres.h>
>> +#include <linux/dmi.h>
>>   #include <linux/err.h>
>>   #include <linux/hwmon.h>
>>   #include <linux/init.h>
>> @@ -38,6 +39,17 @@
>>   #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
>>   #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
>>  =20
>> +static const struct dmi_system_id bitland_tm2107_table[] =3D {
>> +	{
>> +		.matches =3D {
>> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
>> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
>> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
>> +		},
>> +	},
>> +	{}
>> +};
>> +
>>   enum bitland_mifs_operation {
>>   	WMI_METHOD_GET	=3D 250,
>>   	WMI_METHOD_SET	=3D 251,
>> @@ -195,13 +207,18 @@ static int laptop_profile_get(struct device *dev,
>>   		.function =3D WMI_FN_SYSTEM_PER_MODE,
>>   	};
>>   	struct bitland_mifs_output result;
>> +	u8 mode;
>>   	int ret;
>>  =20
>>   	ret =3D bitland_mifs_wmi_call(data, &input, &result);
>>   	if (ret)
>>   		return ret;
>>  =20
>> -	switch (result.data[0]) {
>> +	/* TM2107 returns the profile in byte 2 instead of byte 4. */
>> +	mode =3D dmi_check_system(bitland_tm2107_table) ?
>> +		result.reserved2 : result.data[0];
> You claimed above you tested this patch but how is that possible as this
> patch will not even compile???
>
> Did AI just make up the claim you've tested the patch? Letting AI make
> claims on your behalf that you did things which are not true is misusing
> community's goodwill and trust, and totally unwanted behavior! Please
> don't do that again.
>
> Next time, please properly test the very patch you're sending and review
> it yourself before hitting the send button. Do not mindlessly send patch=
es
> that are AI generated, we don't want unfiltered AI output to be sent to
> us.
>
> In addition, any patch you're submitting to platform drivers list should
> be based on top of for-next or review-ilpo-next branch in the pdx86 repo=
,
> not some random other tree (if that's the explanation for the
> inconsistencies here).

Additionally the problem might partially be solved by patches inside the
for-net tree.

Can you share the output of acpidump on your machine? Some machines use
a different platform profile mapping.

Thanks,
Armin Wolf

>> +
>> +	switch (mode) {
>>   	case WMI_PP_BALANCED:
>>   		*profile =3D PLATFORM_PROFILE_BALANCED;
>>   		break;
>> @@ -229,6 +246,10 @@ static int bitland_check_performance_capability(st=
ruct bitland_mifs_wmi_data *da
>>   	struct bitland_mifs_output output;
>>   	int ret;
>>  =20
>> +	/* TM2107 only requires external power, including USB-C. */
>> +	if (dmi_check_system(bitland_tm2107_table))
>> +		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
>> +
>>   	/* Full-speed/performance mode requires DC power (not USB-C) */
>>   	if (!power_supply_is_system_supplied())
>>   		return -EOPNOTSUPP;
>>
> Variations like the ones you have in this patch should be covered using =
a
> struct in .driver_data in a generic dmi table, not some device specific
> table.
>
> You probably should also add depends on DMI.
>

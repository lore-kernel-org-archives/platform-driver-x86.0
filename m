Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3144A8A39;
	Mon, 12 Oct 2026 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821464; cv=none; b=RBh94Z4sKcouGVpZPVd6Ll3r9heIDP4aOKz/ORIqGsa/CWgZW2Thjr7x7ZH0YzHXTWz2BnKjfN6uT5FSWvxfWLaLmK2fHWrOiBFTdXNlYSCONcttJDUHJaMDMbLgi9QhvviSS/1nRK0/zJ2PPu6/7mAqdk3+7mAu3QYvsC0msmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821464; c=relaxed/simple;
	bh=vl/hjzRGnuiTtGumcg1CAyiR9HJs/NjVOUgWTtvJkL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3ZdheqMBan6oiYAzmbOfHOVvO/8w4QSZRx1RiHRvsKZRgw07sxsPwAUd7VPRj0YmdF8tH/MiaMTbxbvqi7ydcb69AfCJYuPntsKV/bzzE9MU2QalO1t3A7WaweBjXZDR7RiNAux4PkDghQW6uY+wQyaM5NUfBp8ZTUhLhSkp20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0wa1mSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0wa1mSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E10D1F0089C;
	Mon, 12 Oct 2026 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791821462;
	bh=T8t61L+WCKa76kfiPOzPjwOEc+4KwlYEFTiX3EF63ts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X0wa1mSwsg9gwsNFW6/V59dA+bSI5zsbJEpWGIw/xfNNySwg+T39Lc3NE1G27f5qh
	 gY0LjW3SBBmcuFhWSN9jFuFSk6HHnhaxUVNF8ZWI2rKPyXQH2W6OIARQF5bZ39dtT4
	 XqxEWZjRf90SUiEnpLyo0F037M0KdOnKZI2xSlB/OTKKv1MHBV5p2WAMV/BROWXYXd
	 yVzV4SsJtbwdyHY5UP52XaelnexgqtLR4mgP3HAoc1FHRsjk11gFkSE+ubSZwOjfc1
	 N2UXMsMprDNFFfTMDykTDar4XfVGRSSgwJyPxogf4Opo7o1cdmFIEk4rlamGbziXEI
	 8OFbnE1EQ0T8Q==
Message-ID: <1ab8b696-efe2-44d7-a440-bd54bd705232@kernel.org>
Date: Mon, 12 Oct 2026 18:10:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: int3472: GPIO type names disagree with Intel's Windows driver
To: diamondback <diamondback@cohunt.app>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Alexander Patrakov <patrakov@gmail.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sahan Nissanka <adee.sahan@gmail.com>
References: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com>
 <d9a37aff-3b4d-467c-825d-5473b4c1bbb4@ideasonboard.com>
 <CAN_LGv0nBTkVmxbuK+_O1v5Z_OZqQz5LgEZdL1_37otsei36fQ@mail.gmail.com>
 <aslsXPVJIuYRrgKv@kekkonen.localdomain>
 <lVgzYFlB_DT3TKJryx4Et9QF3-oqL7pSNP37e4tUENOuzf7sLRLshnvAkcz1jYpd6NCOqlqowIFv1Di9Ddo2Io1_K3HC5gjylmd-kuDLJv8=@cohunt.app>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <lVgzYFlB_DT3TKJryx4Et9QF3-oqL7pSNP37e4tUENOuzf7sLRLshnvAkcz1jYpd6NCOqlqowIFv1Di9Ddo2Io1_K3HC5gjylmd-kuDLJv8=@cohunt.app>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Oct-26 10:01, diamondback wrote:
> On Saturday, October 10th, 2026 at 12:36 AM, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>  
>> The GPIO naming in Windows drivers is also an abstraction while Linux
>> drivers typically use datasheet names of regulators, which are sensor
>> specific. The handshake GPIO shouldn't exist with the regulators so it
>> should be possible to map the rest independently of that. Changing the
>> default mapping would also be possible, in principle, but that'd still
>> require ensuring all sensor drivers still get the required regulators. I'm
>> not sure it's worth it.
> 
> Answering Alexander's question to me from the first mail:
> 
> On 09/10/2026 04:06, Alexander Patrakov wrote:
>> Leif, do you remember what it was based on, and which other GPIO
>> types that machine's INT3472 reports?
> 
> It was based on inference. My notes from February only say "likely
> DOVDD": the ov5675 driver asks for avdd, dovdd and dvdd, 0x0b and 0x12
> already had avdd and dvdd, so 0x10 got the remaining name. v1 already
> called it DOVDD; Hans only asked me to drop the OVTI5675 quirk entry and
> spell the con_id "dovdd" instead of "vio". In hindsight, my commit
> message should not have stated it so concretely.
> 
> What the Fold declares (from _DSM and the BIOS pin fields):
> 
>   INT3472:00 (\_SB.PC00.DSC0), all sensor-on value 1:
>     0x00  reset    pin 335
>     0x0b  PowerEn  pin 140
>     0x10  Avdd     pin 164
>   INT3472:01 (\_SB.PC00.DSC1): no _CRS, zero pins.
> 
> No 0x0f, 0x11 or 0x12. And a correction: that INT3472 is not the
> OV5675's. The OV5675's _DEP names only the IVSC device, it uses dummy
> regulators for all three supplies, and the supply map shows both
> regulators going to the IR sensor:
> 
>   INT3472:00-avdd -> i2c-SMO55F0:00.avdd
>   INT3472:00-dovdd -> i2c-SMO55F0:00.dovdd
> 
> So 0x10 on the Fold is a VD55G0 pin, not an OV5675 one.

Thank you for providing this information.

> Dan's suggestion makes sense to me
I'm afraid that Dan's suggestion to:

"I think that what probably needs to happen, really, is for
skl_int3472_register_regulator() to look up its array of consumer_supplies (which
maps sensor device name to regulator name) based on DMI matching just as
int3472_tps68470_get_board_data() does for the TPS68470 IC version of the INT3472"

Is not going to scale we are seeing many many different laptop models using
the discrete INT3472 devices, so we really need a generic solution here and
so far the current code has been scaling reasonable well.

The fact that currently we have a conflict between 0x0b poweren -> avdd
and 0x10 Avdd -> dovdd is unfortunate. I would like to see 0x10 register
the avdd regulator as per the Windows table, but that might cause
breakage on some laptop models.

For now the only laptop + sensor which we've seen use 0xf and 0x11 (+ 0x10)
_DSM type GPIOs is Alexander's Lenovo Yoga Duet 7 13ITL6 with the OVTI5675
sensor. The other laptop, diamond back's ThinkPad X1 Fold 16 Gen 1, which
we know to use an OVTI5675 is behind a ivsc and does not claim any GPIOs at
all.

So for now I think it what should happen is:


1. An int3472 driver patch renaming INT3472_GPIO_TYPE_DOVDD to
INT3472_GPIO_TYPE_AVDD, while keeping this mapped to dovdd with a remark
that this is mapped to dovdd for historical reasons and cannot be easily
changed because this might break support for some laptops

+ 2 new defines for DOVDD / DVDD, resulting in (combined)

#define INT3472_GPIO_TYPE_DOVDD                                 0x0f
#define INT3472_GPIO_TYPE_AVDD					0x10
#define INT3472_GPIO_TYPE_DVDD					0x11

So this basically syncs our defines with what we've learned from
the Windows drivers, without changing any functionality.
   

2. A patch to add mappings for the new INT3472_GPIO_TYPE_DOVDD(0x0f) and
INT3472_GPIO_TYPE_DVDD(0x11) values to dovdd resp dvdd regulators.

This one just adds new mappings so should be safe to.


3. A patch adding an entry for the OVTI5675 to int3472_gpio_map[] to
actually map the new INT3472_GPIO_TYPE_AVDD (0x10) the avdd (on the
OVTI5675 only)

This might cause breakage if there is a laptop not on our radar
with a OVTI5675 sensor using 0x0b (power-enable) + 0x10 (avdd) gpio
types at the same time. But there is only one way to find that out
really.


4. A patch to change the mapping of the new INT3472_GPIO_TYPE_AVDD (0x10)
to actually be mapped to avdd and mapping INT3472_GPIO_TYPE_POWER_ENABLE
to dvdd instead of avdd + dropping the int3472_gpio_map[] added in
the 3th patch.

Yes this undoes patch 3, the idea being that we can easily revert patch 4
if necessary.

Note patch 4 can cause 2 types of problems:

1. A name-conflict in the registered regulators. This would be a real
problem and a reason to go with a revert.

2. Some sensor drivers for sensors using INT3472_GPIO_TYPE_POWER_ENABLE
GPIOs may only check for avdd and not dvdd (*), in that case we could
extend the regulator handling in the sensor driver instead of reverting
patch 4.

I hope any problems with patch 4 will be of the second category so
that we can keep it around and have straight forward mappings between
the defines and the regulator names.

Regards,

Hans



*) I'm pretty sure we likely have a few of those, bonus points for
checking all sensor drivers for sensors listed in
drivers/media/pci/intel/ipu-bridge.c and pro-actively adding "dvdd"
support if they only support "avdd" atm






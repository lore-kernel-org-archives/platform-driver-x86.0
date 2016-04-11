From: =?UTF-8?Q?=c3=89ric_Piel?= <eric.piel@tremplin-utc.net>
Subject: Re: [PATCH] hp_accel: Add support for HP ProBook 440 G3
Date: Mon, 11 Apr 2016 23:06:53 +0200
Message-ID: <570C11ED.4080002@tremplin-utc.net>
References: <1459620673-10633-1-git-send-email-martin.vajnar@gmail.com>
 <20160410031042.GC18689@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:47305 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751360AbcDKVHE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Apr 2016 17:07:04 -0400
In-Reply-To: <20160410031042.GC18689@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Martin Vajnar <martin.vajnar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On 10-04-16 05:10, Darren Hart wrote:
> On Sat, Apr 02, 2016 at 08:11:13PM +0200, Martin Vajnar wrote:
>> HP ProBook 440 G3 laptop needs a non-standard mapping (x_inverted_us=
d).
>>
>> Signed-off-by: Martin Vajnar <martin.vajnar@gmail.com>
>
> Eric, this looks good to me. Any concerns?
Hi Darren, Martin,

Indeed it looks fine :-)

Here is my:
Acked-by: =C9ric Piel <eric.piel@tremplin-utc.net>

Darren, could you pick it up in your tree?

Thanks,
=C9ric

>
>> ---
>>   drivers/platform/x86/hp_accel.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/=
hp_accel.c
>> index 10ce6cb..263002b 100644
>> --- a/drivers/platform/x86/hp_accel.c
>> +++ b/drivers/platform/x86/hp_accel.c
>> @@ -173,6 +173,7 @@ static int lis3lv02d_dmi_matched(const struct dm=
i_system_id *dmi)
>>   DEFINE_CONV(normal, 1, 2, 3);
>>   DEFINE_CONV(y_inverted, 1, -2, 3);
>>   DEFINE_CONV(x_inverted, -1, 2, 3);
>> +DEFINE_CONV(x_inverted_usd, -1, 2, -3);
>>   DEFINE_CONV(z_inverted, 1, 2, -3);
>>   DEFINE_CONV(xy_swap, 2, 1, 3);
>>   DEFINE_CONV(xy_rotated_left, -2, 1, 3);
>> @@ -236,6 +237,7 @@ static const struct dmi_system_id lis3lv02d_dmi_=
ids[] =3D {
>>   	AXIS_DMI_MATCH("HP8710", "HP Compaq 8710", y_inverted),
>>   	AXIS_DMI_MATCH("HDX18", "HP HDX 18", x_inverted),
>>   	AXIS_DMI_MATCH("HPB432x", "HP ProBook 432", xy_rotated_left),
>> +	AXIS_DMI_MATCH("HPB440G3", "HP ProBook 440 G3", x_inverted_usd),
>>   	AXIS_DMI_MATCH("HPB442x", "HP ProBook 442", xy_rotated_left),
>>   	AXIS_DMI_MATCH("HPB452x", "HP ProBook 452", y_inverted),
>>   	AXIS_DMI_MATCH("HPB522x", "HP ProBook 522", xy_swap),
>> --
>> 2.5.0
>>
>>
>

Received: from outbound.qs.icloud.com (qs-2006f-snip4-4.eps.apple.com [57.103.85.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819901607A4
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 04:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.85.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907559; cv=none; b=rUoqIX+lYspkgFpEYHEGbTISd10Rr2cxi+OYjAgqVcZQuvFfndwcMgOneAotukOfGW6GLpM1qYiFnmL52dixnuav5EIkV26Pya6Q4iBE60EMriSXWON6FBooh7eqY1QtWSutrhhXSh87EZowhDT5LvJZDcY74S6PpXuwtygKbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907559; c=relaxed/simple;
	bh=4xYrMJlz0cYxys9BCHTik5tUEsMdP0zzDBXcGu+Mnk8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pfVpxLOQfW8rL0DyYfTantypNv+NAC17N/ftOYSb9t7nnl1aUg3POGyvQpd0Fgg35BNooSKrI31lXCEB6sdxN0LSUZ0Jw3TdZAQozaPvUlNH2tzw7PvD+9qFjv0rjh2hjoZO0ECO29m+bIXQsffpzLJtBSWyKhoJwtlD//zzES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=aFZIlAry; arc=none smtp.client-ip=57.103.85.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="aFZIlAry"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-13 (Postfix) with ESMTPS id 4FD9718000A8;
	Tue, 24 Feb 2026 04:32:33 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; t=1771907555; x=1774499555; bh=Pja6XGOalivGgRhkxdpAY/zFZRYnDtTlXoFPWKB5PKo=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=aFZIlAryarxzyJPJ7xmYv+btSA6JG1IUQWoQ0aIpA7U9Yo7V/OLG97ZxLQIJ4J96JP16LbwwFwg6RfjwSTE2XJuKidICteZYBQfJkt6aFrKQ7Con0wfu63vSRCzgUs86WRsZrHP1g2bmpeSimJKkWJ5USGKy9Qqser4cjnoGeVgPMg3IAEwYHBe+amj4FodBY8WLqaf76e8aXFOqsfYotSc/WuYoNiCghKVqFiPbhFyDTimYVwNgedi3gn/SfN7Kr884YjdorELqzVhx3ER+xkfA3SmFEzUSZ2LZTbhM2ZrvByeG1J+aPvcRAI35GKEBxIeIMcM3zJpaM2AGa0aeqQ==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-13 (Postfix) with ESMTPSA id 716E018000ED;
	Tue, 24 Feb 2026 04:32:30 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.147.1.1\))
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: adjust screenpad
 power/brightness handling
From: luke@ljones.dev
In-Reply-To: <d42c4be9-5c2b-498a-b2dd-ac672c926c9b@linux.dev>
Date: Tue, 24 Feb 2026 17:15:22 +1300
Cc: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 Mateusz Schyboll <dragonn@op.pl>,
 Denis Benato <benato.denis96@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9EAA5AA-4B79-4B66-9B24-A0178D365F64@ljones.dev>
References: <20260212220252.1526337-1-denis.benato@linux.dev>
 <20260212220252.1526337-2-denis.benato@linux.dev>
 <71a3278d-d814-87cf-40cc-95bca45146e9@linux.intel.com>
 <d42c4be9-5c2b-498a-b2dd-ac672c926c9b@linux.dev>
To: Denis Benato <denis.benato@linux.dev>
X-Mailer: Apple Mail (2.3864.500.147.1.1)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzNiBTYWx0ZWRfX149DwgTfnAe/
 mQDaVlheMDrJUaSi91PeTrxoYctrubC5XoJ/ZwrrIbI1lMrRlydCopLBEJOHj/8Zoy0yf44NbJo
 qAhNl9YIKwZdxCD0af07oofgKBbqKb5CaF8wQigYgJtf5kbjXK5ZDaVhVauNob7Ap+0yMe8x6RP
 rh2uljoxu21Ec5vd9bGF3Ofe8TwvjiLNJAr0pPaDliKnPSyNRkG8efwNK11Oi2Ktlun03mI9bsw
 zJ1FkCMaiMqXIICynTLrnzKaaqkCjczfCLRhsoVAGndHSxdxgp1k/SGrbD4Wie83rbxiJg9Wvqe
 d07sLZBttZBsVW5fWzLURq7WznjS/9ikh6KwMTt+GBZmFm25vyzFC6onof1DkE=
X-Proofpoint-ORIG-GUID: 79msvaxx6hFTJUJyBXff1aD7xllOyrds
X-Proofpoint-GUID: 79msvaxx6hFTJUJyBXff1aD7xllOyrds
X-Authority-Info-Out: v=2.4 cv=P5A3RyAu c=1 sm=1 tr=0 ts=699d29e1
 cx=c_apl:c_apl_out:c_pps a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=oLjvw4fWjG-6mU-6ZlsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1030 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602240036
X-JNJ: AAAAAAABCHmzVeARLH4h3WZRxHpeiob1blbcVXBhLAXUu1nu4dnlNT0kfVie7N45ZNIkV5eT5RDGW0gaV/BMKo1TqwEW9Te1g5mUKwGAwKRqtrmhMIvlLL5avK4OEWezjgRtbPPCcdHdtzBnaKfdfb7MMRWm9S4bsldVPLdt44bqfvFEjxcnAP+bSK4F15EY19SNTDW6NiKqD2ITgNLnLzIx7KrutIjoqFNudpZz9qZVaeb5F1FMDbdap4xUsVpa0ly789H1+9rGqn5ypYo7/nB+xzJXNHR1XlXHp0MtE102+b6qqpOu8/vV0xvusY/niv3NBpMazjfIZlL7ybLd3qkObDW3+LPVcMxfqQmInntu5aEOHZDW9Id9S1Q8hN/QH22VxzAC28UbhjXZmuhgHUdMvdX0oLYbE3aLYEvpNNF8Y+EzLOyILf346J5kUC9ImAjhy4XVO+cvTaUdKXfqaDkEvceAi/CgI5JL3Xt/tXIXzl/VGi2laFoB07sTa+EQjetyoEP7TtZ8PQnfbbZum3MG8vZQ+xNW4EoSAZhYlS3vFut8zpdT5xviK0i+4RxIdFzTr5O+XQHZC6xakPeOy3PDoXVvYA+Bq3uEE11DVk/5F+aQJV8+2AUcHYZaVJRMkMTmD9A/1U7cZbePAlze9HKIoYdC/odtxgclyN1yGY4azTXPPIZ4dj5etXvWQQSsg5AmJkcOqoXpRq7YIZOTPmimeFs=


> On 24 Feb 2026, at 07:15, Denis Benato <denis.benato@linux.dev> wrote:
>=20
>=20
> On 2/23/26 15:38, Ilpo J=C3=A4rvinen wrote:
>> On Thu, 12 Feb 2026, Denis Benato wrote:
>>=20
>>> Fix illogical screen off control by hardcoding 0 and 1 depending on =
the
>>> requested brightness and also do not rely on the last screenpad
>>> power state to issue screen brightness commands.
>> Should this have a Fixes tag?
>>=20
> Same for the other patch: I am not sure.

It probably should be a fixes tag. Though there is no reference bug =
report or
other relating to it - only my discovery that the previously written =
code was in=20
fact not right.

I had written the initial version that is in the kernel based on some =
limited testing
feedback from a user who was not able to clearly articulate what the =
issues
were and was happy with the final result.

I was able to get my hands on a Zenbook Duo and fully test this, which =
is how
I discovered the issues.

> What I know for certain is that Luke had an asus DUO to test this =
patch with
> and most certainly it was because someone contacted him about these =
bugs.
>=20
> I split up commits found int the previous version of this patch:
> https://lore.kernel.org/all/20250525204214.104030-1-luke@ljones.dev/

Thanks for doing this. I just have not had any time to do it myself, =
very low on
the priority list but I would wager getting this all fixed correctly =
will enable both
Older and newer models to function how they should.

> I changed nothing else beside removing a redundant variable =
assignment.
>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>> Signed-off-by: Luke Jones <luke@ljones.dev>
>>> ---
>>> drivers/platform/x86/asus-wmi.c | 34 =
+++++++++++++--------------------
>>> 1 file changed, 13 insertions(+), 21 deletions(-)
>>>=20
>>> diff --git a/drivers/platform/x86/asus-wmi.c =
b/drivers/platform/x86/asus-wmi.c
>>> index 0775fadedd10..4130dae37e15 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -4254,32 +4254,24 @@ static int read_screenpad_brightness(struct =
backlight_device *bd)
>>>=20
>>> static int update_screenpad_bl_status(struct backlight_device *bd)
>>> {
>>> - struct asus_wmi *asus =3D bl_get_data(bd);
>>> - int power, err =3D 0;
>>> - u32 ctrl_param;
>>> + int err =3D 0;
>>> + u32 ctrl_param =3D bd->props.brightness;
>> Please retain reverse xmas-tree order.
>>=20
>>>=20
>>> - power =3D read_screenpad_backlight_power(asus);
>>> - if (power < 0)
>>> - return power;
>>> + if (ctrl_param >=3D 0 && bd->props.power) {
>>> + err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, =
NULL);
>>> + if (err < 0)
>>> + return err;
>>>=20
>>> - if (bd->props.power !=3D power) {
>>> - if (power !=3D BACKLIGHT_POWER_ON) {
>>> - /* Only brightness > 0 can power it back on */
>>> - ctrl_param =3D asus->driver->screenpad_brightness - =
ASUS_SCREENPAD_BRIGHT_MIN;
>>> - err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
>>> -    ctrl_param, NULL);
>>> - } else {
>>> - err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, =
NULL);
>>> - }
>>> - } else if (power =3D=3D BACKLIGHT_POWER_ON) {
>>> - /* Only set brightness if powered on or we get invalid/unsync =
state */
>>> - ctrl_param =3D bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
>>> err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, =
ctrl_param, NULL);
>>> + if (err < 0)
>>> + return err;
>>> }
>>>=20
>>> - /* Ensure brightness is stored to turn back on with */
>>> - if (err =3D=3D 0)
>>> - asus->driver->screenpad_brightness =3D bd->props.brightness + =
ASUS_SCREENPAD_BRIGHT_MIN;
>>> + if (!bd->props.power) {
>>> + err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, =
NULL);
>>> + if (err < 0)
>>> + return err;
>>> + }
>>>=20
>>> return err;
>>> }
>>>=20


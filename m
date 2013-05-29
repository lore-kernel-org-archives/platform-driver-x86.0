From: Bruce <bruce.ma@canonical.com>
Subject: Re: Patch for thinkpad-acpi.c
Date: Wed, 29 May 2013 11:54:57 +0800
Message-ID: <51A57C11.40403@canonical.com>
References: <51A47773.4080701@canonical.com> <87r4gr9z5o.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33273 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759239Ab3E2DzH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 May 2013 23:55:07 -0400
In-Reply-To: <87r4gr9z5o.fsf@nemi.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-kernel@vger.kernel.org

Hi, Bjorn

Thank your advice .
I will modify my code, then try to submit again.

Bruce.Ma
May 29,2013


On 05/28/2013 06:28 PM, Bj=C3=B8rn Mork wrote:
> Bruce <bruce.ma@canonical.com> writes:
>
>> +struct blacklist lenovo_blacklist[] =3D {
>> +  {
>> +    .model_s =3D "Lenovo LM490s",
>> +    .nummodel_s =3D "814YG01",
>> +  },
>
> The driver already has a list of LED support per model in the=20
>
>   static const struct tpacpi_quirk led_useful_qtable[] __initconst =3D=
 {}
>
> array.   Why do you duplicate this with lots of new model checking co=
de
> instead of just using the code that's already there?
>
>>  static void led_exit(void)
>>  {
>> +        if (no_led =3D=3D 1 ) {
>
> The driver already has provisions for signalling that LEDs are
> unsupported through the 'led_supported' variable.  Why do you add
> another variable, and duplicate testing in every access function?
>
> But I don't think this part is needed at all, as long as you set up t=
he
> proper LED map in led_useful_qtable.
>
>
>
> Bj=C3=B8rn

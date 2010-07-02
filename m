From: Axel Lin <axel.lin@gmail.com>
Subject: Re: [PATCH] fujitsu-laptop: remove unnecessary input_free_device
	calls
Date: Fri, 2 Jul 2010 15:20:03 +0800
Message-ID: <AANLkTim-bc7PfauAU-agGcX56AhziaU41uw2OoP9tvAQ@mail.gmail.com>
References: <1278034977.24246.6.camel@mola> <20100702061958.GA3691@core.coreip.homeip.net>
Reply-To: axel.lin@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:57229 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757756Ab0GBHUY convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 2 Jul 2010 03:20:24 -0400
In-Reply-To: <20100702061958.GA3691@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, platform-driver-x86@vger.kernel.org

hi Dmitry,

2010/7/2 Dmitry Torokhov <dmitry.torokhov@gmail.com>:
> Hi Axel,
>
> On Fri, Jul 02, 2010 at 09:42:57AM +0800, Axel Lin wrote:
>> input_free_device should only be used if input_register_device()
>> was not called yet or if it failed.
>> This patch removes unnecessary input_free_device calls.
>>
>> Signed-off-by: Axel Lin <axel.lin@gmail.com>
>> ---
>> =A0drivers/platform/x86/fujitsu-laptop.c | =A0 21 ++++++++----------=
---
>> =A01 files changed, 8 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platfor=
m/x86/fujitsu-laptop.c
>> index e325aeb..dab1a0e 100644
>> --- a/drivers/platform/x86/fujitsu-laptop.c
>> +++ b/drivers/platform/x86/fujitsu-laptop.c
>> @@ -686,8 +686,10 @@ static int acpi_fujitsu_add(struct acpi_device =
*device)
>> =A0 =A0 =A0 set_bit(KEY_UNKNOWN, input->keybit);
>>
>> =A0 =A0 =A0 error =3D input_register_device(input);
>> - =A0 =A0 if (error)
>> - =A0 =A0 =A0 =A0 =A0 =A0 goto err_free_input_dev;
>> + =A0 =A0 if (error) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 input_free_device(input);
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_stop;
>> + =A0 =A0 }
>
> Instead of using mixed in-line and goto style cleanup I prefer doig t=
he
> following:
>
> =A0err_unregister_input_dev:
> =A0 =A0 =A0 =A0input_unregister_device(input);
> =A0 =A0 =A0 =A0input =3D NULL; <-- !!!
> =A0err_free_input_dev:
> =A0 =A0 =A0 =A0input_free_device(input);
>
> input_free_device() happily accepts NULL pointers.

Thanks for the review. I will send a revised patch.

Regards,
Axel
>
> Otherwise the patch looks good.
>
> Thanks.
>
> --
> Dmitry
>

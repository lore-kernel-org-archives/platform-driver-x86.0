From: Axel Lin <axel.lin@gmail.com>
Subject: Re: [PATCH] hp-wmi: add return value checking for
	input_allocate_device()
Date: Tue, 6 Jul 2010 16:07:49 +0800
Message-ID: <AANLkTimpkmAoPep9s1Hp5gZvdjzDm_1iBO32xYeAQL5F@mail.gmail.com>
References: <1278383426.12801.15.camel@mola> <201007060956.45726.trenn@suse.de>
Reply-To: axel.lin@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:55819 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134Ab0GFIIK convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Jul 2010 04:08:10 -0400
In-Reply-To: <201007060956.45726.trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Frans Pop <elendil@planet.nl>, Anisse Astier <anisse@astier.eu>, platform-driver-x86@vger.kernel.org

hi Thomas,
2010/7/6 Thomas Renninger <trenn@suse.de>:
> Hi,
>
> it's incredible how much cleanups and fixes you find in this
> handful of drivers... It's very much appreciated!
>
> On Tuesday 06 July 2010 04:30:26 Axel Lin wrote:
>> Add error checking and return -ENOMEM if input_allocate_device() fai=
l.
>>
>> Signed-off-by: Axel Lin <axel.lin@gmail.com>
>> ---
>> =A0drivers/platform/x86/hp-wmi.c | =A0 =A02 ++
>> =A01 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp=
-wmi.c
>> index 51c07a0..c508e20 100644
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -402,6 +402,8 @@ static int __init hp_wmi_input_setup(void)
>> =A0 =A0 =A0 int err;
>>
>> =A0 =A0 =A0 hp_wmi_input_dev =3D input_allocate_device();
>> + =A0 =A0 if (!hp_wmi_input_dev)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>>
>> =A0 =A0 =A0 hp_wmi_input_dev->name =3D "HP WMI hotkeys";
>> =A0 =A0 =A0 hp_wmi_input_dev->phys =3D "wmi/input0";
> But also hp_wmi_input_setup() call should get checked and if it
> fails, the previous wmi_install_notify_handler() must get uninstalled
> again. Hm, probably the whole driver shouldn't load then and
> the error code from hp_wmi_input_setup() can be returned in
> hp_wmi_init(void).
>
> Do you mind to incorporate above if you agree.

Checking hp_wmi_input_setup() is already done in my previous patch.
( which is already merged in platform-driver-x86 tree.
http://git.kernel.org/?p=3Dlinux/kernel/git/mjg59/platform-drivers-x86.=
git;a=3Dcommitdiff;h=3Db035d5f9fcb6cd6bba44b764b17d885f4d960d37
).
Thus this patch only adds the return value checking for
input_allocate_device() in hp_wmi_input_setup().

Regards,
Axel


>
> Thanks,
>
> =A0 Thomas
>

From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] eeepc-wmi: fix compiler warning
Date: Sun, 14 Nov 2010 17:36:39 +0100
Message-ID: <AANLkTin-K9jWjtM5qGPP_ZQXFJSAQFCQd9sG939nV033@mail.gmail.com>
References: <20101103181400.GA12818@core.coreip.homeip.net>
	<AANLkTi=4U_kE6+V13=wJM+_7=iZW3NGew=jWcddDMO+m@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=4U_kE6+V13=wJM+_7=iZW3NGew=jWcddDMO+m@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Chris Bagwell <chris@cnpbagwell.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 3, 2010 at 7:43 PM, Chris Bagwell <chris@cnpbagwell.com> wr=
ote:
> On Wed, Nov 3, 2010 at 1:14 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>> This fixes the following:
>>
>> =C2=A0CC [M] =C2=A0drivers/platform/x86/eeepc-wmi.o
>> drivers/platform/x86/eeepc-wmi.c:322: warning: initialization from i=
ncompatible pointer type
>>
>> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
>> ---
>>
>> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 =C2=A04 ++--
>> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>>
>> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86=
/eeepc-wmi.c
>> index 462ceab..0d50fbb 100644
>> --- a/drivers/platform/x86/eeepc-wmi.c
>> +++ b/drivers/platform/x86/eeepc-wmi.c
>> @@ -298,8 +298,8 @@ static void eeepc_wmi_notify(u32 value, void *co=
ntext)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(obj);
>> =C2=A0}
>>
>> -static int store_cpufv(struct device *dev, struct device_attribute =
*attr,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *buf, size_t count)
>> +static ssize_t store_cpufv(struct device *dev, struct device_attrib=
ute *attr,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int value;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct acpi_buffer input =3D { (acpi_size=
)sizeof(value), &value };
>> --
>
> Opps. =C2=A0Sorry, I missed that warning. =C2=A0ssize_t is obviously =
correct return value.
>
> Reviewed-by: Chris Bagwell <chris@cnpbagwell.com>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>

Just queued the same patch on my repo, I should have read the list firs=
t.

Matthew can you queue this one for next batch ?
Thanks,

--=20
Corentin Chary
http://xf.iksaif.net

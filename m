From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 4/4] platform/x86: wmi: Fix check for method instance number
Date: Fri, 18 Aug 2017 15:20:36 +0300
Message-ID: <CAHp75VdMv1fNHLKsuMTeoJFSf75Sh_1te_vZJ-iCddSEEXSHCQ@mail.gmail.com>
References: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
 <1502523858-25716-5-git-send-email-pali.rohar@gmail.com> <20170817152431.GA19276@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170817152431.GA19276@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 17, 2017 at 6:24 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Sat, Aug 12, 2017 at 09:44:18AM +0200, Pali Roh=C3=A1r wrote:
>> instance_count defines number of instances of data block and instance
>> itself is indexed from zero, which means first instance has number 0.
>> Therefore check for invalid instance should be non-strict inequality.
>>
>> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>
> This is correct per the WMI specification. Pali, now that Andy has
> applied 1-3 of this series, is that all the required driver updates?
>
> Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>

Pushed to testing, thanks!

>
>
>> ---
>>  drivers/platform/x86/wmi.c |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
>> index e32ba57..0765b17 100644
>> --- a/drivers/platform/x86/wmi.c
>> +++ b/drivers/platform/x86/wmi.c
>> @@ -218,7 +218,7 @@ acpi_status wmi_evaluate_method(const char *guid_str=
ing, u8 instance,
>>       if (!(block->flags & ACPI_WMI_METHOD))
>>               return AE_BAD_DATA;
>>
>> -     if (block->instance_count < instance)
>> +     if (block->instance_count <=3D instance)
>>               return AE_BAD_PARAMETER;
>>
>>       input.count =3D 2;
>> @@ -265,7 +265,7 @@ static acpi_status __query_block(struct wmi_block *w=
block, u8 instance,
>>       block =3D &wblock->gblock;
>>       handle =3D wblock->acpi_device->handle;
>>
>> -     if (block->instance_count < instance)
>> +     if (block->instance_count <=3D instance)
>>               return AE_BAD_PARAMETER;
>>
>>       /* Check GUID is a data block */
>> @@ -392,7 +392,7 @@ acpi_status wmi_set_block(const char *guid_string, u=
8 instance,
>>       block =3D &wblock->gblock;
>>       handle =3D wblock->acpi_device->handle;
>>
>> -     if (block->instance_count < instance)
>> +     if (block->instance_count <=3D instance)
>>               return AE_BAD_PARAMETER;
>>
>>       /* Check GUID is a data block */
>> --
>> 1.7.9.5
>>
>>
>
> --
> Darren Hart
> VMware Open Source Technology Center



--=20
With Best Regards,
Andy Shevchenko

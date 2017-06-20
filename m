From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] acer-wmi: Using zero as the first WMI instance number
Date: Tue, 20 Jun 2017 20:22:46 +0300
Message-ID: <CAHp75Vd1ZRpZc3P5qnsiWTiURCUSOjsRfPKgShe3seJmsh1GRQ@mail.gmail.com>
References: <20170620090623.18364-1-jlee@suse.com> <20170620164851.GA32699@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35116 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbdFTRWs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jun 2017 13:22:48 -0400
In-Reply-To: <20170620164851.GA32699@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lee, Chun-Yi" <jlee@suse.com>, Andy Shevchenko <andy@infradead.org>

On Tue, Jun 20, 2017 at 7:48 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Tuesday 20 June 2017 17:06:23 Lee, Chun-Yi wrote:
>> Pali Roh=C3=A1r found that there have some wmi query/evaluation
>> code that they used 'one' as the first WMI instance number.
>> But the number is indexed from zero that it's must less than
>> the instance_count in _WDG.
>>
>> This patch changes those instance number from one to zero.
>>
>> Cc: Darren Hart <dvhart@infradead.org>
>> Cc: Andy Shevchenko <andy@infradead.org>
>> Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
>
> Looks good, Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

Unfortunately patchwork ignores this tag.
So, in the future please:
- put a tag on a separate line
- do _not_ prepend it by any characters including white spaces (except
new line :-) )

No need to resend this one.

Pushed to testing, thanks!

>
>> ---
>>  drivers/platform/x86/acer-wmi.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer=
-wmi.c
>> index 79fa5ab..ef420b6 100644
>> --- a/drivers/platform/x86/acer-wmi.c
>> +++ b/drivers/platform/x86/acer-wmi.c
>> @@ -700,7 +700,7 @@ struct acpi_buffer *result)
>>       input.length =3D sizeof(struct wmab_args);
>>       input.pointer =3D (u8 *)regbuf;
>>
>> -     status =3D wmi_evaluate_method(AMW0_GUID1, 1, 1, &input, result);
>> +     status =3D wmi_evaluate_method(AMW0_GUID1, 0, 1, &input, result);
>>
>>       return status;
>>  }
>> @@ -965,7 +965,7 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
>>       u32 tmp =3D 0;
>>       acpi_status status;
>>
>> -     status =3D wmi_evaluate_method(WMID_GUID1, 1, method_id, &input, &=
result);
>> +     status =3D wmi_evaluate_method(WMID_GUID1, 0, method_id, &input, &=
result);
>>
>>       if (ACPI_FAILURE(status))
>>               return status;
>> @@ -1275,7 +1275,7 @@ static acpi_status __init WMID_set_capabilities(vo=
id)
>>       acpi_status status;
>>       u32 devices;
>>
>> -     status =3D wmi_query_block(WMID_GUID2, 1, &out);
>> +     status =3D wmi_query_block(WMID_GUID2, 0, &out);
>>       if (ACPI_FAILURE(status))
>>               return status;
>>
>> @@ -2018,7 +2018,7 @@ static u32 get_wmid_devices(void)
>>       acpi_status status;
>>       u32 devices =3D 0;
>>
>> -     status =3D wmi_query_block(WMID_GUID2, 1, &out);
>> +     status =3D wmi_query_block(WMID_GUID2, 0, &out);
>>       if (ACPI_FAILURE(status))
>>               return 0;
>>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
With Best Regards,
Andy Shevchenko

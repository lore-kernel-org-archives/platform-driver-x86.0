From: Axel Lin <axel.lin@gmail.com>
Subject: Re: [PATCH v2] acer-wmi: fix memory leaks in wmab_execute error path
Date: Tue, 13 Jul 2010 10:14:41 +0800
Message-ID: <AANLkTinM51K1s9dMqcmqZebF-x_bOK0OlKADkparP-Ek@mail.gmail.com>
References: <1278650256.26099.4.camel@mola> <20100712183547.2a873fac.akpm@linux-foundation.org>
Reply-To: axel.lin@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100712183547.2a873fac.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Thomas Renninger <trenn@suse.de>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

2010/7/13 Andrew Morton <akpm@linux-foundation.org>:
> On Fri, 09 Jul 2010 12:37:36 +0800 Axel Lin <axel.lin@gmail.com> wrot=
e:
>
>> When acpi_evaluate_object() is passed ACPI_ALLOCATE_BUFFER,
>> the caller must kfree the returned buffer if AE_OK is returned.
>>
>> Call Trace:
>> wmab_execute
>> =A0 -> wmi_evaluate_method
>> =A0 =A0 -> acpi_evaluate_object
>>
>> Thus if callers of wmab_execute() pass ACPI_ALLOCATE_BUFFER,
>> the return buffer must be kfreed if wmab_execute return AE_OK.
>>
>> Signed-off-by: Axel Lin <axel.lin@gmail.com>
>> ---
>> =A0drivers/platform/x86/acer-wmi.c | =A0 11 ++++++++++-
>> =A01 files changed, 10 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/=
acer-wmi.c
>> index 1ea6c43..3f44446 100644
>> --- a/drivers/platform/x86/acer-wmi.c
>> +++ b/drivers/platform/x86/acer-wmi.c
>> @@ -555,6 +555,7 @@ static acpi_status AMW0_find_mailled(void)
>> =A0 =A0 =A0 obj->buffer.length =3D=3D sizeof(struct wmab_ret)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D *((struct wmab_ret *) obj->buffe=
r.pointer);
>> =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 kfree(out.pointer);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return AE_ERROR;
>> =A0 =A0 =A0 }
>>
>> @@ -598,6 +599,7 @@ static acpi_status AMW0_set_capabilities(void)
>> =A0 =A0 =A0 obj->buffer.length =3D=3D sizeof(struct wmab_ret)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D *((struct wmab_ret *) obj->buffe=
r.pointer);
>> =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 kfree(out.pointer);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return AE_ERROR;
>> =A0 =A0 =A0 }
>>
>> @@ -607,15 +609,22 @@ static acpi_status AMW0_set_capabilities(void)
>> =A0 =A0 =A0 args.ebx =3D 2 << 8;
>> =A0 =A0 =A0 args.ebx |=3D ACER_AMW0_BLUETOOTH_MASK;
>>
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* It's ok to use existing buffer for next wmab_execute =
call.
>> + =A0 =A0 =A0* But we need to kfree(out.pointer) if next wmab_execut=
e fail.
>> + =A0 =A0 =A0*/
>> =A0 =A0 =A0 status =3D wmab_execute(&args, &out);
>> - =A0 =A0 if (ACPI_FAILURE(status))
>> + =A0 =A0 if (ACPI_FAILURE(status)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 kfree(out.pointer);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return status;
>> + =A0 =A0 }
>>
>> =A0 =A0 =A0 obj =3D (union acpi_object *) out.pointer;
>> =A0 =A0 =A0 if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER
>> =A0 =A0 =A0 && obj->buffer.length =3D=3D sizeof(struct wmab_ret)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D *((struct wmab_ret *) obj->buffe=
r.pointer);
>> =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 kfree(out.pointer);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return AE_ERROR;
>> =A0 =A0 =A0 }
>
> I think it's best to remove the multiple-return-points approach in
> favour of the "goto single return point which undoes things" approach=
=2E
> that way we reduce the risk of later introducing more leaks.
>
> Please review:
>
> From: Andrew Morton <akpm@linux-foundation.org>
>
> avoid multiple return points
> remove unneeded cast
> remove unneeded initialisation of `status'
>
> Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
> Cc: Axel Lin <axel.lin@gmail.com>
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: Thomas Renninger <trenn@suse.de>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

I'm not the author, but since I'm in the CC list and it looks good to m=
e.
Acked-by: Axel Lin <axel.lin@gmail.com>

> ---
>
> =A0drivers/platform/x86/acer-wmi.c | =A0 25 ++++++++++++-------------
> =A01 file changed, 12 insertions(+), 13 deletions(-)
>
> diff -puN drivers/platform/x86/acer-wmi.c~acer-wmi-fix-memory-leaks-i=
n-wmab_execute-error-path-v2-fix drivers/platform/x86/acer-wmi.c
> --- a/drivers/platform/x86/acer-wmi.c~acer-wmi-fix-memory-leaks-in-wm=
ab_execute-error-path-v2-fix
> +++ a/drivers/platform/x86/acer-wmi.c
> @@ -571,7 +571,7 @@ static acpi_status AMW0_set_capabilities
> =A0{
> =A0 =A0 =A0 =A0struct wmab_args args;
> =A0 =A0 =A0 =A0struct wmab_ret ret;
> - =A0 =A0 =A0 acpi_status status =3D AE_OK;
> + =A0 =A0 =A0 acpi_status status;
> =A0 =A0 =A0 =A0struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NUL=
L };
> =A0 =A0 =A0 =A0union acpi_object *obj;
>
> @@ -594,13 +594,13 @@ static acpi_status AMW0_set_capabilities
> =A0 =A0 =A0 =A0if (ACPI_FAILURE(status))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return status;
>
> - =A0 =A0 =A0 obj =3D (union acpi_object *) out.pointer;
> + =A0 =A0 =A0 obj =3D out.pointer;
> =A0 =A0 =A0 =A0if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
> =A0 =A0 =A0 =A0obj->buffer.length =3D=3D sizeof(struct wmab_ret)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D *((struct wmab_ret *) obj->buf=
fer.pointer);
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(out.pointer);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return AE_ERROR;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D AE_ERROR;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (ret.eax & 0x1)
> @@ -614,25 +614,21 @@ static acpi_status AMW0_set_capabilities
> =A0 =A0 =A0 =A0 * But we need to kfree(out.pointer) if next wmab_exec=
ute fail.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0status =3D wmab_execute(&args, &out);
> - =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(out.pointer);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return status;
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 if (ACPI_FAILURE(status))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>
> =A0 =A0 =A0 =A0obj =3D (union acpi_object *) out.pointer;
> =A0 =A0 =A0 =A0if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER
> =A0 =A0 =A0 =A0&& obj->buffer.length =3D=3D sizeof(struct wmab_ret)) =
{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D *((struct wmab_ret *) obj->buf=
fer.pointer);
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(out.pointer);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return AE_ERROR;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D AE_ERROR;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (ret.eax & 0x1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interface->capability |=3D ACER_CAP_BL=
UETOOTH;
>
> - =A0 =A0 =A0 kfree(out.pointer);
> -
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * This appears to be safe to enable, since all Wistro=
n based laptops
> =A0 =A0 =A0 =A0 * appear to use the same EC register for brightness, =
even if they
> @@ -641,7 +637,10 @@ static acpi_status AMW0_set_capabilities
> =A0 =A0 =A0 =A0if (quirks->brightness >=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interface->capability |=3D ACER_CAP_BR=
IGHTNESS;
>
> - =A0 =A0 =A0 return AE_OK;
> + =A0 =A0 =A0 status =3D AE_OK;
> +out:
> + =A0 =A0 =A0 kfree(out.pointer);
> + =A0 =A0 =A0 return status;
> =A0}
>
> =A0static struct wmi_interface AMW0_interface =3D {
> _
>
>

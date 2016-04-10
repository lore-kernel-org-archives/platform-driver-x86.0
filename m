From: "Li, Aubrey" <aubrey.li@linux.intel.com>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Sun, 10 Apr 2016 21:46:48 +0800
Message-ID: <570A5948.8000405@linux.intel.com>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
 <CAHp75VeKgVwOQ7U9=a92hcts8tPJriRtNJ3h2nHL_BXVXc7D5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:40451 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753026AbcDJNqv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 10 Apr 2016 09:46:51 -0400
In-Reply-To: <CAHp75VeKgVwOQ7U9=a92hcts8tPJriRtNJ3h2nHL_BXVXc7D5Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: qipeng.zha@intel.com, "dvhart@infradead.org" <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2016/4/10 21:17, Andy Shevchenko wrote:
> On Thu, Mar 31, 2016 at 10:28 PM, Aubrey Li <aubrey.li@linux.intel.co=
m> wrote:
>> Currently the optional IPC resources prevent telemetry driver from
>> probing if these resources are not in ACPI table. This patch decoupl=
es
>> telemetry driver from these optional resources, so that telemetry dr=
iver
>> has dependency only on the necessary ACPI resources.
>=20
> Darren, I have comments as well.
>=20
>>
>> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>
>> ---
>>  drivers/platform/x86/intel_pmc_ipc.c   |   48 +++++++++++++++------=
-----------
>>  drivers/platform/x86/intel_punit_ipc.c |   48 +++++++++++++++++++++=
-----------
>>  2 files changed, 54 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform=
/x86/intel_pmc_ipc.c
>> index 092519e..29d9c02 100644
>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>> @@ -686,8 +686,8 @@ static int ipc_plat_get_res(struct platform_devi=
ce *pdev)
>>         ipcdev.acpi_io_size =3D size;
>>         dev_info(&pdev->dev, "io res: %pR\n", res);
>>
>> -       /* This is index 0 to cover BIOS data register */
>>         punit_res =3D punit_res_array;
>> +       /* This is index 0 to cover BIOS data register */
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>                                     PLAT_RESOURCE_BIOS_DATA_INDEX);
>>         if (!res) {
>> @@ -697,55 +697,51 @@ static int ipc_plat_get_res(struct platform_de=
vice *pdev)
>>         *punit_res =3D *res;
>>         dev_info(&pdev->dev, "punit BIOS data res: %pR\n", res);
>>
>> +       /* This is index 1 to cover BIOS interface register */
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>                                     PLAT_RESOURCE_BIOS_IFACE_INDEX);
>>         if (!res) {
>>                 dev_err(&pdev->dev, "Failed to get res of punit BIOS=
 iface\n");
>>                 return -ENXIO;
>>         }
>> -       /* This is index 1 to cover BIOS interface register */
>>         *++punit_res =3D *res;
>>         dev_info(&pdev->dev, "punit BIOS interface res: %pR\n", res)=
;
>>
>> +       /* This is index 2 to cover ISP data register, optional */
>=20
> All above looks like a commentary fixes (except an additional
> 'optional' word in one case). Can you do this separately?

I don't think it's necessary.

>=20
>=20
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>                                     PLAT_RESOURCE_ISP_DATA_INDEX);
>> -       if (!res) {
>> -               dev_err(&pdev->dev, "Failed to get res of punit ISP =
data\n");
>> -               return -ENXIO;
>> +       ++punit_res;
>> +       if (res) {
>> +               *punit_res =3D *res;
>> +               dev_info(&pdev->dev, "punit ISP data res: %pR\n", re=
s);
>=20
> Okay, what if you re-arrange this to some helper first
>=20

Thanks for the idea, but I don't like a helper here, did you see
anything harmful of the current implementation?

> int =E2=80=A6_assign_res(*pdev, index, *punit_res)
> {
>  struct resource res;
>  res =3D platform_get_resource(pdev, =E2=80=A6, index);
>  if (!res)
>   return -ERRNO;
>  *punit_res =3D *res;
>  dev_dbg(%pR);
>  return 0;
> }
>=20
> In this patch you move to optional by
> dev_err -> dev_warn
>=20
> and use
>=20
> if (ret)
>   dev_warn( "=E2=80=A6skip  optional resource=E2=80=A6" );
>=20
> instead of
> if (ret) {
>  dev_err();
>  return ret;
> }
>=20
>>         }
>> -       /* This is index 2 to cover ISP data register */
>> -       *++punit_res =3D *res;
>> -       dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
>>
>> +       /* This is index 3 to cover ISP interface register, optional=
 */
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>                                     PLAT_RESOURCE_ISP_IFACE_INDEX);
>> -       if (!res) {
>> -               dev_err(&pdev->dev, "Failed to get res of punit ISP =
iface\n");
>> -               return -ENXIO;
>> +       ++punit_res;
>> +       if (res) {
>> +               *punit_res =3D *res;
>> +               dev_info(&pdev->dev, "punit ISP interface res: %pR\n=
", res);
>>         }
>> -       /* This is index 3 to cover ISP interface register */
>> -       *++punit_res =3D *res;
>> -       dev_info(&pdev->dev, "punit ISP interface res: %pR\n", res);
>>
>> +       /* This is index 4 to cover GTD data register, optional */
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>                                     PLAT_RESOURCE_GTD_DATA_INDEX);
>> -       if (!res) {
>> -               dev_err(&pdev->dev, "Failed to get res of punit GTD =
data\n");
>> -               return -ENXIO;
>> +       ++punit_res;
>> +       if (res) {
>> +               *punit_res =3D *res;
>> +               dev_info(&pdev->dev, "punit GTD data res: %pR\n", re=
s);
>>         }
>> -       /* This is index 4 to cover GTD data register */
>> -       *++punit_res =3D *res;
>> -       dev_info(&pdev->dev, "punit GTD data res: %pR\n", res);
>>
>> +       /* This is index 5 to cover GTD interface register, optional=
 */
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>                                     PLAT_RESOURCE_GTD_IFACE_INDEX);
>> -       if (!res) {
>> -               dev_err(&pdev->dev, "Failed to get res of punit GTD =
iface\n");
>> -               return -ENXIO;
>> +       ++punit_res;
>> +       if (res) {
>> +               *punit_res =3D *res;
>> +               dev_info(&pdev->dev, "punit GTD interface res: %pR\n=
", res);
>>         }
>> -       /* This is index 5 to cover GTD interface register */
>> -       *++punit_res =3D *res;
>> -       dev_info(&pdev->dev, "punit GTD interface res: %pR\n", res);
>>
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>                                     PLAT_RESOURCE_IPC_INDEX);
>> diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platfo=
rm/x86/intel_punit_ipc.c
>> index bd87540..a47a41f 100644
>> --- a/drivers/platform/x86/intel_punit_ipc.c
>> +++ b/drivers/platform/x86/intel_punit_ipc.c
>> @@ -227,6 +227,11 @@ static int intel_punit_get_bars(struct platform=
_device *pdev)
>>         struct resource *res;
>>         void __iomem *addr;
>>
>> +       /*
>> +        * The following resources are required
>> +        * - BIOS_IPC BASE_DATA
>> +        * - BIOS_IPC BASE_IFACE
>> +        */
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>         addr =3D devm_ioremap_resource(&pdev->dev, res);
>>         if (IS_ERR(addr))
>> @@ -239,29 +244,40 @@ static int intel_punit_get_bars(struct platfor=
m_device *pdev)
>>                 return PTR_ERR(addr);
>>         punit_ipcdev->base[BIOS_IPC][BASE_IFACE] =3D addr;
>>
>> +       /*
>> +        * The following resources are optional
>> +        * - ISPDRIVER_IPC BASE_DATA
>> +        * - ISPDRIVER_IPC BASE_IFACE
>> +        * - GTDRIVER_IPC BASE_DATA
>> +        * - GTDRIVER_IPC BASE_IFACE
>> +        */
>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
>> -       addr =3D devm_ioremap_resource(&pdev->dev, res);
>> -       if (IS_ERR(addr))
>> -               return PTR_ERR(addr);
>> -       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] =3D addr;
>> +       if (res) {
>> +               addr =3D devm_ioremap_resource(&pdev->dev, res);
>> +               if (!IS_ERR(addr))
>> +                       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA]=
 =3D addr;
>> +       }
>=20
> And here, what about just replacing return to dev_warn()?

I don't think we need to continue the subsequent ops if an error addres=
s
returns.

Thanks,
-Aubrey

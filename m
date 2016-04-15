From: "Li, Aubrey" <aubrey.li@linux.intel.com>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Fri, 15 Apr 2016 10:18:58 +0800
Message-ID: <57104F92.9060908@linux.intel.com>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
 <CAHp75VeKgVwOQ7U9=a92hcts8tPJriRtNJ3h2nHL_BXVXc7D5Q@mail.gmail.com>
 <570A5948.8000405@linux.intel.com> <20160415003236.GA3232@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:28754 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752689AbcDOCTD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Apr 2016 22:19:03 -0400
In-Reply-To: <20160415003236.GA3232@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, qipeng.zha@intel.com, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2016/4/15 8:32, Darren Hart wrote:
> On Sun, Apr 10, 2016 at 09:46:48PM +0800, Li, Aubrey wrote:
>> On 2016/4/10 21:17, Andy Shevchenko wrote:
>>> On Thu, Mar 31, 2016 at 10:28 PM, Aubrey Li <aubrey.li@linux.intel.=
com> wrote:
>>>> Currently the optional IPC resources prevent telemetry driver from
>>>> probing if these resources are not in ACPI table. This patch decou=
ples
>>>> telemetry driver from these optional resources, so that telemetry =
driver
>>>> has dependency only on the necessary ACPI resources.
>>>
>>> Darren, I have comments as well.
>>>
>>>>
>>>> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>
>>>> ---
>>>>  drivers/platform/x86/intel_pmc_ipc.c   |   48 +++++++++++++++----=
-------------
>>>>  drivers/platform/x86/intel_punit_ipc.c |   48 +++++++++++++++++++=
++-----------
>>>>  2 files changed, 54 insertions(+), 42 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platfo=
rm/x86/intel_pmc_ipc.c
>>>> index 092519e..29d9c02 100644
>>>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>>>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>>>> @@ -686,8 +686,8 @@ static int ipc_plat_get_res(struct platform_de=
vice *pdev)
>>>>         ipcdev.acpi_io_size =3D size;
>>>>         dev_info(&pdev->dev, "io res: %pR\n", res);
>>>>
>>>> -       /* This is index 0 to cover BIOS data register */
>>>>         punit_res =3D punit_res_array;
>>>> +       /* This is index 0 to cover BIOS data register */
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>>>                                     PLAT_RESOURCE_BIOS_DATA_INDEX)=
;
>>>>         if (!res) {
>>>> @@ -697,55 +697,51 @@ static int ipc_plat_get_res(struct platform_=
device *pdev)
>>>>         *punit_res =3D *res;
>>>>         dev_info(&pdev->dev, "punit BIOS data res: %pR\n", res);
>>>>
>>>> +       /* This is index 1 to cover BIOS interface register */
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>>>                                     PLAT_RESOURCE_BIOS_IFACE_INDEX=
);
>>>>         if (!res) {
>>>>                 dev_err(&pdev->dev, "Failed to get res of punit BI=
OS iface\n");
>>>>                 return -ENXIO;
>>>>         }
>>>> -       /* This is index 1 to cover BIOS interface register */
>>>>         *++punit_res =3D *res;
>>>>         dev_info(&pdev->dev, "punit BIOS interface res: %pR\n", re=
s);
>>>>
>>>> +       /* This is index 2 to cover ISP data register, optional */
>>>
>>> All above looks like a commentary fixes (except an additional
>>> 'optional' word in one case). Can you do this separately?
>>
>> I don't think it's necessary.
>>
>=20
> This is typically necessary as you would not want the comment fixes a=
bove to be
> backed out if the functional changes below were found to be buggy and=
 reverted.
> This is why we encourage small functional changes. It protects agains=
t
> inadvertent reverts and facilitates review.
>=20
> That said, these comment changes continue below in a way that makes i=
t a bit
> difficult to isolate them out, so I do not particularly object.

Yes, these comment changes are supposed to be together with the
functional changes, without functional changes, I won't touch these
comments.

>=20
> That said, everyone should understand that Andy is part of the
> platform-driver-x86 maintainer team so please respect his comments as=
 such.

I know Andy very well, we co-worked with PMC driver before, it was a
nice process.

>=20
>>>
>>>
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>>>                                     PLAT_RESOURCE_ISP_DATA_INDEX);
>>>> -       if (!res) {
>>>> -               dev_err(&pdev->dev, "Failed to get res of punit IS=
P data\n");
>>>> -               return -ENXIO;
>>>> +       ++punit_res;
>>>> +       if (res) {
>>>> +               *punit_res =3D *res;
>>>> +               dev_info(&pdev->dev, "punit ISP data res: %pR\n", =
res);
>>>
>>> Okay, what if you re-arrange this to some helper first
>>>
>>
>> Thanks for the idea, but I don't like a helper here, did you see
>> anything harmful of the current implementation?
>=20
> In both arguments, we need to identify the WHY.
>=20
> I imagine Andy is trying to reduce the copy and paste potential for e=
rror as
> well as error introduction in future patches. There are... 7 or so ca=
ses with
> near identical usage, that's a compelling argument for a refactor suc=
h as the
> helper Andy suggests.
>=20
> Aubrey, you said you don't like it. Why is that? Will it not save eno=
ugh lines
> of code to be worth it? Are you concerned about revalidating the chan=
ge?

dev_info with different strings makes the helper useless, or more
complex than desired if we have to write a helper here.

Also, we have necessary resource above, which returns directly if there
is a error. For the coding style consistency in a routine, I really
don't like we call platform_get_resource() directly at first and then
put it into a helper later. The current implementation is
straightforward and clean.

>=20
> In my opinion, a refactor is a good suggestion, but I would be OK wit=
h this
> patch as it is and a refactor to follow. I hesitate to do this when t=
he refactor
> is really critical as it may not happen, but in this case, it doesn't=
 seem
> absolutely necessary.
>=20
>>
>>> int =E2=80=A6_assign_res(*pdev, index, *punit_res)
>>> {
>>>  struct resource res;
>>>  res =3D platform_get_resource(pdev, =E2=80=A6, index);
>>>  if (!res)
>>>   return -ERRNO;
>>>  *punit_res =3D *res;
>>>  dev_dbg(%pR);
>>>  return 0;
>>> }
>>>
>>> In this patch you move to optional by
>>> dev_err -> dev_warn
>>>
>>> and use
>>>
>>> if (ret)
>>>   dev_warn( "=E2=80=A6skip  optional resource=E2=80=A6" );
>>>
>>> instead of
>>> if (ret) {
>>>  dev_err();
>>>  return ret;
>>> }
>>>
>>>>         }
>>>> -       /* This is index 2 to cover ISP data register */
>>>> -       *++punit_res =3D *res;
>>>> -       dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
>>>>
>>>> +       /* This is index 3 to cover ISP interface register, option=
al */
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>>>                                     PLAT_RESOURCE_ISP_IFACE_INDEX)=
;
>>>> -       if (!res) {
>>>> -               dev_err(&pdev->dev, "Failed to get res of punit IS=
P iface\n");
>>>> -               return -ENXIO;
>>>> +       ++punit_res;
>>>> +       if (res) {
>>>> +               *punit_res =3D *res;
>>>> +               dev_info(&pdev->dev, "punit ISP interface res: %pR=
\n", res);
>>>>         }
>>>> -       /* This is index 3 to cover ISP interface register */
>>>> -       *++punit_res =3D *res;
>>>> -       dev_info(&pdev->dev, "punit ISP interface res: %pR\n", res=
);
>>>>
>>>> +       /* This is index 4 to cover GTD data register, optional */
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>>>                                     PLAT_RESOURCE_GTD_DATA_INDEX);
>>>> -       if (!res) {
>>>> -               dev_err(&pdev->dev, "Failed to get res of punit GT=
D data\n");
>>>> -               return -ENXIO;
>>>> +       ++punit_res;
>>>> +       if (res) {
>>>> +               *punit_res =3D *res;
>>>> +               dev_info(&pdev->dev, "punit GTD data res: %pR\n", =
res);
>>>>         }
>>>> -       /* This is index 4 to cover GTD data register */
>>>> -       *++punit_res =3D *res;
>>>> -       dev_info(&pdev->dev, "punit GTD data res: %pR\n", res);
>>>>
>>>> +       /* This is index 5 to cover GTD interface register, option=
al */
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>>>                                     PLAT_RESOURCE_GTD_IFACE_INDEX)=
;
>>>> -       if (!res) {
>>>> -               dev_err(&pdev->dev, "Failed to get res of punit GT=
D iface\n");
>>>> -               return -ENXIO;
>>>> +       ++punit_res;
>>>> +       if (res) {
>>>> +               *punit_res =3D *res;
>>>> +               dev_info(&pdev->dev, "punit GTD interface res: %pR=
\n", res);
>>>>         }
>>>> -       /* This is index 5 to cover GTD interface register */
>>>> -       *++punit_res =3D *res;
>>>> -       dev_info(&pdev->dev, "punit GTD interface res: %pR\n", res=
);
>>>>
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>>>>                                     PLAT_RESOURCE_IPC_INDEX);
>>>> diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/plat=
form/x86/intel_punit_ipc.c
>>>> index bd87540..a47a41f 100644
>>>> --- a/drivers/platform/x86/intel_punit_ipc.c
>>>> +++ b/drivers/platform/x86/intel_punit_ipc.c
>>>> @@ -227,6 +227,11 @@ static int intel_punit_get_bars(struct platfo=
rm_device *pdev)
>>>>         struct resource *res;
>>>>         void __iomem *addr;
>>>>
>>>> +       /*
>>>> +        * The following resources are required
>>>> +        * - BIOS_IPC BASE_DATA
>>>> +        * - BIOS_IPC BASE_IFACE
>>>> +        */
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>         addr =3D devm_ioremap_resource(&pdev->dev, res);
>>>>         if (IS_ERR(addr))
>>>> @@ -239,29 +244,40 @@ static int intel_punit_get_bars(struct platf=
orm_device *pdev)
>>>>                 return PTR_ERR(addr);
>>>>         punit_ipcdev->base[BIOS_IPC][BASE_IFACE] =3D addr;
>>>>
>>>> +       /*
>>>> +        * The following resources are optional
>>>> +        * - ISPDRIVER_IPC BASE_DATA
>>>> +        * - ISPDRIVER_IPC BASE_IFACE
>>>> +        * - GTDRIVER_IPC BASE_DATA
>>>> +        * - GTDRIVER_IPC BASE_IFACE
>>>> +        */
>>>>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
>>>> -       addr =3D devm_ioremap_resource(&pdev->dev, res);
>>>> -       if (IS_ERR(addr))
>>>> -               return PTR_ERR(addr);
>>>> -       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] =3D addr;
>>>> +       if (res) {
>>>> +               addr =3D devm_ioremap_resource(&pdev->dev, res);
>>>> +               if (!IS_ERR(addr))
>>>> +                       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DAT=
A] =3D addr;
>>>> +       }
>>>
>>> And here, what about just replacing return to dev_warn()?
>>
>> I don't think we need to continue the subsequent ops if an error add=
ress
>> returns.
>=20
> Why is that? Will the driver fail to provide any functionality? Or co=
uld it be
> the other IFACEs could still be of some use?
>=20
> This one does need a justification.
>=20
We discussed this.
- For the necessary resources, if we obtain an error address, we should
return immediately.
- For the optional resources, we keep quiet if we don't get them, that
is, not throwing a warning out.

Thanks,
-Aubrey

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10163C55ABD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 18:53:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 937E522241
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 18:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="cm+/77aE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgKLSxV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Nov 2020 13:53:21 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3795 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgKLSxU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Nov 2020 13:53:20 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fad849a0000>; Thu, 12 Nov 2020 10:53:14 -0800
Received: from [10.20.23.185] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Nov
 2020 18:53:18 +0000
Subject: Re: [PATCH v4] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
To:     Hans de Goede <hdegoede@redhat.com>,
        <platform-driver-x86@vger.kernel.org>
CC:     <andy@infradead.org>, <dvhart@infradead.org>, <lukas@wunner.de>,
        <pobrn@protonmail.com>, <dri-devel@lists.freedesktop.org>,
        <peter@lekensteyn.nl>
References: <c7dcb052-0ccf-dae3-49dd-1518f5ab182e@nvidia.com>
 <20200902173851.224368-1-ddadap@nvidia.com>
 <92f0b784-a931-2c45-a98c-789430d4c6e9@redhat.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <35147557-4fc1-be3f-8edc-ce6393144165@nvidia.com>
Date:   Thu, 12 Nov 2020 12:53:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <92f0b784-a931-2c45-a98c-789430d4c6e9@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605207194; bh=vV9FLwyqX1AYWXt1/AYYw2ce2CINl2FFRj/lWhUbeUU=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=cm+/77aEPUbBLTagxEXwnp422Rizq1VniJsGyodlDSiTUms6FbfKY9Bok4VD2yZh+
         HZ7NG0PVtY7/ruqkgvIwmY+xsqBWixZ70gHY3rOZ5KirAD5uUQGFuiSOHynOUxQL/h
         KOXWK7TruSG5yBpfhHpKuURdQgDg09MW4V633yMb4mIvDt0F94JqwvdzSKSfneF4xY
         66iBvWfqiKtspyOx5KF+sPiCAAyCNxHHXypRQxti/Vrm2rM7YosP/AIF5GVrrbtcy+
         q1NYom93euwCn8CM+J8PvGh+FKXZpDzuUPj5wxkRbzItY5w/VhiMM2tmcCrZdE0UfP
         JddrnGGOzsvAA==
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 11/10/20 3:29 AM, Hans de Goede wrote:
> Hi Daniel,


Hi Hans,


> Quick self intro: I have take over drivers/platform/x86
> maintainership from Andy; and I'm working my way through
> the backlog of old patches in patchwork:
> https://patchwork.kernel.org/project/platform-driver-x86/list/


Thanks for the introduction. I believe we have corresponded in the past=20
regarding other issues. Thank you for following up on this patch set.


> On 9/2/20 7:38 PM, Daniel Dadap wrote:
>> Some upcoming notebook designs utilize display muxes driven by a
>> pair of ACPI methods, MXDM to query and configure the operational
>> mode of the mux (integrated only, discrete only, hybrid non-muxed,
>> hybrid with dynamic mux switching), and MXDS to query and set the
>> mux state when running in dynamic switch mode.
>>
>> Add a vga-switcheroo driver to support switching the mux on systems
>> with the ACPI MXDM/MXDS interface. The mux mode cannot be changed
>> dynamically (calling MXDM to change the mode won't have effect until
>> the next boot, and calling MXDM to read the mux mode returns the
>> active mode, not the mode that will be enabled on next boot), and
>> MXDS only works when the mux mode is set to dynamic switch, so this
>> driver will fail to load when MXDM reports any non-dynamic mode.
>>
>> This driver currently only supports systems with Intel integrated
>> graphics and NVIDIA discrete graphics. It will need to be updated if
>> designs are developed using the same interfaces which utilize GPUs
>> from other vendors.
>>
>> v2,v3: misc. fixes suggested by Barnab=C3=A1s P=C5=91cze <pobrn@protonma=
il.com>
>> v4: misc. changes suggested by Lukas Wunner <lukas@wunner.de>
> According to the discussion archived here:
> https://patchwork.kernel.org/project/platform-driver-x86/patch/2020090217=
3851.224368-1-ddadap@nvidia.com/
>
> Andy did a review and you promised a new version, but I don't see
> a newer version in patchwork. Can you please submit a new version
> addressing Andy's remarks ? Then I will review and merge the new
> version.
>
> In that discussion you also promised a new version of this patch:
> https://patchwork.kernel.org/project/platform-driver-x86/patch/2020073120=
2154.11382-1-ddadap@nvidia.com/
>
> So please also submit a new version of that series.


You are right. I do have updated versions of those patches, but enough=20
time has passed that I do not recall if I tested them and failed to=20
follow up on the e-mail threads, or had yet to test them. So I will test=20
the updated patches and get them to you. Thanks.


> Thanks & Regards,
>
> Hans
>
>
>
>
>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>   MAINTAINERS                      |   6 +
>>   drivers/platform/x86/Kconfig     |   9 ++
>>   drivers/platform/x86/Makefile    |   2 +
>>   drivers/platform/x86/mxds-gmux.c | 265 +++++++++++++++++++++++++++++++
>>   4 files changed, 282 insertions(+)
>>   create mode 100644 drivers/platform/x86/mxds-gmux.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index eeff55560759..636c9259b345 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11510,6 +11510,12 @@ L:   linux-usb@vger.kernel.org
>>   S:   Maintained
>>   F:   drivers/usb/musb/
>>
>> +MXDS GMUX DRIVER
>> +M:   Daniel Dadap <ddadap@nvidia.com>
>> +L:   platform-driver-x86@vger.kernel.org
>> +S:   Supported
>> +F:   drivers/platform/x86/mxds-gmux.c
>> +
>>   MXL301RF MEDIA DRIVER
>>   M:   Akihiro Tsukada <tskd08@gmail.com>
>>   L:   linux-media@vger.kernel.org
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 0ad7ad8cf8e1..5d00ad1ffc0e 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1368,6 +1368,15 @@ config INTEL_TELEMETRY
>>          directly via debugfs files. Various tools may use
>>          this interface for SoC state monitoring.
>>
>> +config MXDS_GMUX
>> +     tristate "ACPI MXDS Gmux Driver"
>> +     depends on ACPI_WMI
>> +     depends on ACPI
>> +     depends on VGA_SWITCHEROO
>> +     help
>> +       This driver provides support for ACPI-driven gmux devices which =
are
>> +       present on some notebook designs with hybrid graphics.
>> +
>>   endif # X86_PLATFORM_DEVICES
>>
>>   config PMC_ATOM
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
>> index 53408d965874..b79000733fae 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)             +=3D intel=
_telemetry_core.o \
>>                                           intel_telemetry_pltdrv.o \
>>                                           intel_telemetry_debugfs.o
>>   obj-$(CONFIG_PMC_ATOM)                       +=3D pmc_atom.o
>> +
>> +obj-$(CONFIG_MXDS_GMUX)                      +=3D mxds-gmux.o
>> diff --git a/drivers/platform/x86/mxds-gmux.c b/drivers/platform/x86/mxd=
s-gmux.c
>> new file mode 100644
>> index 000000000000..dd7f6edaf0f3
>> --- /dev/null
>> +++ b/drivers/platform/x86/mxds-gmux.c
>> @@ -0,0 +1,265 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * mxds-gmux: vga_switcheroo mux handler for ACPI MXDS muxes
>> + *
>> + * Copyright (C) 2020 NVIDIA Corporation
>> + *
>> + * This program is free software; you can redistribute it and/or modify=
 it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, but =
WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see <http://www.gnu.org/licenses>.
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/pci.h>
>> +#include <linux/vga_switcheroo.h>
>> +#include <linux/delay.h>
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("vga_switcheroo mux handler for ACPI MXDS muxes");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
>> +
>> +/*
>> + * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key of=
f of
>> + * the WMI wrapper for the related WMAA method for backlight control.
>> + */
>> +MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
>> +
>> +static struct pci_dev *ig_dev, *dg_dev;
>> +static acpi_handle internal_mux_handle;
>> +static acpi_handle external_mux_handle;
>> +
>> +enum acpi_method {
>> +     MXDM =3D 0,
>> +     MXDS,
>> +     NUM_ACPI_METHODS
>> +};
>> +
>> +static char *acpi_methods[NUM_ACPI_METHODS] =3D {
>> +     [MXDM] =3D "MXDM",
>> +     [MXDS] =3D "MXDS",
>> +};
>> +
>> +enum mux_mode_command {
>> +     MUX_MODE_GET =3D 0,
>> +};
>> +
>> +enum mux_mode {
>> +     MUX_MODE_DGPU_ONLY =3D 1,
>> +     MUX_MODE_IGPU_ONLY =3D 2,
>> +     MUX_MODE_MSHYBRID =3D 3,  /* Dual GPU, mux switched to iGPU */
>> +     MUX_MODE_DYNAMIC =3D 4,   /* Dual GPU, dynamic mux switching */
>> +};
>> +
>> +/*
>> + * Call MXDS with argument value 0 to read the current state.
>> + * When reading, a return value of 1 means iGPU and 2 means dGPU.
>> + * Call MXDS with bit 0 set to change the current state.
>> + * When changing state, clear bit 4 for iGPU and set bit 4 for dGPU.
>> + */
>> +
>> +enum mux_state {
>> +     MUX_STATE_IGPU =3D 1,
>> +     MUX_STATE_DGPU =3D 2,
>> +};
>> +
>> +enum mux_state_command {
>> +     MUX_STATE_GET =3D 0,
>> +     MUX_STATE_SET_IGPU =3D BIT(0),
>> +     MUX_STATE_SET_DGPU =3D BIT(4) | BIT(0),
>> +};
>> +
>> +static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method me=
thod,
>> +                             acpi_integer action)
>> +{
>> +     union acpi_object arg =3D {
>> +             .integer =3D { .type =3D ACPI_TYPE_INTEGER, .value =3D act=
ion }
>> +     };
>> +     struct acpi_object_list in =3D {.count =3D 1, .pointer =3D &arg};
>> +     acpi_integer ret;
>> +     acpi_status status;
>> +
>> +     status =3D acpi_evaluate_integer(handle, acpi_methods[method], &in=
, &ret);
>> +
>> +     if (ACPI_FAILURE(status)) {
>> +             pr_err("ACPI %s failed: %s\n", acpi_methods[method],
>> +                     acpi_format_exception(status));
>> +             return 0;
>> +     }
>> +
>> +     return ret;
>> +}
>> +
>> +static acpi_integer get_mux_mode(acpi_handle handle)
>> +{
>> +     return acpi_helper(handle, MXDM, MUX_MODE_GET);
>> +}
>> +
>> +static acpi_integer get_mux_state(acpi_handle handle)
>> +{
>> +     return acpi_helper(handle, MXDS, MUX_STATE_GET);
>> +}
>> +
>> +static void set_mux_state(acpi_handle handle, enum mux_state state)
>> +{
>> +     enum mux_state_command command;
>> +
>> +     switch (state) {
>> +     case MUX_STATE_IGPU:
>> +             command =3D MUX_STATE_SET_IGPU;
>> +             break;
>> +     case MUX_STATE_DGPU:
>> +             command =3D MUX_STATE_SET_DGPU;
>> +             break;
>> +     default:
>> +             return;
>> +     }
>> +
>> +     acpi_helper(handle, MXDS, command);
>> +}
>> +
>> +static int mxds_gmux_switchto(enum vga_switcheroo_client_id id)
>> +{
>> +     enum mux_state state;
>> +
>> +     switch (id) {
>> +     case VGA_SWITCHEROO_IGD:
>> +             state =3D MUX_STATE_IGPU;
>> +             break;
>> +     case VGA_SWITCHEROO_DIS:
>> +             state =3D MUX_STATE_DGPU;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     if (internal_mux_handle) {
>> +             set_mux_state(internal_mux_handle, state);
>> +             if (get_mux_state(internal_mux_handle) !=3D state)
>> +                     return -EAGAIN;
>> +     }
>> +
>> +     if (external_mux_handle) {
>> +             set_mux_state(external_mux_handle, state);
>> +             if (get_mux_state(external_mux_handle) !=3D state)
>> +                     return -EAGAIN;
>> +     }
>> +
>> +     /* DP AUX can take up to 100ms to settle after mux switch */
>> +     mdelay(100);
>> +
>> +     return 0;
>> +}
>> +
>> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
>> +     struct pci_dev *dev)
>> +{
>> +     if (dev =3D=3D ig_dev)
>> +             return VGA_SWITCHEROO_IGD;
>> +     if (dev =3D=3D dg_dev)
>> +             return VGA_SWITCHEROO_DIS;
>> +
>> +     return VGA_SWITCHEROO_UNKNOWN_ID;
>> +}
>> +
>> +static const struct vga_switcheroo_handler handler =3D {
>> +     .switchto =3D mxds_gmux_switchto,
>> +     .get_client_id =3D mxds_gmux_get_client_id,
>> +};
>> +
>> +static acpi_status find_acpi_methods(
>> +     acpi_handle object, u32 nesting_level, void *context,
>> +     void **return_value)
>> +{
>> +     acpi_handle search;
>> +
>> +     /* If either MXDM or MXDS is missing, we can't use this object */
>> +     if (acpi_get_handle(object, "MXDM", &search))
>> +             return AE_OK;
>> +     if (acpi_get_handle(object, "MXDS", &search))
>> +             return AE_OK;
>> +
>> +     /* MXDS only works when MXDM indicates dynamic mode */
>> +     if (get_mux_mode(object) !=3D MUX_MODE_DYNAMIC)
>> +             return AE_OK;
>> +
>> +     /* Internal display has _BCL; external does not */
>> +     if (acpi_get_handle(object, "_BCL", &search))
>> +             external_mux_handle =3D object;
>> +     else
>> +             internal_mux_handle =3D object;
>> +
>> +     return AE_OK;
>> +}
>> +
>> +static int __init mxds_gmux_init(void)
>> +{
>> +     int ret =3D 0;
>> +     struct pci_dev *dev =3D NULL;
>> +
>> +     /* Currently only supports Intel integrated and NVIDIA discrete GP=
Us */
>> +     while ((dev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev))) {
>> +             /* Ignore eGPU */
>> +             if (pci_is_thunderbolt_attached(dev))
>> +                     continue;
>> +
>> +             switch (dev->vendor) {
>> +             case PCI_VENDOR_ID_INTEL:
>> +                     pci_dev_put(ig_dev);
>> +                     ig_dev =3D pci_dev_get(dev);
>> +                     break;
>> +             case PCI_VENDOR_ID_NVIDIA:
>> +                     pci_dev_put(dg_dev);
>> +                     dg_dev =3D pci_dev_get(dev);
>> +                     break;
>> +             default:
>> +                     break;
>> +             }
>> +     }
>> +
>> +     /* Require both integrated and discrete GPUs */
>> +     if (!ig_dev || !dg_dev) {
>> +             ret =3D -ENODEV;
>> +             goto done;
>> +     }
>> +
>> +     acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ACPI_UINT3=
2_MAX,
>> +             find_acpi_methods, NULL, NULL, NULL);
>> +
>> +     /* Require at least one mux */
>> +     if (!internal_mux_handle && !external_mux_handle) {
>> +             ret =3D -ENODEV;
>> +             goto done;
>> +     }
>> +
>> +     ret =3D vga_switcheroo_register_handler(&handler, 0);
>> +
>> +done:
>> +
>> +     if (ret) {
>> +             pci_dev_put(ig_dev);
>> +             pci_dev_put(dg_dev);
>> +     }
>> +
>> +     return ret;
>> +}
>> +module_init(mxds_gmux_init);
>> +
>> +static void __exit mxds_gmux_exit(void)
>> +{
>> +     vga_switcheroo_unregister_handler();
>> +     pci_dev_put(ig_dev);
>> +     pci_dev_put(dg_dev);
>> +}
>> +module_exit(mxds_gmux_exit);
>>

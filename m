Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD57DC433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 13 Feb 2021 20:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB38C64E35
	for <platform-driver-x86@archiver.kernel.org>; Sat, 13 Feb 2021 20:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhBMUtE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 13 Feb 2021 15:49:04 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:16002 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhBMUtC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 13 Feb 2021 15:49:02 -0500
Date:   Sat, 13 Feb 2021 20:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1613249297;
        bh=fkFSEug3CXZC6hpGWSGQj8sLWIy6lgCNADFmAV5i91M=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=pWvgJy6dxD3S8P3Ow/jT3rlMhBYw4cf/HM+6tU6imKgzeS1W82OQEM595kVA0lbxW
         Q6/leMCIT96mD4PU+potKeE9hVXbXd9gRMKFBLlLk2mzd/uA2PgvywLfcTN5AAdyu1
         ehMHHmHG9/qqM1TKNt7jrMBqRD0HcAWGNKUViqAU=
To:     Nitin Joshi1 <njoshi1@lenovo.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Nitin Joshi <nitjoshi@gmail.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark RH Pearson <markpearson@lenovo.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: RE: [External]  Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs interface to reduce wlan tx power
Message-ID: <uGAxeFNLitkAtlQCUChIecwb5tCirBt9WQA86vRS-s_X5y3e8kBhBjNK-Ko4ufeYrLkoQ0oondRbRfuygZip-vHW1xgZ3e38CFP3AbJuWOc=@protonmail.com>
In-Reply-To: <TY2PR03MB3645FAF0AAB573298D0AC47E8C8B9@TY2PR03MB3645.apcprd03.prod.outlook.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com> <E3f2ByroNWD6igc0zIeWthnZ0NztA6QT_Uvg_wgS912Bq03401uE2ieeXM-WRLezCsBNgesU0myH-69IuKVkXbmtp5jkb30Vd6Rv6E3rld8=@protonmail.com> <TY2PR03MB3645FAF0AAB573298D0AC47E8C8B9@TY2PR03MB3645.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. febru=C3=A1r 12., p=C3=A9ntek 11:40 keltez=C3=A9ssel, Nitin Joshi1 <n=
joshi1@lenovo.com> =C3=ADrta:

> [...]
> >>
> >+/***************************************************************
> >*****
> >> +*****
> >> + * DPRC(Dynamic Power Reduction Control) subdriver, for the Lenovo
> >> +WWAN
> >> + * and WLAN feature.
> >> + */
> >> +#define DPRC_GET_WLAN_STATE             0x20000
> >> +#define DPRC_SET_WLAN_POWER_REDUCE      0x00030010
> >> +#define DPRC_SET_WLAN_POWER_FULL        0x00030100
> >> +static int has_wlantxreduce;
> >
> >I think `bool` would be better.
>
> Ack . I will modify  it in next version.
>
> >
> >
> >> +static int wlan_txreduce;
> >> +
> >> +static int dprc_command(int command, int *output) {
> >> +=09acpi_handle dprc_handle;
> >> +
> >> +=09if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DPRC",
> >&dprc_handle))) {
> >> +=09=09/* Platform doesn't support DPRC */
> >> +=09=09return -ENODEV;
> >> +=09}
> >> +
> >> +=09if (!acpi_evalf(dprc_handle, output, NULL, "dd", command))
> >> +=09=09return -EIO;
> >> +
> >> +=09/*
> >> +=09 * METHOD_ERR gets returned on devices where few commands are
> >not supported
> >> +=09 * for example WLAN power reduce command is not supported on
> >some devices.
> >> +=09 */
> >> +=09if (*output & METHOD_ERR)
> >> +=09=09return -ENODEV;
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +static int get_wlan_state(int *has_wlantxreduce, int *wlan_txreduce)
> >> +{
> >> +=09int output, err;
> >> +
> >> +=09/* Get current WLAN Power Transmission state */
> >> +=09err =3D dprc_command(DPRC_GET_WLAN_STATE, &output);
> >> +=09if (err)
> >> +=09=09return err;
> >> +
> >> +=09if (output & BIT(4))
> >
> >I believe it'd be preferable to name `BIT(4)` and `BIT(8)`. E.g.:
> >
> >  #define DPRC_GET_WLAN_STATE_RES_REDUCED BIT(4)
> >  #define DPRC_GET_WLAN_STATE_RES_FULL    BIT(8)
> >
> >(or any name you like).
> >
> Ack . I will modify  it in next version.
>
> >
> >> +=09=09*wlan_txreduce =3D 1;
> >> +=09else if (output & BIT(8))
> >> +=09=09*wlan_txreduce =3D 0;
> >> +=09else
> >> +=09=09*wlan_txreduce =3D -1;
> >
> >Can you elaborate what -1 means here? Unknown/not
> >available/invalid/error?
>
> -1 means "error" .
> I had found that when "DPRC" method return METHOD_ERR i.e BIT(31) as 0 th=
en it goes to this condition.
> So , therefore I had added METHOD_ERR check in dprc_command() and now , t=
his doesnot goes here.
> But, I have still kept it here , just in case if any other error occurred=
 .
> Can you please suggest , if I should remove it (i.e remove *wlan_txreduce=
 =3D -1; )?  as I still think, there is no harm keeping like this.
>

If `dprc_command()` handles all error cases (i.e. it is not possible that `=
dprc_command()`
returns 0, but there was an error) - which seems to be the case - then I th=
ink in
that branch you should return -ENODATA and not touch `wlan_txreduce`. Becau=
se if
that branch runs, then there was no error, but the state cannot be determin=
ed,
so I think -ENODATA is an appropriate error code.


> >
> >
> >> +
> >> +=09*has_wlantxreduce =3D 1;
> >
> >Is it necessary for the getter to set this? Couldn't it be set in
> >`tpacpi_dprc_init()` once during initialization?
>
> Actually, yes we can keep it in init function also but I have not kept it=
 because of other patch (PATCH 2/2)
> which I had sent . patch 1 (this patch) and patch 2 ( other patch which c=
reate sysfs of WWWAN Antenna type)
> both uses "DPRC" method . So , we will need a flag to create sysfs becaus=
e few system will not have this "wlan tx reduce"
> even if it has "DPRC" method exists and vice versa .
> So , in this case, we need to explicitly check whether it require to crea=
te corresponding sysfs  or not.
>

I was thinking of something like the following:

  static int tpacpi_dprc_init(...) {
    ...
    int err =3D get_wlan_state(&reduced);
    if (err && err !=3D -ENODEV)
      return err;
    else if (!err)
      has_wlantxreduce =3D true;

    err =3D get_wwan_antenna(&antenna);
    if (err && err !=3D -ENODEV)
      return err;
    else if (!err)
      has_antennatype =3D true; /* as I've commented on the second patch, t=
his
                                 variable is probably not needed */
    ...

If I'm not mistaken this is enough not to need the second argument in eithe=
r
`get_wlan_state()` or `get_wwan_antenna()`. Note, that if both functions ma=
y
return -ENODATA, you might also want to add `err !=3D -ENODATA` to the
conditions.


> >
> >
> >> +=09return 0;
> >> +}
> >> +
> >> +/* sysfs wlan entry */
> >> +static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
> >> +=09=09=09=09struct device_attribute *attr,
> >> +=09=09=09=09char *buf)
> >
> >Please align the arguments:
> >
> >  ..._show(struct device *dev,
> >           struct device_attribute ...
> >           ...);
> >
> Ack . I will modify  it in next version.
> Also , I will correct it in my other patch(PATCH 2/2) also.
>
> >
> >> +{
> >> +=09int err;
> >> +
> >> +=09err =3D get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
> >> +=09if (err)
> >> +=09=09return err;
> >> +
> >
> >Wouldn't it be better to return -ENODATA or something similar when
> >`wlan_txreduce` =3D=3D -1?
>
> Ack . I think EOPNOTSUPP will be better ? reason is that "DPRC" method is=
 available but there is error . So , its more likely that command is not su=
pported.
> However, I will modify it after I get feedback about my previous comment.
>

I think the place to determine whether the operation is supported or not
is in `tpacpi_dprc_init()` and the attribute should not be created
if it's not supported.


> >
> >
> >> +=09return sysfs_emit(buf, "%d\n", wlan_txreduce); }
> >> +
> >> +static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
> >> +=09=09=09=09struct device_attribute *attr,
> >> +=09=09=09=09const char *buf, size_t count)
> >
> >Same here.
> >
> Ack . I will modify  it in next version.
> >
> >> +{
> >> +=09int output, err;
> >> +=09unsigned long t;
> >> +
> >> +=09if (parse_strtoul(buf, 1, &t))
> >
> >Maybe `kstrtobool`?
>
> Thank you for your suggestion.
> I can use 'kstrtobool' and will modify on my next version.
>
> >
> >
> >> +=09=09return -EINVAL;
> >> +
> >> +=09tpacpi_disclose_usertask(attr->attr.name,
> >> +=09=09=09=09"WLAN tx strength reduced %lu\n", t);
> >> +
> >> +=09switch (t) {
> >> +=09case 0:
> >> +=09=09err =3D dprc_command(DPRC_SET_WLAN_POWER_FULL,
> >&output);
> >> +=09=09break;
> >> +=09case 1:
> >> +=09=09err =3D dprc_command(DPRC_SET_WLAN_POWER_REDUCE,
> >&output);
> >> +=09=09break;
> >> +=09default:
> >> +=09=09err =3D -EINVAL;
> >> +=09=09dev_err(&tpacpi_pdev->dev, "Unknown operating mode.
> >Ignoring\n");
> >> +=09=09break;
> >> +=09}
> >> +
> >
> >If I'm not mistaken, `err` is never returned, so the write() will always=
 seem to
> >succeed.
>
> Yes , its correct . I will use 'kstrtobool' and will drop this : "err =3D=
 -EINVAL;"
> Is it Ok ?
>

If you use `kstrtobool()`, you can even drop the entire switch statement.


> >
> >
> >> +=09sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> >"wlan_tx_strength_reduce");
> >> +=09return count;
> >> +}
> >> +static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
> >> +
> >> +static int tpacpi_dprc_init(struct ibm_init_struct *iibm) {
> >> +=09int wlantx_err, err;
> >> +
> >> +=09wlantx_err =3D get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
> >> +=09/*
> >> +=09 * If support isn't available (ENODEV) for both devices then quit,=
 but
> >> +=09 * don't return an error.
> >> +=09 */
> >> +=09if (wlantx_err =3D=3D -ENODEV)
> >> +=09=09return 0;
> >> +=09/* Otherwise, if there was an error return it */
> >> +=09if (wlantx_err && (wlantx_err !=3D -ENODEV))
> >> +=09=09return wlantx_err;
> >> +
> >> +=09if (has_wlantxreduce) {
> >> +=09=09err =3D sysfs_create_file(&tpacpi_pdev->dev.kobj,
> >> +=09=09=09=09&dev_attr_wlan_tx_strength_reduce.attr);
> >
> >I believe `device_create_file()` would be better.
> >
> Since, file will be created in /sys/ directory , hence I think its better=
 to use sysfs_create_file.
> Also, by checking in this  file, it looks like sysfs_create_file will be =
more reasonable to do .
>
> Please let me know, if its Ok to continue using sysfs_create_file or you =
still feel. we need to use
> device_create_file()  also feel free to correct me, if I am wrong.
>

There's not much difference, so sysfs_{create,remove}_file() would work jus=
t as fine
here. The reason why I believe `device_{create,remove}_file()` is possibly =
preferable
is that you don't need to reference the kobj and the attribute when calling=
 it,
and you're adding an attribute to a *device* (not any kobj), so device_*() =
functions
are a better fit syntactically in my opinion. But in the end, both will ach=
ieve
the same effect, so you are free to choose whichever you like.


> >
> >> +=09=09if (err)
> >> +=09=09=09return err;
> >> +=09}
> >> +=09return 0;
> >> +}
> >> +
> >> +static void dprc_exit(void)
> >> +{
> >> +=09if (has_wlantxreduce)
> >> +=09=09sysfs_remove_file(&tpacpi_pdev->dev.kobj,
> >> +&dev_attr_wlan_tx_strength_reduce.attr);
> >
> >And similarly, `device_remove_file()`.
>
> Same comment as above . I feel, sysfs_remove_file is more reasonable to d=
o.
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze

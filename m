Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FF2C6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Mar 2023 19:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjCKT0P (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 14:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjCKT0P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 14:26:15 -0500
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C89A60416
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 11:26:10 -0800 (PST)
Date:   Sat, 11 Mar 2023 19:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1678562768; x=1678821968;
        bh=Pop+Pz5x2Pc99XBZaFK/tAZySgf6OG8cUpkPMuLUKAA=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=XWYZh/6MqNSR4IFagipJi4Qj0jnKAz9zvV2uy1V5LWkkrnnYfY1ytv5tSbz2ty1KU
         lHIm2IZ/RgS6TSxWx0zl/Y1x9OKIqUvnbslFMP3q3odRlYqRUCVQHMzcVC725IIkFn
         FDqf5hly8M2IWoW3Yx3OuV6p8T5MBJ3m/LtXZSnyTWPM5CyHJwLqyVWnd7el3CF6wk
         rJqR6v61icbU5hq/VKiYCJbtNo8q2wVEK/CCSAH4/6diIxWgTKz1ka1uaSCktbmDLk
         kxT14uLY7YTYZwbYipoYLlRorDulYDsU2oioK5ffcwVUX2MAAmPy527FhVvP0SRHNB
         qm2NqKcG4e0dw==
To:     Nikita Kravets <teackot@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH v2] platform/x86: Add new msi-ec driver
Message-ID: <iPt1Reo37oGFvlRdQOY-3kZypWeV0pRah5oZ17K4xUOkeMqE7E43XQVyUX0A4a6oeEc1hPPzbjKcU3NznXUA3fnmp-foM3vuFSnA4YcFTDQ=@protonmail.com>
In-Reply-To: <20230311144054.8754-1-teackot@gmail.com>
References: <20230311144054.8754-1-teackot@gmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2023. m=C3=A1rcius 11., szombat 15:40 keltez=C3=A9ssel, Nikita Kravets <tea=
ckot@gmail.com> =C3=ADrta:

> [...]
> +static ssize_t
> +charge_control_start_threshold_show(struct device *device,
> +=09=09=09=09    struct device_attribute *attr, char *buf)
> +{
> +=09return charge_control_threshold_show(conf.charge_control.offset_start=
,
> +=09=09=09=09=09     device, attr, buf);
> +}
> +
> +static ssize_t
> +charge_control_start_threshold_store(struct device *dev,
> +=09=09=09=09     struct device_attribute *attr,
> +=09=09=09=09     const char *buf, size_t count)
> +{
> +=09return charge_control_threshold_store(conf.charge_control.offset_star=
t,
> +=09=09=09=09=09      dev, attr, buf, count);
> +}

The above two functions are inconsistent with the rest of the file because
they have the return type in a separate line.


> +
> +static ssize_t charge_control_end_threshold_show(struct device *device,
> +=09=09=09=09=09=09 struct device_attribute *attr,
> +=09=09=09=09=09=09 char *buf)
> +{
> +=09return charge_control_threshold_show(conf.charge_control.offset_end,
> +=09=09=09=09=09     device, attr, buf);
> +}
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev,
> +=09=09=09=09=09=09  struct device_attribute *attr,
> +=09=09=09=09=09=09  const char *buf, size_t count)
> +{
> +=09return charge_control_threshold_store(conf.charge_control.offset_end,
> +=09=09=09=09=09      dev, attr, buf, count);
> +}
> +
> +static DEVICE_ATTR_RW(charge_control_start_threshold);
> +static DEVICE_ATTR_RW(charge_control_end_threshold);
> +
> +static struct attribute *msi_battery_attrs[] =3D {
> +=09&dev_attr_charge_control_start_threshold.attr,
> +=09&dev_attr_charge_control_end_threshold.attr,
> +=09NULL
> +};
> +
> +ATTRIBUTE_GROUPS(msi_battery);
> +
> +static int msi_battery_add(struct power_supply *battery,
> +=09=09=09   struct acpi_battery_hook *hook)
> +{
> +=09return device_add_groups(&battery->dev, msi_battery_groups);
> +}
> +
> +static int msi_battery_remove(struct power_supply *battery,
> +=09=09=09      struct acpi_battery_hook *hook)
> +{
> +=09device_remove_groups(&battery->dev, msi_battery_groups);
> +=09return 0;
> +}
> +
> +static struct acpi_battery_hook battery_hook =3D {
> +=09.add_battery =3D msi_battery_add,
> +=09.remove_battery =3D msi_battery_remove,
> +=09.name =3D MSI_EC_DRIVER_NAME,
> +};
> +
> +// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D //
> +// Module load/unload
> +// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D //

It's a small thing, but usually /* ... */ comments are preferred.
Hans will tell you if you need to change it.


> +
> +static int __init load_configuration(void)
> +{
> +=09int result;
> +
> +=09u8 fw_version[MSI_EC_FW_VERSION_LENGTH + 1];
> +
> +=09// get firmware version
> +=09result =3D ec_get_firmware_version(fw_version);
> +=09if (result < 0)
> +=09=09return result;
> +
> +=09// load the suitable configuration, if exists
> +=09for (int i =3D 0; CONFIGURATIONS[i]; i++) {
> +=09=09for (int j =3D 0; CONFIGURATIONS[i]->allowed_fw[j]; j++) {
> +=09=09=09if (strcmp(CONFIGURATIONS[i]->allowed_fw[j], fw_version) =3D=3D=
 0) {

Previously you said `match_string()` works here. Has something changed?


> +=09=09=09=09memcpy(&conf, CONFIGURATIONS[i], sizeof(struct msi_ec_conf))=
;

Why not simply

  conf =3D *CONFIGURATIONS[i];

?


> +=09=09=09=09conf.allowed_fw =3D NULL;
> +=09=09=09=09return 0;
> +=09=09=09}
> +=09=09}
> +=09}
> +
> +=09pr_err("Your firmware version is not supported!\n");
> +=09return -EOPNOTSUPP;
> +}
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792847050;
	b=FSn4rXDAqSBAs2H1xxEYK0AdaokzSU/G2B54p1T1Gi71EPZyms+KQYe8J4jOsLsxusan
	 C9sXdBSSaA43S9w5qn5tnBtCqWn4nKSiqTvn96zMHa9YW8x8+TwjFZqz4NEfRf0jL+xmD
	 r3wrjJ8oZwiegbV1TeIhwCc+d12+yoj1M94BQa07leJ0kzUczcxtV79yyWJ2naP8Xmm93
	 xRmXIZhKsh3+7Z+DiupzALrEVM4hAtiOhxAV22Iyj8GAQacoz+aUAC6EL5fp1e0SED/mL
	 esHhwtpNvT+MOboIN5dHiELX6YmnHJ5bbku4KYGV19OqGey3t+hNh6gSZ41u9RVP/4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847050;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=jweyIax9MrNM41Fr612IpxPDanPG1QtsYbhddNSLtBI=;
	b=CDF49GSaxYlkcZWd+2XGe+bYkjyGljY2M4yQnhv35wfz6d7T82/SfD1dUquCURjVk0AC
	 hmgYzpHMa0QL66J6gZjIjOPVeBNghQKWQaTfSIKvG39f4MIu3vh5s8zLVTYsqPkhJ49AR
	 gXxkPU9H363Zaw5MXyCZ19SFYQTn1z/uvFW1hB0s1+VgOnep65IGq3wpCQ8ZvfUKh95I4
	 +kVbj8Rt7uH0qECg06o/qz90K+bDU43uAJCmGKKz1K6qRCHtLUIa5hhqh4Vuzhj6Inhz0
	 ENtUqLchXOeMCa9CZTgirvZQkYVet7tlzalwF6IZAOVQaCuFOnWltYQ8MC8LLKCOB9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=J081P02C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7F606A31B
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 13:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C7F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=J081P02C
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6CE7F402DC
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792847041;
	bh=jweyIax9MrNM41Fr612IpxPDanPG1QtsYbhddNSLtBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=J081P02CAlTCiGfWPnPfcDM1cIpzn1i0Cpju0qGwil8Zkw7kBT9u7sOdT06rcw4Vz
	 amBjQ2YzLt5/s3ZTwKv+rtlfW9IjfXKS/z/FIsZkwfOfsTvzy7jAtDdUBzTinWnI0H
	 tiNHYF5cgk1nB+PhpV1RsmKKaIbzx/GfIx7PWFoJ9d26mTNnVmEpnRp7TGl96oJIHD
	 3ZJRRBnsTx89x05294tCzQfZzVxQQSzG+KqBZujLPlX7CDUmACkwbFnKr8CQ9/spZ7
	 gfipDEcx0Ha+Qrt6cWKT5jmV+3szXhaAnZ9I5X0gA1dJi1FLrPxAPgCaS8UGY0NMio
	 gjaAQLXer5qZEzOrc1KTGLv/0PgdIwkOgKaKB3KSi6hrcHWevw131PfquPo646N5Pt
	 hIStF4ff9Is2K9k1ATtBPO3fiFhlKCxnOetVXyXIADciwNQ6GYxSs92NC/FUAj3Jc6
	 RBvH64wzaBsxnYSEP+XxFLf831vVpmz8za+xv/o7fO6OY+peOot2ydHwXAfKu0Kis8
	 kGCov2R0oyzImlYw0t7dhk7akDLdeTKotKX8ZPXAnQ1FTDRX6wHq/uFP5rjFzteU9h
	 6WF5hHizgXzmS5T8P3Gre1JUa6wZK1zhNKtqP4ww/ToanF/ZIabONCSOD2SBj0HKpE
	 Krz2Rt6uCL1kwasQ++N+KWl4=
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ffe90b2cfdso908786a34.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 06:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792847040; cv=none;
        d=google.com; s=arc-20260327;
        b=SrtyDggMwGJlnZKXCMsXpDW3cdEVp2CU7anyOuT6+FAnuqsNjwEpPAwygx+81iwD3+
         gt87eFc3SU8hmVt9MzF3zrXEq1zF/kV4+ZYHs9Oj2tJ4h2zbGHbCFzW61bBgyvjlMp0V
         gmlyRaOnTxkhTRCvKZF9kUKmcJ4UnQVXJjwX3+Bm7wiE79rG4AWD35Zodn47WJz/08mh
         VktNyPXUCNxRw2A8udaun99jg45EicDn3GtRZYb0fKBKdQKgWBcHCa2M2RcGudt3LCVy
         t2NDBd+nASmXO3IbZ8Khke7fSSVndNUARNpC0ylxPZRIHzRe9mZwt64GVWN+4PHPsWZa
         wBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=jweyIax9MrNM41Fr612IpxPDanPG1QtsYbhddNSLtBI=;
        fh=yPqAEMxq2nb/IsyrjmzY3TERHXIJZ1xnl9FH/G5HFUc=;
        b=CGa8mJX7Awo0B7Sx3ct5wXwtWtwsh9YT4Ofs3MW8tmt1HEDmQEo/1HPt6qVPoiRHVf
         45e5VQ6BJZuVZ8KD8KOjQXwqf2i4Y89AdMoaEYdvrZV8vsur5GnBB/0TwEDwOQJEezMN
         K3omwONTadu+3/bEHkKhDmfOVbbjPiCthDYYM4sHhCSXBdc+wNJeH9ErAWikmNEW53ZZ
         5MVIerR2LWghRs9ySIQm6u4/Mht+RiRMkc6ZZ9wga6CkCrv9DpJXEzpQ3WxR7uwhkUPg
         q2K7B5KNidU8UZSSQuw9yyyP19hZmHJ9meU0EnU08WXN2gbCzSdWgUxVpKISplCVrccQ
         Q9qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792847040; x=1793451840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jweyIax9MrNM41Fr612IpxPDanPG1QtsYbhddNSLtBI=;
        b=rgWqiQ6IC//udkYUwbiwqHrL55CWMcF3JwgsAWqwynYxM4w2Zowf22mOQysQuHzkcg
         H/AWPC215XXm7mS9eOk3KjNQLp98rcMWZaQ3flOVPjzuLGfmRc/aOdkMOWv3WUFGQRbG
         w5X8T/JQBfLvDNDhp5PG9Pob42vBQhaO/pa0AVUj0kMBFvL0qL6qUtjLwJLKOuCXXCn/
         3SO+vrCQTDK0XZop4Yc5qg51NcoMHc8TjQehUKmr87L43VrCdbCnEnE6504GwOEa109F
         /96ooMexeYHYbRmG28reXaMbipbtDF+p4q1r1Qfgdt6ThK06AuqAJYPj6O7OrzmK/yzu
         lQPg==
X-Forwarded-Encrypted: i=1; AKwUvBx69QU+jJWL1vSP/9bGftShtphwAMcjC16p+oqjHmTDAKDJHr5ioXfZfBDCHon6Wpc74eFVmhw1jZ42JtCrJsMRfXaB@vger.kernel.org
X-Gm-Message-State: AFq9FYIefR+Vdi7Bv/FpV62ImDTExP3of+IIcaec0CKpsoBBgsYSe3ul
	kUnlgwALdEYoYa5JqXXVtOnwFx1axzt82OaepFEWyFSPqcJiRajueWJ9AUosCrNt2IyygaLoPIH
	gmPm9OMU77MC0RMtrroTIkRA5v4VLFmVcAf4TMl6N0km1sxLVdLFJOtoeVo8gzpo9FlXErsmTlF
	yKoXwUt/9xZhT1Eoe51KTilntg18/KpS2CVJAEE58Sssudc4nM9rcBGKB/l+39IEMx4Vw9vHGkj
	g==
X-Gm-Gg: AYBFou1f7+7Rq0ztHKApzQjtY6rVL1TxEjzq32ZFdv/RdfPhnmkzMaZ03rpbdP0+EDc
	+MpK1XopBT953WRxljvdWWFRK9SwISmN4C3jAvP9oShuxXTKX8fMbK6KDlvYnn8aW19jDyejGc7
	MtOmSJJxpH6nZqdbFKeP2L+BRVJ+hhqorPSVeJpNrVZAWBlqhpNpLXbos/WMIQsdPPhs+zYsOLF
	BAl4jxwawUWPRr9gteLKb1nGwaHHnYdJqeJdgfLi3GcjkdNKGLGag/kLqtLit2aVfa+nfpPNoyn
	MRJVYN/yDDvb3mw=
X-Received: by 2002:a05:6808:1b10:b0:4c5:90f1:b9c3 with SMTP id 5614622812f47-55bffffe000mr1773836b6e.2.1792847039680;
        Sat, 24 Oct 2026 06:03:59 -0700 (PDT)
X-Received: by 2002:a05:6808:1b10:b0:4c5:90f1:b9c3 with SMTP id
 5614622812f47-55bffffe000mr1773809b6e.2.1792847039227; Sat, 24 Oct 2026
 06:03:59 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792831564.git.an.wu@canonical.com> <f3ec60d4e68819c994a0d4c6d44eb5cf8d511ddb.1792831564.git.an.wu@canonical.com>
 <b66d47a456bddb23deaf1c4c625b0029dde0e9a5.camel@posteo.de>
In-Reply-To: <b66d47a456bddb23deaf1c4c625b0029dde0e9a5.camel@posteo.de>
From: An Wu <an.wu@canonical.com>
Date: Sat, 24 Oct 2026 21:03:46 +0800
X-Gm-Features: AclHuK-sOOwDGwCHCZV4lIH3ZMIPSiDEfECwrddSaz0IwKRR3_H4sc8awgXIGFc
Message-ID: <CAO4Mv0aE5MeoKGcWpvWvWis-A8pD6UpE8m_-VFF2EK+VP0uoYg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] serdev: handle devices without an ACPI or device
 tree node
To: Markus Probst <markus.probst@posteo.de>
Cc: linux-serial@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus
    Working on it,
Thank you~

BR
    An

On Sat, Oct 24, 2026 at 8:58=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> On Sat, 2026-10-24 at 20:04 +0800, ChunAn Wu wrote:
> > Serdev clients instantiated by a driver have no ACPI companion and no
> > device tree node. Their modalias read returns -ENODEV, their add uevent
> > is suppressed, and they cannot be driver-matched, so creators force a
> > bind with device_driver_attach().
> >
> > Resolve both TODOs in the serdev core by modelling matching on the SPI
> > bus: let the creator pass a modalias to serdev_device_add() and give
> > struct serdev_device_driver an id_table. ACPI and OF are still tried
> > first; clients without their own modalias keep returning -ENODEV. The
> > device name, derived from the controller, is unchanged.
> >
> > Split struct serdev_device_id and its defines into a new
> > include/linux/device-id/serdev.h, following the pattern already used by
> > the SPI and I2C buses.
> >
> > Signed-off-by: ChunAn Wu <an.wu@canonical.com>
> > ---
> >  MAINTAINERS                                   |  1 +
> >  .../platform/x86/x86-android-tablets/core.c   |  2 +-
> >  drivers/power/sequencing/pwrseq-pcie-m2.c     |  2 +-
> >  drivers/tty/serdev/core.c                     | 62 ++++++++++++++++---
> >  include/linux/device-id/serdev.h              | 19 ++++++
> >  include/linux/serdev.h                        | 12 +++-
> >  6 files changed, 86 insertions(+), 12 deletions(-)
> >  create mode 100644 include/linux/device-id/serdev.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 917f3f72e31b..06e67aa5d9b0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24905,6 +24905,7 @@ L:    linux-serial@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/serial/serial.yaml
> >  F:   drivers/tty/serdev/
> > +F:   include/linux/device-id/serdev.h
> >  F:   include/linux/serdev.h
> >  F:   rust/helpers/serdev.c
> >  F:   rust/kernel/serdev.rs
> > diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/=
platform/x86/x86-android-tablets/core.c
> > index cfff7f5eac5d..853aa6ff5d50 100644
> > --- a/drivers/platform/x86/x86-android-tablets/core.c
> > +++ b/drivers/platform/x86/x86-android-tablets/core.c
> > @@ -317,7 +317,7 @@ static __init int x86_instantiate_serdev(const stru=
ct x86_dev_info *dev_info, in
> >       ACPI_COMPANION_SET(&serdev->dev, serdev_adev);
> >       acpi_device_set_enumerated(serdev_adev);
> >
> > -     ret =3D serdev_device_add(serdev);
> > +     ret =3D serdev_device_add(serdev, NULL);
> >       if (ret) {
> >               dev_err(&serdev->dev, "error %d adding serdev\n", ret);
> >               serdev_device_put(serdev);
> > diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/=
sequencing/pwrseq-pcie-m2.c
> > index e42e85f47629..e0482f2ef39f 100644
> > --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> > +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> > @@ -309,7 +309,7 @@ static int pwrseq_pcie_m2_create_serdev_one(struct =
pwrseq_pcie_m2_ctx *ctx,
> >       if (ret)
> >               goto err_free_serdev;
> >
> > -     ret =3D serdev_device_add(pci_dev->serdev);
> > +     ret =3D serdev_device_add(pci_dev->serdev, NULL);
> >       if (ret) {
> >               dev_err(dev, "Failed to add serdev for PCI device (%s): %=
d\n",
> >                       pci_name(pdev), ret);
> > diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> > index 7500efcdfc21..e0517d5a48da 100644
> > --- a/drivers/tty/serdev/core.c
> > +++ b/drivers/tty/serdev/core.c
> > @@ -29,13 +29,21 @@ static DEFINE_IDA(ctrl_ida);
> >  static ssize_t modalias_show(struct device *dev,
> >                            struct device_attribute *attr, char *buf)
> >  {
> > +     const struct serdev_device *serdev =3D to_serdev_device(dev);
> >       int len;
> >
> >       len =3D acpi_device_modalias(dev, buf, PAGE_SIZE - 1);
> >       if (len !=3D -ENODEV)
> >               return len;
> >
> > -     return of_device_modalias(dev, buf, PAGE_SIZE);
> > +     len =3D of_device_modalias(dev, buf, PAGE_SIZE);
> > +     if (len !=3D -ENODEV)
> > +             return len;
> > +
> > +     if (!serdev->modalias[0])
> > +             return -ENODEV;
> > +
> > +     return sysfs_emit(buf, "%s%s\n", SERDEV_MODULE_PREFIX, serdev->mo=
dalias);
> >  }
> >  static DEVICE_ATTR_RO(modalias);
> >
> > @@ -47,15 +55,22 @@ ATTRIBUTE_GROUPS(serdev_device);
> >
> >  static int serdev_device_uevent(const struct device *dev, struct kobj_=
uevent_env *env)
> >  {
> > +     const struct serdev_device *serdev =3D to_serdev_device(dev);
> >       int rc;
> >
> > -     /* TODO: platform modalias */
> > -
> >       rc =3D acpi_device_uevent_modalias(dev, env);
> >       if (rc !=3D -ENODEV)
> >               return rc;
> >
> > -     return of_device_uevent_modalias(dev, env);
> > +     rc =3D of_device_uevent_modalias(dev, env);
> > +     if (rc !=3D -ENODEV)
> > +             return rc;
> > +
> > +     if (!serdev->modalias[0])
> > +             return -ENODEV;
> > +
> > +     return add_uevent_var(env, "MODALIAS=3D%s%s", SERDEV_MODULE_PREFI=
X,
> > +                           serdev->modalias);
> >  }
> >
> >  static void serdev_device_release(struct device *dev)
> > @@ -86,28 +101,57 @@ static const struct device_type serdev_ctrl_type =
=3D {
> >       .release        =3D serdev_ctrl_release,
> >  };
> >
> > +static const struct serdev_device_id *serdev_match_id(const struct ser=
dev_device_id *id,
> > +                                                   const char *modalia=
s)
> > +{
> > +     if (!id || !modalias[0])
> > +             return NULL;
> > +
> > +     while (id->name[0]) {
> > +             if (!strcmp(modalias, id->name))
> > +                     return id;
> > +             id++;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> >  static int serdev_device_match(struct device *dev, const struct device=
_driver *drv)
> >  {
> > +     const struct serdev_device *serdev;
> > +     const struct serdev_device_driver *sdrv;
> > +
> >       if (!is_serdev_device(dev))
> >               return 0;
> >
> > -     /* TODO: platform matching */
> > +     serdev =3D to_serdev_device(dev);
> > +     sdrv =3D to_serdev_device_driver(drv);
> > +
> >       if (acpi_driver_match_device(dev, drv))
> >               return 1;
> >
> > -     return of_driver_match_device(dev, drv);
> > +     if (of_driver_match_device(dev, drv))
> > +             return 1;
> > +
> > +     return !!serdev_match_id(sdrv->id_table, serdev->modalias);
> >  }
> >
> >  /**
> >   * serdev_device_add() - add a device previously constructed via serde=
v_device_alloc()
> >   * @serdev:  serdev_device to be added
> > + * @modalias:        Driver name or alias, used to match devices which=
 have neither
> > + *           an ACPI companion nor a device tree node. NULL for device=
s
> > + *           enumerated from firmware.
> >   */
> > -int serdev_device_add(struct serdev_device *serdev)
> > +int serdev_device_add(struct serdev_device *serdev, const char *modali=
as)
> >  {
> >       struct serdev_controller *ctrl =3D serdev->ctrl;
> >       struct device *parent =3D serdev->dev.parent;
> >       int err;
> >
> > +     if (modalias)
> > +             strscpy(serdev->modalias, modalias);
> > +
> >       dev_set_name(&serdev->dev, "%s-%d", dev_name(parent), serdev->nr)=
;
> >
> >       /* Only a single slave device is currently supported. */
> > @@ -553,7 +597,7 @@ static int of_serdev_register_devices(struct serdev=
_controller *ctrl)
> >
> >               device_set_node(&serdev->dev, of_fwnode_handle(node));
> >
> > -             err =3D serdev_device_add(serdev);
> > +             err =3D serdev_device_add(serdev, NULL);
> >               if (err) {
> >                       dev_err(&serdev->dev,
> >                               "failure adding device. status %pe\n",
> > @@ -707,7 +751,7 @@ static acpi_status acpi_serdev_register_device(stru=
ct serdev_controller *ctrl,
> >       ACPI_COMPANION_SET(&serdev->dev, adev);
> >       acpi_device_set_enumerated(adev);
> >
> > -     err =3D serdev_device_add(serdev);
> > +     err =3D serdev_device_add(serdev, NULL);
> >       if (err) {
> >               dev_err(&serdev->dev,
> >                       "failure adding ACPI serdev device. status %pe\n"=
,
> > diff --git a/include/linux/device-id/serdev.h b/include/linux/device-id=
/serdev.h
> > new file mode 100644
> > index 000000000000..96644953cece
> > --- /dev/null
> > +++ b/include/linux/device-id/serdev.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef LINUX_DEVICE_ID_SERDEV_H
> > +#define LINUX_DEVICE_ID_SERDEV_H
> > +
> > +#ifdef __KERNEL__
> > +typedef unsigned long kernel_ulong_t;
> > +#endif
> > +
> > +/* serdev */
> > +
> > +#define SERDEV_NAME_SIZE     40
> > +#define SERDEV_MODULE_PREFIX "serial:"
> > +
> > +struct serdev_device_id {
> > +     char name[SERDEV_NAME_SIZE];
> > +     kernel_ulong_t driver_data;     /* Data private to the driver */
> > +};
> > +
> > +#endif /* ifndef LINUX_DEVICE_ID_SERDEV_H */
> > diff --git a/include/linux/serdev.h b/include/linux/serdev.h
> > index b6c3d957ec15..96a441abc1ac 100644
> > --- a/include/linux/serdev.h
> > +++ b/include/linux/serdev.h
> > @@ -7,7 +7,9 @@
> >
> >  #include <linux/types.h>
> >  #include <linux/device.h>
> > +#include <linux/device-id/serdev.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/string.h>
> Unused include.
>
> >  #include <linux/uaccess.h>
> >  #include <linux/termios.h>
> >  #include <linux/delay.h>
> > @@ -35,6 +37,10 @@ struct serdev_device_ops {
> >   * struct serdev_device - Basic representation of an serdev device
> >   * @dev:     Driver model representation of the device.
> >   * @nr:              Device number on serdev bus.
> > + * @modalias:        Name of the driver to use with this device, or th=
e alias
> > + *           for it. Empty for devices enumerated from firmware, which
> > + *           are identified through their ACPI companion or their devi=
ce
> > + *           tree node instead. See serdev_device_add().
> >   * @ctrl:    serdev controller managing this device.
> >   * @ops:     Device operations.
> >   * @write_comp:      Completion used by serdev_device_write() internal=
ly
> > @@ -43,6 +49,7 @@ struct serdev_device_ops {
> >  struct serdev_device {
> >       struct device dev;
> >       int nr;
> > +     char modalias[SERDEV_NAME_SIZE];
> >       struct serdev_controller *ctrl;
> >       const struct serdev_device_ops *ops;
> >       struct completion write_comp;
> > @@ -55,12 +62,15 @@ struct serdev_device {
> >   * struct serdev_device_driver - serdev slave device driver
> >   * @driver:  serdev device drivers should initialize name field of thi=
s
> >   *           structure.
> > + * @id_table:        List of serdev devices supported by this driver, =
used to
> > + *           match devices which are not enumerated from firmware.
> >   * @probe:   binds this driver to a serdev device.
> >   * @remove:  unbinds this driver from the serdev device.
> >   * @shutdown:        shut down this serdev device.
> >   */
> >  struct serdev_device_driver {
> >       struct device_driver driver;
> > +     const struct serdev_device_id *id_table;
> >       int     (*probe)(struct serdev_device *);
> >       void    (*remove)(struct serdev_device *);
> >       void    (*shutdown)(struct serdev_device *);
> > @@ -158,7 +168,7 @@ static inline void serdev_controller_put(struct ser=
dev_controller *ctrl)
> >  }
> >
> >  struct serdev_device *serdev_device_alloc(struct serdev_controller *);
> > -int serdev_device_add(struct serdev_device *);
> > +int serdev_device_add(struct serdev_device *serdev, const char *modali=
as);
> >  void serdev_device_remove(struct serdev_device *);
> >
> >  struct serdev_controller *serdev_controller_alloc(struct device *host,
>
> You will need to address the sashiko report (both are true positives).
>
> In the scripts/mod/file2alias.c file, you can copy the spi entry.
> scripts/mod/devicetable-offsets.{h,c,s} and
> include/linux/mod_devicetable.h are also relevant for this.
> (Didn't know myself those files existed, so thx Sashiko)
>
> Also add serdev_device_id to scripts/coccinelle/misc/of_table.cocci .
>
>
> With that fixed,
>
> Reviewed-by: Markus Probst <markus.probst@posteo.de>
>
>
> Thanks
> - Markus Probst

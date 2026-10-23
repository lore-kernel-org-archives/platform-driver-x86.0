Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792760551;
	b=pyR8fwGJUwrOQ5QeMi/A369egAtWvOi+KYiXJKCQoD06YkbHa54uH4SWW0q5CN+8Un3d
	 E7DlA9iv4I5SvuAowwN2LFJ7tosvswpP2eUH4mdeVXQZCNLhoRRxSXYW9qxvjuVcQC/Y0
	 6n/JMIfuFrKrACy6dzUUqzTVRci9giYxzasPzmn9pXtk2h+pxi7Ehe0vDoxLsJeDi60X2
	 V3JxvyZb5hsaG7rwxhlcCshrBix2ZYONmHRwudehxXdabZiO0sNpNTesiULGNzVysCpAs
	 jvmPdzdCOgYFHGYsFiGCY4l/NFHJFJDZ18KjuwH0WLGLOYmNb2aCtFdMCl5InTsXOGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=+AuTATHXeKj9NqRJf0hVa3/vGiuR3FiHkiC9A4S8EeE=;
	b=a736h7X2mBmp7BkEDAabhgBYyIS4MU2SYxo+n0+iORZ7IBYHJfNSmzJtFtBhVqzvsEGq
	 u1x/rUz6pUlGN1rG7v75WBv0cJzlD1cfeR1KtHitOhAsN2fBVhKdK1nUf6a9N+slImBNm
	 10Qqj5eU00nYc2B/8gXa103A/xZKFSOrt1c2tr2VHtPXwZshHAYLhDqEXs+kEe9nfPoA7
	 y9tWAEmF4pFrDzHsS9DIuo+nfqOzHw6AKT4T33xcqcZosIXe69yjFFCsIUxTbh4sTYjtn
	 qL7/7aTJxb6Y3qcucbPNC5EqYoMYY4I5Q6yTpelfVo1zO6Ek1ndffPfq5TYYSa5wTfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=l5YiKRgv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887C8606A325
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 13:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 887C8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=l5YiKRgv
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C38694013E
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792760537;
	bh=+AuTATHXeKj9NqRJf0hVa3/vGiuR3FiHkiC9A4S8EeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=l5YiKRgvdk6uxZq3jiZyhqFoBQY582lx5JJvt4jc+RpSleuOyoJXuLZl36+MuTiSA
	 Ckm7+sTdbuZdXe3fqUGudyC8ZpWDYP47ljbTTctfr4oI7jSq6o0HI3TDRkWlNw+Jf3
	 Pect5F/JYyadcyZmrFeuvWUoa1Kg75bWoXKCAxUemjK/Wpqtcw0Ik86LhJbDSp8C0f
	 68lRv6SKFqd0BNtEeTqms+YbOVe7yEF1YMv+am5/AOLUc0CR62zM9EYF+eFIzdWzZw
	 L0FtUeHvCDyn8iee/BdI/5qQqg8wEZyO6dtkDT1dtpdUpHu8zze5pxrmbPh3KuYn8o
	 qa7PUEtYpUufeSxAmUVk/2Gv6FvfvMJ6GI71rmx7Rc59pbLizCSx36VY+kPes53WhP
	 ySYC3MZfx42s4ufvUUs90oTQUml+8W5VH/OZjvVqvpVlaeJI357Fh6mVyZURtdDg/w
	 2OGeIT2TE9AtqRrzMfT+zdwzsynL8BNN4mfW4oCw2TKccINeEG3RLtRfIj/tih4vC2
	 5uxkdvKgAS+/mzs2dDCHYmD4aFXsnzyJzZybR9P38jLxMMwsIpMDPWQZRsVUXuEZ+y
	 SShnrAxf46s9U2aCW1Ec4P644DWRIeKtjOsWu2bnHsJDQ0NzS5v5Kbj/QijHzE5dkA
	 3+yFcTY0MIOk+iC79KDxoET0=
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-555eaa3ff0dso232034b6e.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 06:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792760536; cv=none;
        d=google.com; s=arc-20260327;
        b=pTLWIWDwUrtnPZ8pnvO8gYz6DiXw6IukvJDRutKVFoYDowm3YmBMPW8mLFE6hjW2DN
         q3GTvB+Dn005Yj6Zp4M+XMFSVCtNN2WkMs/vmyRCEJufdsd3QMIdQ9uK4EOT/lDnEJPI
         8LQCKQZXjjSdDesbTvF0vfbVdUwcUrq5YDqG1VzWeYgERMxd9bH5YqCNgV4d/BZk9/k4
         +J8PWqsOnVwCuaNd0X9bJnGWLYcgNTANTwpN/7yC4q5/zWFJKkAvvhEJInpfeKZg7js/
         AyvCGjZaEOaOLk1BoIKPrpKMM+xatdCg1cYAFSooCArePpQTIawCFHed7YXWlhtWMrH2
         chqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=+AuTATHXeKj9NqRJf0hVa3/vGiuR3FiHkiC9A4S8EeE=;
        fh=rVrk5zRX3Cs+T+HthO+hKN6bLDGMa9am61rQN2mljSg=;
        b=BJbZZxZIh8ImRUEqkFSXwdTESLisn6pN5vY5z3N8S8VcQJ8ij+MjL7VmgyGkpwnRgt
         GHxQkatBjMRAx6UrCBNXjaK51bZvUgofII6d7fTRwRbJkB8YhGckD7ioQyb7q6dtN7EX
         t7aMSjh0OlZ/nlxRwMooRyWa3+yXzqoB1DMe9oSqhnHUJpOm9/nG/84yhqgRKw43hiwT
         +1FN32UnLZsp8IzHQGdkQ6FyYe5900FBeRr54fnbsyDif4egvB0dXlIyFLP9m52dLSCs
         vHJAluplwv8+HybLFIyXl3LhKIL+qqswdBBoRKW+Grdkzo8NJxVZkmLKCmldZdjAjUp1
         ar1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760536; x=1793365336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AuTATHXeKj9NqRJf0hVa3/vGiuR3FiHkiC9A4S8EeE=;
        b=B58FTYFtY4CUS+EdH/Lkv5dE8kTQ9IQ8SatJ2sxbUq11d11BwGMNluLaASqeYcrPLB
         kTsDKwfMzgHoKtx0UghKnc/x5oN5Jo/9sUG/WTrKptsGnbaFc28WJrgi0YlFmDyd3awU
         xVKGH4dVkYK0CQA9cNSSAIPAaDX3M0nkaaqiy0bziucMWhjKobjxR87L2d4fb4KvN3ec
         YZT6ywQlKWxZdAg/3y5nBnd8xZKHVSl6aq92KLf1VTlZNALGypNj/W78TkP0kfVYwx9e
         flm3PE5oSm5EwoUJlAZOumOU2Vw8AD0isxXfmnKAWMn5Ys9CLhUoJcqF8GAWSaRkQGlZ
         kwig==
X-Forwarded-Encrypted: i=1; AKwUvBy8Dokxfp7VSbZlJRdlHHEqHLc4hvahbUkvwLIc2eNC6X9xHd1JdP5shdlp1y88LN/0jnVf094dwzTxQDBTh6JwNU9l@vger.kernel.org
X-Gm-Message-State: AFq9FYInfMZ1bXZLJChVzJQIF4TteVWRPqogEcspty4Q8o7hielpLazN
	AipGCKhjMCpzpRxSvrgbpsDHlP6T5wLu64uYDLHxwAsum33yYKVSX0xSRI3u4uK6AjKW5wm2ZTV
	fUyjYLumQvVDvnkPE8H2o6af9VzhLx7H0KhYRqL2BnNOrtM0baU7eeuN5vzwYTJHfyPSVyfaVQt
	FdrYRBvK2YJDNFXQSfYXyNFZjdiqNYCJUgeVj6qKgj1ES2ZVAHCgyUlMIrCQMuJsmUZg==
X-Gm-Gg: AYBFou1FAw4eimX6qFoiTBHRyCRMVH4zK7EYn6ZhsnfmPLJBbYc5wizp2hjhg3ahA67
	oaGmMR3S6pKtp8i2765SwxyI3GkYH+Li4UuHBxbtrAB4tcicdTW+X+XZpZzaQlXzqOXzcrPFbo+
	CIFAdOB/3OujxPcUyrwrwdlAUlE0siiK/Swe+cQ1ZMQUAuviylp2xdXYID5fEk9w4n6rr0qjEZ1
	sSoMO4hqzvUSzWNO1HM1kHbSJ1+/Di93RP2jepSnFMSVEnZqSYIh0rf42e3fU9VIye++lJ+hYjc
	GwR/8rX9iEcQ8tc=
X-Received: by 2002:a05:6808:50a8:b0:4c4:d241:d230 with SMTP id 5614622812f47-55be816a3d7mr2090213b6e.2.1792760536100;
        Fri, 23 Oct 2026 06:02:16 -0700 (PDT)
X-Received: by 2002:a05:6808:50a8:b0:4c4:d241:d230 with SMTP id
 5614622812f47-55be816a3d7mr2090139b6e.2.1792760535458; Fri, 23 Oct 2026
 06:02:15 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023052717.2577234-1-an.wu@canonical.com> <20261023052717.2577234-2-an.wu@canonical.com>
 <f985179ec5ffd2bd558f394c9af9070e8c1e2f75.camel@posteo.de>
In-Reply-To: <f985179ec5ffd2bd558f394c9af9070e8c1e2f75.camel@posteo.de>
From: An Wu <an.wu@canonical.com>
Date: Fri, 23 Oct 2026 21:02:03 +0800
X-Gm-Features: AclHuK9-U3TrsJ_YTYQ3ey-26S-PPldzjI4VyJvpL9r8_VBsogTkWVj5Nz6jtRM
Message-ID: <CAO4Mv0aW4pRSi5kf8GjnORJMyx-VZhCtUk2AGiX-1TambzgQOw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] serdev: handle devices without an ACPI or device
 tree node
To: Markus Probst <markus.probst@posteo.de>
Cc: linux-serial@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus
    Thank you for your review.
For this,
```
#ifdef __KERNEL__
#include <linux/types.h>
typedef unsigned long kernel_ulong_t;
#endif
```

I originally implemented it this way, but checkpatch.pl reported a warning.
Since it's only a warning, I'll go ahead and update it accordingly.
I really appreciate your patience and guidance. Thank you!

BR
    An

On Fri, Oct 23, 2026 at 8:26=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> On Fri, 2026-10-23 at 13:27 +0800, ChunAn Wu wrote:
> > Serdev clients instantiated by a driver have no ACPI companion and no
> > device tree node. Their modalias read returns -ENODEV, their add uevent
> > is suppressed, and they cannot be driver-matched, so creators force a
> > bind with device_driver_attach().
> >
> > Resolve both TODOs in the serdev core by modelling matching on the SPI
> > bus: add a creator-set modalias to struct serdev_device and an id_table
> > to struct serdev_device_driver. ACPI and OF are still tried first;
> > clients without their own modalias keep returning -ENODEV. The device
> > name, derived from the controller, is unchanged.
> >
> > Signed-off-by: ChunAn Wu <an.wu@canonical.com>
> > ---
> > Changes in v3:
> > - Rename struct serdev_device::name to ::modalias; dev_name() is unchan=
ged
> > - Model matching on the SPI bus: add struct serdev_device_id and
> >   id_table; drop driver->name matching
> > - Add serdev_device_set_modalias() helper and SERDEV_MODULE_PREFIX
> > - No MODULE_DEVICE_TABLE(serdev, ...) support: both in-tree firmware-le=
ss
> >   clients are created by the same module that provides their driver, so
> >   udev has nothing to autoload
> >
> > Changes in v2:
> > - Instead of silently returning success with no modalias, use a
> >   creator-supplied name as a "serial:<name>" modalias fallback and as
> >   the matching key, so clients can bind through normal serdev matching
> >
> Thats something I would expect on the cover letter.
> >  MAINTAINERS                      |  1 +
> >  drivers/tty/serdev/core.c        | 54 ++++++++++++++++++++++++++++----
> >  include/linux/device-id/serdev.h | 16 ++++++++++
> >  include/linux/serdev.h           | 34 ++++++++++++++++++++
> >  4 files changed, 99 insertions(+), 6 deletions(-)
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
> > diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> > index 7500efcdfc21..e178dc57d31b 100644
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
> > @@ -86,16 +101,43 @@ static const struct device_type serdev_ctrl_type =
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
> > +
> >       if (!is_serdev_device(dev))
> >               return 0;
> >
> > -     /* TODO: platform matching */
> >       if (acpi_driver_match_device(dev, drv))
> >               return 1;
> >
> > -     return of_driver_match_device(dev, drv);
> > +     if (of_driver_match_device(dev, drv))
> > +             return 1;
> > +
> > +     /*
> > +      * Devices which are instantiated by a driver instead of by firmw=
are
> > +      * have no ACPI companion and no device tree node, match them by =
the
> > +      * modalias their creator gave them.
> > +      */
> Drop comment.
>
> > +     serdev =3D to_serdev_device(dev);
> > +
> > +     return !!serdev_match_id(to_serdev_device_driver(drv)->id_table,
> > +                              serdev->modalias);
> I think you can drop the `is_serdev_device` check and use
>
> ```
> const struct serdev_device *serdev =3D to_serdev_device(dev);
> const struct serdev_device_driver *sdrv =3D to_serdev_device_driver(drv);
> ```
>
> in the top.
>
> The function `serdev_device_match` is only used inside the match
> callback on the bus type definition. Other bus devices also do not have
> this check. It should be safe.
>
> Alternatively `to_serdev_device` in the same expression as the function
> call (like with `to_serdev_device_driver`). It should be consistent
> (either both as variables or none).
>
> >  }
> >
> >  /**
> > diff --git a/include/linux/device-id/serdev.h b/include/linux/device-id=
/serdev.h
> > new file mode 100644
> > index 000000000000..1c3b03b7d501
> > --- /dev/null
> > +++ b/include/linux/device-id/serdev.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef LINUX_DEVICE_ID_SERDEV_H
> > +#define LINUX_DEVICE_ID_SERDEV_H
> > +
> > +/* serdev */
> > +
> > +/* Large enough to hold the KBUILD_MODNAME of any serdev client driver=
 */
> Is this relevant for anyone reading the code? If not, drop the comment.
>
> > +#define SERDEV_NAME_SIZE     40
> > +#define SERDEV_MODULE_PREFIX "serial:"
> > +
> > +struct serdev_device_id {
> > +     char name[SERDEV_NAME_SIZE];
> > +     unsigned long driver_data;      /* Data private to the driver */
> > +};
> In almost any other include/linux/device-id/*.h file, there is a
>
> ```
> #ifdef __KERNEL__
> #include <linux/types.h>
> typedef unsigned long kernel_ulong_t;
> #endif
> ```
>
> statement and `kernel_ulong_t` is used.
>
> I don't know why, but there is likely a reason for it. Thus do it the
> same way, unless you can explain why this isn't needed here.
>
> > +
> > +#endif /* ifndef LINUX_DEVICE_ID_SERDEV_H */
> > diff --git a/include/linux/serdev.h b/include/linux/serdev.h
> > index b6c3d957ec15..9f91aa3e875d 100644
> > --- a/include/linux/serdev.h
> > +++ b/include/linux/serdev.h
> > @@ -7,7 +7,9 @@
> >
> >  #include <linux/types.h>
> >  #include <linux/device.h>
> > +#include <linux/device-id/serdev.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/string.h>
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
> > + *           tree node instead. See serdev_device_set_modalias().
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
> > @@ -58,12 +65,15 @@ struct serdev_device {
> >   * @probe:   binds this driver to a serdev device.
> >   * @remove:  unbinds this driver from the serdev device.
> >   * @shutdown:        shut down this serdev device.
> > + * @id_table:        List of serdev devices supported by this driver, =
used to
> > + *           match devices which are not enumerated from firmware.
> >   */
> >  struct serdev_device_driver {
> >       struct device_driver driver;
> >       int     (*probe)(struct serdev_device *);
> >       void    (*remove)(struct serdev_device *);
> >       void    (*shutdown)(struct serdev_device *);
> > +     const struct serdev_device_id *id_table;
> Just a suggestion:
> Move it directly under driver, so the fields (driver->of_match_table,
> driver->acpi_match_table, id_table) are next to each other. It has no
> real runtime difference, so I won't complain if you leave it there.
>
> >  };
> >
> >  #define to_serdev_device_driver(d) container_of_const(d, struct serdev=
_device_driver, driver)
> > @@ -135,6 +145,30 @@ static inline void serdev_device_set_client_ops(st=
ruct serdev_device *serdev,
> >       serdev->ops =3D ops;
> >  }
> >
> > +/**
> > + * serdev_device_set_modalias() - set the modalias of a serdev device
> > + * @serdev:  serdev device.
> > + * @modalias:        non-empty modalias to use, typically KBUILD_MODNA=
ME of the
> > + *           client driver.
> > + *
> > + * A serdev device is identified by its ACPI companion, by its device =
tree
> > + * node, or by a modalias set by its creator. Serdev devices which are
> > + * instantiated by a driver rather than by firmware have neither of th=
e
> > + * former, so they must set a modalias before serdev_device_add() to b=
e
> > + * identifiable. Doing so reports a SERDEV_MODULE_PREFIX modalias to
> > + * userspace and makes the device match an id_table entry of a serdev
> > + * device driver.
> > + *
> > + * Devices enumerated from firmware have no modalias of their own and =
keep
> > + * deriving their modalias and their driver match from firmware only. =
The
> > + * device name is not affected either way.
> > + */
> > +static inline void serdev_device_set_modalias(struct serdev_device *se=
rdev,
> > +                                           const char *modalias)
> > +{
> > +     strscpy(serdev->modalias, modalias);
> > +}
> Drop the function.
> Add `const char *modalias` as parameter to `serdev_device_add`. It
> should be clear that any driver calling this function manually should
> provide a modalias. Also, keep documentation simple (unless there is
> need).
>
> Either you add `__serdev_device_add` for internal use (of or acpi), or
> it will use NULL. Your choice.
>
>
> Overall, looks pretty good so far.
>
> Thanks
> - Markus Probst
>
> > +
> >  static inline
> >  void *serdev_controller_get_drvdata(const struct serdev_controller *ct=
rl)
> >  {

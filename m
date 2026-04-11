Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A213A7F4B
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775922876; cv=pass; b=pbS+J3kJLCTp5ckeQswjYS698JmBQ7QpyiRBCTXeq2r6XTKsGiOOTGSD9pFOOvtIIVjDXH1132IQLTxRozBjMKNkWo6WNS0ZIWbQ9k9VgD1c7svU8cfy49tuQ7yaLOjBpSvJBTC7YknOH/7VYKEoGTn2yMT9aGVe2UKlu9SVVXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775922876; c=relaxed/simple;
	bh=wnFTSL5+5AvqU1zw0FEeS0hEKxpvnDpxKGI1rQHHzSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iag/7pUvJwc7dDWCjdco59xzvSfiKu1F5hL0Eng2HnCpI5Mvn2gfHL4D6U6LSnYkU80eudA1e6kiq14fhy+8oKErlVyV0rLYH0sHD58crzEsfM0/pm1hsFz7gR1Hwa+2iwerRle5eQqR/fP0hTbDOb3dwxVvOiF8oc7snGDdvmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWrdfzaJ; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWrdfzaJ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89f68634786so33892156d6.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 08:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775922872; cv=none;
        d=google.com; s=arc-20240605;
        b=J9tfGVeyHBkZUlp2iY32p7l+Yf1HqZiJAi9Wrenb/wta2/V+vMOTkmeZ9cW1a68AKk
         Z7K70l7i4LwE9lcyzuk37/8oV7g7fBX7gHeox02sUKOGCwLvYFvsZIdGqcy517PSLF/z
         R5RZVKfwra5u2eh2L0auLDSkBWsXlF44p4+q4WiFvTZD0pCyjfLSyj4HPBzuVNzv78B0
         ay29hidn7Za0NN5wVSWwcJpDrxn2YlaKI7hIG6Mw1wX5w4LtQ74VQE4hMqOONxZtfwYg
         w6hrfru2IkANBlyBof/NsmEg7yAUq6hmp86bwa153kWspuhAfVM8zhh8rOjIyDw6Y7j7
         qzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XdA/ZLC4RhdlMmk5sZOK048aLbs3qsqStKVz7rhwQwU=;
        fh=8hXiS2WdrjKTOWC4vx2G+z7L+lQaAdyyw0+f5xRU2gI=;
        b=S4w2wZ4mpTm5nweadM6lhvaNWtwIwf4nKbWorU79OhUqQNK23iimJGyqR4WIz3Vp9m
         kslarhElrchEB6RjyCT1rl7Y/qQO62ZJEMSiYvXmm2uD/BDfAFfxKSF2Ilw1EHdO18cc
         JIerYe3jCDNw2y2CB1IOdSq+RkwlIkk8bBZ0hhwQPZbYZ8oTBaCGWIpJmditEXBw3KTI
         xTA6bIyFIbfFU1jWd9G8aXRT04obC0Of4IGX5GK037Qr10hc+jaieawQ3o4/nurh6nsD
         ba89h3c0QNA+YOWPxXdB3NW+QIkmkaZGKlFHE/1v2H//8r/TcrUbksmSVZs1ADRZcE4X
         a15w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775922872; x=1776527672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdA/ZLC4RhdlMmk5sZOK048aLbs3qsqStKVz7rhwQwU=;
        b=cWrdfzaJZZrEKWMEK5G+AB0SG1P1AaaBxY7jSG4g6bsD6aMgTsJeHI6s59gt0Bmwxv
         XcNcnXBCJJXsLlJes1RY53NMJATWp/8GRWKDtOJyE0SrriibpsJVvLCe3ZT8OygSbLam
         QNPEH3tFaEYNevkbMxOG++OzjlKJVQzp9INEXjEb92th6zGZIcf/4k0vDr39lDErJu91
         xmFT3+MmsZ/4neOvp2TxekraY+EIlBVp07vY8PJneUMkaaU7j8uhGumk/ALGts4Z9ODp
         0q/2JYhfZvNBCilwVgEnJKVw/mTBs4tcVKQQwbIiHEaexNKlbEfizZ7va2alxQK9ZUYk
         ry9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775922872; x=1776527672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XdA/ZLC4RhdlMmk5sZOK048aLbs3qsqStKVz7rhwQwU=;
        b=XFoz14SnQyRm4EvItaWICqZGp6L8w+yJkdfz4tQ4UMSDEnjYsGvDpc/xIYyFZDThgJ
         0TXjLLDxPwFg6ERTdda/cEElsTLj8K8ZxeDeVBE4Xgutd6z5UAYenpT55vxIm/QYzSbB
         mYSSkjRkSFUfKPZnNMyuVYaihTFkGk2e3kb519WjVSLKcZM6HX1/GT6xEV+OVkccwT70
         6rArgXzK4Jw8DpqKohQ2jkFYijtvcbun32M/WvZP9QuKtIHlvDiJiS6bSGywCB8J7gFU
         RLtiEijYS57Vv5z9nF2m/tBRhJyWQGPYtZ1aSdKkO24R5H6AG+g6ExmRPJEtyjbCUr+U
         Zu5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgTwpBSHVt9LlI+gqmp+06FSypRLARwUHzgnOQGtkbJTR4op5the66j2Av9XxrzJXCLcHHyT6RRIgmCFXjaps9HXcV@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1ROEl/ydkXYVJCEhshOutIvA6mVwZPxVSlrSzdGQlAneb9ku
	PwAdFur0DG0YJ37ohwUgJ2uoLQAz8V4t04lw0TYHVN5DYO8Xtsm1GOofuMBlQCGlvr4So7Qm+Ob
	MsiE066xfluK3ZscskEiWbjnEfiLPl/s=
X-Gm-Gg: AeBDiesYootbRAQlygTuUH8QE5ksGpW2fQLEkQPmg6H+CDTCkFZXjnr4L8dAXJhhx3X
	us+b9GTAwj4N0mSGOkvNcNgH6fHYK8riB3wEWLYUVYP3U9yxGRj4irLZ0qW/qXlJF0UhMg8H48v
	OrIAB6lt/+qAZzP3nATdkVn6OUoA6X3ESvygkMKEOqGyKw2y7boq3rudUV2hamLrC0JFq7ScQgm
	CkxzpWmx+96thR7DcmfFNgkYzm5NRvTE2op3bHEoZIMC9Uk65bZhHtaDuocC+vc3N70L97Ib5Bd
	LCK8yLQ7PRb7VUnAXaE=
X-Received: by 2002:a05:6214:2b86:b0:89c:5e9c:4158 with SMTP id
 6a1803df08f44-8ac860efeaamr115004046d6.18.1775922872028; Sat, 11 Apr 2026
 08:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <499fa3efd5be054ffdda77dd00ad4d8d3391e073.camel@rong.moe>
 <20260401190221.1595264-2-i@rong.moe> <6a796411-67b4-943b-f8aa-1e5f6b0b2c97@linux.intel.com>
In-Reply-To: <6a796411-67b4-943b-f8aa-1e5f6b0b2c97@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 11 Apr 2026 08:54:21 -0700
X-Gm-Features: AQROBzAW3_jb7iBeg_RoPELa2yh8qdd48j14mkjbuYYcSS-TIAvYhm8zUKWTldM
Message-ID: <CAFqHKT=O4h=w_3kNqEArd9su=4kK2qwdPDJ=4CsWrv-PWEQwWQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: lenovo-wmi-other: Balance IDA id
 allocation and free
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>, Hans de Goede <hansg@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 5:30=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 2 Apr 2026, Rong Zhang wrote:
>
> > Currently, the IDA id is only freed on wmi-other device removal or
> > failure to create firmware-attributes device, kset, or attributes. It
> > leaks IDA ids if the wmi-other device is bound multiple times, as the
> > unbind callback never frees the previously allocated IDA id.
> > Additionally, if the wmi-other device has failed to create a
> > firmware-attributes device before it gets removed, the wmi-device
> > removal callback double frees the same IDA id.
> >
> > These bugs were found by sashiko.dev [1].
> >
> > Fix them by moving ida_free() into lwmi_om_fw_attr_remove() so it is
> > balanced with ida_alloc() in lwmi_om_fw_attr_add(). With them fixed,
> > properly set and utilize the validity of priv->ida_id to balance
> > firmware-attributes registration and removal, without relying on
> > propagating the registration error to the component framework, which is
> > more reliable and aligns with the hwmon device registration and removal
> > sequences.
> >
> > No functional change intended.
> >
> > Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
> > Cc: stable@vger.kernel.org
> > Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.=
clark%40gmail.com [1]
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  drivers/platform/x86/lenovo/wmi-other.c | 34 +++++++++++++++----------
> >  1 file changed, 20 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index 6040f45aa2b0..b47418df099f 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -957,17 +957,17 @@ static struct capdata01_attr_group cd01_attr_grou=
ps[] =3D {
> >  /**
> >   * lwmi_om_fw_attr_add() - Register all firmware_attributes_class memb=
ers
> >   * @priv: The Other Mode driver data.
> > - *
> > - * Return: Either 0, or an error code.
> >   */
> > -static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> > +static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> >  {
> >       unsigned int i;
> >       int err;
> >
> >       priv->ida_id =3D ida_alloc(&lwmi_om_ida, GFP_KERNEL);
> > -     if (priv->ida_id < 0)
> > -             return priv->ida_id;
> > +     if (priv->ida_id < 0) {
> > +             err =3D priv->ida_id;
>
> This looks a bit backwards. It would be better to do:
>
>         err =3D ida_alloc(&lwmi_om_ida, GFP_KERNEL);
>         if (err < 0)
> > +             goto err;
>
>         priv->ida_id =3D err;
>
> ...This, btw, tells us why "ret" would have been superior name for the
> generic return variable as it does not carry "error" connotation.
>

I've taken a note of this. In the next series I'll add a patch to
rename any "err" to "ret" for all lenovo wmi drivers. This series is
already getting out of hand though so I don't want to introduce more
complexity at this time. For now I'll just invert the logic as stated.

Thanks,
Derek

> > +     }
> >
> >       priv->fw_attr_dev =3D device_create(&firmware_attributes_class, N=
ULL,
> >                                         MKDEV(0, 0), NULL, "%s-%u",
> > @@ -993,7 +993,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv =
*priv)
> >
> >               cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->de=
v;
> >       }
> > -     return 0;
> > +     return;
> >
> >  err_remove_groups:
> >       while (i--)
> > @@ -1007,7 +1007,12 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_pr=
iv *priv)
> >
> >  err_free_ida:
> >       ida_free(&lwmi_om_ida, priv->ida_id);
> > -     return err;
> > +
> > +err:
> > +     priv->ida_id =3D -EIDRM;
> > +
> > +     dev_warn(&priv->wdev->dev,
> > +              "failed to register firmware-attributes device: %d\n", e=
rr);
> >  }
> >
> >  /**
> > @@ -1016,12 +1021,17 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_p=
riv *priv)
> >   */
> >  static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
> >  {
> > +     if (priv->ida_id < 0)
> > +             return;
> > +
> >       for (unsigned int i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; =
i++)
> >               sysfs_remove_group(&priv->fw_attr_kset->kobj,
> >                                  cd01_attr_groups[i].attr_group);
> >
> >       kset_unregister(priv->fw_attr_kset);
> >       device_unregister(priv->fw_attr_dev);
> > +     ida_free(&lwmi_om_ida, priv->ida_id);
> > +     priv->ida_id =3D -EIDRM;
> >  }
> >
> >  /* =3D=3D=3D=3D=3D=3D=3D=3D Self (master: lenovo-wmi-other) =3D=3D=3D=
=3D=3D=3D=3D=3D */
> > @@ -1063,7 +1073,9 @@ static int lwmi_om_master_bind(struct device *dev=
)
> >
> >       lwmi_om_fan_info_collect_cd00(priv);
> >
> > -     return lwmi_om_fw_attr_add(priv);
> > +     lwmi_om_fw_attr_add(priv);
> > +
> > +     return 0;
> >  }
> >
> >  /**
> > @@ -1115,13 +1127,7 @@ static int lwmi_other_probe(struct wmi_device *w=
dev, const void *context)
> >
> >  static void lwmi_other_remove(struct wmi_device *wdev)
> >  {
> > -     struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > -
> >       component_master_del(&wdev->dev, &lwmi_om_master_ops);
> > -
> > -     /* No IDA to free if the driver is never bound to its components.=
 */
> > -     if (priv->ida_id >=3D 0)
> > -             ida_free(&lwmi_om_ida, priv->ida_id);
> >  }
> >
> >  static const struct wmi_device_id lwmi_other_id_table[] =3D {
> >
>
> --
>  i.
>

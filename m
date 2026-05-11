Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C27F28CF6F
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 20:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529913; cv=pass; b=leBnta9fEmvYOpj6Zx9weqtIQ9uS6yPRbqSzAXRgemAcZxLBEPpE7D640FMIdIiWdYtkODTTMdhFzP7u4RmBQSlGnlF/pnkgn0mxTHY7DDmomwoLEOgzQhMnXwO1SybULZap0DUgGsxUrDnBCWPBzaR8MMC2mpliYcCpMelXhTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529913; c=relaxed/simple;
	bh=PNz3/ja6yCghAo+BODB0jZweGJz6XevgXdRQE/G3GcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeVKf7F3hXm7BHSdhXLZgjlSzatbVI2o2gNYOEXWtxJWp4zBqMawNWbunAH0sFvsE2UAJamr/p3xsmyZ/lN4Wu3Qp9FoFgSyLa7g0KmKyUOIMVuNrngQBNCRk4URRh48rjTsF7Qv7Or6Of3lbOhJOSe+OJyIEyrNCO1xBEXO4n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+2dwBWa; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+2dwBWa"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b7f937ef44so27045216d6.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 13:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778529910; cv=none;
        d=google.com; s=arc-20240605;
        b=F9rNfmcgQD7ben+uO1S6LOP6qkKd1PAXZMoHYE1Eel7Je7kn7GB1C0FJOOCFvsYos7
         7Km/sn1GIsacZ3lgJ8ZgCFN9Uh1qM//4CDRPYrs0EZGIbj3mjIPHOjPKCZeQ8ofjYuGX
         eJt+Fd/IFrqvS8Sc7TYXlr2lYVkYT/aEd44RCaEE5zH0stvht5XYw+LOWu9gpN4sSJ7b
         w/D2ogn6FQDRHBgfEEZq0PwdVq/lptJMoYueYwULsTUa8S2KidnuCA6m+XyVYZFgiKBP
         vvK9aTp3ywY/eZBJe5/rjEAAhR9y3GggxUk1dX/1/NaMVu1VQV75t1Oy//Y5sMg83AKF
         8TSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RD9xTYYpmMxEJYSam8F84HVFGDTMyGCoxRFK7V0f6B8=;
        fh=/iigKdhU1XWvUfgIBhzuUl4PwGIM5sZGoEwWAGzQJ8U=;
        b=AdPwRaHymwZ9OlJLpS+bGE2AjOZzdx2YoKYRVzKGGpUVTjoaX9FbDiugYNdGbsbXYi
         VrE2LlbSyYuvsvwf5NQFChHjRL/XQo6uN0N/KClTov74QLAWgigBUnMTgoE/0ScHJMMV
         EXerhQQZ5i2eKdgCT5nNa3kJCiIuycgVHaLa59qG6kVkvi/Vj6ujEOWC9kWv7YIJGC/e
         NPTch2cePzP+05A3L7frQjRKYVgdouyGrgIDQAeVkh5ewievDd+8hDnHo79nekJ8yirZ
         cLJwcwm2DVmBxIoxyd9P6GOZIGbCxNttdw9ND0F3Y3aVo5yzYcw/tm/B5er/JgdA9JTh
         wjog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778529910; x=1779134710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD9xTYYpmMxEJYSam8F84HVFGDTMyGCoxRFK7V0f6B8=;
        b=H+2dwBWaxhDYhm8FlqwLfK5aIZ2zfnVkbEtXErXM7r3+z9m/kRMq54o0wKO7nj/xTL
         wfhFxYuER7hopzcDFoHiZncdWxyiv+j31g1RF0KGj4ZhbU1DbVbBC+tidQ/orWaVAIhm
         XzTdHSlutni/3Kabs27x0bat1x1eDQsnUQPmyNOhxtEYPbHR9ycRLX9LMiGcfGZQOL2k
         YLbxjjSMc9+vzyZkJPJPkRH+JJuLpTYodBU2F7Mcj0SoGC3xtJCaqfSsiIfMADgVTaFv
         r1uxwVaS+FautKlqBC4Tfyg0rUPCwc/HkaFUWBxX6OjfEoIm7Typro5+H3hoEndItSP0
         xidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778529910; x=1779134710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RD9xTYYpmMxEJYSam8F84HVFGDTMyGCoxRFK7V0f6B8=;
        b=fAdRoMbVP2I+sR6wj1FHRSH74AE1spaBh/8qFWyyf/T6/0GeLzSBeN67p7fsOMD3rd
         CkuiVVC1aagj1+zwLGKr5kcP5KqpP8NZ+QABIrDRu7ilrJzOsW8aWfsgPZheJUV4iLcC
         7eD58l5mJ9iy/VGgLYaoKfAcX7XFF9jON+yOahZloWXh1cyilvzlW5F9RSr2TUgX+cXs
         b/Gy61wWvV96BYWys6YFM/oHpYjfDyM4wBUNOaV35jpsX/s+mRvpWzyFQqYp/ZHOMld+
         /q6g7BX5o4A/mYXreVF2lO5R7A6+svWIhTONiayKVr48aWD1yLuC7FT/SoShz+pJL7er
         pu3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/PAYfPoBg3cZoLMxLjRMsT6z8j8EG+e3b2sGjBMxkOCg/OWdobi9vSZYzJI6sqAJxFwfAaHqPQE21yx57f9HYy+SOZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg7lu7l7HgCiJ3gEA3zcnv7YgGZrjJDWCvooGhKxQdd0jwKRPR
	7IoKxY6Gz0a71nZOzTUrrLehyfunC/IZkv0pjTx+Tc/u88TEIsU7UFxcrjlcIC/DyAm5mQFNdnX
	Hpik2uo/3gQA8dTzCA4NSCCJAyDtsbO8=
X-Gm-Gg: Acq92OFDJkfsUY0woTZK2Ns2iMgzzQeXiuXcTacOQjGHACKbE+qDqvgLglBDg9lnNmQ
	3tamHPKpiU5tZOcSFWZIezZPfDpc28/VvRTAqTpMCJU/NNzAjMaZE5JTUzArhRNYnzJG8FWQBJF
	MOhWnre/1QyGZhYCO47kNjzvvkfaNiAv/KiiXpTRDNAsCXQaev2hTytaDnO1tzaPbn78qsR3jxd
	DJEz9q/pH00xIq+dcJa8gJgzJiRv32xoVh5/BzmiA3pWKcYZn/5xlTN/VySZHhRo3/9IaRiYp6R
	QyWzLKZY
X-Received: by 2002:ad4:5ba9:0:b0:8b6:6d70:aaac with SMTP id
 6a1803df08f44-8bc449aff20mr379565746d6.30.1778529910222; Mon, 11 May 2026
 13:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
 <20260510042546.436874-15-derekjohn.clark@gmail.com> <825a0b7ac8fd5fad8b5f77205244ff2669977375.camel@rong.moe>
In-Reply-To: <825a0b7ac8fd5fad8b5f77205244ff2669977375.camel@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 11 May 2026 13:04:59 -0700
X-Gm-Features: AVHnY4KhE1NVuotTV02S_6SLmiprkmKELBxatIjFhppeqPB8-82PsuVNGBM8wNo
Message-ID: <CAFqHKTn719GnWL=mSuYH48R4KbE2F2aqYzq1Lbsqk9sXBRKAtQ@mail.gmail.com>
Subject: Re: [PATCH v12 14/16] platform/x86: lenovo-wmi-other: Add
 force_load_psy_ext module parameter
To: Rong Zhang <i@rong.moe>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 8:50=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Derek,
>
> On Sun, 2026-05-10 at 04:25 +0000, Derek J. Clark wrote:
> > Some Lenovo BIOS have been shown to have incomplete and/or broken
> > capability data and WMI attribute IDs. In some cases the capability dat=
a
> > reports that a feature is not supported when the get/set methods are
> > fully implemented. It is also possible that the ACPI methods from the
> > ideapad_laptop driver we defer to could be bugged while the WMI method
> > is fully working. To aid end users in submitting more complete bug
> > reports in these situations, add an override to skip the ACPI and
> > compatibility checks to force load the power supply extension as if it
> > is fully supported and has no conflicts.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v12:
> >   - Move the force_load_psy_ext into its own distinct patch.
> > ---
> >  drivers/platform/x86/lenovo/wmi-other.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index 4d95a9109f5e..007fef658bfe 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -185,6 +185,16 @@ MODULE_PARM_DESC(relax_fan_constraint,
> >       "Enabling this may results in HWMON attributes being out-of-sync,=
 "
> >       "and setting a too low RPM stops the fan. Use with caution.");
> >
> > +/* Visibility of power supply extensions */
> > +static bool force_load_psy_ext;
> > +module_param(force_load_psy_ext, bool, 0444);
> > +MODULE_PARM_DESC(force_load_psy_ext,
> > +     "This option will skip checking if the ideapad_laptop driver will=
 conflict "
> > +     "with adding an extension to set the battery charge behavior and =
battery charge "
> > +     "control end threshold. It will also skip checking if the BIOS re=
ports that "
> > +     "those features are fully supported. It is recommended to blackli=
st the ideapad "
> > +     "driver before using this option.");
> > +
> >  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & =
fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> >
> >  /**
> > @@ -898,6 +908,11 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_pr=
iv *priv)
> >
> >       priv->bh_registered =3D false;
> >
> > +     if (force_load_psy_ext) {
> > +             props =3D LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHO=
LD;
> > +             goto load_psy_ext;
> > +     }
> > +
> >       /* Deconflict ideapad_laptop driver */
> >       ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, N=
ULL);
> >       if (ret)
> > @@ -915,6 +930,7 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_pri=
v *priv)
> >       if (!props)
> >               return;
> >
> > +load_psy_ext:
> >       /* Add battery hooks */
> >       priv->battery_ext =3D lwmi_psy_exts[props];
> >       priv->battery_hook.add_battery =3D lwmi_add_battery;
>
> You said "it should probably also cause is_writable to return true
> always when set" in your reply to Ilpo's opinion on v11.
>
> Hmm... I agree with that, but the code here didn't seem to do so. Am I
> missing something?
>

Good catch. I indeed forgot to go back and fix that. I have this
change staged in my working tree now. I'm just waiting on Ilpo's
response now on how best to deal with the API confusion Hans brought
up. If we have a v13 its an easy change.

Thanks,
Derek

> Thanks,
> Rong

Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535F7374E67
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420341; cv=pass; b=JB/sW+AnLhu+j8EdtHogiaspv2yT5R3Z+Lz6ZYxZrYWM5JsOeBOT29M6nXVQxlpuSWyVWuK+xbIr+Yqa5Ar+0oZfzHb7NLuODEJdat2NN1pLCzrJRO39ksRO2tSHPjN8kVkLHghHwhEHsXEmM76EcY/FeUowUM3f9DjaUUPZRj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420341; c=relaxed/simple;
	bh=XIW0skLzRfcUs+OdX9HssPF2ar7RCE0EjuAPY9HJr6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmNLqq5cthC7CH8Cz6IlnytCroWe7aQYtSS0j5zZYsrODHd1rjKqHCdCNKlLr7ScRU0ULLkfC3cmNlafCAz3QIYqLjqeigBb8stYX0nhYgWD6AZ2NSIysVOgb5q3xU6SZAAeghJyWOCXv4cFsq2iorxo3rdUlAo+4bPP/5SpWoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHDeC7uy; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHDeC7uy"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4896ae35be9so865383b6e.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 07:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785420339; cv=none;
        d=google.com; s=arc-20260327;
        b=sO1Kg1a6I0t72jcPfKI8bQGOqZZqe3C63zuE7ByiDf9DFbptydEoIiupY3HGWk62fa
         TDqyS7dHbIrDwWrWEScW9hlKRTy9jb6YLH6g7ZF8oDWfxJo3l4qn/+HY12HiI2Zo2eFG
         Q+EAdRV3nmTHGr1WbUnoas4OjsnJJ5J0mi+VPTZSUgIx2d26uw+zS77Hi9L1rW/OT2x2
         NyYx5RK5CufH+5ssfLv6egeMlMdXdSjjxotZ5NQAeUg+DiJJaiGCXxqjRzt5/cFl9uGo
         0RUISK2VpdlUHBLC2xgGVPkqfKW0aVQbh+eYg6hNSkqalGx3SGiR9DNd8+iTAZlYNaq7
         ZQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TUwtZZ6lV5B3ZrKWkDwbznKrR7KSFbpMcHo4SuJ0sak=;
        fh=FKTsrcp9jrPCkNwIo6a79wvnCBAReq08GozB7EkTsN0=;
        b=J6PCDsJZVjBJHM8B8qg3MOd4+f38AR9/yQL+JX+d4edVyrlfLo3g3F2KuG4bMgamOx
         DPepVJwSBnvDeSE/vPe2D8vIRsE8ZV2UTWYg7NcLO80BKkIq2Yx5vka97EAEePV/Wb9i
         +I9r8EXRIygD2ftH+95aLMyZ/mu6n1Qc3J3cfSiCWEcQJoIAE1fujz/Gd377+vzoDfir
         duhkqrbEdQ3YWyhdtUXtfziSgx02OHYgCP0lW9BvmQ7nmgTLGmwecAoEy+WjdD0VooyZ
         5d6FOmh8vozcX4rHOuMvA4xuRp0wxcTunkyuVeAgkyIxDNRE96oSSiWVIuvAC3yTjPo/
         5tKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785420339; x=1786025139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUwtZZ6lV5B3ZrKWkDwbznKrR7KSFbpMcHo4SuJ0sak=;
        b=EHDeC7uyLjX8Fx3vn/qpMQ3cST9PpPERgT1zlTTMzE5WcXMF5V/d3zXKErz+t7KnzU
         SpWj6hSWXzShGvBMenbhzeGD0qkEY5BJlmYmopOkO57cpA7OwIM0TowzTUuOylbnua0Q
         delvwy0Q07jI4xJAmNe2286FurR/eCdfGgGWLG9gtoX1CyK4cKF9tQKdbE/S8+TT9Woc
         1dMMl2JknVM30/PsCWQen4UZwERgtRgVuocJwXeICQvZ3oNlmiWaXSeYlGUzD8uI+DcR
         Jsx3T50vN2OG9Aerd9oYBVgc6wyg3SAe5JK5HSEit+3IwscJTWfi3d45pjI+C+hSRS7T
         F1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420339; x=1786025139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUwtZZ6lV5B3ZrKWkDwbznKrR7KSFbpMcHo4SuJ0sak=;
        b=E9UsADNGS2HrLYZbcLNuDLFRBdswxYM3SB1OxAv7W3ac9H6id7tm9trMwVGLTlVgGP
         mi6GdhuTdigxoeCVDdySvISdeCXQXLeynLocJqKtr2PE4DU0DRyvSxTgGCSPvjL2sDdD
         RUanXB0GhJctcp5tyviHiwVy3t1ygc/OmhSi9wdSD70FTWEuFEmSdJgkos2/CmWMWraA
         +kKDirJ54WwpWHPy5flPuJ5nk0v+zEQrbUBCnOE5FqWFJBSiJDLmgPHaZChpJ5F0mFT4
         zjNLYLNlZ8ps5yZh031IzIws5kqCF3JWOJLcH4RfainxhM22ot2vl0zNX0z5AAzge9ka
         QXyg==
X-Forwarded-Encrypted: i=1; AHgh+RoZINLP4F4fEyeNJLGx2caID8VH68SDVoriKmBusHSqyva8mEzZ16ODAFTwaw22CrGd8pRDbLQOLrNO1k7MewpRk2xY@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJxcy6hRJfcKZmcgZI6lWr/i42ARzKUzNKlPDMwAuK5tYlsTJ
	CBigVPklpnBFF3e9kihjLmkCUPgOniBqpiZkLqIop5EUzmHR4KCE9dGNaxiz46J2vv6TEySwBQ5
	Sw/jWXwRC6hqtiBcIYGi92kJXf3NOTA==
X-Gm-Gg: AR+sD10i88Imp2LHcn2D9wSBVKq1IKtTs8R2pRUAmUeJOYibC7gqKAa7zq6bPd00lpX
	V04qzbdxWfvTumrJaNanrqPFBjaYWa2DjaERisrHrA6pGQu4l8GDEiROyF8f4Qd/T7blFPr28dR
	X4XcbeL4vmKjrG03N9d/KRSl+tQMGB3sQGOYG4Umh2G0xxzojmwc/kdmDBLw3r5Uve3HpPWQmnI
	kmi7orOP5QTRYqOg/3Fe1QDFT9+V3mHzar4ry6d8dcgO/8NegdNUOSRSf5bn32WN6weeAigOMWj
	XmLh9X9uEvVp3pQ3gnFLr/MA7strbLgcrdXw3y6xFhKZ
X-Received: by 2002:a05:6808:1490:b0:4a3:fb6b:bcb8 with SMTP id
 5614622812f47-4ad8777971dmr1679042b6e.10.1785420338983; Thu, 30 Jul 2026
 07:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729222920.6490-1-justinyvar@gmail.com> <20260729235125.1698-1-justinyvar@gmail.com>
 <a7c7611d-1721-407d-a4d3-ec096c5e34e2@gmx.de>
In-Reply-To: <a7c7611d-1721-407d-a4d3-ec096c5e34e2@gmx.de>
From: Justin Vargas <justinyvar@gmail.com>
Date: Thu, 30 Jul 2026 10:05:27 -0400
X-Gm-Features: AUfX_mzUfSJrkNxZKzhv5UsnlWL1qGZbEMC4Ypxjk8LSul87JHOq8NzkK4DVhWw
Message-ID: <CADkD=u565J=YACh5j8WDiB6kxGrr_2zb+9WpOEQbuYEZBrSGgg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: acer-wmi: Add support for Acer Nitro ANV15-51
To: Armin Wolf <W_Armin@gmx.de>
Cc: jlee@suse.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> can you create a custom quirk entry and check if controlling the CPU/GPU =
fans
> works? For this you need to fill-in the number of CPU/GPU fans inside str=
uct
> quirk_entry and set "pwm" to "1".
>
> I think fo something like "quirk_acer_predator_ph16_72", just without ".t=
ubo =3D 1".

Sure. The machine has two fans - with predator_v4=3D1 loaded, sensors repor=
ts
fan1 and fan2 under acer-isa-0ace - so I'll use:

static struct quirk_entry quirk_acer_nitro_anv15_51 =3D {
    .cpu_fans =3D 1,
    .gpu_fans =3D 1,
    .predator_v4 =3D 1,
    .pwm =3D 1,
};

One note on timing: this laptop runs Windows day to day and I've been testi=
ng
from a live USB, so I need to set up an environment that can build and load=
 a
patched module on the hardware before I can report back on fan control. Tha=
t
may take me a few days, but I'll follow up with results either way, and sen=
d a
v3 once I can confirm whether PWM control works.

Thanks for the quick review,
Justin


On Thu, Jul 30, 2026 at 5:17=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 30.07.26 um 01:51 schrieb Justin Vargas:
>
> > The Acer Nitro ANV15-51 uses the Predator V4 WMI interface for thermal
> > profile handling and hardware monitoring, but has no quirk entry, so
> > these features are only available when the predator_v4 module parameter
> > is passed manually.
> >
> > Add a quirk entry for this model.
> >
> > Note that this machine does not support the turbo thermal profile: its
> > supported profiles bitmap (misc setting 0x0A) reads 0x53, and writing
> > PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware. The four
> > remaining profiles work as expected.
>
> Hi,
>
> can you create a custom quirk entry and check if controlling the CPU/GPU =
fans
> works? For this you need to fill-in the number of CPU/GPU fans inside str=
uct quirk_entry
> and set "pwm" to "1".
>
> I think fo something like "quirk_acer_predator_ph16_72", just without ".t=
ubo =3D 1".
>
> Thanks,
> Armin Wolf
>
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Justin Vargas <justinyvar@gmail.com>
> > Tested-by: Justin Vargas <justinyvar@gmail.com>
> > ---
> > v2: Add Assisted-by trailer per
> >      Documentation/process/coding-assistants.rst. No change to the code=
.
> >
> > Tested on an Acer Nitro ANV15-51, BIOS V1.60 (04/08/2026),
> > kernel 7.0.11-1-cachyos:
> >
> >    $ sudo dmidecode -s system-product-name
> >    Nitro ANV15-51
> >
> >    $ sudo modprobe acer_wmi predator_v4=3D1
> >    $ cat /sys/firmware/acpi/platform_profile_choices
> >    low-power quiet balanced balanced-performance performance
> >
> > Writing low-power, quiet, balanced and balanced-performance all succeed
> > and audibly change fan behaviour. Writing performance is rejected by th=
e
> > firmware, consistent with the supported profiles bitmap (0x0A) reading
> > 0x53, i.e. bit 5 (turbo) clear.
> >
> > hwmon works: sensors reports acer-isa-0ace with fan1 3024 RPM,
> > fan2 2685 RPM, temp1 +48.0 C.
> >
> > The WMI mechanism was cross-checked on Windows, where NitroSense switch=
es
> > profiles via SetGamingMiscSetting with index 0x0B and the same profile
> > values used by this driver.
> >
> > The analysis and patch were produced with AI assistance (see the
> > Assisted-by trailer); all testing was performed by me on the physical
> > machine, and I take responsibility for the patch as signed off above.
> >
> >   drivers/platform/x86/acer-wmi.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
> > index e0eaaefb13d..a7290f85166 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -662,6 +662,15 @@ static const struct dmi_system_id acer_quirks[] __=
initconst =3D {
> >               },
> >               .driver_data =3D &quirk_acer_nitro_an515_58,
> >       },
> > +     {
> > +             .callback =3D dmi_matched,
> > +             .ident =3D "Acer Nitro ANV15-51",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
> > +             },
> > +             .driver_data =3D &quirk_acer_predator_v4,
> > +     },
> >       {
> >               .callback =3D dmi_matched,
> >               .ident =3D "Acer Predator PH315-53",

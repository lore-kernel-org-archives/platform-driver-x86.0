Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33776386576
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482131; cv=pass; b=luNyTBU+/PSxDDpC3+Y+iAEC7uuGu8lBiOuo0QU0rnDQ3WB5++qjY/AMsGqhL/J7kUO1F0N+oacICZffkUJg9G9SBbSqoyv8VF/PLlz7na52x/8Xixyifo2ERWh+NkqPURf1qwWt3ObAEbDm/rrN3wv2KRxbp2JXrQmLDWIbw/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482131; c=relaxed/simple;
	bh=Dk03HdR44xTmogo8ZcZq5yT8mIl21lhvJ+1hkUiBmCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGF34EDdexd9OOxmk5bR9VcFJcUTgmga0YccVL3wZogEi1XGxKVu4SelLMzEm1YTh0wDP2tJNem9IkXhm/nMQ43zMVHAzM/K+qlh2lOToMv+mJPqb9VYPPItf2NbwUuqpeRw9mCJxZI9hr6SKGTDKl+39SD211LIOCuk+UqsDME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGQyAn2v; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGQyAn2v"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-48a0ca07c38so441445b6e.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 00:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785482129; cv=none;
        d=google.com; s=arc-20260327;
        b=l5hhFCBwxBeJe/UWq+k7P9fZX0LmtuKwX08kq6kMIDiJcwXAjPPe+kmQnBKiNdkx8f
         U7uXbYaYg5B8a77bdOedTwLpjSGtcIcoplAeN+bOEjlqMreDPjtsGjVM1Ptcoz49WXX+
         J3XrF0bvVVOFMBi10jYZMEkoK5Faj5ODumJXOsGhmN2qQ7gx9IK8fXOuukypjSpMHG/U
         xumGD+D51uWfe3JmgDSvVaUcRNGAEWUmwqt7JrZgX9KLVyiM6VUdZPkzSCOmdl5YazQH
         E93h/XlMV9fJdEqJtDlN6uHR2jHHWfG1x9hpqK542XLw+3FqHJ2o67R8LCpKG0DTD1RX
         uEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x4vCLoMKpG3lKFjbQu+5PS000OH8/vaU8JYyEh3/EP0=;
        fh=09Wwjo054Uju25FVKOiZTDtloZBHkR4TjqAGkNPY334=;
        b=Y1W+RA+jXInt1WzDzcdscmiW8MqzOYs9gZ8rHkSKw/doqgivTNS9eNyO0n+2pxoDAU
         3QNZMYmsAxiolBV4c/thD5nBXxoCTxnaMPDk+kgoP4IfSN4OsiDOCz9l+ftraOqbOaJd
         5/dDXNB365VURT5J+Jbfc6EiZG3oyJUdWxE4ucv4pma1QGahawdH8BoVCYgdcEvUEEUY
         lhtVCAtu5NJ3JJgtwgoji6OggMCrvNhQ1qn30HNWTqyYRw5m6iAvlharwV/AZPl4Gjlc
         mXOJjYNE5xrjAuJIoDaiEHAKVPuryB9BVMBxc4F2MCjvt1mOcB3aNXdBgGv81a7NoCBd
         4c3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785482129; x=1786086929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x4vCLoMKpG3lKFjbQu+5PS000OH8/vaU8JYyEh3/EP0=;
        b=NGQyAn2v+WlI4cWoUSAtCL0OAZKuhJvOPPFkzF8BS91U1L238bhSBmMkvmQn4soxcg
         ZFTeqTEjrFZVUQUtB7JXua2kri1VlmoKClv377seiI9meW10RMJ3x1CG95oRG7eSWLyD
         3LN+dhc6Kb4sI/liq6g4HwZV5OWoArPzr833qZSdH37kYdGLauBy3Oqu4dRGukvEy4i0
         7LD2VM46zZcyKHFNkgfafZbXpzpLLTgLLWTrjfmVtmeMy5DV8q63ZYCB7oOW2jM78r4z
         VPM8+wQNOdiZd87FctEamzVGixiyPjS4FVgRjC2l7vcaveDq2xwnHJYmLLSvHc9y64jz
         3WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785482129; x=1786086929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4vCLoMKpG3lKFjbQu+5PS000OH8/vaU8JYyEh3/EP0=;
        b=HzPiEPzMnsqPhkBP4btYaHfajCrH+mBCgMp/9QCj6Uv9TgR5+GNoqlMkRg8Leo6bKs
         FHh9cInKqu4W0waBwzhIUimXvt8Sk1Hgdc8jWUoH99IokOD7GSpBox/xp8biQ1xBFB3V
         0tFYZGzicfApC38jLoRsmbp6BE/FNKTf57Xx7jj47ZXBCFUcnNYrTQCEwLLfOT/S546F
         8kT20rhlLRUVCGEe83mxCQvoJX7EW3VnGhdbERy0sQjgKHsei9LAP6RVUCc6myaQyr1O
         KDIxwlswzfoiWF162zJl0bPw4G4ni7VWaTb7TuQXID6kMqq6On+nbs+Tjt8nFJoSCDLm
         llpg==
X-Forwarded-Encrypted: i=1; AHgh+RoMeXGJdSk8fbBqa2wA2hu5OB8X8uq+exY5zCOqF74sIjvGRIxd3JR+nsbiDA6TZmAc++lLogVlgp04Uwaf7b+dz+7F@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZ8H7PlUAV825RBHZBj37BTZ9OYCQ0q9UMbo7r8xFev71/d9V
	5zfORlX2xwUsT/EACyPM+4mN9+hJ32oqrUNiYDgay+qp2HJATsAWo0d82iggsSIdNmCQoa5f7YT
	B3xicxZNDiNlHtO2gfKtO6Sg1o6D/7A==
X-Gm-Gg: AR+sD10JQw7q8P1W76laiSlHKW4i/RTs0n5trbAAMDkcVzMTQfQVrUuqu4Z6F3ynecs
	0xylO7qAoRaNkf0IAuUeCM8gh5xuOy+WqDi63qEtIXg0J0oA0GrVvw4OFCROdruuLV8fplb8xtT
	b9vSV/AWuOy1is5QAaTfsCDaT73pZgP5MzAEfqzxU32eVEFZYtWDCegqT3ZQBEfOfR5EJCfZ21h
	ujYpfuOCJYvc3IQvv15kSDMjzuGbKK46LjtF06Itofzj6mqsxG2NPkqFtsov4n0M7LiNjGrDlDA
	zcIhLv066LQPAa8YqiKwANsit5nAJIWfkT/kdYf9dEZlQ3qqffvEH6yTOW8dipCFZ5/7dYWkjwy
	+833sHwteUjKF0npqn/Gpz389OQ==
X-Received: by 2002:a05:6808:1a23:b0:492:cdc2:80e0 with SMTP id
 5614622812f47-4ae5ac20fc6mr671212b6e.23.1785482129060; Fri, 31 Jul 2026
 00:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729222920.6490-1-justinyvar@gmail.com> <20260729235125.1698-1-justinyvar@gmail.com>
 <a7c7611d-1721-407d-a4d3-ec096c5e34e2@gmx.de> <CADkD=u565J=YACh5j8WDiB6kxGrr_2zb+9WpOEQbuYEZBrSGgg@mail.gmail.com>
In-Reply-To: <CADkD=u565J=YACh5j8WDiB6kxGrr_2zb+9WpOEQbuYEZBrSGgg@mail.gmail.com>
From: Justin Vargas <justinyvar@gmail.com>
Date: Fri, 31 Jul 2026 03:15:16 -0400
X-Gm-Features: AUfX_mzW1HunjsOGsnSFRzsAKMDZ0IK20qXB3T8KcEy-SuuDGQbQB9tUg252Axs
Message-ID: <CADkD=u7ADLuLrVcHYGFmy=3j1VDVYhx8+dA4YrJcoObtCqzauQ@mail.gmail.com>
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

Happy to. Based on sensors output with predator_v4=3D1 loaded, this machine=
 has
two fans (fan1 and fan2 under acer-isa-0ace), so the quirk would be:

static struct quirk_entry quirk_acer_nitro_anv15_51 =3D {
    .cpu_fans =3D 1,
    .gpu_fans =3D 1,
    .predator_v4 =3D 1,
    .pwm =3D 1,
};

On testing: this laptop runs Windows day to day, and my earlier results cam=
e
from a live USB session, which turns out not to work for loading a self-bui=
lt
module - the live image's kernel and the current repo headers are different
versions. I'm setting up a persistent Linux install on a separate drive so =
I
can build and load a patched module properly, but I've hit some snags there=
.

So it will likely be about a week before I can report back on fan control. =
If
you'd rather not wait, I'm equally happy for the patch to go in as tested w=
ith
&quirk_acer_predator_v4, and to follow up with a separate patch adding the =
fan
fields once I've verified them.

Either way I'll report back with results rather than leaving it open.

Thanks,
Justin

On Thu, Jul 30, 2026 at 10:05=E2=80=AFAM Justin Vargas <justinyvar@gmail.co=
m> wrote:
>
> > can you create a custom quirk entry and check if controlling the CPU/GP=
U fans
> > works? For this you need to fill-in the number of CPU/GPU fans inside s=
truct
> > quirk_entry and set "pwm" to "1".
> >
> > I think fo something like "quirk_acer_predator_ph16_72", just without "=
.tubo =3D 1".
>
> Sure. The machine has two fans - with predator_v4=3D1 loaded, sensors rep=
orts
> fan1 and fan2 under acer-isa-0ace - so I'll use:
>
> static struct quirk_entry quirk_acer_nitro_anv15_51 =3D {
>     .cpu_fans =3D 1,
>     .gpu_fans =3D 1,
>     .predator_v4 =3D 1,
>     .pwm =3D 1,
> };
>
> One note on timing: this laptop runs Windows day to day and I've been tes=
ting
> from a live USB, so I need to set up an environment that can build and lo=
ad a
> patched module on the hardware before I can report back on fan control. T=
hat
> may take me a few days, but I'll follow up with results either way, and s=
end a
> v3 once I can confirm whether PWM control works.
>
> Thanks for the quick review,
> Justin
>
>
> On Thu, Jul 30, 2026 at 5:17=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote=
:
> >
> > Am 30.07.26 um 01:51 schrieb Justin Vargas:
> >
> > > The Acer Nitro ANV15-51 uses the Predator V4 WMI interface for therma=
l
> > > profile handling and hardware monitoring, but has no quirk entry, so
> > > these features are only available when the predator_v4 module paramet=
er
> > > is passed manually.
> > >
> > > Add a quirk entry for this model.
> > >
> > > Note that this machine does not support the turbo thermal profile: it=
s
> > > supported profiles bitmap (misc setting 0x0A) reads 0x53, and writing
> > > PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware. The four
> > > remaining profiles work as expected.
> >
> > Hi,
> >
> > can you create a custom quirk entry and check if controlling the CPU/GP=
U fans
> > works? For this you need to fill-in the number of CPU/GPU fans inside s=
truct quirk_entry
> > and set "pwm" to "1".
> >
> > I think fo something like "quirk_acer_predator_ph16_72", just without "=
.tubo =3D 1".
> >
> > Thanks,
> > Armin Wolf
> >
> > > Assisted-by: Claude:claude-opus-5
> > > Signed-off-by: Justin Vargas <justinyvar@gmail.com>
> > > Tested-by: Justin Vargas <justinyvar@gmail.com>
> > > ---
> > > v2: Add Assisted-by trailer per
> > >      Documentation/process/coding-assistants.rst. No change to the co=
de.
> > >
> > > Tested on an Acer Nitro ANV15-51, BIOS V1.60 (04/08/2026),
> > > kernel 7.0.11-1-cachyos:
> > >
> > >    $ sudo dmidecode -s system-product-name
> > >    Nitro ANV15-51
> > >
> > >    $ sudo modprobe acer_wmi predator_v4=3D1
> > >    $ cat /sys/firmware/acpi/platform_profile_choices
> > >    low-power quiet balanced balanced-performance performance
> > >
> > > Writing low-power, quiet, balanced and balanced-performance all succe=
ed
> > > and audibly change fan behaviour. Writing performance is rejected by =
the
> > > firmware, consistent with the supported profiles bitmap (0x0A) readin=
g
> > > 0x53, i.e. bit 5 (turbo) clear.
> > >
> > > hwmon works: sensors reports acer-isa-0ace with fan1 3024 RPM,
> > > fan2 2685 RPM, temp1 +48.0 C.
> > >
> > > The WMI mechanism was cross-checked on Windows, where NitroSense swit=
ches
> > > profiles via SetGamingMiscSetting with index 0x0B and the same profil=
e
> > > values used by this driver.
> > >
> > > The analysis and patch were produced with AI assistance (see the
> > > Assisted-by trailer); all testing was performed by me on the physical
> > > machine, and I take responsibility for the patch as signed off above.
> > >
> > >   drivers/platform/x86/acer-wmi.c | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> > > index e0eaaefb13d..a7290f85166 100644
> > > --- a/drivers/platform/x86/acer-wmi.c
> > > +++ b/drivers/platform/x86/acer-wmi.c
> > > @@ -662,6 +662,15 @@ static const struct dmi_system_id acer_quirks[] =
__initconst =3D {
> > >               },
> > >               .driver_data =3D &quirk_acer_nitro_an515_58,
> > >       },
> > > +     {
> > > +             .callback =3D dmi_matched,
> > > +             .ident =3D "Acer Nitro ANV15-51",
> > > +             .matches =3D {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
> > > +             },
> > > +             .driver_data =3D &quirk_acer_predator_v4,
> > > +     },
> > >       {
> > >               .callback =3D dmi_matched,
> > >               .ident =3D "Acer Predator PH315-53",

Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D03A9638
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736652; cv=pass; b=C2V5ukas1jT5QZ0IIIL2B/h2dUaXvPsheUG6NANCefhuWr8ETka/nr7TRLjPlw4x8EeTlNejilGVWkju0jTexlpcOqgWz/WAkh7DReTQ14HLYA+1G2FcVBIK1yalA6U986aOXHfMm6m3RZspVaWMuNTx5aihqnHfFbaZOdKPEdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736652; c=relaxed/simple;
	bh=6cZQ88YvMyKDlbojOOX0uUwsznnXAQW99G7QctL7sho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMFJFrqPafj/iG/L/8MyV2A5ijj2XTDWI2nrDWHm3CtTne/chU4DNqm7/YesCn57Fz+m0KmyitwlcOhzbzB1ttsNYtSAR605VH2o+hJaGe+yL/BugH7rDth5WcZ/rwBwcnUpFRw/tBDgx7XqE06gzANpgM66eow4kBl2XrIl5QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=redhHN05; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="redhHN05"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c6560f7a84so22996e0c.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 06:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789736648; cv=none;
        d=google.com; s=arc-20260327;
        b=GOJjscttE35bokpgJEsVqsqHF6JyrKCb7NX54jdct8o4sgljmi3uE4x4PGQz77DhBi
         nXWmXKiBuNHZFC99Qh3UtzxyK8PS1bdzaBwST+RXJcs6+LgocxNSPXqOwKRgikT/O6St
         62YCEEhO+eCwPeFFGI196rlej6fXg7J29Aa5inDtiHqRzNP2uD4CQLCuYs6ezgLKQpD9
         /3+CupPadLWqa1cpgzgcXpI/yyyKgbksvFXiMzLXPzfZLQRyODeTmbftKgqmb/rlXQ+J
         /+h2edUQpIRA6gbDrtDFeby/BFGWKbiLH8UNbRInEEZiMKE5DuK5qlv9u1ijnwwzx6GK
         SNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
        fh=IOCHFuPemuhoP1GPSzAPLSSykY4GpWZphBNwWjSF9WA=;
        b=Kum5wqpKC0o4+gle51BTc4Uq2TcEoI26bBt2O3ljY4KEQrv3YvBAika2BvrBml6iCu
         ofKM4g/u31lRg9N+EdaWfRdeRWqn3lgsEtXoW2+9SCKhQdPh09zjGsdy8a7r27vO9ELG
         s3RnenN1VubB52bZ3y9EECw/FNpqkciY2c9DkVyAYTjJKZbBg+aqnSeyMwEQLCGGA9xu
         I3+bLawaTjLdF5NrIoK+Gcqq/JjvJyuQJOVTQlqTvbd14YEEMf2l3X14+czbLe5Etp3C
         cddUvr30lGw86KAKOxuX5ueLxNI26TGKPrE0rjUxNtOpDmVErHG3JfhB/7cPMrPbBADX
         deuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789736648; x=1790341448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
        b=redhHN0537THjErWIWHtqY0+u9ia3AjlOVAum3WKBMcMF1K+RAtSjeYzdgN/dv+d6C
         XqJcf1T4UhR2nowa5mJ58Vnfraghvk+5Ph71GGBFxY4scJG4wW4Og0cdQ7PNjPzv3F81
         bLrPxffqM0hXVGl9Kfu8vmyNfJsNrCa3xqmmAbACNfJj1Weg0JaCyRuyGKM+YnYtMZ5r
         ktl9tOZ/jGJTdLiQlDSSiEBlmnpJxpKbLpTlsKvxchprs5LYFfXiAdV0Tm0QVYlLlHxh
         aynAD6TttgpZIef/Z4/t1O05Rxkp80ijWzt5pvl0RJlVy+Ub1aM34MdTcJOTWWIhDl30
         U6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736648; x=1790341448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
        b=HMMreCyqf/ukY1R8Be8QnxJrFY4zJ6Wlcwi9rMsxZAC9TpVqvBKT4JMlanF6jsN10K
         4DCwz0Et2nW1Ve3EGIY/q7CLyIkHq8RtKuGphLsS53SJB3LLtFxKKSag/STh3R0AWcxb
         azCcJ/EafnZ0CeXKw7uwz1oek2tF5zRtmpX39XWV6DPcpw6WAZSx4P142YwkE3ubh8hQ
         c6DGVbddnUPMq7XIf2nCTaGvSY1fIfMOjqyG/tBJU5Nprk2nLjS9K1/J+uMgEZU7A+cK
         VjF4JBJaD1nvFqikqByvSYS/0hqwiTnkyo8GwNMqx7HGutzLs+EKIX9T7jHqP2dM59pu
         97hw==
X-Forwarded-Encrypted: i=1; AKwUvBw/o2xGDUVzd3Al4PhD2noS1y6dU81R7L+1NgB8joK48dBVhOm/7mViX5IDJMrmE3T6GYI6aIJM0W0bPD7Vi+lmCMMa@vger.kernel.org
X-Gm-Message-State: AFuF++lr6/QOaPDgQX+6RSYQnq3ngDzSOhuGPz4z+KzwS36h4AFc0ruw
	djLYBM+gegRel4dc0FaoUz2o+AcaBc667Bn9Zwe3bXX9EdxJNzGHKXVi8FiUp1JNaD8PiSq7ZEm
	eTYQWDh03K3vp9cZxZWbWEoBLhrm19W8=
X-Gm-Gg: AYBFou239iCxPe1IdbqRWjP1JMRgxcOOa/U7Jo07GrVde1P5p0UBTyNdUUcIvjrqwdL
	8E8VXfi/mnXAkE0Oj5/ZKf0HebjWtB8+5VWSoNkglNTG3C+BnTsoK3NFKCBi4CRd+mhA+RaTc8p
	BH/8SMaD2Xd+c1c0ArUltmTFZjUMNC3MfD7CBu9ae5eN6ag++1CKm43qx5iw9JwOTqYmwj4qZRC
	2eY/hiARFjl4DSX9GI+efaiCStKaj+PMYiH8vDR5RsicOfvJ8FrpHMr0ApqbAcoq6C8hRmQYqMS
	li7RhYEdb8z5ZJFmfy/s1VxN/FNrKmYJj6RzzBj63lLQgubJSqUOc7N8MPVpsyXa/b+03Z9bfzU
	YmNAJqr2syNdGcKBOVEDpGY5EdDwS4euwC7uqDM7gL6Q=
X-Received: by 2002:a05:6102:5e8b:b0:7a3:2e52:114b with SMTP id
 ada2fe7eead31-7a59dd5f437mr474902137.2.1789736648001; Fri, 18 Sep 2026
 06:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724025959.142826-1-W_Armin@gmx.de> <20260724025959.142826-3-W_Armin@gmx.de>
 <BN9PR12MB514668975E87D570F50B2D91F7A82@BN9PR12MB5146.namprd12.prod.outlook.com>
 <86d0e015-a8f4-4e10-a9b6-a9714d3e0f07@gmx.de> <80c4bb47-936b-976b-6ba8-b366f7a455cf@linux.intel.com>
 <11976ed3784675ad241646287a909286a42675a8@intel.com> <3ef68773-e07e-437a-98fb-a3c5fc08539c@gmx.de>
 <62d7da838e7042df8456e76190db792093065b57@intel.com> <06550473-63c2-4a3e-a5ad-7e23d7b6b050@kernel.org>
 <d696d85c44930d2124054ce11a06d3096c0db04a@intel.com>
In-Reply-To: <d696d85c44930d2124054ce11a06d3096c0db04a@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Sep 2026 09:03:54 -0400
X-Gm-Features: AcwNN1XHNFQcATzjGyaYhKX2aDW9koV5gKbX6KpcatyNovdS0W4jwqBJ2n5fxn8
Message-ID: <CADnq5_PT7s6ixTqDSwe9ai9tUQa04z7UnwhMn7bo7CcsH5Qf0w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ACPI: video: Remove CONFIG_X86 handling from nvidia_wmi_ec_supported()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux@weissschuh.net" <linux@weissschuh.net>, "rafael@kernel.org" <rafael@kernel.org>, 
	"lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, 
	"rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "tursulin@ursulin.net" <tursulin@ursulin.net>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"matthew.brost@intel.com" <matthew.brost@intel.com>, 
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 7:01=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 18 Sep 2026, Hans de Goede <hansg@kernel.org> wrote:
> > Hi,
> >
> > On 16-Sep-26 09:16, Jani Nikula wrote:
> >> On Wed, 16 Sep 2026, Armin Wolf <W_Armin@gmx.de> wrote:
> >>> Am 15.09.26 um 14:31 schrieb Jani Nikula:
> >>>
> >>>> On Tue, 15 Sep 2026, Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.c=
om> wrote:
> >>>>> GPU people heads up!!
> >>>>>
> >>>>> On Wed, 2 Sep 2026, Armin Wolf wrote:
> >>>>>
> >>>>>> Am 01.09.26 um 23:30 schrieb Deucher, Alexander:
> >>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> index 12e4a41bf1f0..50305630f533 100644
> >>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> @@ -30,9 +30,7 @@ config DRM_AMDGPU
> >>>>>>>>         # ACPI_VIDEO's dependencies must also be selected.
> >>>>>>>>         select INPUT if ACPI
> >>>>>>>>         select ACPI_VIDEO if ACPI
> >>>>>>>> -     # On x86 ACPI_VIDEO also needs ACPI_WMI
> >>>>>>>> -     select X86_PLATFORM_DEVICES if ACPI && X86
> >>>>>>> The change below makes sense, but this one looks like it should r=
emain
> >>>>>>> unless X86_PLATFORM_DEVICES is handled some other way?
> >>>>>>>
> >>>>>>> Alex
> >>>>>> AFAIK the dependency on X86_PLATFORM_DEVICES was only necessary be=
cause
> >>>>>> ACPI-WMI depended on it in the past.
> >>>>>> By now ACPI-WMI neither depends on X86_PLATFORM_DEVICES or X86 any=
more.
> >>>>> Hi all,
> >>>>>
> >>>>> Could more GPU people besides Alex take a look on this. I'd want to=
 make
> >>>>> progress with this series within this cycle but would prefer to hav=
e Acks
> >>>>> from GPU side.
> >>>> I share the same concern with Alex. It seems to me we could now end =
up
> >>>> with x86 configurations without X86_PLATFORM_DEVICES, which handle
> >>>> e.g. backlight on a lot of platforms.
> >>>>
> >>>> I think the safer option might be to go for:
> >>>>
> >>>>    depends on X86_PLATFORM_DEVICES || !X86
> >>>>
> >>>> in all of the cases that select/depend on X86_PLATFORM_DEVICES in dr=
m.
> >>>>
> >>>> The alternative is to find out, and handle the fallout, if any.
> >>>>
> >>>>
> >>>> BR,
> >>>> Jani.
> >>>
> >>> Alright, should i leave the original "select X86_PLATFORM_DEVICES if =
..." statements
> >>> as-is or should is change them to "depends on X86_PLATFORM_DEVICES ||=
 !X86" everywhere?
> >>
> >> There are some places that depends on X86_PLATFORM_DEVICES. I think it=
's
> >> almost always a mistake to have some places select and some places
> >> depends on, and select should anyway be used with care. I'd go for
> >> depends on.
> >
> > I'm a bit late to the party here, sorry.
> >
> > Note that X86_PLATFORM_DEVICES is an option which enables / disables
> > a menu and does nothing more.
> >
> > Enabling it or depending on it by itself does nothing.
> >
> > The select used to be there since it must be selected to be able
> > to select ACPI_WMI (which is no longer the case after this series).
> >
> > To depends on in XE was probably copy pasted from the existing
> > select-s and then changed to a depends and already was a completely
> > no-op since depending on ACPI_WMI was enough as that itself
> > dependend on ACPI_WMI.
> >
> > As for X86_PLATFORM_DEVICES being needed for some backlight
> > interfaces, depending on it by itself does not result in those
> > interfaces being there. That requires enabling the actual drivers
> > providing those interfaces.
> >
> > And I don't think that the GPU drivers should start depending
> > on those since that will become very unyielding.
> >
> > TL;DR: I believe Armin's original patch is fine and this is
> > a welcome cleanup / simplification of the DRM drivers Kconfig
> > bits.
>
> Your explanation makes sense, thanks.

Yeah, sounds good.  Thanks!

Alex

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel

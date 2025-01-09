Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1036217652;
	Thu,  9 Jan 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421054; cv=none; b=WoGqwrUq/fCvEpTu1Cfu3JKkHLPilyrGa4W/Nq9XEMHz+Pv3nmjigd4gu7scKOoy+WiYXj/ZLKxHrB74UyN2V8jPuZKXc2VYHkxb47aFSd9908lanFRkC6N6wF6fOS7zSQR2HCzWDJdR9hb7BmvYXVgZBYYrKZ4eWNPEEPpe62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421054; c=relaxed/simple;
	bh=Ys+fvP3J2W5FqDT7DhBS+zFgdM8DJqVtIfAszWex2Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dnq7U6YkPKnWwONJ7nRt3ufMSFD6ZTMD9VNRBpGniibudeExp0MsK2ck7i1hRN0kmbuAcPMDNkqGUxCpSJaK9DM4RL+MEcPgHjPszZ0qhSKGxPfbo9XiPIGfbrdqfGty0Tj4uMideItF9fkk3xfLUs54KXmWyrzOXiCMmWd3ZVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQ5feePO; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQ5feePO"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so1385153a91.0;
        Thu, 09 Jan 2025 03:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736421052; x=1737025852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xg/Ko4xsOQPI/N7BrM/ObGy7VyovnjDWXj6p3kcuuuM=;
        b=mQ5feePO5IoyGiYoDYzixBTj55tjL4FmDdpZDNZiRNGzzFvX9xb6PGqb9OJWDPmmYa
         mgfwloqRJSHt5kGNp2+IEyMUvQ28gwHj42r5ny7EvXDy9c3iPIAU0PnoUoy5w+6A8gDy
         4Dpwcms8eeEs6RSDhbtcV1VaTkuj5lXxZre+nqTS504+i2TLVSRvjLv2oTr8hGpwoJXD
         M+TjmSLpjf39JX2SAr+ys4Mx0RrkhyzPnUufYAB9xXyxKXCCbax9SoCteL3hBdcdUn1a
         fW2bygRUygzyLVn3p2Oork/vW0HEXXhGCn4TD6KnfyD+xN+uI7p8l7kp3oTwrbGUWfmR
         K4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421052; x=1737025852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xg/Ko4xsOQPI/N7BrM/ObGy7VyovnjDWXj6p3kcuuuM=;
        b=KPQGx5ZChOXDI56Ujbw3huhXnfpzCmGNMhsZFEas+AzGE+TvXBV8SAUAwP2WZfZMYr
         5XdcLFgIXiBQN1EX18kVTYt4mCEaq3zlq9IGPwl8ncOW7N94ccBNfnh9aiQGlmVSkavD
         eujGBW/wkrvn0c1AGySKC2pmDIYNj9ZtcDWheYtRrcaCfrksWfXlTpb2dNfXRTR+IFiQ
         q2ugLPxupPs7cJGnYgQ+Awa1C2SV69NzC+00ZzNo/yc5SynTYxCW1byiCGFhnTLd4VOQ
         OSNfwjeCD1CKlqxi0mxiUxSVgjKhrQQV2qrPYP19gwZijnVCpm5YHF4LrCA5i7NpjwiD
         AAsg==
X-Forwarded-Encrypted: i=1; AJvYcCVZaj84qsmL7iDn+a8Ptj2XRL7J28UdvunDMsw9Wng5aMlmuMJFdIoEjVdzIldESjo9JElAEJn6rssHQIsTIVCT41DIew==@vger.kernel.org, AJvYcCWnOBGOWl6TavL/rqBwMrYysG6GN1NLFtbXpHj72UG1iyQTsqCu7Ganhk5W3drmr6B0PXcfjNqv2GhFH9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYToIgvZ0vZ6aDFP89q07zojoSvFmPfEP5plXrlTU1tHo7xSJ3
	CkJKndlK/JCXNBSIFttggb2ch8i5Zxk9yO1+5AaQ+oYz4YbiSoRZMVa4VqU2fKXi8tYkIV5KRqu
	AP8lee7YlOhrrJ7jTp4ecFK3llzw=
X-Gm-Gg: ASbGnctXUCjVWNcNBunWUWBoLyp1QiOXCSyYL4ot81oLGrn40+Z1crdmjM/AzBmn+G2
	BxEpqlxwxv9Aj9dROpcZi7phT+ldk83/m1Y0CHLeis1k63XBmSCc4QWZpkL+xriKCCfnk/Zay
X-Google-Smtp-Source: AGHT+IF77mzi6RjQnW/hMuDE012m0u2a9M5AANAYZSi2yxU3zgm3WjMgvYbqsATfsGOqG8uSlkDBU0bejdn1Deru24E=
X-Received: by 2002:a17:90b:3a10:b0:2ee:f1e3:fd21 with SMTP id
 98e67ed59e1d1-2f5490c20f3mr9130141a91.25.1736421051893; Thu, 09 Jan 2025
 03:10:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
 <20250108-platform_profile-v3-4-ec3658d9be9c@gmail.com> <ntiwr3bxaf66eqe7upu2qk3wwkemqo5qft76g2ybqydbs7qqjv@2vyn36qayp6o>
In-Reply-To: <ntiwr3bxaf66eqe7upu2qk3wwkemqo5qft76g2ybqydbs7qqjv@2vyn36qayp6o>
From: Hridesh MG <hridesh699@gmail.com>
Date: Thu, 9 Jan 2025 16:40:14 +0530
X-Gm-Features: AbW1kvbiM5XzcW0KPnn3TW-UT2Bnfj5FBnpycRyWwXuEk0Qx36pgH-R7h9GSzB0
Message-ID: <CALiyAon=Ba37S2se92ckbOSTk6D5O6oykpHUbC_n64Gqy95pcg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 7:21=E2=80=AFPM Kurt Borja <kuurtb@gmail.com> wrote:
>
> On Wed, Jan 08, 2025 at 02:15:26PM +0530, Hridesh MG wrote:
> > Currently the choices for the platform profile are hardcoded. There is
> > an ACPI bitmap accessible via WMI that specifies the supported profiles=
,
> > use this bitmap to dynamically set the choices for the platform profile=
.
> >
> > Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8e=
bf-8c162b339ade@gmx.de/
> > Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> > ---
> >  drivers/platform/x86/acer-wmi.c | 55 +++++++++++++++++++++++++++++----=
--------
> >  1 file changed, 39 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
> > index 7968fe21507b1cf28fdc575139057c795e6a873b..6c98c1bb3bdce6a7c6559f6=
da4ff3c6ce56b60e3 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -33,6 +33,7 @@
> >  #include <linux/units.h>
> >  #include <linux/unaligned.h>
> >  #include <linux/bitfield.h>
> > +#include <linux/bitmap.h>
> >
> >  MODULE_AUTHOR("Carlos Corbacho");
> >  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> > @@ -127,6 +128,7 @@ enum acer_wmi_predator_v4_oc {
> >  enum acer_wmi_gaming_misc_setting {
> >       ACER_WMID_MISC_SETTING_OC_1                     =3D 0x0005,
> >       ACER_WMID_MISC_SETTING_OC_2                     =3D 0x0007,
> > +     ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES       =3D 0x000A,
> >       ACER_WMID_MISC_SETTING_PLATFORM_PROFILE         =3D 0x000B,
> >  };
> >
> > @@ -1957,7 +1959,7 @@ static int
> >  acer_predator_v4_platform_profile_set(struct platform_profile_handler =
*pprof,
> >                                     enum platform_profile_option profil=
e)
> >  {
> > -     int err, tp;
> > +     int max_perf, err, tp;
> >
> >       switch (profile) {
> >       case PLATFORM_PROFILE_PERFORMANCE:
> > @@ -1983,7 +1985,10 @@ acer_predator_v4_platform_profile_set(struct pla=
tform_profile_handler *pprof,
> >       if (err)
> >               return err;
> >
> > -     if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> > +     max_perf =3D find_last_bit(platform_profile_handler.choices,
> > +                              PLATFORM_PROFILE_LAST);
> > +
> > +     if (tp !=3D max_perf)
>
> You can't directly compare `tp` and `max_perf`. ACER_PREDATOR_V4 values
> may not match PLATFORM_PROFILE ones.
>
> It does in the case of PERFORMANCE and TURBO, but it does not in the
> case of QUIET and BALANCED.
>
> I suggest you store the actual ACER_PREDATOR_V4 max_perf when setting up
> the platform_profile.
Ah this was quite a stupid mistake. I'm not sure why I even assumed
both were equivalent. I have one doubt though, if i set it during
profile setup, the code becomes quite verbose -

        /* Iterate through supported profiles in order of increasing
performance */
        if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO,
&supported_profiles)) {
            set_bit(PLATFORM_PROFILE_LOW_POWER,
                platform_profile_handler.choices);
            max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
        }

        if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET,
&supported_profiles)) {
            set_bit(PLATFORM_PROFILE_QUIET,
                platform_profile_handler.choices);
            max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
        }

        if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED,
&supported_profiles)) {
            set_bit(PLATFORM_PROFILE_BALANCED,
                platform_profile_handler.choices);
            max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
        }

        if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE,
&supported_profiles)) {
            set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
                platform_profile_handler.choices);
            max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
        }

        if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO,
&supported_profiles)) {
            set_bit(PLATFORM_PROFILE_PERFORMANCE,
                platform_profile_handler.choices);
            max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
        }

Is this fine? Maybe for readability's sake, I could lift it up into a
different function, like what you did in the RFC patch. Btw, thanks a lot
for the detailed reviews so far=E2=80=94they=E2=80=99ve been very helpful!

--
Thanks,
Hridesh MG

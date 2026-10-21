Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792553193;
	b=wK83r+r1KHSpYPAKTE8GGTHuGT8MIZpAtDeXz3J1z8BqJ8GuXDLTToAkgf57FNirJlO1
	 YIzw1gpSv3bINlTjy6Ohp6CyDqIKAm98LSFUo+GTkNjbag6oHgApFdU5EPfWFXTR7LGLv
	 ytEl2imiSNbb3WJSizdAqtFvKJ/gJs7B12yM1VRYTbfKQW3OtcnVlQ0+yJeBaFftW9Dnj
	 8q/cmCDFJObeoWddgFroIxgXL64kg+ENfVwo32jEP3PkESCUNFWRW7HCJEc60iZ51W7XG
	 JJJKxGyKpBZlvHeqScBFroCRpwQKM+3ngLLJw2l9BZiP7qA+KhtIc3oW9HSTwxlDUwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
	b=dFrGF8cvDrznkkTFkdYX2X56iwNGuT9o/q9dR5hvFGjtUftJndcPNTrmoOW/Qd/MqVaY
	 e5TKsDhb5KdqpfCTgyqHB2335owBQJqZCTTYYJKmUVeheFAXnYdQSRYhYJIbD26hLFuL+
	 FhI/RlPoqDxw9XjxyRHSyPEmCHe8lL0P1xlvYA4lRJu2jvaxlqGaGxzvkP77AHXPCOnAF
	 21bFj6T9yzZTGtpyHNVHSaADJNrHUg8qjyG0JRs+JP7khN+nw5NSOHfNfEkybYOkpYvk+
	 +sxRoEqeDJKNRb6+Bj5Gn9b6HBOYsoiLR6qBuLsLcA8wbsR19F3sqibIfbK0N6MOrIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lOcwEeEx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0B6071548
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 03:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D0B6071548
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lOcwEeEx
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8b20a899fso1324395ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 20:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792553193; cv=none;
        d=google.com; s=arc-20260327;
        b=hF+4hMWrIQFtIX243yVDbXWm8FNg3KgXsSvTff2Rb50gNyOG2ryzIRgkU7FIM+jbeG
         NN2Cru3bTvHv4f1sRdvL2ihk57gIAEb0yl+n/h/LqLNGHgqFsmB6Hud4GZ3Nmk3hd+Gd
         X1QAf96E7ZtJbpGEU3QRIIHUogXH8kXr2kYkIlMRobsybYh3V7mQAZN+gYzxHwzeY2wO
         axSEp0eDvs8htgGMCTj3N115NjXnjm0I0vDOuBiFSmseaKXyyCpPl0FH1ribhiq3YkqE
         iC3unNQaPWWZdJk6bO6E/h1CHCD07YA6PDeEHgD+KrFJcVTI12VsvWrCxOZgzTIvUzTH
         j69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        fh=mtjbW37uzELAFm3qIRiiEuxw8VM3diL4kViiIucwmj0=;
        b=MuDE2FozM1OKMIjRkWpGseRlOcidR6IqQNovgtJbn6rfC7O/LPAz6XXSxRT7CDVOv2
         rg/8eUEWmYLvsDaHsygWw3IfHFCnNiu+yw43fvDwL5TsfPHghK+IAszl6F2SLY2XxklT
         WO7qYGyGwEJP5koW07RlzCI8cdHZO/Ozd95GeXsdkOrKU5K/7ALWH+XAjiAiTmI+loVe
         J3rVetknJSsSj/f10p26aMbFjbDS2r6zWkp/d0ZLGznnP57c+lz6GSqujjiLeWvUIYYE
         bQUJa+9pyp5DzD0wRBikVZI213BUfCRSEp2ptiOshqq3RPsuTnBtWxbbHjl5dw1De3kf
         SBgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792553193; x=1793157993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        b=lOcwEeExZVAEIy9usLkBIV4yuk0sku3m9Y82hmVTKbhLuOlYNdNr17teoxDu7qO6jB
         vncGvDKOBjWc5ulwevD8mnmYQ2x8K8t0rq2y6zLbe6kYaiiWMJPeraxA7reUgy6xVaDv
         xeItrhLgGBJE7C6Poj6JHlXIoHybbwYTvWcdf4HP/SNJcyz57TyuM6+JeAMxLfg6TZ/w
         zCy82mTslfSCqC3LlbnLdYIshuKwVFTmvLlY3v39amL7q2aJ+XR54vm1Vi6ctJd8rlFU
         G/zqjdmmL4cK/C03NQ1yAR+lNgSDdkNIQHHLbQ2JSbviH5oApWaqCfRw2CssNQLoR+Qo
         om0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553193; x=1793157993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        b=vwrn03Vrf2ao3jShKNKlgnD3/hQ9bSEoHTAr9hZmbMytJivGCCgGKU0co3cXtBDeeU
         cnMZVyjedmAZKoM//z4HyYyFIxynveWQQ7VJ0rABPuD4aXPWfAYTveU/l8BRWLMQ30KF
         z3q/j5Tn84ojZM9yWNoyTWmDZ/AS4uyVOIfsKI2sM4XJF0KX3ugIFMA3BMGgugsGq8vT
         igOkq2aFKIgFq1hq7T7GAp1yDYOZep1GNv3IzBP5kpuYu0DPG+fRQnHzFTNBIajWAlT1
         eUO00tCsdp4lkyjEDZ4f7LU8ebMyb4D8r2usYT+KU4W3dvrH35ndDj+SF/Ar7HsRIJIF
         cmAQ==
X-Forwarded-Encrypted: i=1; AKwUvByMPN/K7aXPQDJGKZMtbTHusYaT7XeWkre6hYi+Ysviahp+Hrdr04bTiIrH12WtfKVzaXqshY+IdkJAoM9Y1FMdvaUw@vger.kernel.org
X-Gm-Message-State: AFq9FYJVY4bjUrux8A2J/EK8nBxcj1Z9/rakip14kq6yapbkFicouwO9
	tIdWLjvkULteVCyWuZaDo7lhTsmWiW615oLhgBJ5A98FCh+CDLm7k+z5OJ+GMQ6bB9lJpxI1QFN
	ONrCI+g0ltaed39//iP1Yi3xRkMN15pE=
X-Gm-Gg: AYBFou0FUxWKdSYtYbGt25CLHy7SvbG6OUqHRRzEbPSxZEpKxJyEINVlioAkxe9xPjY
	ubOs5YOLznIIUqHcdo0Euje5xAbOWHDVm/U/KeaUW5v448JowAl2yMpe/+g6Oj49qnmzbyT7QSo
	H9P0MSiHo3oOkruhYYAr9Mypoarm5GCiUvWq+MGOH6urqqgmSW0gbm4gEnfQH9eh6dE36OTJRXP
	qpt1UEqaYMUsaP4GTAg3o0cE8QQ17jXfSPVWk8jbUF5Y4b6Rdapnft4BTFO08ngFzMCXh4d6zz/
	A99M/LeFkyTjXSJRolGHmvlcdBjcpB2bQ5FujMgzqzcAC5LeNI6zyWMFv75GHpWchBIeYP4qIuW
	nUFLWM51LhqmkUhsFIug1naNT9pmEeLak8jMQzpqdVSPDimanlpXn0T2C2BEeGSG/FpC+p6I=
X-Received: by 2002:a17:902:e74a:b0:2df:4dc5:e12e with SMTP id
 d9443c01a7336-2ea43d88783mr5847285ad.27.1792553192737; Tue, 20 Oct 2026
 20:26:32 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev> <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com> <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net> <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
In-Reply-To: <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 20 Oct 2026 20:26:20 -0700
X-Gm-Features: AclHuK8Xs091-vKVT7bOvhDjoq3_nWge5aBpQnq0586E9aA_45l3eZeGSIpucN0
Message-ID: <CAFqHKTmQ2R-UAP9rAZzoxe=p-T1_JKPU1NaQ2ijrVg0RXZEHUA@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	W_Armin@gmx.de, corbet@lwn.net, jdelvare@suse.com, kuurtb@gmail.com, 
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:53=E2=80=AFPM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:
>
> On Tue, 18 Aug 2026 at 17:26, Antheas Kapenekakis <lkml@antheas.dev> wrot=
e:
> >
> > On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
> > > > On Mon, 3 Aug 2026, Derek J. Clark wrote:
> > > >
> > > >> The ML patch set uses a guard within a switch case that violates c=
leanup
> > > >> rules. Move the guard outside the switch so all return paths are c=
overed.
> > > >>
> > > >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > >> ---
> > > >>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
> > > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/pla=
tform/x86/msi-wmi-platform.c
> > > >> index dfb65ac8fbf6..33acd448f674 100644
> > > >> --- a/drivers/platform/x86/msi-wmi-platform.c
> > > >> +++ b/drivers/platform/x86/msi-wmi-platform.c
> > > >> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct dev=
ice *dev, enum hwmon_sensor_types ty
> > > >>      u8 buffer[32] =3D { };
> > > >>      int ret;
> > > >>
> > > >> +    guard(mutex)(&data->wmi_lock);
> > > >>      switch (type) {
> > > >>      case hwmon_pwm:
> > > >>              switch (attr) {
> > > >>              case hwmon_pwm_enable:
> > > >> -                    guard(mutex)(&data->wmi_lock);
> > > >
> > > > While I cannot see the code easily, one could also add braces to in=
side
> > > > the case to avoid this problem.
> > > >
> > >
> > > I don't see the code either, but wouldn't this be a use case for
> > > scoped_guard() ?
> >
> > Hi, not explicitly stated in the cover letter, but this is essentially
> > a series on top of the series I sent last year but I did not clean up
> > due to a variety of issues with MSI firmware that would have made the
> > driver unsuitable for upstreaming (to my standards at least). These
> > issues span Intel driver problems, HID controller instability, and
> > varying WMI implementations esp. in regards to PLx setting between AMD
> > / Intel variants, shift mode behavior not acting correctly, and fan
> > curve application / resetting being weird (the fan curve on off bit
> > does not seem to change whether an automatic curve is used but how
> > close the device alings to the set curve? requiring us to back up and
> > restore the original curve? half of the devices keep the curve during
> > sleep and half don't? but if the fan curve is so finicky do we really
> > want a resume handler for it? Perhaps we can kick the timing quirks to
> > userspace)
> >
> > For this reason, I focused on other manufacturers such as Ayaneo and
> > OneXPlayer. I will revisit this series per request from Derek as he
> > seems to want this for steamos and hid-msi is already queued for 7.3?
> > Although, to be honest, compared to the controller firmware issues,
> > the WMI implementation is pristine.
> >
> > So I will need to go through these issues 1 by 1 and see which can be
> > fixed and either drop certain features in the beginning.
> >
> > Particularly for the fan curves, if we say that resume handlers are
> > required to be in the kernel moving forward, I do not know how
> > realistic it is to make those reliable for this WMI device family.
>
> This driver still needs work. I am getting bug reports about
> inconsistent TDP application on the EX. A8 is broken as well. Even
> with your patches Derek. I need to grab a new version of center M and
> see what they are doing.
>
> Does this driver work in your experience? What is that SMT toggle you add=
ed

I've got a few reports of some issues, but nothing with much detail. I
have the 8 AI+, 8 EX AI+, and A8 in hand and all three had effective
TDP changes in SteamOS with these patches applied and SteamOS Manager.
I haven't done extensive testing over multiple suspends or longer
sessions myself. I'm also not aware if there have been BIOS updates
since my testing.

By SMT toggle i think you mean the STAPM toggle for the A8? It was
referenced in API_UserScenario.dll (setPowerLimit_AMDSTAMP) which I
reviewed using ILSpy. After toggling that TDP started reporting
correctly and being settable.

Hope this helps. LMK if you need anything tested or additional info.

Thanks,
Derek
> Antheas
>
> > Best,
> > Antheas
> >
> >
> > > Guenter
> > >
> > > >>
> > > >>                      buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_=
MODE;
> > > >>                      ret =3D msi_wmi_platform_query_unlocked(
> > > >>
> > > >
> > >
> > >
>

Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA464B204A
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444075; cv=pass; b=H1yByoM89hNgz5Cli0eZaC5aJfasH+2MIayux1DsN/lF9ndsfZIg5GxmZ0DDa92+rdtexo0BFC0MXUMPwVd9/JrFKz5+8tnXXD8SM2q8ixqRLBxx7ZuaVogbTO732y0r0WFf98CGcxE2F76KQVL78rnRlJxtgQpe85IAG5xO3d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444075; c=relaxed/simple;
	bh=W/ZhzYyuVms2wSvCuj+zW2Oqgu5ZoLzyqaYyoEnm/KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+EFrZA0NFTeQKaDp/11JEFz4PH32yUWz5kxjpK7sxUTkTRVfrwHVTZCLPsmYD7XjULAOFCylDcdx/MvjSQQaddH61/Ek6bJypS55xSIn3fD/qAxjpJrYPI5Yd4+1MZO9uDUZWFQtdsi4tGbenZ+UtnSm+JAEzLtopFPHoB/k8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaHIehkY; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaHIehkY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15e2dab83eso107197666b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Sep 2026 07:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788444065; cv=none;
        d=google.com; s=arc-20260327;
        b=mU0PYYV9r2kxtxKljZS/X8G53HzspSi2IyIqG3EC0EQlr6UsCZZwB+kWaRvB661fsH
         w0rkCxinOWY+q2sagfYiPdeSECmR9vyfV5uQMaF2c9lnpjnMVw93+uw7nHEk9d2vFtab
         iQK1BFCHSrMJxBmC/jfydH3oSVtnJpRv5x2dG2A+fLm1aedy0W8MyFoMCSBi3Oek39yl
         PZLsJPF0yi8FvHxOrtrbwyXRja2hohISe9z0CiHTy4Lb4OSw5xT6lZQSiOyJsGE8AYq9
         9QdKJPeVxqG73BDcTlxpeDhOaKye+BebP8iSKAZAtxuF18QneZ5frsLjTtyJP40f054Y
         G93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o7o2saOOdNbey7P8OnQtW1dHvAKknp6TT0oyR0mR9C0=;
        fh=kh9Re3d9FWgH06/zxiaI2HFxPpBwxojub8wORknsthY=;
        b=eKvPaQ7rewfyHMGUf041Efr0h0eWH/iEmudqO/XCo5kh0sAkeWFvDbMWqMYz67zDnR
         fXYfJhEBtnfW/Di5rnuHmFm5mW54yy13Me6Gh0bJYdGRcs18KWgYF7RwhHdW6UUAsfVL
         TuI31EgDGyCU1ynPsI/5WfKYCmujn5VYUCKUyNh8QhgdXiwJdjswWn/Flx+uRfQJ5Py1
         44HAcV8EpOURdvdh7+3wbnBv0VkUpQ9b90atVME2zD/bcJDrDSp5rN5KG54gDMjYs5HG
         NDnSXNrj/KRtZFn1tzc6oRyoyOYaJIdxG2Wu51JcQTBh/tTqkm1BrDfTXFcSmKQXI7Re
         3IWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788444065; x=1789048865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o7o2saOOdNbey7P8OnQtW1dHvAKknp6TT0oyR0mR9C0=;
        b=CaHIehkYBVU3F4NVcMelqG9bkOH6YD8y4KiwfHW+yDR5TROAMH7naiLZiZa+AIzzIq
         rbsZyfBtsSCFYcIy5w/iq17X+fasmYALTuwMKoZxxAq6TbElz8ji7WYXUH4nOPVtdGUI
         BW43Y8q67P8jKEE+/K2MWlptPCemBVNWsCBsb7bn/E2QH+wUS3ZGVWjrzXS22D0P1nw4
         0pOrCKKED4Y1lTNVCm4vqyRd4npPFRLgJeYZ1SI28GfmcTDRxPSmB3M5aHp+ProudAOd
         6z1/MZhkLsIsdWFAVL74NkIEhpJ29LUqQqkUyl3+g5KfF4yq0dB1jTZqjPQ6j4AtoFz6
         6MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444065; x=1789048865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7o2saOOdNbey7P8OnQtW1dHvAKknp6TT0oyR0mR9C0=;
        b=sDn1ZWjdj7oi8/10O2tvrCFf62l0396xVcvh3ssqAiXKc/B2KCCqfeeUNA/dlpdCmH
         498lQwGLJldt9kMHYmebfcZz76voUOWq/yP2lgOpbH4N6sw2y78ocTLTq9jwDU+OZiSt
         0DbasHAAgVwpKZPjvgPjuedKZmav7Z9GJhjn3x/rd3aURSXTpYDjQp7qYzvEbdfGKRwB
         HAxb48neHzHNAVQLzNIg+KUNnP8sY45EYOfH8VxUuvn46jXyWJ+yEIIwnDr56KjHw6C+
         ueKyktJJGmm2gDIUOOygxKJCMmxk1k17Iz4Vs4WhBMGjvu8SY36SeACDMOhmIzj6e8Fe
         xGQA==
X-Forwarded-Encrypted: i=1; AKwUvBzpcLnvLc5qNz8VviquOeUC3IWDespLddqckre9wMzsXAhz2xzgeRt5NJ9uYc7xvls/SB+OkJXvtcZ8lTE6mV3fDD3O@vger.kernel.org
X-Gm-Message-State: AFuF++l+YnnY+a7ENZQp40m5WZ5VYN8n6N6VYXTTlVGDrgITZJrZYLNJ
	1Zw9w8DZBeqUk1iRHaVk6u4LBvMN4snSNWBEG49yLLX8Zn6p05ZW6QDsFvnZRDYH//aUd5pvBuu
	V6+I/tDT/z/aOWGjPFRTBv47VmWpN+NA=
X-Gm-Gg: AYBFou0d96hPpFQkU6C21f5E7qrS71ACv+Elge88sZ0n12BmbArVf9YRIh2EQXvcit9
	ruuOz95n4ws0Cn2LUCVJW4HYnmPhHsWAGkWBJej6hX55dDSXXXy11TW+PI1AKqKaZ7W8CGkPEKa
	RCZkiO2kaE+gIDKa5s6XN1VSjHJ9fVlGr+EiXnfnHZU7FPV2tJqHVlw7QBvdzLvoSGIbNUeGyuq
	mSC/tIlqBovUfU3FnlwnsWKfPzTQzFZPU92okILbxGI7dtE2X8/mGT0mDOxy5iyCSvr3y87a08f
	U10G0a6Xy+E5r6vYJVTr5BBAEo3w5r7a/Jf4JHQl8blA4eVn+kS3k/mAxNPfiXWTa3h38MrRscf
	eh4CELZGHhV9RXY4/FGdgiqEi6xBviSbPwh+S9MxYH/sdom4OX1fZ++I/8Q8Y1tyntlHYG+pELK
	yZpuwV0xg//cTjqIsCvBkkVJZDYi6byg==
X-Received: by 2002:a17:906:8e0e:b0:c25:c651:fa70 with SMTP id
 a640c23a62f3a-c260474e8dfmr39283966b.13.1788444055893; Thu, 03 Sep 2026
 07:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081557.16603-1-germanpapulindez@gmail.com> <apkvE9kbfEWHrAte@kekkonen.localdomain>
In-Reply-To: <apkvE9kbfEWHrAte@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Sep 2026 17:00:18 +0300
X-Gm-Features: AcwNN1XMsw-TkkISsHavguNAtNCU7_fOI4nrPd6B4gIR-w9TMT3OopwVlR-oBR0
Message-ID: <CAHp75Vco84AK9mU_HH8oubsVOmErB3utsTcoQpqtB0EG8KFAOQ@mail.gmail.com>
Subject: Re: [BUG] platform/x86: int3472/discrete: unknown GPIO type 0x08
 breaks OV13858 rear camera on Surface Pro 11/12 Business (INT3472:00 / OVTID858)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: German <germanpapulindez@gmail.com>, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:26=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Thu, Sep 03, 2026 at 10:15:56AM +0200, German wrote:

> > On the Microsoft Surface Pro 11/12 Business (Intel Lunar Lake, IPU7),
> > the rear camera sensor (ov13858, ACPI HID OVTID858) fails to probe.
> > I've traced the root cause to int3472-discrete not recognizing one of
> > the GPIO types described in the device's ACPI _DSM data, which leaves
> > a power/reset-related GPIO unconfigured and the sensor unable to
> > respond over I2C.
> >
> > System
> > ------
> > - Surface Pro for Business 11th Edition with Intel (Intel Lunar Lake, I=
PU7)
> > - Kernel: 7.2.2 (Arch Linux, vanilla)
>
> It's usually best to test with linux-next, not with distro kernels, or in
> this case, the media committers tree
> <URL:https://gitlab.freedesktop.org/linux-media/media-committers> next
> branch.
>
> > - CONFIG_VIDEO_OV13858=3Dm
> >
> > Evidence
> > --------
> >
> >   $ dmesg | grep -iE "int3472|OVTID858"
> >   [    5.555231] int3472-discrete INT3472:00: GPIO type 0x08 unknown; t=
he sensor may not work
> >   [    5.788882] ov13858 i2c-OVTID858:00: failed to find sensor: -5
> >   [    5.789321] ov13858 i2c-OVTID858:00: probe with driver ov13858 fai=
led with error -5
> >
> > The "GPIO type 0x08 unknown" warning comes from the default case in
> > skl_int3472_handle_gpio_resources() in drivers/platform/x86/intel/
> > int3472/discrete.c:
> >
> >     default:
> >         dev_warn(int3472->dev,
> >                  "GPIO type 0x%02x unknown; the sensor may not work\n",
> >                  type);
> >         ret =3D 1;
> >         break;
>
> This should be addressed by commit 34e31390a3b939db2e0cbfef4c40d95052572d=
f0
> .

I can't see that commit in many trees from kernel.org nor in
media.git. So, you mean it *will* be in Linux Next soon.

--=20
With Best Regards,
Andy Shevchenko

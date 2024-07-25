Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623D14687
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721867827; cv=none; b=DV1ya+zlzfyUIlC3BSOk4mbdsGiCcPBgR9B5CtudOLa+RCwPwqPTpe5tAEVTKlccXsFNaHxnzQENEIabKIzzu6M4BLdF2Dvczofm3rbA59RoQTxb+fycSrw9dKRAc/frwCQrx1dcn6Y73qHkYEy/t5CuZbm2D+8Zl36xsh9gFjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721867827; c=relaxed/simple;
	bh=2lRLrFFrV60S0eQxkJVml+jlR2q9iwkEtdYQHbZdq4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX4xBY7WjOg0kV9CtHUp05MHJxlRRdBjeCIKNWKc3CaElq0vOT0K941r2UMp20Yf2NqpBv33yWiGPBwXLdwUOYTH1yJuHCdS4Lb3C8kME6gg2PAqtZgvdMFrp8n9sXz39JdJo5plJ5SGDZbrv3Ic5yFfWExP+RmuUaHVSREX6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/dxWkaA; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/dxWkaA"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4f50dd3eab9so139872e0c.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jul 2024 17:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721867825; x=1722472625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXjE3WlGUWuPAZCd3nABcDzyRWf56VWlG8GIFIIMSzk=;
        b=V/dxWkaAto5oGLANF7Old1xs9EM4v5/3HBIArDzisDPjZ5eZ00k/xZjIB1hpYdb3Fj
         MuC26GlEH1673RwK0xh0cdbus/SHZlzljCL4jJiKJZG4S6igoVHyOC1cmILvHeDQ57J8
         Qc4KcbvV86XgH3JDGtZyZTP8rGZGf9TfLGTCq28YWP9CSZraKMF+pSZ7tFKdOlbxDkxP
         /Xj5I4yzoQ3Ct05sgnyTGx0tjEACkq2HhfMIV1iZKXLpFWJo0LfhwtpV9guFnD0Mtk5s
         E9z8AKYrXJYObwuM5djo3bl7XZsaDCfSKQmvF2gfCAdi9tHmz8V1ShHB3BuB7yTckPGi
         wydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721867825; x=1722472625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXjE3WlGUWuPAZCd3nABcDzyRWf56VWlG8GIFIIMSzk=;
        b=i2S7gb/ai6TVXtqws+17cCYGJI5RV3Glcy72aHOmdWl0UYaBaZpUBwlI0oTt2H/Bef
         FYzvpzZqjk7531CMiaYZPSKzBvaT3aqoykeazTD2iyaEDruGVnJtgSRTlM6nKO4qIRuJ
         Cx6Bu7CheantLIfL3zSnGP/H7PyuOLF22zk4MSKRuviK4fkk1wrRRoYihTYaTwI9eoBl
         groZpOtbsrfxff8dHc1mBHgL6siCW9vU4GL/3EeGdj24W9HFyqaULW1WUfm/WFpIORv/
         nabTMI3PtmhdAeYCzfBXFPLn2I0qM6gfGiCYiqXFD7QGZQMRkbJqBkj0H5SndBo0zj0p
         g3Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWdJYfSw249SJ681Pgz0fUTPW+QeS82SFamSmIbNfMjQ0Hrg8jOTVMrKGy6OLjaXwPevvbupZhx66iuRVcijO46q4QZcVD++YTBcgVkrW6g9QJtsA==
X-Gm-Message-State: AOJu0Yw0GEvPUQlmMhg6/kbTjsnbPcYpugTXzc2dGkJk0zTamyGS4bGS
	9I2Gvf1FCLxqjqe9tjmk2h62EIdyeHrfuRciY5LjeU5eI8JpR2n66Rdtrvb059ehhwYzSWF411y
	h+01rlf1z+VL5oxp/945E/+Oh4Qk=
X-Google-Smtp-Source: AGHT+IFdZE4pfVlHM+jWCBCXvXTzUtMaVSBh3xPczDjmq7z/6dKu4sAviA2RudXsc08Ns7TgyQPJ0qlIsKlNlMg+Xo4=
X-Received: by 2002:a05:6122:3112:b0:4f5:1b1f:ee6e with SMTP id
 71dfb90a1353d-4f6c5c5229emr2018870e0c.10.1721867825135; Wed, 24 Jul 2024
 17:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHfPaQt_ZkJ=LghsuNg98X+HmXcbDbPvT2QyB9sDQLX5+KkU4Q@mail.gmail.com>
 <CAHfPaQuLT1zvuRBQ9bJZ7=rxLrOXbZ9xryoGH8piWa3r5cfSPQ@mail.gmail.com>
 <1f3435c3-6006-4f6c-8e8d-d6e0ef23e42e@gmx.de> <CAHfPaQsK5=VChWa_y1eotQQx=YfpduE13jcCyp5KwPUwbUs+0g@mail.gmail.com>
 <JrI0KCYBVY2fFxGaZWHazfLIX7oZRsF41F_DnFD886nJEcq7uyegWQPOM2O7UkmvrL2FGFjwB_TNRn2FFvv_aZVnpEn14mLkLg4bHCyjV2s=@protonmail.com>
In-Reply-To: <JrI0KCYBVY2fFxGaZWHazfLIX7oZRsF41F_DnFD886nJEcq7uyegWQPOM2O7UkmvrL2FGFjwB_TNRn2FFvv_aZVnpEn14mLkLg4bHCyjV2s=@protonmail.com>
From: Liam Howlett <howlett@gmail.com>
Date: Wed, 24 Jul 2024 20:36:54 -0400
Message-ID: <CAHfPaQuxWwx-Yf5RMQusP5QYB8kX+_hYeRSdCXhs0JMMusqicQ@mail.gmail.com>
Subject: Re: Tablet mode on L13 Yoga Gen 3
To: =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, hmh@hmh.eng.br, hdegoede@redhat.com, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 7:45=E2=80=AFPM Barnab=C3=A1s P=C5=91cze <pobrn@pro=
tonmail.com> wrote:
>
> 2024. j=C3=BAlius 24., szerda 4:39 keltez=C3=A9ssel, Liam Howlett <howlet=
t@gmail.com> =C3=ADrta:
>
> > On Tue, Jul 23, 2024 at 10:19=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
> > >
> > > Am 24.07.24 um 01:35 schrieb Liam Howlett:
> > >
> > > > Just to follow this up, it's not (just?) an acpi issue, the driver
> > > > isn't doing what it needs to do - if there is a driver for the
> > > > hardware at all.  I'm still looking into what is necessary.
> > > >
> > > > I did write the value to the CMMD variable, but calling the _Q2E
> > > > function does not cause the ^HKEY.MHKQ (0x60C0) to be sent.  If I
> > > > understand this correctly, that's what should happen.
> > > >
> > > > Thanks,
> > > > Liam
> > > >
> > > Hi,
> > >
> > > can you share the output of "acpidump"? This will make it easier to f=
igure
> > > out what the ACPI code is doing.
> >
> > Sure, see attached (I hope gmail doesn't mess this up on me..)
> >
> > What makes me think it's not just an acpi issue is that the iio device
> > doesn't seem to have an indicator for the rotation of hinge angle of
> > the screen:
> > ls /sys/bus/iio/devices/iio\:device0
> > buffer  buffer0  current_timestamp_clock  dev  in_accel_hysteresis
> > in_accel_offset  in_accel_sampling_frequency  in_accel_scale
> > in_accel_x_raw  in_accel_y_raw  in_accel_z_raw  name  power
> > scan_elements  subsystem  trigger  uevent
>
> Hi
>
>
> I am not sure if this will be useful but I have a Lenovo YOGA 520-14IKB. =
And on that
> machine the hinge rotation angle seems to be reported via a custom HID se=
nsor based
> on reverse engineering and experimentation.
>
> You might want to check under /sys/bus/platform/drivers/hid_sensor_custom=
/. In my
> case there is one.
>
> $ pwd
> /sys/bus/platform/drivers/hid_sensor_custom/HID-SENSOR-2000e1.3.auto
> $ cat feature-b-200306/feature-b-200306-value
> 76 0 101 0 110 0 111 0 118 0 111 0 32 0 89 0 111 0 103 0 97 0
>

I believe the Lenovo YOGA uses another driver for a sensor the
Thinkpad Yogas don't have.

$  ls /sys/bus/platform/drivers/
ac          amd_pmc                byt_crystal_cove_pmic
cht_crystal_cove_pmic    clk-pmc-atom       efi-framebuffer      i8042
             pcspkr              soc-audio             thinkpad_hwmon
acpi-ged    amd_sdw_manager        byt_gpio
cht_dollar_cove_ti_pmic  coreboot_table     geminilake-pinctrl
icelake-pinctrl    reg-dummy           sp5100-tco
tigerlake-pinctrl
acpi-wmi    axp288_pmic_acpi       cannonlake-pinctrl
cht_whiskey_cove_pmic    crystal_cove_pwm   gpio-clk
intel_rapl_msr     serial8250          sunrisepoint-pinctrl  tpm_tis
alarmtimer  broxton-pinctrl        cedarfork-pinctrl      clk-fch
            denverton-pinctrl  hid_sensor_accel_3d  lewisburg-pinctrl
simple-framebuffer  syscon                ucsi_acpi
amd_gpio    bxt_whiskey_cove_pmic  cherryview-pinctrl
clk-lpss-atom            dw-apb-uart        i2c_designware
parport_pc         snd-soc-dummy       thinkpad_acpi
vesa-framebuffer

So the only sensor seems to be the hid_sensor_accel_3d, and it has no
hinge properties in my case.  Although, it might be one of the other
items here so I will explore this area.  Thanks!

> The above feature (property-sensor-model) spells out "Lenovo Yoga" in UTF=
-16.
> As far as I remember this is how the windows service finds the correct se=
nsor.
> Under the various inputs, the sensor seems to report the hinge rotation a=
ngle,
> as well as the angles between the keyboard and screen, and the ground lev=
el.
>
> If the situation is similar in your case, then there is already infrastru=
cture
> to expose the angles to user space in iio sensors. See hid-sensor-custom =
and
> hid-sensor-custom-intel-hinge.

No such lock, no hinge is returned with a find command in that directory.

Thanks,
Liam

...

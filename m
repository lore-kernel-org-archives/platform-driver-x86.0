Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DAC3BBEC
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 May 2024 04:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748857; cv=none; b=p9myWiKPcZLxcflKDL2Gs8D9e8dAi/UMN+nKp80BmnGRlL1AH2UX8o0bRCPj/Wu2QnefrRQdRH+R6pWSTfOJ9ZYNvLTqAYj8elNgA3h59cw5FaYJ4scWDSPTUnr1DcpwH8qSFMA2E18UOMWayH24BtsSs8IGrUupTq8zOsbGcgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748857; c=relaxed/simple;
	bh=97nvtUxgc3WsktpWyNxSNadgjuTPIAXSyYFTfZ/M82E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tf3U9lfOplliq+TzMp6BStXwAzjJh03cS9QE/IMECcfuawua9tBikpLIZ093sSoDUaYd9m3R9tonFCFGAczJbpLasapG+bpwELONJO9LFpe/sGSKgxRCqjEnXcSeZAXlwI6CNQnBqY1prgiRGu/Ag2khYyWlouLcWLhK9Gq8kEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLMKlANx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLMKlANx"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso1154212a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 May 2024 21:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715748854; x=1716353654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukQ8cKDAD1SJxJKt4eNfx/Vf47wqHb9768hSQMxGZAE=;
        b=dLMKlANxEY19z4RsezsutJwq7YutQWk7f+0pjzYRzJxFD4j/+GzFK/BZy4pUbThvD6
         clvowwbouZzBg+u78ye43qggt6GtBYIFadtXMZdTEb/gbpqp/AG5czBuePzqwFBS7Ns3
         +KK1G1O4Oj1cOg7Oiwivcs4kTz1uMQRfec5CuqV6/TcQC0ARA7AJrbRy/rwNS/BfAXNc
         wncnA48XJbAHo2WYnpWLoq8EP1WBvOCFc3M0hq1IF83LN8zcjW1XxrQzMTsLbotgA4b+
         LPQF9Q1MeqFauRcpmf4wsAbPbkrTxMGRQUCf57EaTZMeltp14dALzPgQz6qNqtm3uoWw
         f/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748854; x=1716353654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukQ8cKDAD1SJxJKt4eNfx/Vf47wqHb9768hSQMxGZAE=;
        b=KZ8O2WEwwbXvunSr4TGBUTm7yft+YxtDFObhIBfGp6eccR3zyAS3MGcS4siYpXftfZ
         Id/RHPEtYJSzp0bmZqCCuEDFR/YFw3SsNLa9zSMRq/TnfPUWMXkGNGfnqN4XqZ3AhHLf
         +eqKEe5jEXbscWpYmqr90CE/AbVwNheZcYDbACz3WTVYUXhpfcOSPfp2uCl+wxeOS0rF
         rnBkmTIGoM4KZT+TumOB3eko1GdJu6g3OqSZGQ19rWWB9w9e3tPTL58EXpWoLf1Pfyx4
         8hwafssGNXTZz1LRG0Tv0r11U1SgDxVfZZabUzB8ZP331mtnNQGB/aIsx3SQYWrbyxR5
         K5pA==
X-Forwarded-Encrypted: i=1; AJvYcCUhH+26c7++AgZ9+qAurZ4+3hnouXSRowpObOvsMS4hMCBbJcSq1bAi0Hnj4Sajf/cQpVih8g3AqGOY+MDNwXy+yQxmXu35u1PTQfKji1LsXM595Q==
X-Gm-Message-State: AOJu0YwKQ6NMGE+Z7+Kdg04Y9FCaFLJQf9TNhfRRnE7y/Kjl5wO7fsoT
	WHm6Ofr6Pz2JU5QwFw2UG+5iB7UeRZ4Z+09PLnxAkGyfQdRCLGe4AmnZguLZcdqwFjtW2gbbU5y
	qJLTQBJALqn5weGe0cPlhwwYKfGEI08Nx
X-Google-Smtp-Source: AGHT+IFmSsyIV3IHI13VP1nRh00h+5dCe/v085MDxBcj4NmeXhP/RNUaARXGpNpszyMhj0KMfBa2dbURpx/CeuZaJb4=
X-Received: by 2002:a17:906:4ed0:b0:a59:c8bf:1269 with SMTP id
 a640c23a62f3a-a5a2d5eebf4mr977703666b.37.1715748853592; Tue, 14 May 2024
 21:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514180343.70795-1-hdegoede@redhat.com>
In-Reply-To: <20240514180343.70795-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 15 May 2024 07:53:37 +0300
Message-ID: <CAHp75Vdb3_yHmS1A0cixKGRXHu_aUg0a7+cXLvtQFT-DumDQgA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross
 Switch driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 9:03=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for USB3.1 Gen =
1
> and DisplayPort over Type-C alternate mode support.
>
> The ANX7428 has a microcontroller which takes care of the PD negotiation
> and automatically sets the builtin Crosspoint Switch to send the right
> signal to the 4 highspeed pairs of the Type-C connector. It also takes
> care of HPD and AUX channel routing for DP alternate mode.
>
> IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
> things look like there simple is a USB-3 Type-A connector and a
> separate DisplayPort connector. Except that the BIOS does not
> power on the ANX7428 at boot (meh).
>
> Add a driver to power on the ANX7428. This driver is added under
> drivers/platform/x86 rather than under drivers/usb/typec for 2 reasons:
>
> 1. This driver is specifically written to work with how the ANX7428 is
> described in the ACPI tables of the MeeGoPad x86 (Cherry Trail) devices.
>
> 2. This driver only powers on the ANX7428 and does not do anything wrt
> its Type-C functionality. It should be possible to tell the controller
> which data- and/or power-role to negotiate and to swap the role(s) after
> negotiation but the MeeGoPad top-set boxes always draw their power from
> a separate power-connector and they only support USB host-mode. So this
> functionality is unnecessary and due to lack of documentation this is
> tricky to support.

...

> + * DisplayPort over Type-C alternate mode support.
> + *
> + * The ANX7428 has a microcontroller which takes care of the PD
> + * negotiation and automatically sets the builtin Crosspoint Switch
> + * to send the right signal to the 4 highspeed pairs of the Type-C
> + * connector. It also takes care of HPD and AUX channel routing for
> + * DP alternate mode.
> + *
> + * IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
> + * things look like there simple is a USB-3 Type-A connector and a

simply

> + * separate DisplayPort connector. Except that the BIOS does not
> + * power on the ANX7428 at boot. This driver takes care of powering
> + * on the ANX7428.
> + *
> + * It should be possible to tell the micro-controller which data- and/or
> + * power-role to negotiate and to swap the role(s) after negotiation
> + * but the MeeGoPad top-set boxes always draw their power from a separat=
e
> + * power-connector and they only support USB host-mode. So this function=
ality
> + * is unnecessary and due to lack of documentation this is tricky to sup=
port.
> + *
> + * For a more complete ANX7428 driver see drivers/usb/misc/anx7418/ of
> + * the LineageOS kernel for the LG G5 (International) aka the LG H850:
> + * https://github.com/LineageOS/android_kernel_lge_msm8996/

...

> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>

+ dev_printk.h

> +#include <linux/dmi.h>

+ err.h

> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>

+ types.h

...

> +static struct i2c_driver anx7428_driver =3D {
> +       .driver =3D {
> +               .name =3D "meegopad_anx7428",
> +               .acpi_match_table =3D anx7428_acpi_match,
> +       },
> +       .probe =3D anx7428_probe,
> +};

> +

Unneeded blank line.

> +module_i2c_driver(anx7428_driver);

...

You can fold the above into the current one, no need to resend.

--=20
With Best Regards,
Andy Shevchenko

Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075E339768C
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162563; cv=pass; b=G+Ctq386EaKtklE31fVyeRzt8MMNh2ohn4DGo90kG+DgQ2Nllk8uf0P0ObVNqYO/PuFeWz38oyyToEUfGEZVZvO5vGZYtTUDWjsPAffjN+LTSKC4YtTw9wVS6mFi8XUWv6L16zJC/6qi+hav5xSQAlnbrqYrf697rttmlqg9SEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162563; c=relaxed/simple;
	bh=Ido82lTsBObPiLyE+cnbnYTa5RnXovthshiMl4cqqxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfvLuXxA6dKwlJomwLcA2lCp7QAPxfTTXqh+SfnS633hD/eXqu0UgDrGh8dUNypmTn3Q6asDGg4YUMQU6HSEkoHol8hNhs5PwrFCEcBTlUgxEwP2JgLZQcX3RKS02Ib3max6THdPVf0mCblo/fRYq7Oms9LspO2XfD7gsSKACv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CAg1W+YC; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CAg1W+YC"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e4a04f059so5019101e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776162554; cv=none;
        d=google.com; s=arc-20240605;
        b=L0v/yDxaX0dJjHPGl02qjKOt1w1GO82RLE0hi8wHM764fzHTZDXqZvAydPeGXP7tuf
         u1amMb8qVzJAj0xeZSmanxBdH/qSmvPMao5WX6dr5AkKMxZSs5Sqhnyo6OIjSkFbTQ72
         I0dUoje+XXQZ2IUgY/EP/udzkZoVcC2lqJIbOLBGoQT4cG+hw3Cb1cK8i/9W9Ly1mkpx
         5KMPTaC+NDgfnVs1V2Kdh6PNE24z1PDHW9JA201wh5PYI+xFDst6TlQxO5TY+5+IEj+A
         XBrDtTZ11qqjFUB9X3pru4+CS1m0SgOem33HbgvIymfZ+doC2algOYeU6WHMZw/WD9dG
         Adpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        fh=3E10NQruygRJEm73kdh4AbuFBe5RQlc5Lzl7MNtq5Ic=;
        b=SVyqSYX7hcKiKzo5+12e92XavGe4WMPDll/gfeISGzt9hFWuKJ3wrPizft8wgIgRvp
         Hb9qnp7YaxlDmeNxg8HzNBSS1BHNJMF2vYeutYVdxDtYZS3b4d3oluWN2VGu/RLGUYPO
         ZwbnzJGRRQzm2/UpYpWApDqT80w0jbSCueM0cfqoyzZktv9iYFJ0tvwaQsnJ0mYH+fM3
         wjTdw0wDpq9XSdqSAjRsxakqkw4MtMpvXHKHAkQi/P95bHYyGkmC4l3RS3IvpiKp0ZjD
         sninHEFi3Ozb5Bod9DrvaROrjIWNWdfoKGUIkiHqkixMvV8ruP0bGesBVkEdF96ziioN
         FA6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776162554; x=1776767354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        b=CAg1W+YCDWa+7hMyoFTX9wrJnea3anbAiHdxWmpDFPNhe7kCyRPxDRCs4+n9KcUSjl
         w6nzvTJigwS7oM6UFv5A3HKxmii0VyJz1d3VSyhkRHh9KbLCHy+zvkfyRpySbb5xZhZu
         JuL3QYV3wyDOI2wfxl8ehTcAnuZZDMlWKsh4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162554; x=1776767354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        b=XOhCNdWuQ8/ln45Oy8YjcAGIQeb0PYIsrWG0LhjO5p2FueahOBl5SeQ7/abkyYrVLK
         HaUTc+1szJiXNXIbrWPI6U+f38Jzy5YVQmT3R9sarRALG2So+xlRz37FrdBUugpmBXiU
         D5zPWpwht0RuC2WNcB6Qlw1y3H9p9O6UWmmKaDRx4gT9vydA1wtea5XesDUFSW+AV0Wq
         SqtKhM85U/jat3oyn0UOg4abvosIdOqKfluvTL7JWbXOTFqov1ufVB+ztYFDgUWc2hzF
         1B7FuiI4oWVYgwc9DdbrMHXhZtHOnzzEgZmNy+G5OSsE43rwaalZBlBgYgdpIYtO7MWL
         Az6w==
X-Forwarded-Encrypted: i=1; AFNElJ+A5RElXSYMf2ThQAh15tq7tNm2j/EGVRHsY3TO965qaxAduucTCwO0MqPtub5+21PGPtRdaRrhrQlOalS1fUHfF78I@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq2Zd+14mPmroXvUwqC6w1IpWdul+xeTaX32XBD57ISkcXWiY8
	l0F45UHH6mKUNLWeDV8q3KcqQlBPiZx0d+MmHNYS0UvYdyh7jk3BfzFS42VILhZjfKNmLsCD4ft
	iITuEOJOav6S1ILjBvUMLINwN+0u0RmBOmVzsImIi
X-Gm-Gg: AeBDiesLceatbEVh31454Z8iVJ7ITn1JHbl0eD6rVmk/wEToa4r/VExWiOM5o5nxpH2
	urQ4gCMXzMcAEzfTNENCAyddOWA0d9fnHEpCdR1zL/p/wxeEZ8dujNuUYvgQIQn683AnzOSyCQh
	O16v3Znkj2SWKJwAnaMqFIvx/F4vIAyTxcDGl2HfS++wTMX1Op5vW2i+qZAFFaHRdiXRHijhDkJ
	688XHR54zNGtWbq7R/2Z4XNhnpj3iZDHOoi4Uwp7mQbtpsEOxxIOn2NdSLwESogXbrp6NqBPShE
	K2SC2JOgqOaIsLJf7A8BlExXkIy7Jp/e67Ut9KwvQMqNzWUd
X-Received: by 2002:a05:6512:68e:b0:5a2:ae27:c879 with SMTP id
 2adb3069b0e04-5a3efd7f0d8mr4850095e87.29.1776162554447; Tue, 14 Apr 2026
 03:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com> <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
 <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
 <CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com> <ad36pIu-0dutL7Nk@ashevche-desk.local>
In-Reply-To: <ad36pIu-0dutL7Nk@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Apr 2026 18:29:02 +0800
X-Gm-Features: AQROBzDHB_HCwto4iaprIWgL7mrQWt62yIrtGAtxckKlX4EUkJwTT3ZqPu-YslU
Message-ID: <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E connectors
 in devicetree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 4:28=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 14, 2026 at 01:03:19PM +0800, Chen-Yu Tsai wrote:
> > On Tue, Apr 14, 2026 at 12:08=E2=80=AFAM Manivannan Sadhasivam <mani@ke=
rnel.org> wrote:
> > > On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam wrote=
:
> > > > On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > > > > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam w=
rote:
>
> ...
>
> > > > > - Given that this connector actually represents two devices, how =
do I
> > > > >   say I want the BT part to be a wakeup source, but not the WiFi =
part?
> > > > >   Does wakeup-source even work at this point?
> > > >
> > > > You can't use the DT property since the devices are not described i=
n DT
> > > > statically. But you can still use the per-device 'wakeup' sysfs kno=
b to enable
> > > > wakeup.
> >
> > I see. I think not being able to specify generic properties for the dev=
ices
> > on the connector is going to be a bit problematic.
>
> This is nature of the open-connectors, especially on the busses that are
> hotpluggable, like PCIe. We never know what is connected there _ahead_.

I believe what you mean by "hotpluggable" is "user replaceable".

> In other words you can't describe in DT something that may not exist.

But this is actually doable with the PCIe slot representation. The
properties are put in the device node for the slot. If no card is
actually inserted in the slot, then no device is created, and the
device node is left as not associated with anything.

It's just that for this new M.2 E-key connector, there aren't separate
nodes for each interface. And the system doesn't associate the device
node with the device, because it's no longer a child node of the
controller or hierarchy, but connected over the OF graph.

Moving over to the E-key connector representation seems like one step
forward and one step backward in descriptive ability. We gain proper
power sequencing, but lose generic properties.

The latter part is solvable, but we likely need child nodes under the
connector for the different interfaces. Properties that make sense for
one type might not make sense for another.


Thanks
ChenYu

P.S. We could also just add child device nodes under the controller to
put the generic properties, but that's splitting the description into
multiple parts. Let's not go there if at all possible.

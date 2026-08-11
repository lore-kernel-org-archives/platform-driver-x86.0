Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8EE3FE66F
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479710; cv=pass; b=RVPr3DRVZ517JBiDeE4Gj0A7alQNnNd55Ov6wyIyCs8Ya1vXk/a9blYSDR7e9E1A0xPc5fn7T+KVy9k/MRXmr3HjaQuwEX7j3ggpa8ZYOwAy1ZfVmCxNlmLL9TWLpKtTH6xeIomF67wyr6uQTwshzjbNICkpPAnbDwaIiBFdjig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479710; c=relaxed/simple;
	bh=X+Hn+2UT/c3HZyX/hNrvvPS+vgTytH3RluH/8Z7NWV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwIFsyg5Pb4ACSI+p1k7WOcPLAuxw+sepH3XZiw3p/D9PVmUimO51FsLerIoTwxI7sTmL2wF7L90lo/fx1MTlNW626gaHsP7KbnNi/Q7Je+OVVYVby+uifxd3GZxAp/Ao07vP6ZT4endL9fN6fm6uIFBzHnPXPb3EXnrPZi2g1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JOiX4z6T; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JOiX4z6T"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498012a61f6so14175e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 13:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786479707; cv=none;
        d=google.com; s=arc-20260327;
        b=XFjcJRlElW9W8VmS758d8cintTSiXlS4yLZhr4rnL9tyVop6hI5XdpU/+ZE9E3cl3Z
         tBuRaZGaRqwqcdkmQNKU+4Cy1VVbqqrcOCyvIojR54TPFr9QLg2Ld3sLcmoCGOj7infw
         MJF/X14qodEOQKCmmo+UtBMMWfHHH+LfKLEy5B633estKTYsgxTOKK3+Hwud7LsMsGCG
         RhKdZD1pndiwFiKnGjz6jx+J/ZHaNtBhCMDlUjloOMWgCxtHAis6228btix50GTGTJn8
         bL1nTodKBuqmIyJms+6G5GDsM8hak15mu5rj0plRn6W8ybmh4Eyxtu7tunB4JRqkyAkw
         D4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2y76Lt61/i/b/snN9JbQtpyqqRRI3i3v46Jl7CWq7qg=;
        fh=J/nwYkzlyFHGwtgFYgUIJ9bvT1CU1nGphTFOJlQGr3Y=;
        b=Gre4nzGPCOfGJUnqxr+XjUDNtajuOb+oER4TrjTny7qbLAhjjRddpR7mXt5+K7eVpW
         hyHGjXbvmQV226DUGL1iJpuMtXJT/4ZPvvGxlghbtaw5bSPfIVbY0wZqwDfwDjH6MWbO
         5/zIgPzHQiVIJRJXPXTsfdmSzlrliXdDh+X3Rf4+I9RA0S7uWD06xjcRd/0azhERRtxT
         1uTxNn1DOTT65bKO0OzB0zp2qp3EiwCxI+bvVMrol47iNJ2MrnJLTne7olkvmC9gx7pq
         6O9hhWkg1+l+eBJ7Do+4dh4awfLtBEvvM+TdZtC3pIYkTwO3XLnqI7Xp6DnpZbYvfsi8
         TayQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786479707; x=1787084507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y76Lt61/i/b/snN9JbQtpyqqRRI3i3v46Jl7CWq7qg=;
        b=JOiX4z6T3S4hXTdXlOS2Iy9FsV4q0reEp3GQHdgIUTZC2ehMcwRuZnD42CVytTHJGj
         meiKXDSI1yfWaVsALAMjoEMqDLkSaFMUSs7mlI7zOE8QfTtbPrqe+xHGOmFGzTMsHvVT
         AZa2cYhWZzkMYA//fIHNgocLBZwxtPMcuiSIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786479707; x=1787084507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y76Lt61/i/b/snN9JbQtpyqqRRI3i3v46Jl7CWq7qg=;
        b=oLw9Hphj6o3mc14uQDQqxzZRTOlhX8IuMceT/T9vP9EWR8lCwuU6GXQ1bL1xNWjTHp
         hM8WZNU4biTdAlWFowsmm//pGPRj9fr0Qvp5rwEHSPJF12zD/Z4J7RRnaokR+RWTybE2
         Fw0qLPSmq1Y0BaTbp9zRVlvelD932nPHLJ9JsWl+D7bDNEiiAdFb0T9PEg66P+b+fQAk
         YCls/QgZEPDqgww2UTBMAS+W+xhp1vPBRxLCg8i2RJjdfT0mFpnZOvGn2Au6EgRz+A0E
         00F4EZJgUDIcXk0j62fyUaIiV0RJib5vaQl3rd6znPtbO8+LLzHk7YEeQiY4qDkHqEE7
         6uzA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9U+i1DTh5uwPLdrH9zCOBGYDRYyuIKiDQOr71BGo2GuFztmaCRJgHroUxW/e9TKrzl2BEmP78nppiTlPdTyjDFo7u@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjGssvhMw1OleEunvaBuf819I6PaPm4TIl39Jcx/6X2kVhhsH
	fq3HK9AZR4Y4UF0nZfp5+BwM6w5gSt7I9jFFqZyhqisPA5f4ximybu0bXDBERpWAscnFtw/mABm
	VJ9iAUu4yzHOS2z57pqqas74bW+K+xUT27o4kAf3b
X-Gm-Gg: AR+sD12bfcGueO3hRRYfduEQAsQH8rLn0hdhr8aXODXHeA6xxtfE+5DSgSXREuZTL3W
	Z68O+hFl4EUyaP4V1b6z17T365VGKsx4wc+1RFDxO5pgENCyt6dW+EVgqE0P2MCgPxDcyxXq3YE
	gQCB3V0kagfXh9TBqd2APZ/L1rWd14R4WQpSNO2mFA3DOU2SO8KdVKK6/Gkv5rIvlacYt0p77oM
	Em8ChAspzYVMW8M3+NJMCNiKCoToNIIgCRVWlh5UGb7fy89bVRLgF25wNlttCL5G7DM1Wc6c8R6
	zzBeTIJQWR25HHN8j4LW+h6F/aMW5U+3ApET0N1/i4iQctatbqn0GXrLsjlEi7et2aFMKeAEQcW
	mb8bvs+QGaBwwHXo=
X-Received: by 2002:a05:600c:a210:b0:495:51b1:3b7c with SMTP id
 5b1f17b1804b1-4997ae8fa87mr189725e9.8.1786479706369; Tue, 11 Aug 2026
 13:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785838269.git.sean@starlabs.systems> <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com> <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
 <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com> <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com>
In-Reply-To: <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 11 Aug 2026 13:21:33 -0700
X-Gm-Features: AUfX_mwPkMPdfE9_YsGRn0TlcmOaeVgS_UG6HvdrEqDFesBA8RH57sUUWpUXm-M
Message-ID: <CAODwPW8B2-i4Ne-ZTVUM_H-EZwn2hoaC4joRhxNM=CREDd_aUg@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to coreboot
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Huacai Chen <chenhuacai@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biggers <ebiggers@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, Kees Cook <kees@kernel.org>, 
	dri-devel@lists.freedesktop.org, Oliver Lin <oliver@liuxiaozhen.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 4:28=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 04/08/2026 13:24, Sean Rhodes wrote:
> > On Tue, 4 Aug 2026 at 12:05, Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >>
> >> On 04/08/2026 13:02, Krzysztof Kozlowski wrote:
> >>> On 04/08/2026 12:13, Sean Rhodes wrote:
> >>>> rename to drivers/firmware/coreboot/Kconfig
> >>>> index b78c644fa253..d273bd836245 100644
> >>>> --- a/drivers/firmware/google/Kconfig
> >>>> +++ b/drivers/firmware/coreboot/Kconfig
> >>>> @@ -1,13 +1,16 @@
> >>>>  # SPDX-License-Identifier: GPL-2.0-only
> >>>> -menuconfig GOOGLE_FIRMWARE
> >>>> -    bool "Google Firmware Drivers"
> >>>> +menuconfig COREBOOT_FIRMWARE
> >>>
> >>> As pointed out by defconfig change, which is supposed to be separate
> >>> commit, this will affect users of the kernel for no real gain.
> >>>
> >>> Do not change this.
> >>
> >> I am surprised that such change appeared at v10.
> >>
> >> Changelog is quite incomplete and I do not see any explanation for thi=
s.
> >
> > Sorry, don't follow - so put the names back, or split it into its own p=
atch?
>
> I did not find explanation of this in the changelog. It cuts at v9, so
> maybe that's the reason, although lore pointed me the v10 as the first
> version introducing new CONFIG symbols.
>
> Anyway, IMO renaming is really not worth if the sole reason is Google
> name is disliked now.

Krzysztof, the idea with this change was to introduce the new Kconfig
symbols that more accurately represent the new directory structure
while keeping the old symbol names available as fallback symbols for
people who continue using old .config files. Doesn't that avoid the
pain to users you're concerned about? I thought doing renames like
this cleanly was the whole point of the `transitional` feature in the
Kconfig language. Why do we have that lever if we don't want to use it
for the kind of cases it was meant for?

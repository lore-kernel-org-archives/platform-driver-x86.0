Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795742079;
	b=5S5Fmwvy4wGyRUXL0WPQc+DZss4N8ePzV0cvxwVGTsqhGkXs9wK2QvMLprlI47H/soS5
	 JOfg31bHI+9xf+eWNhK64qhRMJ5cZoqiKUyEOq74DvR2Cj3s7WJAB9LpVj1XJkINaoBA3
	 gB5NyRev1diAqYv3edjslNmT3xItlS8F8MXT5lqKKcmQXuLsLpUfLn+KepOBUEgErBCVn
	 NYzPphjHiK/NsMKaSlWrzrSiPReleimHooeYuknI7KEp1RNWiqGeg5aca/QIc8afrTnBZ
	 TnAeR84RQUdpQ+jbB5CoLYI52fJOWkAnDUkXBokHj9i//b4yoVSNUvxE3UIXAGXGZSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tUBA6pVGVzuWRSoOa+DeUxU1u9Vo4hxpo45FKzvoAQQ=;
	b=EVBxLdYH2gLa9gUeh2ei+b0yPnzZ4L+xM9e5ByQq/oAqg50fB5hw2TfzBV42ancADO2O
	 2mb+9RORm19Hhz9n8rEUsqiYjCsbpiu6Rma6/U5G8YpUolue/ble3pmklA/lJOtJ2BWI4
	 oLNm05ajGqyS+CUaxeFIjmikEUqg6jIwUwR90EB/E/yDwEEEhspbnoCtKpKCi9M3aM3+Y
	 XEao5cAo72fNymnb9EyYHn2ZtcgWbpEr0aui+05qPVxJ39Vg0Ute+4ZkQDppldCWQKkHx
	 hMAPHYDbO4Sz2bLYUWRs9IMPccvSfPP53F+i0CYc65hrfuXOxQM9jFoXWfVbT2CriRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffNnuWKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5E606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 01:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffNnuWKs
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so12420597c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 17:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795742078; cv=none;
        d=google.com; s=arc-20260327;
        b=dSprWoZgV6Ec1b6ZxbqPyJMKiN8lvC4wDtj4Z9t6zsKESipla5B5On13C0zZP9zSGp
         YqBGFAgxGLz6M8Og4iP5sHwd7+hHSEdytvJII4LT/j0vThnnWfCGc4FRsip9dGQPaBsU
         OwAG7vgc82snr3JrTimHB8Dv+e3nlxoIz9ATcM08syNbWMp/ccB6eptf3jrAj5aUGkFI
         xiv+uwcpPq8vI1YMqOzSP7NU4O67zuUE9MglrKKH/JzPwOxH+zC5+LHzrxvsNNIw9pa8
         QK0oiS06sa+BqE4q0jBqia4Mt7w3Jg8e0QjqT5+wOkf+46TC76dTJ0INR+55pb1HkSuQ
         +BCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tUBA6pVGVzuWRSoOa+DeUxU1u9Vo4hxpo45FKzvoAQQ=;
        fh=RbK/m7HQeZuR+HNtrkESDTRYRCqRpMO4eZ0HPNE5aX8=;
        b=EZGFypemWwuy7cbAoxuRDx7h1OxCk6lpkr42ACncZMI1/U8nYjwM09loV+WQVIQz2V
         j4N98o0zX2Y1xiPFzzxOMQoiuZC1lvWkmQG2Y9VenGs7hL+EGLEUd2ayG9SQ8B1cr5ib
         k/Ck8Osl4CD5xR2yJx7aSDoEKJcBNCQBLg76YQ5GiGjUtFLT1Mwbcc4tsD/CB7mitYjf
         X6B+YufYTlHnjCdZkbpwTnTssxb0koSbbN38gzd68KfywhT6LkGFC9d/FZhdk/k7FJAk
         xqPZxbDoejNxfF+iWf8ygHcpz28AxsCIAf44iKiDHCFMIu/tyriCm26Cfl11myKA9gLq
         uojA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742078; x=1796346878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tUBA6pVGVzuWRSoOa+DeUxU1u9Vo4hxpo45FKzvoAQQ=;
        b=ffNnuWKsKYf3sXG4mlzfQOZDnQ75A/qYCr+clralhQcT6oOXBXG0tWjZStinG/DyYN
         bbuusKzV/KbqywIJB81kJXk9ODltskVMUuVVf7AY4vdkl0PoF2IfWcFv4XoXXbp/Nfde
         IV/QsMH2QZ76adKWUtTDal6dwRH5Le10IH7ZtAmmPYXHKkAnuNHgxuYXRFPOE16IuGN0
         bUprouJRbFA6+bTbtz6yXe81amUxWejn9wIi0Y3jkt65m2qI7HS0J7huABICF1Qwjl+C
         gctpVnDwBibg2moRpmhEDlELaBEpIBIhS7hjwSEFQkRj4ZLzCS5U+Ncy+kQHIpv5LBgE
         ATtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742078; x=1796346878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUBA6pVGVzuWRSoOa+DeUxU1u9Vo4hxpo45FKzvoAQQ=;
        b=J26ungM3Fzdyld+hN/xUn9W8/1/It5+4oB/8VIQVSX/Tzf77PmAd2e573LeA2CCtdZ
         JunfY2/yW3ooTY+9miM884Nra7uXJbnaBM3fkdATHcRZXsWPBYkuYoH2JEfN+Lh6D3lx
         U7Wo1jqEynJ9+Q5AB+NIZI39VKtWH48YHDRQiKpA45KNb7FIzPYNBrBN1TTiYhTLL0GL
         QkADgljT/lJ9fRw5fIW/aoY2GQbviiFHhRQTW9j1hhzKoJvYC5dndUyJizI17QtzQIKg
         ukVUDzra3VV/XFi8yRT655+nFWrfMIPoETXTuy9qq+ZfDTKXT5vLNjOIJ/L3Zx5tw6tz
         AcBA==
X-Forwarded-Encrypted: i=1; AL+hErHSMZhJoPI2Wl56jPpyuESe+CdVOpnQ1cZ6P7bpnmnkGA22cPrBOHdIbf2cdKkVvh0Wonip8GWtBG+4REsJ5Nm0coKA@vger.kernel.org
X-Gm-Message-State: APuU4Z+fQUjYwW4hfmBfzSm5U1AUWFfFqh/n+3TvwnTayVZbkjcyACGA
	N5vk9G4bWbzvraqLg8LXTuYg5FBLpnr0vu19kFGX5x1WnG8iKoSlY745O0PU/ZxGnzzwiHq96+I
	g4f9q/hBbQBnjrLAOxA8BpUi6vrXh7wU=
X-Gm-Gg: AZFdTZfQnma/54ADiPkEvqN4lQ6hL2Wxm/i1k2G5AfYspP9yVHM49K4Z/+fxRuttJhK
	DhlHDnOoKd5x4/Df5N84MESbte3rjF36hKr77ICCIeOZxotKoT0dkX7F7Qqka1uxEUgmudsvgLC
	H48K+rChqqbr9ORQOS6c6+Q0hHqrj4I2QDobli8oeUkgzVGNFZTtXjclOaQX+zIG718DyfM65ll
	hCWSc9eV+9332PV16nliRMHGJs53Pv9fdsUIGGegK1Il293pKtP3d/f3HkwfwYR6qql195nomAi
	6TnpEONFYOrsP2N80XTYPbFP/eM2lhxSb6QSyLokuRgIELn4us5PXAsgEp0dQ3UMu0oM3EZXZ43
	HlB8ErwEGcoCAdYEpfd+J8ycjcu9YTOLIczI9
X-Received: by 2002:a05:701b:42c6:10b0:1b5:49da:b969 with SMTP id
 a92af1059eb24-1b5568fbf25mr23134158c88.36.1795742077731; Thu, 26 Nov 2026
 17:14:37 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com>
 <20261110-legion-lighting-rfc-v2-2-845726afb71c@gmail.com> <3e8f3452-06c1-8194-2d76-524418f0194c@linux.intel.com>
In-Reply-To: <3e8f3452-06c1-8194-2d76-524418f0194c@linux.intel.com>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Thu, 26 Nov 2026 22:14:26 -0300
X-Gm-Features: Aa3M54ooPyM-qjfnlrGm_Sa7EwjiM7vZt76XOBAjXwxqti8qG2MPIB7IOQa6o2o
Message-ID: <CAPKD0HcrVfvQyCTZ-1s26EO9wsLXxwJoeBRMro5jmt0BRjbAZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: lenovo-legion: Add keyboard backlight driver
 for Legion Gen 10
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Wed, 11 Nov 2026, Ilpo J=C3=A4rvinen wrote:
> Thanks for the update, this one looks much cleaner already. :-)

Thanks! All of these are done in v3:
https://lore.kernel.org/r/20261127-legion-lighting-rfc-v3-0-15c55d9f15b7@gm=
ail.com

> > + if (ret <=3D (int)sizeof(*msg) || msg->report_id !=3D LEGION_REPORT_I=
D ||
>
> Just remove this cast.

Removed, also the one in raw_event.

> > + hid_warn(hdev, "unexpected answer to 0x%02x: %*ph\n", op,
> > + min(ret, 8), msg);
>
> Printing data like this looks more like debug level stuff.

It's hid_dbg() now, without the dump.

> > + WRITE_ONCE(kbd->led.brightness, level);
>
> Please add include for this.

That write is gone (brightness_get reads the hardware). The driver now
keeps the last known level for brightness_hw_changed with
READ_ONCE()/WRITE_ONCE(), so it includes <asm/rwonce.h>.

> > + * LED_BRIGHT_HW_CHANGED: Fn+Up/Down are reported to userspace.
> > + */
>
> This only documents what these flags are so why a driver needs such a
> comment?

Dropped.

> But could you solve this with devm_add_action_or_reset() (for hid
> teardown) and use devm for everything?

Yes: hid_hw_start()/hid_hw_open() with a devm action that closes and
stops, then devm_led_classdev_register(). The .remove callback stays,
empty with a comment, because without it hid-core calls hid_hw_stop()
itself before releasing the devm resources.

> > +MODULE_DESCRIPTION("Keyboard backlight of Lenovo Legion laptops (2025)=
");
>
> I don't think we should put year into this

Removed here and in the file header.

Thanks,
Ciro

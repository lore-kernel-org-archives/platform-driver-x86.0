Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA1C30DECC
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564085; cv=pass; b=gPNRTNwVYF++CvApXXKAjGwPZV3IF5+QSz5fupI1/i5p0Zdfy5YDqw5VH4Vo0kwMFQo1wW5fr7TtDYh7FsW8oUTUyBJqGwI67ZpRI65/7QHMAOmXhf4G3cki7KZ+X3HUb6fFBiWls3INNbf6qJZ4QQrX3vqr8uiFxW1tgLl6m68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564085; c=relaxed/simple;
	bh=1DVjTbKTXkhH1yUwpD/lgRqJn/mvRVunuCZAxUjSgDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzIAY0SbEyWsJoqG2/Gom+VFw8pTgIqpgnozKjQwt/0XvBskNyE2e5YALf6PeiUQ81bKUgQFI5FcwR68EQrAef2JhFWEfX+M66tMX3F78XrZauX253RHHBfPbTY5qUbxS6nLqCEC3gRABB2maPJMA+xZnkJKcUbXv4NxuA+TeTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RDkWyc34; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RDkWyc34"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4996e2575dbso2595e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 12:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786564082; cv=none;
        d=google.com; s=arc-20260327;
        b=iFJyABSCmxZmPAOIGfQgqz6xOqPv9Ks9xmZYxktFCrnI2/Gv3XRHF8dtHD0gOJeJB3
         kkV4hPcUJwcDZ9m4/NYmOrRC7rT4D2qbS3T8MlR/ZS6LNnSijJom2UoscqS+1ZHUAL7W
         gLnnTZ8TaoFi+YdShxiV9XBeKOUpScUXa4usfJQOq8SPiz+4d0Ra0V5L028Avk2nV1f8
         k/akV09Z4YLLxSlbbQCHTLSfuvXs3bH7f+tJkzur0ahQUalxUV3UqwT0iw+aFUpyMPXB
         KDWssqVVSoZCISOX3x2sZ4Jj2WgkexwPEKfuGZoMsjoPSMLrbJbfyEFFHIhgfmFU7vxE
         sg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1DVjTbKTXkhH1yUwpD/lgRqJn/mvRVunuCZAxUjSgDU=;
        fh=IlYa86sY714WP5B5+67rVN28Qko32jX8dkyqVltqQF4=;
        b=VXES6d7m6m+CXM0/UE601pZNZCtiMWWAvNAGgo2pfkauWr++qt3Hdsxy2BpjdOPHrw
         rPUx+32w6GYr/JmxZeBljeh67x448VyrUwfSc/Di+4uDihHsPIsQ9NbRPK5p28HhiFkZ
         GCVtBmRhGjWMl7L91ScWv+dAcvtcRC2HXEjVdBoUJ52JoH69d49hXUzErBBWML1folzK
         5iifZXSm3yomuFhPh2pOov48Mz7ls4VJU6fr0n8j6YOEcbMS4q79XH/MMff/HBhAxp8y
         kA8XEExJLfLGrGUT3nKuHYUJpbw8MfTAbfNMsz5IgC4Yxe67tJL1PlhD4raEy8llqrEA
         Wk6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786564082; x=1787168882; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DVjTbKTXkhH1yUwpD/lgRqJn/mvRVunuCZAxUjSgDU=;
        b=RDkWyc34VQg53X+mHtwMrao9rfu5WV5wzl1Wy7L5hDIXEXOxRK9c3xNicBYnKxE8y8
         7s3rPBQ/AvMGfpLbjXMXfSah2HdSZDmdOlAlmZyU+Kq7584/wMHO2x1mKBE2TajiY79W
         eXIL+zSyNvv7ydvSc+cOjMJ7X/6Ph8do3IbU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564082; x=1787168882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1DVjTbKTXkhH1yUwpD/lgRqJn/mvRVunuCZAxUjSgDU=;
        b=Bx12DHuaCptBD7wlvaktqK7wJZM+DCIO5RXwAfwgoPfNfcBmlkPBdTCQ4ToFC8K2gU
         AoiYNC17/Cwd0DDWVK0CAawrUT1VJOsMTQtFnxPq1q/1Bx0Hn1Ct09zXU7Nbz/Pk/3I+
         bfIEYnvgNtUkh8U1ZfU2OF4WQw3wVkw0VhlXQ4f6XgS0HTZE0MWNovBGzMnj6H6nhwzK
         auXwmX1XDMh2AEgm/N0vl9tbdONIm7ygFMuPNIfjV/+sLdf9tYDCLIF74pbRo49mx2Vp
         oKYX+9KsHb7Zhgpoa5x2gjBZFPSOoQpIbJZ+i6AfRAfOFMBWN0loo5hF3hZfYrMQzoEq
         akbA==
X-Forwarded-Encrypted: i=1; AHgh+RoixBvSJczXygo+Hl80ETxRNpVLk82AT8HPJ7OuoU8HGFq+McPBUYfff0WkDIa0dQy/07Tth+f5JFCR4QzKda4Bc+eY@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpl5FdkQywtTsKJQ7VlOy/WDhJ/wc6jgPLe5AQT8GC+wUnnSU
	LFoEDU058F06VO4QvtT22OibXDq8tR18meLy68rqRpn2yWXkdQPb6JeV25JQDm5P5tO2DvMhKY+
	qHwgJXxVX1p9lK9Jw/4X+W/iJlAPD8K6P2T8TF90j
X-Gm-Gg: AR+sD124waDDUDBEpacsP6jQnlj+e4xIgfdcUFtv45HTkEPzfcvCECaYAhy32o58uFD
	5pkpca2oY3QE9qrbOPMp62Ys5pHw967yKchHUYR1E4pWxMdHDPafCPd9MH0cmEl2uQptGRZ8dPA
	JPnDIqWRgXpHQDteu9rt6Z4EbXw8I6hzqqUwqSnP2qxPfkip0Dn4VPVsnrxbD9srC0msHtqWJDi
	Dw9TEVK5l9cXDNUUi1jR2pGuSQUixQ9yXlOicBLcXg5ZEfMHFdsRpJewylAY0mbrOfUyft72n/l
	9QvJSpIXp9jyN40aSuZx63uRvto2Hu1C1jFRdK2/EZt/n+OqJ1XHis6ASXdhH9UwuR6+3B/gfs1
	UF78=
X-Received: by 2002:a05:600c:a29f:b0:495:4069:b0de with SMTP id
 5b1f17b1804b1-49981fabe30mr92875e9.9.1786564080986; Wed, 12 Aug 2026 12:48:00
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785838269.git.sean@starlabs.systems> <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com> <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
 <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com>
 <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com> <CAODwPW8B2-i4Ne-ZTVUM_H-EZwn2hoaC4joRhxNM=CREDd_aUg@mail.gmail.com>
 <c8e4a3d3-a96d-4fd1-85a6-881e68385c83@oss.qualcomm.com>
In-Reply-To: <c8e4a3d3-a96d-4fd1-85a6-881e68385c83@oss.qualcomm.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 12 Aug 2026 12:47:48 -0700
X-Gm-Features: AUfX_mxfmohhDd7NwZ5OlHrJ4eVefwPyRshu_429PA-DB0FUH4Xn3jxZI6eV4zY
Message-ID: <CAODwPW__tskkkqSREHFAf9iG17oYfG5Li-1kh0y8pX=z0W_31A@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to coreboot
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Julius Werner <jwerner@chromium.org>, Sean Rhodes <sean@starlabs.systems>, 
	chrome-platform@lists.linux.dev, Corentin Chary <corentin.chary@gmail.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Huacai Chen <chenhuacai@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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

> I do not consider marketing or pure "I do not like this name" as valid
> reasons, because this is developer string (or kernel/distro
> configurator) not end-user visible thing. And for us, the developers,
> this marketing does not matter.

I'm not sure I'd agree that naming doesn't matter for developers? The
style guide has an entire section about choosing good names for C
symbols, I don't think Kconfig symbols are fundamentally different in
that regard; they're still strings developers read to find and make
sense of things, and leaving something with the wrong name makes it
harder for the reading developer to find and understand it. (This
isn't about "marketing", btw, Google the company doesn't care whether
this driver is called GOOGLE or COREBOOT. I care as a kernel developer
that this driver has been mostly used for something else than what it
was originally labeled for for a long while and it's high time that we
correct that to avoid confusing people.)

> Anyway, defconfig change must be separate because it goes via different
> tree, unless this is non bisectable. Keeping it here initially confused
> me into thinking you are actually breaking use cases (which you are not).

Fair enough. So Sean, could you maybe split this out into this patch
which does everything (the renaming and adding of transitional
symbols) except for the arm64 defconfig change, and then the defconfig
change as a separate patch at the end of the series so that it can go
through a different tree?

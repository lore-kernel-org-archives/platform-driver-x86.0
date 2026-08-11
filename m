Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E936EAAC
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474375; cv=none; b=P2NRB0LCd481L+kxov570jtAcxqDAhr0QqZgGOiwH+w0afZp5cCSjaH6Uc3pIhHZAAObLyCDfH22Dlm3vLBqzQ5fSc1s3eF4WJzWi0EW9wtJnQx3C1b6jko04es6lmEtBvDfrQy9AAo/Js0ujXvfIV3g9aEu2AmB0PnODzAU5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474375; c=relaxed/simple;
	bh=JR5HHb27zLtgTE3jEjvE5O4QP0G2THjkTCSY0L3E8eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFNUtJgjW8DgGXFmN4ZLi/A5USEZp8gCdjBLafxxSBpS5PSFAizhkhraUJtajEpzIQKDuNc9stkrcicyvpPUC9e+D2O633YqCb4Ulwb217pBdF7s3wjBUA7Iz/RhrIpsKVCsQM+V/x13x3j6qaoKtcf02un7NgCAZzcx1TQZRC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IOnYtbli; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IOnYtbli"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9aea40d799so81308a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786474373; x=1787079173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/A62uLpxfiS9evE/MOrYEJH336pQ9QO0r0n78qP4dLA=;
        b=IOnYtbliaqu+7xdBzneiM/93LZYG6WvEEKZRB5AZSDnsoc5Oy0miX4Wjv0jxS0/PZ4
         KcGoW29sqwS907I7CiQxcSmV6PssyypRxFPv/scw3R/LfbHIllyWfX5OrTMNAYYALHt6
         hcIAJzXTEzNLyB9zSoLfJKAR3INMUAu7mWQDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474373; x=1787079173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A62uLpxfiS9evE/MOrYEJH336pQ9QO0r0n78qP4dLA=;
        b=EkAES72ElXfSZcxHXeMx1bEAhwhnuo35kDb4DxfSxnDWiH7VF40yYQlcIWpPXYjwdz
         WQfDB48mhlrw52Mh3iaOOjw6V8eQISzCDr7ZLqeraL1Bh7DnZklBsTQkoP/gm2A3DxIo
         NycliJLWOhnGgWEy5mqlsgHyyopBNZyuhyOpxoIgu3tS2go+9mx7bdq48DqDx/DNSD55
         3MzRPFBlBtWpYXeJ+yuWjsg469JQWUiGrZDD3KsTJtFdkmLCAyCXO40bD2kzPzb/x2nO
         WeV+oIvGnZxavr1i0l29PJle036Mg4418oNabC0M3RFUu/NqiWozFnrCIiDGA/Uxck5/
         44cA==
X-Forwarded-Encrypted: i=1; AHgh+RpI/0f0KghpHItrpTNQGMemQEuCVSsES9Nf/H42UffoELz0jNaUbWHDogCkb+ihfIqbRCkSdpP10lPb0GwSYYGCsRYR@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbN2tjPDWg+UNpuyRhWMnuzJdsKlKnP9Ka8r63jDyHT6Ia1Xp
	rBU+wHSqGFjnh65xfPitGkPq6ghdjVlzq3krDIks+9i7hnEgUKXbM4W7lFtnOHFi9g==
X-Gm-Gg: AR+sD102zONduP304laUG4hzSpbkSv84Rzkf+NVvxQ3WyFpimjChKftrxOdkX4HIrqx
	+WtVkTHnSbonwPpbnV4HFKeJOCeFJttJEWIxHtWL8bsR1ERMkvNIC3RUqptFWsgMfVbejGBeMg6
	6BzSArtAjpoP1Md1tF4IcKCgRbopthwLB511ENG2PrXOhkYCchH/Vf32yI3SUAtVX9loHlZQY+G
	FC4HUvsumbj2Iax2rt64aDk+FB5fi4k0bS+Dr5YaDTDx7Dzx6QSJ43jeAlMDmerKC41uKwBRVgQ
	uuFQoQXGbvzkYlgpwrvPd4GlPQzc0nol78A6en7lxjf73Oy+obmSHifPSZ4BbGIOM3g93Sm7y23
	UwvFp/Y1VjRib0mdk/gyZLXEfzBgIUq2sY4Et5Jl2OCUtnojH2M+CnhcqlLPWaz+wPgEJVnGK88
	OHy3SKMmA9VuATcYsw+AjZOIuRVKnKxve+Iq10geVf5mNifxoAtZPSWupJ+TF8LEzmRQTJLBdcJ
	MGpdf4ZtI7eHxoY4Pqf/Yi2nNM=
X-Received: by 2002:a05:6a21:699:b0:3c4:396d:4a7f with SMTP id adf61e73a8af0-3cc2ba20ae3mr7611480637.15.1786474373068;
        Tue, 11 Aug 2026 11:52:53 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79fa:d268:80cb:4947])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-31cf6d7a3c7sm2872543eec.29.2026.08.11.11.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 11:52:52 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:52:49 -0700
From: Brian Norris <briannorris@chromium.org>
To: Sean Rhodes <sean@starlabs.systems>
Cc: chrome-platform@lists.linux.dev, corentin.chary@gmail.com,
	luke@ljones.dev, denis.benato@linux.dev, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com,
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com, josh@joshuagrisham.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com, florian.fainelli@broadcom.com,
	chenhuacai@kernel.org, mst@redhat.com, wenst@chromium.org,
	tzungbi@kernel.org, jwerner@chromium.org, tzimmermann@suse.de,
	javierm@redhat.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org,
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com,
	arnd@arndb.de, ebiggers@kernel.org, luca.weiss@fairphone.com,
	michal.simek@amd.com, sven@kernel.org, u.kleine-koenig@baylibre.com,
	bhelgaas@google.com, dakr@kernel.org, o-takashi@sakamocchi.jp,
	titouan.ameline@gmail.com, kees@kernel.org,
	dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
Subject: Re: [PATCH v12 3/4] firmware: Rename google firmware directory to
 coreboot
Message-ID: <antvgf6pF8JbW9BA@google.com>
References: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>

Hi Sean,

On Thu, Aug 06, 2026 at 01:28:26PM -0700, Sean Rhodes wrote:
> Most drivers in drivers/firmware/google are coreboot table drivers rather
> than Google-specific firmware drivers. Rename the directory to coreboot
> and update the Kconfig prompt, build path and maintainer entry.
> 
> Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
> churn in this mechanical move.
> 
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  MAINTAINERS                                                 | 4 ++--
>  drivers/firmware/Kconfig                                    | 2 +-
>  drivers/firmware/Makefile                                   | 2 +-
>  drivers/firmware/{google => coreboot}/Kconfig               | 6 +++---
>  drivers/firmware/{google => coreboot}/Makefile              | 0
>  drivers/firmware/{google => coreboot}/cbmem.c               | 0
>  drivers/firmware/{google => coreboot}/coreboot_table.c      | 0
>  drivers/firmware/{google => coreboot}/coreboot_table.h      | 0
>  .../firmware/{google => coreboot}/framebuffer-coreboot.c    | 0
>  drivers/firmware/{google => coreboot}/gsmi.c                | 0
>  drivers/firmware/{google => coreboot}/memconsole-coreboot.c | 0
>  .../firmware/{google => coreboot}/memconsole-x86-legacy.c   | 0
>  drivers/firmware/{google => coreboot}/memconsole.c          | 0
>  drivers/firmware/{google => coreboot}/memconsole.h          | 6 +++---
>  drivers/firmware/{google => coreboot}/vpd.c                 | 0
>  drivers/firmware/{google => coreboot}/vpd_decode.c          | 0
>  drivers/firmware/{google => coreboot}/vpd_decode.h          | 0
>  17 files changed, 10 insertions(+), 10 deletions(-)
>  rename drivers/firmware/{google => coreboot}/Kconfig (94%)
>  rename drivers/firmware/{google => coreboot}/Makefile (100%)
>  rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
>  rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
>  rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
>  rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
>  rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
>  rename drivers/firmware/{google => coreboot}/vpd.c (100%)
>  rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
>  rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6a8c271e79d..62ddee473f55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11069,14 +11069,14 @@ S:	Maintained
>  F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
>  F:	drivers/net/ethernet/google
> 
> -GOOGLE FIRMWARE DRIVERS
> +COREBOOT FIRMWARE DRIVERS

I won't weigh in on the Google-to-Coreboot naming, but if you're doing
it...
...this leaves MAINTAINERS sorted incorrectly. You'll need to move this
entry between "CONTROL GROUP ..." and "CORETEMP ...".

>  M:	Tzung-Bi Shih <tzungbi@kernel.org>
>  R:	Brian Norris <briannorris@chromium.org>
>  R:	Julius Werner <jwerner@chromium.org>
>  L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
> -F:	drivers/firmware/google/
> +F:	drivers/firmware/coreboot/
>  F:	include/linux/coreboot.h
> 
>  GOOGLE TENSOR SoC SUPPORT

...

> diff --git a/drivers/firmware/google/Makefile
> b/drivers/firmware/coreboot/Makefile

I think something about how you sent v12 has broken a few things:

 1) some aritificial line-breaks; the above 2 lines should be 1 line.
    This breaks `git am`
 2) the email threading seems missing

v11 and most (all?) previous versions didn't have this problem.

 Brian

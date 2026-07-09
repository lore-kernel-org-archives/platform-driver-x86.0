Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7413A2E0A
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633519; cv=pass; b=AUbx1ovt0+2U2bs7LQmhAaQyhC3/NOIVH5pFxK0LO1JJCcdxB1SGO3+ofnq8ECYMdqgG76uh5fXi7cBB5HkTrc01O0Hvos1cj6g+zXBJZa2ZlJOQfyXs+sOEvKEpEGup8iBup9YUUK4iY1jHRxDxSUFuRewADuGunbhqR2bWJWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633519; c=relaxed/simple;
	bh=97uKos/2iMJDbe8c2Ylsf2FNjqanvMAOyyMPpCzzwcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4Ef95DsZpTBaedxFaBKdkdH3nCZV7hnXKx75+XDQ9LzqBDJ/fjtNBvH7ak7vpcKCl+iwiqc8XrvfoZ8IXtKqXAzULQCrh/W2bCCnq/hpIwMRy3KQfTCbaXwMczeJ8utfmNsklsltsB1H7VPa/6kggjw3mhPJIDaaUdhMqUVqfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XGExDLwA; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XGExDLwA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so20525e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 14:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783633515; cv=none;
        d=google.com; s=arc-20260327;
        b=XLddCK7YQ9YAC55Y9mvR4CUevYYp7npRPVYgcZKj/9nLGVHGGJJNVaD2uDPDP8v2br
         ZOffJQcAbtoSTGwXwXeOzi2XhzsasRJosMOXiTaV8/XLM6mrKS3f6mDunDdHuqbaCR/b
         77tSssYM2QlXvZAfaqVP6kWmkPA+V6WQpjx9xU8iqFEuVoBDyffQZobuXwm1XvDCV9kh
         FlgbjwkKWW1dY7AKmuM2LVMyi7fco/rPa48CY8lFo3MmJG1Z7oQIcpalYm3Iy4LI4rVp
         xy6fC0ar57F5oHe9m/31jJItuRoRE5sS+q1we+0m0GG82gJUhAy32ErvFHrVhEggE+Jw
         OqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJhEfvZFC3LPpnLPjpmX/P5/46H4OYG3hIyps5e/coU=;
        fh=4xTsgTjbWJpIGuXZUbyzgXc7MqM00Dacpvz9LBez+ec=;
        b=L6UnPHdBlAFUhcFOPyd4ccWkDbDo6+e/KUr5bXium41Wuba///otHG5tcswK+Ho6Le
         g5K+uFqu+8BO4YNzzLUT62YiVlJMJWkhlPsxkPt7yLwQg3WdeZaj0jDpB0NUnNWG+uD9
         HuB08HGuD/vT5rQxDa7ORuEKLPOrZ1WZZJBi0gRmudLkMH+FncgsQ6ca2r/dlmBDeaNg
         enChsWikVk6iSlX51XviyFMltHQmzofDKIzN+v9iIwFxcU3xBlMmMYyRN+FPV7CGUd4U
         qpiNmbR5pw7dwAGS5kQXUPBuY99yxFCeMUtXm2GNpujhZR/gYV0cWiZX1bGbW2nBQWvm
         vXbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783633515; x=1784238315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PJhEfvZFC3LPpnLPjpmX/P5/46H4OYG3hIyps5e/coU=;
        b=XGExDLwAhbAVjwC/gFINgbE1rrs6XJOaVFrChHh99Y88IZllsWZk4pXX4YQ8unnVTE
         TvEnZNmQtT57M/DyJpHRvzRL2Mc0DkZ7YIJCYmDZGUTBeagohbNWD969nQ4V0CXRvczI
         YhpLqYC7tuCRUhlL9FgG1uDmA0NcwH+x7nCmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783633515; x=1784238315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJhEfvZFC3LPpnLPjpmX/P5/46H4OYG3hIyps5e/coU=;
        b=cx8VfM3l/WDNHdzy4FsUMKZ2qQFNM56Cmvrss4FgXORDyZOgB96nIY1IxxkaDH/Upq
         gQso3ZfsK+jjFvmtodnO6QKx0OVYBnP69oN/bl0rJaY48pM6kufvYyUno84I6+yonUnf
         ap4cPgUztlbyyJGlx6uPmMjQ6nfGWi1N+nzlwoFcwT2Q49ycWFBZcevxskZY64inbBg4
         UPxDYbttckUrSDi+S7N5KvzLFyHSep6vjsURjMN8IDE0Ei4G5uDVIKYdPC6CTWEGAS01
         RA5ehExSSIehZkMqFVREt3NADbOsgNEsANWn52XbKGRgFhZVUQEnuvWDPhPNzvZoAzf+
         nBfw==
X-Gm-Message-State: AOJu0Yyl7brX81cgZKJIgSiXPd4eR53RWWrKP5GQ0aQY7E6FbtbnjAvW
	ueY5IF/Ts1eP6ubVIQqzKmEE0hSp9u6+uuSuCVDaNHGzLGywF3N4rxlLxkL4O6c5mA3+NFBXP+h
	IXfx5ic73zl6QZhVYROIOcyLpvM7jFRYFgE7X3WVV
X-Gm-Gg: AfdE7ckl/gnAfcBPHsWNuzkKNnaPJgdN9zu2SpRu+ks8OgExEch1FAGaZYyA2HhTlfF
	ooQR3JXWbqtl9b1YZs9/5Vq6HBsfIWIEykHgBbKZEgVfOhcWNC+25J+KQ3uZ1Ad+jUEWMBWqzsH
	DghGLVKtBUHTPC5VjCvPtrRkATI7CCbKll8GpHSSGjCzYBLeee7XLTRptVQrfk/PC57aTymeG2F
	C/0EIKx22Yuqu9VWpI5u5zbL/d7h0DUmbZ24UVjXuOcPvuRsCrfBSjx7TJ1cffGPJW4XXQkeivu
	/mkpeLZoyu208hvBoImdQzrOank=
X-Received: by 2002:a05:600c:a414:b0:493:c1a0:7fdc with SMTP id
 5b1f17b1804b1-493f2acb145mr484755e9.0.1783633514708; Thu, 09 Jul 2026
 14:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783601414.git.sean@starlabs.systems> <1e2a63afb26f989db2179e2aa82f1938068c10dd.1783601414.git.sean@starlabs.systems>
In-Reply-To: <1e2a63afb26f989db2179e2aa82f1938068c10dd.1783601414.git.sean@starlabs.systems>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 9 Jul 2026 14:45:03 -0700
X-Gm-Features: AUfX_myLvshupDDVjc-azRWSfgrwIGthYfsz8I-jkiS6JGfW_xirAaWLBuoRGFg
Message-ID: <CAODwPW-xnHQ5JPAkN9+12C1=3qaavPcQbM5-HCtr5vP5bWdkUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86: Add coreboot CFR firmware attributes
To: Sean Rhodes <sean@starlabs.systems>
Cc: platform-driver-x86@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 5:50=E2=80=AFAM Sean Rhodes <sean@starlabs.systems> =
wrote:
>
> coreboot can publish a CFR tree in its coreboot table to describe
> firmware setup options. Add a firmware-attributes driver for that table
> entry and move the coreboot table bus definitions into <linux/coreboot.h>
> so the driver can bind from outside drivers/firmware/google.
>
> The driver exposes runtime EFI variable-backed boolean, enum and integer
> settings through the firmware-attributes ABI. It only registers settings
> with readable runtime EFI variables, skips suppressed, volatile,
> dependency-gated and non-runtime options, and keeps read-only or inactive
> options read-only in sysfs.
>
> For settings with an APM_CNT runtime-apply record, write the EFI variable
> and ask firmware to apply the setting immediately. If firmware reports a
> failure, restore the old EFI variable value. Settings without a runtime
> apply hook keep the EFI variable update and set pending_reboot.
>
> Tested on a Star Labs Byte with firmware 26.07 and the driver built as a
> module against Linux 6.17: runtime APM_CNT apply was verified with
> power_led, and reboot-needed behavior was verified with debug_level.
>
> Link: https://doc.coreboot.org/drivers/cfr.html
> Link: https://doc.coreboot.org/drivers/cfr_internal.html
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  MAINTAINERS                              |   6 +
>  drivers/firmware/google/coreboot_table.h |  45 --
>  drivers/platform/x86/Kconfig             |  13 +
>  drivers/platform/x86/Makefile            |   1 +
>  drivers/platform/x86/coreboot-cfr.c      | 986 +++++++++++++++++++++++
>  include/linux/coreboot.h                 | 147 ++++
>  6 files changed, 1153 insertions(+), 45 deletions(-)
>  create mode 100644 drivers/platform/x86/coreboot-cfr.c

Is there a specific reason to put this under platform/x86, or are you
just doing that because it's not related to Google? If so I think it's
just time to rename the directory from drivers/firmware/google to
drivers/firmware/coreboot, and then you could just put it next to the
other drivers. The only thing that's still completely unrelated to
coreboot in there is memconsole-legacy.c, but since it's piggy-backing
off the same buffer format as memconsole-coreboot.c I think it would
be fine to just leave it there anyway.

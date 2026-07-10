Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B23DDDA1
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671881; cv=pass; b=JJEd6zEkCQYQoDVqXeJ++GmS+4J+x3brDZgMEB79396F0MWaf8Mrs4Xulp9SmWOQctayvLLe8wyGrtGBZMGNh8Bh4lLV96Zwzv+lx5aGfmWRL7EAWyQLYBgha6sjL8NH8bF0HE6NC1jA2MwN8cU8paLSxawmR5B1y+uxHcWsdxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671881; c=relaxed/simple;
	bh=HFRxqkTILC1gTa2YZXlrdLlbvcZEhSZmE8LdUsNk7Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khx+8jJBu9j2nGjanIDEvOBtsjB2pMRl4EEgvq+8+VDAGtpOUjUXbmnHuFbPOEk9ykuEklfoSJ+b8dUHU8brkWZ5FbWU/o6n+Y57Foy4f3nZD53MMROoetWH604Z8HoXaHLxxvuHQ0rKt6YKl8SIBpOu0CYoosYo5dgT8iRTWA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKesCdPA; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKesCdPA"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so562362e87.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 01:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783671878; cv=none;
        d=google.com; s=arc-20260327;
        b=Y58ryNKQ46E0LHNYaD618U0zcw69VLIXufn0w7mI32sJh1kX9uwm9wKvCKJkbZ4Lva
         4pd8zQtYGfPHGIGj0qqyGKdBhguHBBZls15P3wcOBRcSwNMFxLE5qrPSNI2sgmq9szoU
         BGHg6ITXs4KfZK7TlvRgLZyElYi2nk0FHlRz444LzdyTv1TxupR0b/AOfG7Hp4+ZPGrU
         v8ZrOOMK38g/SOdBuezoNZJ6Q8DvHe+lpzziDiB3hPqLNX3/exwTCx1ZYO0RMPnfrRGj
         OCm6z4+o8KbHSjJ9AG5gXFrmHs/J+ab+wYdQXWqetb7k1GmwOcfnUCuyvfG9mu3RwTb3
         QAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xgYmC/leQRqXDMOV+U09FDj6ipD6P/O6AkutlI1vKbo=;
        fh=5MXsSZ1nZwNBUYoB9a13vh8U7/qemwHbi6m6XkVvwcI=;
        b=U1QurAutygCXk/wOScxvPAfrJMCydnljs2p8J87WggYToYlHd9yqXjjTEm/WEROtQL
         jCLUxejMgZEFG9uVoFO4awMR0cb8wD8jlJeWQTdLDCE/xwy1ko41KxSrbc7Sjx0IjV2p
         MZ47jDcCtKJ5HhzXnsEph2T4vWPFict7oRNYQ7TdPNohybBGuTQALSRipPBpBzSVULlC
         TcktdX6raEbM6LaSkcVL6DsaJLfup6iCU3GygkaBSr6vGCj7aJh5rEe1w9v14c9rkSbY
         PjhjMcCotgQF8fFFnvZE8Jbkkz5uExW2gvKZPM2gXvUU5i9J5RiyqSJU42hJbkKTilZB
         j3Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783671878; x=1784276678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xgYmC/leQRqXDMOV+U09FDj6ipD6P/O6AkutlI1vKbo=;
        b=EKesCdPAaMSxBGa+Xno06lngrxbiLCTdATP428lvNntbiY755dAR6BHmFvSYvgwUkr
         uoFg/ys7wUCRTUDg/I3mHpjI3Z8XSqiuvtsDwhI7nh+U47GfldTg+NMDp3hESwMTyA0+
         YhExn4R2R+HzuH7DXG6L6hdXeC8HwDXoSgI5sdMtiQH1CYeR2oLfUWjmpJp0MBe2cBPk
         G94W7hLekDfsABMqCfr24vdzorD1BjB2sGXqUUw7ICGA5WQxIWd6dXpATZGEzTKqN5/8
         /Z4MCeTClPzZAoDQDE09tyPsXr2C2nr97vEK/+HA0G9eMFRzke2LdUtsuCh7bWPOv7Ix
         A4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671878; x=1784276678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgYmC/leQRqXDMOV+U09FDj6ipD6P/O6AkutlI1vKbo=;
        b=s1lW6X8LbHgFEzsWwgDGgIHZlj1vkWWsc0kL8R0B6OfkFzpsO9TiW+WxrKrhH+1f1v
         /52z9kUohiAO6EcbkU/QO7mWjD+5mMUvb+oryKCyyk0b5IaaVYNfgc3VCAslASjhb2M3
         9Z9Ixp60iMuz+YVTvza9PIYD7rpSTUiddqO2a3YEkOu+rftsta3zx17v/6X7AodeCZOX
         zOH6SBAPrZbcTm6c0NHFXSbTv8rLKVfBgvBeE8IPYt28tdO75LywfNT1xhfVwWwJkHHJ
         TGVgn4BNnmtgRR05TZRyCakhnXsVT4iapmxuXnSLhL7DGVSh6fCdKoP3SldTLLm5to/z
         WKJg==
X-Gm-Message-State: AOJu0YwrgRwo0Y3//a3qSR7fN7ebu0ENTeVvOqtiE/AfLyM70CK1DPiZ
	pzJR8+w3rBm8+UEl5mrhoAsxeuqL2GoKCNTgZN9kUD7cG76OLGldDg5TrpVDCKR5ck7BIZCp08b
	ZP8YYrCzk/xxWH3fb0ElFcbAxScdJADrzcQspQMXBcw==
X-Gm-Gg: AfdE7clyXFIvLGOx3Wu7SPSk4NxJ5Hd0KKeNHsRd7SR/pc2+G6grgWETgrJitkN77dv
	OhVXeH8gGuidXNqxozrSzOFB1ObTqztPzpYn4M6Ub/R8LmHFY7K9pB0oLeb4pqXDiWYaQoNgfsg
	76xjJg6QeJgmZA6z73nFFfVLSCkM9zH1+aTltOKXhBsbMT2eEEGke03ClCMvf4dUxA+Lkq8mjR+
	p2cEG5+Tpr7XAKjdTDDXj+ShLOGLp+L1MF7r1O6OVUO7YeZiW8XMQOpR9PXBwRTjLETL3lPaw9e
	YwjN
X-Received: by 2002:a05:6512:4507:b0:5ae:b764:3ba5 with SMTP id
 2adb3069b0e04-5b01147fbadmr2335281e87.64.1783671877994; Fri, 10 Jul 2026
 01:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709021504.465792-1-vishnuocv@gmail.com> <239c8162-e1e6-4b49-8292-35547c5a525c@liuxiaozhen.dev>
In-Reply-To: <239c8162-e1e6-4b49-8292-35547c5a525c@liuxiaozhen.dev>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Fri, 10 Jul 2026 17:24:00 +0900
X-Gm-Features: AVVi8CdJHOTuRUbVyX9EDCsmYkHyncA5b_--6_5gEe0H34M3a0_AcbJco12MIH4
Message-ID: <CABxCQKtAYt7heT8a+GknA_4n+znA3+-=eRzuuky1RTLO+KNK0A@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
To: oliver@liuxiaozhen.dev
Cc: platform-driver-x86@vger.kernel.org, mark.pearson@lenovo.com, 
	linux-acpi@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	vsankar@lenovo.com, mpearson-lenovo@squebb.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

Thank you for testing and reporting this.

On systems where the USCS ACPI method does not exist, acpi_evalf()
returns AE_NOT_FOUND which maps to -EIO rather than -ENODEV. This
causes tpacpi_usbc_security_init() to propagate the error and
thinkpad_acpi fails to probe entirely.

Apologies for missing this =E2=80=94 I only tested on a system that has the
USCS method present.

I believe the fix is to check for USCS method presence before
attempting to call it, using acpi_has_method() which is already used
elsewhere in the driver for the same purpose:

  static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
  {
      int err;

      if (!acpi_has_method(hkey_handle, "USCS"))
          return -ENODEV;

      err =3D usbc_security_query(&tp_features.usbc_security_enabled);
      if (err =3D=3D -ENODEV)
          return -ENODEV;
      if (err)
          return err;

      tp_features.usbc_security_supported =3D true;
      return 0;
  }

I am expecting this change to fix the issue (not yet tested).

Ilpo,
since this is already in your tree, please let me know if you would
like me to send a fixup patch or if you prefer to handle it directly
or if you prefer a v5 with this addressed.

Sorry for the inconvenience caused.

Thanks and regards,

Vishnu

On Fri, Jul 10, 2026 at 4:52=E2=80=AFPM Oliver Lin <oliver@liuxiaozhen.dev>=
 wrote:
>
> Hi Vishnu,
>
> I tested v4 on a Lenovo ThinkPad P15 Gen 1.
>
> System:
>    - Lenovo ThinkPad P15 Gen 1
>    - BIOS: N30ET47W (1.30)
>    - Kernel: 7.2.0-rc2 + this patch
>
> I checked the BIOS setup and could not find any USB-C Security (USCS)
> option.
>
> During boot, I get:
>
>
> ```
>
>    thinkpad_acpi: acpi_evalf(USCS, dd, ...) failed: AE_NOT_FOUND
>    thinkpad_acpi: required events 0x00720000 not enabled!
>    thinkpad_acpi: probe with driver thinkpad_acpi failed with error -5
>    thinkpad_acpi: unable to register main platform driver
>
> ```
>
>
> As a result, thinkpad_acpi fails to probe and
> /sys/devices/platform/thinkpad_acpi/ is not created.
>
> It looks like systems without the USCS ACPI method may fail to load
> thinkpad_acpi with this patch applied.
>
> Please let me know if you would like me to provide the full dmesg log or
>
> test a revised version.
>
>
> If needed, I can also test on a ThinkPad P50s.
>
>
> Thanks,
> Oliver Lin



--=20

Regards,

      Vishnu Sankar

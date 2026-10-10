Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E8367B71
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 01:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595783; cv=none; b=pIAzHU+A17pxruKv9Z+M8Pm2LtRbrG6+Z8PVFElq/VTppTBwzJXPMaasj1zsRw29j8K/LoxwVTAi+Xl5VYfqfRAqG/xhD9KQE/QRRTeDPzBCmEkB+fzy/IGf6hpVgAf973Txp2YBOeIKpaum0CfrAFDfWK5ZwkiyAV9qnodjxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595783; c=relaxed/simple;
	bh=KBTgGPXwqYMTvTgguf27DJ1ah3djAKSMH1oBB+BYjq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VngSOMZiN9ncEQ6+vPSprGBetMQc0LBFPKuy23Xqu+Yw+mTPnc2IzFbKc1azpge7Ljm/m7g2oM7WJkLZa/C9h0pqYRZ/heUx3i64gLDYEybM124giTTNO3DiA2NyL5L6GegGHg1AM4jP9ixI9Z6v/bipiRKwbPOWJE6GM33mMFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIyvOiLU; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIyvOiLU"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15168a20b47so236041c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2026 18:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791595782; x=1792200582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H3zas76OUfhL96GeojGYBzXO7tmHzkqw0ykYvlYF/R0=;
        b=BIyvOiLUktNI4wNDChBGQQcssfi2Oz/4ct19FTXz9CsxwpdSD/lJGCFuemIE8FBabU
         MwZLYgkTpALz4UhfmUMFV56PrWWoXJM10qYD8k/mh/mlTUJ4xKxQMHB9GgSXr7jWGc9C
         LC0XRL78N9tvhoAIu1+Kfp4+YxVnw3cJNXjTm9K3z1yH68Brs6n076BiFRnF5vWqw4FC
         SgQsG4+FS2yVEJI3HpHB6TPNMnrFQCRwIxaNo1y+1aMS9/cfAJrep2cDNWvvoFFkPvXl
         nNY3SYf72YhMmulO4m/9H1X6lcW2frswjhjhYztsW4956SYMCL/Hk/TZSNTqPugRPsxF
         LuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791595782; x=1792200582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3zas76OUfhL96GeojGYBzXO7tmHzkqw0ykYvlYF/R0=;
        b=tT30CQymxhLwVRqvXVSuuCokodM1VHCZANveN1H+FhLN//Vh1MaF9BdKytB6eHo6eC
         uYmj1TiIb+gUilapmctN/grrI/7rR/VusiZBW+08J7sTFTI7/VdCkl8vvZBCX4Moaaan
         KzoPkUmlf2TAbHtO187ZjB3l5KyKcMBaLXhtM/VnmhE1rCoww8OoPYOFsBkj8Ep8HNX+
         uG9Cn7p5ht+zdQU63Rcq0075ET+f8dBJxnoO2BCdNj/CpS8yNbBx++0QlQCE1ciG/nh6
         1mM7E0Teu7+oZgu+IWrSNfcIFJNUeMRoQob9TNjd/vz0i7sMDmXXoFiRVOlg3jbjdlM4
         tNPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBUerN0GqN2oFoOtB2YVKLOyBUaZQlhVYZkCzrpSP0Wnr/La4pC++NSydXTibsbHWMXtCoqftJ0QqhYoRQqikplnOa@vger.kernel.org
X-Gm-Message-State: AFq9FYLTrheelCzedeAqP+KbHC3M7WcozsrQ4UJNKQh24Ppq6qW02Uky
	jNGC9gQhEi9E2iy2/nWPzdGcOKV29frMi7LO4lV0iok5XrMn34lga3Rv
X-Gm-Gg: AYBFou2VZWrsFSXprsHfyHewBznYUFUEMAlwuJqNoadbRJ3dinMCbNeIFapyX2k4A56
	wDlASSuprSJ34ZDc+uB+UMCIM6oCejLxsTwlImLAQ8WvFa5leM+cY1SLqZQ8gISgG3aajoTCTm5
	3HbrPGdN9XBMVg3Luhwb41hNU66MpfDpQyG/L1bOFFP9hd4Ye7xUG9KiLd/6WAVOVLYPsqXLnGx
	h6IMhg8oJX35SsQ1wlNRmgHc9+BI3jYm4H2+dNKgXNPOGnIqu7hxBBfsUucoc1ypRwlc8aFrSod
	ZKUKse53fnqdd4XJvFJYE9IdfehOJZVzT6rywnuq/WtX1B4ymZ0qWRmshFItU4xRCQ4OkaZhRmi
	OOYJOrzaPDJABbSFaKjb7TiLFtiWqhgew4y9HeNDf0HF+FFpREFKaO1V5f3phzRtc992j/FY4fL
	j4YXx5l0OjPDsnA5FJ7LL89K63koErKPB4qLFV8w4IgV4gI/OsnGZ03UatwYuvq3N5xEg3pRky9
	BrPea5VjMYa/hJDu1VyW63F7Ij9LeBVW8cjoZXf
X-Received: by 2002:a05:7022:e888:b0:168:6ad8:e89d with SMTP id a92af1059eb24-16a5dbfe727mr5007124c88.11.1791595781518;
        Fri, 09 Oct 2026 18:29:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7ea:19aa:c6f7:8c02])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm8624343c88.19.2026.10.09.18.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:29:40 -0700 (PDT)
Date: Fri, 9 Oct 2026 18:29:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Oleksii Kryvenko <diver.ua@gmail.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] thinkpad_acpi: probe deadlocks in
 hotkey_poll_setup() (next-20261008)
Message-ID: <asmU_fdpt0I_JQK8@google.com>
References: <20261010002413.30007-1-krivenko@itstep.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010002413.30007-1-krivenko@itstep.org>

Hi Oleksii,

On Sat, Oct 10, 2026 at 03:20:24AM +0300, Oleksii Kryvenko wrote:
> On next-20261008, thinkpad_acpi hangs in probe on my ThinkPad
> X9-15 Gen 1 (CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y):
>
>   INFO: task (udev-worker):537 blocked for more than 120 seconds.
>    __mutex_lock.constprop.0+0x569/0xa30
>    hotkey_poll_setup+0x50/0x110 [thinkpad_acpi]
>    hotkey_inputdev_open+0x36/0x50 [thinkpad_acpi]
>    input_open_device+0xa7/0x170
>    kbd_connect+0x73/0x90
>    input_attach_handler.isra.0+0x6f/0x90
>    input_register_device.cold+0xd5/0x16f
>    tpacpi_pdriver_probe+0x442/0x4a0 [thinkpad_acpi]
>   INFO: task (udev-worker):537 is blocked on a mutex likely owned by task (udev-worker):537.
>
> The input core calls ->open() with dev->mutex held, and since
> d6479c25ecef ("platform/x86: thinkpad_acpi: Use
> input_device_enabled()") hotkey_poll_setup() takes that same mutex
> again.

Thanks for the report. I posted a fix for this earlier in the original
patch thread here:

https://lore.kernel.org/all/ar1iwx_390hWw_e7@google.com/

Instead of taking tpacpi_inputdev->mutex or reading dev->users directly,
it tracks whether the input device is open via a driver-local flag
protected by hotkey_mutex, which also keeps polling suppression working
properly when the device is inhibited.

I will send it out as a standalone patch shortly so it does not get lost.

Thanks.

-- 
Dmitry

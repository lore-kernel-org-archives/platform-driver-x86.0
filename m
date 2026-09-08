Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9954EEAE
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884004; cv=none; b=niYOKM0Y///dbTGvmcNj6Vus9/mEeeMbMeoHqnDSogXxv7is8RtVwMrHUy/CZsDnSMwf60WhqhPe0gjTFptTZivQArc5+0EfOobvxMvTae6RDNxBBn/jbgQgAx9bQzutbJae9Shb4xYO+fJRrz2hOxEM//kQ8CULEdjAtM8XEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884004; c=relaxed/simple;
	bh=QpWWOwFBULeKwYI4PCedm3/zoOvVb+lhUJD3npEojNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msKAF+gos5T3V4beXGo5Eux5N8l87D7t4Zh7YoBrYRMytefkcukR/Zq6kSE7PeMt8NcA9llPWBwP+u7neeRUPpBD+OTe98hb5o+pSsvyn1FWWFOhSQc6LU5/1WbcWT7V4teXZnGCcHVMZfhv3Y8A/aQE+4N6Ie8dbM5W/6jMH4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnGilOSX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnGilOSX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso60400225e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883996; x=1789488796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZozWtHmNmFGuuXS6rdSiwWmzJrbj3zMVvcx41YYesA=;
        b=SnGilOSXtKXLaV8URfU9kS+2KjHUs0CgWyL6QMqRmQVNUIqv+vZpuItpucgTLOv7Rt
         m1FnKQN0vmozNALEOmp36wWMLweiIXIxlRis4ngI274awT5JTvLiTf4G5R2C0JhfyoH/
         SWAY9jbgyyuolLTzTM5fQRgEdeGXICONY/QpXeLZ5kZW/J12UGZJfCOqjEeKUxbkYiAT
         mGC+P4Uogxwc+/UCBu/6/aJNVSNAqbrFM5jvTPLjvfqHMbznxn60TLbTYqzLV1xDkK5o
         LCDaOKFr7UUrKZd9BbdS7zangrSs7KQ7qrwn+gDcPh1HGtvld+fwtZwxIyLgFH05dmIe
         RgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883996; x=1789488796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZozWtHmNmFGuuXS6rdSiwWmzJrbj3zMVvcx41YYesA=;
        b=RTNCfzPjr7TX0ZnMC1cy9WEHxmw5fggvUZkgcvw/GysONrKKZhYR6MXQv/N98j+OvX
         /466MFm7TyaixoxRwREqKJFbeqUu7hRqj1Z0fGUlAGMK4viYmeK05EEtWqoSBgImM0HR
         rAFL525WEfYOPbegfHhTI9R7uMPhsTUD/XAUcfG7rJx80MzrDXUFK1eNXDfMad8gzHCb
         npws5KXHYlWeFiY6sbRb27/2oyFATHEprf5KJm5tZjPi7KnTZy0wRMqSBfe8dYoRE2TT
         FfYOL9o7fnkPvjtITRtQvkUGcSh+k88E/+f/o+2V9z74lyJhzTXVAGeW+CtWCoI2czoo
         d5HA==
X-Forwarded-Encrypted: i=1; AKwUvByF6iBzekFJBoP8QdG/K6OoKelg75Anei0JmQKIrr2B58JQShxfnNAy+5V+QLiz58gyu4KIvtDZKh5tAcUHALs34faH@vger.kernel.org
X-Gm-Message-State: AFuF++mpIX+jeW4fpfl8n7YTz+10gahLCQl6qd6NXfAlr8R/nZyNmIm4
	oAkm3Gy0bXEv6AUR5JziE/xQ5YLYSIQKYCHDN6Oqw+SHi6HSMABGUao=
X-Gm-Gg: AYBFou3NCQhg8xrDdky/s2tGGCHi+w2h6jKvlHiKHlLbDyXGTwq8t4HR/R2q64MhC3R
	XXlvWEQ1OUHw/6wQe5HS1Cl9nY8W/LE2Sq3/eyi0sO47DYUolt7SQ1kcQfoxfov7mLQpeiTtIhD
	x6uBtwszakzHY9ql4euQvV25QeCUXC/XQNoGR6sFJMyq3dPIp+JDYfdoEdcgD1vjXxKObDFrm4D
	mHhxCAaRMwXMT8ggAewKN46m8n/9nyijO3H1pTJtN9s/vvl/Bvw6I3+cLkCu2yMfgJTnIx+pxKm
	O+W3Rc51PvSywDr5qPHhDA6KwKnDPNks7hzObeH7ywz4daM3aZJV1BdXWNul58BfwqG+T/9wxPi
	LOION3WrzmPmDiPPRt3Grt2alJef8l2uQnwYCb4g5M2YXBv7AO1BqC5tkQG+yCsWeJfem9r0aEg
	+jo6Zrmzg8nrosZr9jfAU5XszopIwYSgdafQL/iNDueUZbfD7FjgkEPVvGUUebtDR2rJpNmSpBz
	o+gAx8l6XF47A2pWa6RYRGq0CZNXFXX36xeJPcJYidMt3tY4UuZdh/Om6k=
X-Received: by 2002:a05:600d:8445:10b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49cf825d77amr217235175e9.11.1788883996080;
        Tue, 08 Sep 2026 09:13:16 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm404906985e9.0.2026.09.08.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:13:15 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thierry Chatard <tchatard@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: int3472: Add TPS68470 board data for Dell Latitude 7275
Date: Tue,  8 Sep 2026 18:13:22 +0200
Message-ID: <20260908161322.334690-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apptlIQexoFg42DF@kekkonen.localdomain>
References: <20260904062006.39209-1-dmanresa@gmail.com> <apptlIQexoFg42DF@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Fri, 4 Sep 2026, Sakari Ailus wrote:
> What's below would better fit after the '---' line.

Will do in v2.

> Is this the same issue than for Latutude 5285 here
> <URL:https://lore.kernel.org/linux-media/20260831160754.9857-1-tchatard@gmail.com/>?

Yes, exactly the same. On the 7275 the GEXP device declares

  OperationRegion (BAR0, SystemMemory, SB04, 0x0208)

and the I2C4 controller (INT3446) builds its _CRS from the same SB04
variable, so intel_lpss_acpi fails with -EBUSY unless
acpi_enforce_resources=lax is given. Thierry's patch 1/8 fixes it here
too once a "Latitude 7275" entry is added to intel_lpss_quirk_dmi[]. I'll
send that as a small patch on top of his series; Thierry, if you would
rather fold it into v11, I'm happy to provide a Tested-by.

The other 5285 quirk, the static clock consumer list for the broken
INT3479 _DEP, is not needed on the 7275: tps68470-clk already lists
i2c-INT3479:00 as a consumer in clk_summary.

Thanks,
D.

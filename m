Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0F642B756
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423461; cv=none; b=r+u/6c2h2DE8ec1KOroTIOVX6kRD+Oz8sI1IU5R/L6Y1f3EDQ/m0Qz2UrIYM6wk/R2l7jGrQIfpxhaxKwdyo/GNEli1WGMf1LXkDkjlZDre26fYzh7jiHMlIkHZfegtVK6Z9TfL4zDwCJAqPXX5EFDUqEhVIGA2Yl1+ihnHygAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423461; c=relaxed/simple;
	bh=SyjBTVgAfVH+5pZ96S0t5B+ExtC3L0RJbZJUJVgIiXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WcDAJQ58NgG/5gAujo5eC5Zy53c2IcHHn6xDYY5yzmIMKoc30J3K+xs9r88MTqspYFwyX3DIJWyZml1hSSTdQ+asB1G8KI9S1COCYSEyT6yX9oqdlFFZaBw8b7lgfnuyT94bUxOuou7abdo7opmlKTXAAVE7vDVTu3LcY57a9S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=plTG4T5T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plTG4T5T"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso14440645e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Sep 2026 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788423458; x=1789028258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+82u+VPDiTqb4aWxxVynU7CqEmkdg56YaZZ1NJVLaO0=;
        b=plTG4T5TqnzIG5nG1wiTWE+d8ECOzgpMwPS3hIWAClkNl1q25ZCmpGcsFy+U/dR+TM
         u+4jdFD6tq1VR0x1WLz1mnv+wNGFEWUYDEea8znJWWwb+cQeQWoHP8YtqXfzEA1DSDby
         aRQIBuNiv08Xnh67SBJDlgV0R5V4Wet2i6tRzw5fLTSkTE9S5HB1wdkKypWSU+ADf/gF
         SeL/rQIkMtSnDieHGL0iYZUqD0lHfqmsN2YQaoQ7DgegyyET9SK/41EfeqdBLtSvplbV
         SW2+XSRxa+CX75bd5QWc3BIV04ReOPYGOAl/HTbR669rCF5FE1osmwNcTht/9NNQ34Nt
         /Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423458; x=1789028258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+82u+VPDiTqb4aWxxVynU7CqEmkdg56YaZZ1NJVLaO0=;
        b=Ksf6PVLSa4lOXhgL6fE1OJt3WuRxLnDcmXpQUpS90P0HDcYXMR+ouZVPrvyxphr1xM
         lqPeIDEtvr7SqD01P78iavu0cE65mLco79bGmgsCcoIW0bp1+A0CHUjS3nD3IVuEKsha
         /TPA8WnjPsvQeGUD0wc/22r9vUUaYKuRqQJRVRH5rcgOO8fFafmSWPd6FJKqVuZlGckA
         oAzYU0eCd4mgyG2b51OMj9ahbr/PCUMHOkkB+W6CY7mHIOw8HmSu1JH5Sz5fB9AtHQU2
         MG1Tv5e3Dp4lyLIJ058sx5pncybhRM9PmZB2NGBNijmKLKmFN2/MsqoHiWHK6ePzLptE
         pG7w==
X-Gm-Message-State: AFuF++mRUjRjGQkC6YKVb/4tp2K0yghlo1R/AIAafnPMionCQqrJmjXc
	Axox2Q8v4nn2wGJWa6fD8L2GOlBW2ONDmpklO1wyuh4QBGWc4vOtBkt6oe9WFpO8
X-Gm-Gg: AYBFou1PWJj2/X4r0YQ8jRB1VXOf7cim1d4/lYDQ1XQH0JBfGDz9M64FKPWLGHW3f27
	3v4t7bXOIxJWY2/gImpEWPDnUdKh4ZOPTmdMH8IZA+/doq6iUHkjSCUjd61jA7jdJtiBKtlUUNq
	Ncof/lCZqO49vpxSh0AdWhiY7LIQMMhHU4mBJtoRVtDoEb6K4CfjAmDS4K4haRgAR4EQY2ufj46
	tB55ex35L1j1dPIEamGcY35Ltw/28VMX5WVakzf2SzVSe9OA1kxWABKi5CmqRtS/gmHqwtdh0AX
	cczKKbaC33zS0otWPIMW0KJBX2v5ZQuMo80xLX1NDsn9OqGzxH0Ocwhy3AO/CplAiyP2v+oxPO1
	/AjHMAKOkhdvogOQ3hG99aR4bGrAHBmobxF5jqx+jl+QyS1NesFUZXwUUFYv5JilSgSE7SXYjOd
	IhwKGIWQqEpwP3YXm5yvM7wgGCbz1K/igLCdRRySadGGWssnnE0YuvsSWZOPevuPNSgHHRlbKL+
	hDVbgfmDfuhYlwU5BRhNS9+F8mRJK+qwKHUE4L22CfDeY+i4ycHrA==
X-Received: by 2002:a05:600c:1d14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49ce583e94cmr170139925e9.10.1788423457493;
        Thu, 03 Sep 2026 01:17:37 -0700 (PDT)
Received: from localhost.localdomain (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2531232sm25711605e9.7.2026.09.03.01.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:17:37 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: [BUG] platform/x86: int3472/discrete: unknown GPIO type 0x08 breaks OV13858 rear camera on Surface Pro 11/12 Business (INT3472:00 / OVTID858)
Date: Thu,  3 Sep 2026 10:15:56 +0200
Message-ID: <20260903081557.16603-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On the Microsoft Surface Pro 11/12 Business (Intel Lunar Lake, IPU7),
the rear camera sensor (ov13858, ACPI HID OVTID858) fails to probe.
I've traced the root cause to int3472-discrete not recognizing one of
the GPIO types described in the device's ACPI _DSM data, which leaves
a power/reset-related GPIO unconfigured and the sensor unable to
respond over I2C.

System
------
- Surface Pro for Business 11th Edition with Intel (Intel Lunar Lake, IPU7)
- Kernel: 7.2.2 (Arch Linux, vanilla)
- CONFIG_VIDEO_OV13858=m

Evidence
--------

  $ dmesg | grep -iE "int3472|OVTID858"
  [    5.555231] int3472-discrete INT3472:00: GPIO type 0x08 unknown; the sensor may not work
  [    5.788882] ov13858 i2c-OVTID858:00: failed to find sensor: -5
  [    5.789321] ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5

The "GPIO type 0x08 unknown" warning comes from the default case in
skl_int3472_handle_gpio_resources() in drivers/platform/x86/intel/
int3472/discrete.c:

    default:
        dev_warn(int3472->dev,
                 "GPIO type 0x%02x unknown; the sensor may not work\n",
                 type);
        ret = 1;
        break;

~230ms later, ov13858_probe() fails in ov13858_identify_module()
with -EIO (-5) while trying to read the sensor's chip ID register
over I2C - consistent with the sensor not being properly powered/
reset because one of its GPIOs was left unconfigured.

The currently known/handled GPIO types in common.h are:

    INT3472_GPIO_TYPE_RESET        0x00
    INT3472_GPIO_TYPE_POWERDOWN    0x01
    INT3472_GPIO_TYPE_POWER_ENABLE 0x0b
    INT3472_GPIO_TYPE_CLK_ENABLE   0x0c
    INT3472_GPIO_TYPE_PRIVACY_LED  0x0d
    INT3472_GPIO_TYPE_HANDSHAKE    0x12
    INT3472_GPIO_TYPE_HOTPLUG_DETECT 0x13
    (plus DOVDD/STROBE in newer trees)

0x08 does not correspond to any of these, so it's silently skipped
and the sensor is left without whatever line that pin controls.

This is not a boot-time race: I tried unbinding and rebinding the
ov13858 i2c driver well after boot had fully settled, and the probe
fails identically both times, at very different uptimes:

  $ echo "i2c-OVTID858:00" | sudo tee /sys/bus/i2c/drivers/ov13858/unbind
  $ echo "i2c-OVTID858:00" | sudo tee /sys/bus/i2c/drivers/ov13858/bind
  [  470.046844] ov13858 i2c-OVTID858:00: failed to find sensor: -5
  [  470.046855] ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5
  ...
  [  703.417136] ov13858 i2c-OVTID858:00: failed to find sensor: -5
  [  703.417153] ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5

This rules out a probe-ordering/deferral issue and points at a
persistent hardware-configuration gap: whatever pin type 0x08
represents on this board is never toggled/configured, so the sensor
stays in a bad power/reset state indefinitely.

Possible precedent
-------------------
I noticed drivers/platform/x86/intel/int3472/discrete.c already has a
per-ACPI-HID quirk table (int3472_gpio_map[]) for exactly this kind
of situation - e.g. OVTI08F4 (ov08x40) needed its GPIO type remapped
to INT3472_GPIO_TYPE_HANDSHAKE with a 45ms enable delay on some HP
laptops. It's possible OVTID858 on this Surface board needs a similar
per-HID quirk entry mapping type 0x08 to one of the existing known
types (my guess, unverified, would be a reset/powerdown-adjacent
line, given the symptom - sensor unreachable over I2C at all times,
not just during a specific mode), but I don't have visibility into
what the ACPI _DSM on this board actually intends by 0x08, so I'd
rather report this precisely and let someone with more context
(and/or ACPI table access) confirm than guess further.

Happy to pull the full DSDT/SSDT for the INT3472 device, run with
dynamic_debug enabled on int3472-discrete, or test any proposed
patch on real hardware - just let me know what would help.

Thanks,
[TODO: German]
[TODO: germanpapulindez@gmail.com]

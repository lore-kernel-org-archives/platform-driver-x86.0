Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173822;
	b=yTWREWzt0v3UdGW+UmdleW+DQT6DWhjZD5/9OisyWHT4D79EbupoT02AVxJKHu8Utvuj
	 B1NBpqpuszb6YXrO1cw16sevvNHBhtpWYx9u9T8XEN5tllG2RxeK4dmZNv5YQEH89oVs7
	 fMkW4msqGn4y+UHR6NskG0cnEKn4mdeRlZuuuWW8tI10IQoNu4FefMJwjhJhHYSCUlxMQ
	 8LTIMpRc3Sr9J9ZK8ya6CPW7qKuZPTfb91Ihpj/TNw3ZvK8GkklaWyDeFTVu8fl/kOXju
	 UynrlpMKkR0s6au0pZkqY+6+KFzHy6Bm12UmTBMrGISDprFrZ8ZIiWCEhhIYQUjWZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ytnzf6VXxBICp1pG+WcFKQAeNWKQrJq47ffcZ2o26I8=;
	b=BdzvLiRQxb7anlajNrLa9ErDQB8l+HczsRTylj08zT4TozOTbfL7Ia0c06G/pwEPUnj1
	 b1BkL4fH9k1GxII0mRRhSvQ5NmGJWbCPe/sAaq1vOgeRU3Tqp7CsIJJI2ByZ2EYHkzdqh
	 JB2C9oHOwa8dmloigtSY6DBWc0YtS+JjvyKzhy/eLBpe2IcZbQUhJnxdilhmrfDx44Rky
	 8rUmkNVzlXfzKzbk8HVG8CjDNGwrWhgUd4gMcLlgbTon97qi6TuCgXVbzagOe34uZkxDJ
	 TK0r1FZO3d0u0XBBaPsoIP7ZXoZqHJckA0vcFd2k5dJfvXhBiOifqikXF7U4EiJaeJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k7fI5pG4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5A8606A321
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 21:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5A8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k7fI5pG4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso1593595e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173820; x=1794778620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytnzf6VXxBICp1pG+WcFKQAeNWKQrJq47ffcZ2o26I8=;
        b=k7fI5pG4uo55lbPEW3NEz7FyUKtUQcZKULR/CxTPToc4ALjBs2GlYauuwaNpuePIMI
         uJcnFsRVubheyEiEKN0cMUOGFhJZYTOd/DheiUx/aKyfvkyeW0YMYUUmnuUTEHY1gfIB
         32eLHnMHKclCuN+6UOS0JeBxgeT000I23E3p74SqgSrg81Dsb/gIzNOD/Rs6wOjaOfYJ
         Q7oBqD9H5eGRNvGnfWRlp5zMascAmo6jCT/Kt48TNZFQJtyI/M5jkgSmjWaev24ZO77w
         /1+KPZbHqa8Dp4UualDb8//G/rZUta4WEJFlYb1e1qMVX0jupbcp177VPSeLyQy+iXhc
         jXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173820; x=1794778620;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ytnzf6VXxBICp1pG+WcFKQAeNWKQrJq47ffcZ2o26I8=;
        b=MfmyrD6u9eOsZzq6uQlsgm2WOarMRXycMGKYgCu+U5ZdVhmsSV6fXWFighCIFiGrFN
         X7Xhm3ZQf2/LJesXamqiiLAsJyPhsj3zeNL2e8o/DYpuse+juM+/r8zDu/b/X1Klgy8T
         CWOAPqNHZPVIoVeq/PAKihH44GD/mPJTyHQGWqaSziDTgC5ohYeREIAAOwTTObUqZ/Yi
         BC7/rlCbWyS/nraE7ullFZXca2LRGviKqAfB33NtxVUELmoOmMy+fyCOFnntMzmdTcHE
         A8GWOv1d0KqM5tGZtij181phN73cGB0auszYSTq3NKICXubfk0W1p6dnaUtmCPm/hFz3
         TvcQ==
X-Forwarded-Encrypted: i=1; AL+hErGJ3gFNFnpOeg2Ix4ld2kxETTii8zHkAQjz/XTYOTtpkQBxVuIsCA7bHMAwTY5qmCchuKXEPGSNi5BOF66S82hOvE+q@vger.kernel.org
X-Gm-Message-State: APuU4Z+8cu0YskxEH+NlpfjlirWRQg/KcQbjdClpCk58FU0uQl1miaCI
	CLEsH+oD5qwpvBU+M/AgNb2t5HRjiwmP46tSbz6Wt5TB8MadiFESIh5stp+ns2gV
X-Gm-Gg: AYBFou0Q8c4z4ihJTiPIv/zaLoCLanjzr3W9q8JK8sHbBbMJrVEnkZluQoPBViwrBZ3
	8TvQZ3Ua2HxMtNMr+GZy7gypcr2biqi0GEO6Uk6KH1CgewU61JTsf0X+sSxvZVYa7gkNxzYN07O
	GQXs7BgMPg91ayA50BkXzo81aht0NlvREl4r0+aEa5MFU6SJaY3G67xqc+yZZyqIkTslEGtp1V2
	VZmsZU6/PztlTMt5RFQZ2BJ+iW/qagV2NM7loAcYpZzsfOeqxYmlG7yHjIP5UAGSjwKdjaabNX6
	Jr7l0OHAGQIwy0Xye85cVxq/9oRUrdunIszuHr1RiirQrA3P8mWjTk6LkZvNERLUDrp0gPBp98u
	wiCX9zhU8Vw4QPxoLAYtsJ6SrVLkCtxe25TGVp1+vBXqlMQ1Zyi/GGASEROaiw6ytwBMzispku8
	MNmfRldaSPQdMBz+NlDWS12jhO2tVgnCZzEzqDAWWT5jSLCsLQuz+T6MvS+WGpdcD+lIXftUSQt
	WC6nf+8Vux+tsjndRQ3ZzFbDvwd7R53cz0xI/4G4+xe6d38/J0HFv9Da3nv/bDs+ADcz4kbR9Zm
	kzpAQT2BPYdaZVAFREAcRm1H2o+Nnd7FfL9EcmOik/baq+NOF7nXG6flYuKh
X-Received: by 2002:a05:600c:4eca:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4b94d762f98mr43434335e9.1.1794173820341;
        Sun, 08 Nov 2026 13:37:00 -0800 (PST)
Received: from SurfaceArch.localdomain ([207.188.128.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm92178595e9.6.2026.11.08.13.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:36:59 -0800 (PST)
From: =?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: Sachi King <nakato@nakato.io>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
Subject: [PATCH v2 0/2] Fix MSHW0040 button driver selection on AMD Surface devices
Date: Sun,  8 Nov 2026 22:36:54 +0100
Message-ID: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a rebase and rework of Sachi King's series from November 2021 [1].
It was reviewed then, the review was never acted on, and the thread went
quiet in March 2022. Sachi has confirmed they are happy for it to be
carried and no longer have the hardware. Both patches keep their original
authorship and sign-offs.

The problem, restated, because Hans asked for this in [1] and never got a
clear answer:

The AMD variants of the Surface Laptop 3 and 4 use the same MSHW0040 ACPI
device ID as the Intel Surface devices from the 5th generation on. Both
soc_button_array and surfacepro3_button match that ID and tell the groups
apart inside probe, by evaluating function 2 of the MSHW0040 _DSM, the OEM
Platform Revision, and treating a returned 0 as proof that the method is
absent. The AMD variants implement that function and legitimately return 0,
so both drivers draw the wrong conclusion, and surfacepro3_button binds
where soc_button_array should.

The sound test is whether the device implements that function at all, which
function 0 of the same _DSM advertises and acpi_check_dsm() reports.

To answer the question of which models are affected, every ACPI dump in
linux-surface/acpidumps [2] carrying MSHW0040 was surveyed, 32 models, for
UUID 6fd05c69-cde3-49f4-95ed-ab1665498035 revision 1:

  Model                        fn 0 mask fn 2 advertised
  Surface Book 1               0x03      no
  Surface Book 2               0x0d      yes
  Surface Book 3               0x0f      yes
  Surface Laptop 1             0x05      yes
  Surface Laptop 2             0x05      yes
  Surface Laptop 3 AMD         0x0f      yes
  Surface Laptop 3 Intel       0x0f      yes
  Surface Laptop 4 AMD         0x0f      yes
  Surface Laptop 4 Intel       0x0f      yes
  Surface Laptop 5             0x0f      yes
  Surface Laptop 6             0x0f      yes
  Surface Laptop 7 Qualcomm    0x0f      yes
  Surface Laptop Go 1          0x0f      yes
  Surface Laptop Go 2          0x0f      yes
  Surface Laptop Go 3          0x0f      yes
  Surface Laptop SE            0x0d      yes
  Surface Laptop Studio 1      0x0f      yes
  Surface Laptop Studio 2      0x0f      yes
  Surface Pro 10 Business      0x0f      yes
  Surface Pro 11 Qualcomm      0x0f      yes
  Surface Pro 4                no _DSM   no
  Surface Pro 5                0x0f      yes
  Surface Pro 6                0x0f      yes
  Surface Pro 7                0x0f      yes
  Surface Pro 7 Plus           0x0f      yes
  Surface Pro 8                0x0f      yes
  Surface Pro 9 5G             0x0f      yes
  Surface Pro 9 Intel          0x0f      yes
  Surface Pro X SQ1            0x0f      yes
  Surface Pro X SQ2            0x0f      yes
  Surface Studio 2             0x0d      yes
  Windows Dev Kit 2023         0x0f      yes
Exactly two do not advertise function 2, and they are exactly the two that
need surfacepro3_button:

  - Surface Pro 4: its MSHW0040 device carries no _DSM at all, only _HID
    and _STA.
  - Surface Book 1: it does carry the _DSM with this UUID, but function 0
    returns {0x03,0,0,0}, advertising functions 0 and 1 only. Function 1
    there is dGPU base attach and detach handling.

Worth noting that v1 said the devices needing surfacepro3_button "do not
have the _DSM". That is not true of the Surface Book 1, and the inaccuracy
is probably why the problem was hard to follow. The commit messages now
describe what is actually tested.

Changes in v2:
 - Dmitry: a returned 0 is no longer treated as invalid. acpi_check_dsm()
   makes the decision, and the revision is still evaluated and dev_dbg()'d
   afterwards, instead of that evaluation being removed.
 - Andy: the dev_dbg() of the OEM Platform Revision is kept, and the new
   comments use kernel comment style.
 - Hans: the commit messages now state which models load which driver and
   what each one's _DSM advertises, and the in-driver comments are
   expanded.
 - Rebased onto v7.4-rc2: surface_button_check_MSHW0040() now takes
   (struct device *, acpi_handle) and the driver has become a platform
   driver.

Not done, and I would welcome guidance. Hans also suggested replacing the
ACPI match with a DMI table plus MODULE_DEVICE_TABLE(dmi, ...), so that
surfacepro3_button stops auto-loading on machines that do not need it. That
is a larger change, independent of this fix, and the survey above suggests
the _DSM test is reliable across the whole range. That may be a good
follow-up if it is still wanted.

On merging: please do not separate the two patches. Both drivers match
MSHW0040 and discriminate only in probe, so with only one of them applied,
which driver claims the device on the AMD variants depends on module load
order. Hans asked for the same arrangement for his own two patch series in
2022, so either tree with an ack from the other would work.

On testing. Tested on a Surface Pro 4, which is the "no _DSM" side of the
check. Its own DSDT agrees with the survey above: the MSHW0040 device
carries only _HID and _STA, with no _DSM at all. With both patches applied,
MSHW0040 still binds surfacepro3_button, soc_button_array still declines,
exactly one input device is registered, and the volume keys still work. No
"OEM Platform Revision" line appears, which is the correct result here: on
this model both drivers return before reaching that evaluation.

That is a regression check, not a confirmation of the fix. On a Pro 4, v1,
v2 and current mainline all take the same path, because the _DSM is simply
absent and acpi_check_dsm() returns false. The Surface Book 1 is the case
that separates them and I do not have one.

Worth knowing, though: the out of tree linux-surface kernel has carried v1
of both patches since 2021-10-05 and still ships them today on its 6.19,
7.2 and 7.3 branches. This logic has therefore been in continuous use on
Surface hardware, including the AMD Laptops it fixes, for about four years.
The Pro 4 above had been running it before this test.

Neither I nor Sachi has an AMD Surface Laptop, so the half this actually
fixes is still untested by us directly. If anyone with an AMD Surface
Laptop 3 or 4 can test it, that would be very welcome.

[1] https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io/
[2] https://github.com/linux-surface/acpidumps

Sachi King (2):
  Input: soc_button_array - support AMD variant Surface devices
  platform/surface: surfacepro3_button: don't load on amd variant

 drivers/input/misc/soc_button_array.c         | 31 ++++++++++---------
 drivers/platform/surface/surfacepro3_button.c | 31 ++++++++++---------
 2 files changed, 34 insertions(+), 28 deletions(-)


base-commit: 8a65162514fbad21a2c58ffed65f42b27e92b163
-- 
2.56.0


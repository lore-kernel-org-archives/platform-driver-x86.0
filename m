Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A433672BF
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701572; cv=pass; b=O+dqOT3EKzMhpjrT8cqICsz+3gbroDbwgyajzZWI9A4YLte8OjvcnOAIGe/pq65uXauhdzmDz0nhOPIJZWSKj/OYhIKjYUPdy8QFk0PHfoqsGMvXXXePm3O0KbMxUKa8ZBaAZ3NPaI7L7VdfwN+Ua6kylJuRf44/nQMF+/ZIm9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701572; c=relaxed/simple;
	bh=87hn7ATmRPc8ZcikRSW9cm57wsYMirr6i9sKKcfrpTk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qlUw310nrG19KHulwP3RTVccrk4j03JcHCNzYCpcsTlGFlaZUM5k8yJpH6D2XWF2dC1dJEIoC5Rd/tKNUyYMBjhugo5D1UlNJQE3W6w0zX0kpqp0U28X9KfK4EZcJgeIn9BdVYATU0Ins1gBVc5CY1hvcMNItbJ8TlI7k7Ynw3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=0Gh9LoZn; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="0Gh9LoZn"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-80bb41f7f3cso10377307b3.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 09:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701568; cv=none;
        d=google.com; s=arc-20260327;
        b=CU5q3l8G8lMSXbU/IFdtL1Zt4MZu7LgU6LmXUD5Hlh3cmlP3mxlHrSNC+yuSFPaZFN
         p30X3AwfC+2+u0V/fi38hgFBaK5id5A064cjAY2hvDqj2MQYxq+KcwZ6Gi9+tcg4WYI6
         kMxIppcKsmI0jg1o9gqZV8kaQI7pN3kQgMVjYonQlAN/3dtgl7a1V4GpjGOMLsRCKEeb
         29ZcMFxzgGF9GudOxjez/VwzG2WgPL2urpfFjcL83h6mZepidrHr1L+S29deraYGpLVB
         jZPBcVfcojny2ZZyFcIoAEMm4R+764EgwyFzywfOgcQa1FZNfxDwRoTawV+BEBJPwUmZ
         hyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=v504c+zhTg8lC67Dqba4ENAf7i07B7kuAHGn3h98w8g=;
        fh=dbgbsAYeDYFg0V2uEQngo35qoI1LAfvMkWMjczORiuI=;
        b=nw3DZY2ODJuWOCJrI90oLwSGdehfkXCV0XnbjOabhYmZozGloKGaWkNhxwuUZQqlAL
         8bTl728kdrb6R2hxeV5mgLWCBPyzxoeqjiQNPfo/dVDBO5NzxKX7Bv8RonYvvGwc35Ec
         nlbnVTytflO/uPA0yNT/RemFb5+WzmiS+7R+sYXKD/wkxfxboEb9g0vQN94dGoiAzKSO
         j2m4f5kAE+5+tCTOSu16E1Q2J7Pefr9kiE8rhYwQdmw+got2UOwqTCsyXEZM365ZxzNh
         7p3llKJ9YhwNut9WO+E/HRLIiSms4GRj+Mzx1LHKVuWE31/651IQ/RW2nPPIwWCxfsgr
         qIpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783701568; x=1784306368; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v504c+zhTg8lC67Dqba4ENAf7i07B7kuAHGn3h98w8g=;
        b=0Gh9LoZnGzf66lh4GvaIRW9UlD0du7FyUAsPczwsyrXkUytzwQ9n/12+V+hchojWj6
         YBrsfgDocqOgWNVQhg+9T3J1ftArEyp+xFKPkzBVODSdc01zV0/Tg2xAC8SuL7KfzHhl
         qRSnHPFfxsokeUaFahJZJciFSSBGT3isagWfpF7Z3njSF2+xeYaPh3AYa3w4rRvnhB7d
         E2aYbFDhD1IDGT4f6cD1NPlQ4/7/irFrEZP3OqzUSoFfV+0VT5zYn18t+JDS2c6HwN+4
         1BPmDEasTBHSl7IiauyuPLTTqanhKN5M6t9N+7x8AAprWYeEgQ8KFJ/lcTRcNebjpiBK
         06kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701568; x=1784306368;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v504c+zhTg8lC67Dqba4ENAf7i07B7kuAHGn3h98w8g=;
        b=IhqFVkB6Z8wgUfX2CQ9t7KbU4PD6ZMz+70kQDIjo3FNH4qD/2tO/icSRsP4y0KbNlq
         0WHt3Q2X0T5ruAD4L16ia8lYrVWeSFlFogMuFs/Mv1nAxqFKSD1hjfjQPpp/jsH2rJvT
         v7T0tVhRml5siypdpDkN/EvOxkqJeJlZZ3t/qIABTDXCj0rjVr4sm3r++ERRWjALGTNy
         e4jtY6SMkYhWYZo7ya8UXhgWe2tCPKn3aInDm9lRuREv9L7jX6SCQYOiBr1gNI/eeO66
         hnFejdK0ztBofDQHsO/V7AFQF0tl7b+ZtvMIMP6CrTv5OUGBWohQxXu1Dx3ic0ySwhjL
         mcNg==
X-Forwarded-Encrypted: i=1; AHgh+RqRfcYOQtRFgJxKjX11A9favtzxtr8EJx/NrcX/k2KLvFFDyYcIsnYUPGh6nprsGdBdthfBVowL/JLxaraV8EUfzpEG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2572HlJ6ArWRRuUtNrdb6DJpHFbZ87DNuN2YTOPSJ7iQNjOnX
	wO3T2mISWJnXu5Hrs8+yaXmwz6p8eohKXvs4RrOFOpgE/VcVK62iu8dq8WenGIAYP8ccVndoPWw
	c1H1IINCLoTbHKkgUfgeDOg+VoAPZl4mNnxAexhnB
X-Gm-Gg: AfdE7cnnJ+7mEyGOCmMIeeCoUaH7WSF8m4VaUVjkS6cSx2+18di8ySMkzw64nvA6v/Z
	ZoWg4BgPLBQ0obyLUUYfN7QQC1J7fMoGtWsh/e1Ev4FErVt75MHsEIVcQeQvfhf1OYb3YtSBWhY
	S0xbXFKdUBBsMZqjyCZTdfY1d8BVZGLdqqN9RFoGB6JA1j0ay0yuhyfjSsPIGVgX4+IhcwF5KYq
	65o6TT8D1m2uivcv7Q/fhQXdkw8mk4DAdECq5gfSucsxYxwVOI3msedByLoUQsgnnLuJWmlHGIO
	zPTsBM3pDuxSfGENWtexzGshijo=
X-Received: by 2002:a05:690c:10d:b0:81d:5155:2149 with SMTP id
 00721157ae682-81dbe3425b3mr103094997b3.4.1783701567857; Fri, 10 Jul 2026
 09:39:27 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 09:39:27 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 09:39:27 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Fri, 10 Jul 2026 09:39:27 -0700
X-Gm-Features: AUfX_mwnVWaovJPEdIHNALTOpL0W_mwzBe_RV4qg2fKY66qa1CHSukJMaQ8tcJc
Message-ID: <CABtds-0uN8WW2SkDzwYf8cbQGZnx=Y8Nocs-ebMYB0KWOiX_Kw@mail.gmail.com>
Subject: [PATCH v4 0/3] firmware: Add coreboot CFR firmware attributes driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Move the firmware attributes class helper out of platform/x86, rename
the coreboot-table firmware driver directory from google to coreboot, and
add a coreboot CFR firmware attributes driver.

Changes in v4:
- Rebase onto current upstream/master.
- Add Mark's Reviewed-by to patch 1.
- Include <linux/device-id/coreboot.h> instead of
  <linux/mod_devicetable.h> in the CFR driver.

Sean Rhodes (3):
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   19 +-
 .../firmware/{google => coreboot}/Makefile    |    1 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1068 +++++++++++++++++
 .../{google => coreboot}/coreboot_table.c     |    0
 .../{google => coreboot}/coreboot_table.h     |    0
 .../framebuffer-coreboot.c                    |    0
 drivers/firmware/{google => coreboot}/gsmi.c  |    0
 .../memconsole-coreboot.c                     |    0
 .../memconsole-x86-legacy.c                   |    0
 .../{google => coreboot}/memconsole.c         |    0
 .../{google => coreboot}/memconsole.h         |    6 +-
 drivers/firmware/{google => coreboot}/vpd.c   |    0
 .../{google => coreboot}/vpd_decode.c         |    0
 .../{google => coreboot}/vpd_decode.h         |    0
 .../firmware_attributes_class.c               |    2 +-
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    2 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    2 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    2 +-
 .../linux/firmware_attributes.h               |    6 +-
 28 files changed, 1120 insertions(+), 25 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (83%)
 rename drivers/firmware/{google => coreboot}/Makefile (92%)
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 create mode 100644 drivers/firmware/coreboot/coreboot-cfr.c
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 rename drivers/platform/x86/firmware_attributes_class.h =>
include/linux/firmware_attributes.h (60%)

Range-diff against v3:
1:  0d105cd2eb39 ! 1:  4a82d0a07612 firmware: Move firmware attributes
class helper
    @@ Commit message
         firmware drivers use the standard firmware-attributes ABI
without living
         under platform/x86.

    +    Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
         Signed-off-by: Sean Rhodes <sean@starlabs.systems>

      ## MAINTAINERS ##
2:  4cc4e0c4b69a = 2:  285b33f805dc firmware: Rename google firmware
directory to coreboot
3:  b12a36d80e48 ! 3:  5edcdb4635c2 firmware: coreboot: Add CFR
firmware attributes driver
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +#include <linux/kobject.h>
     +#include <linux/limits.h>
     +#include <linux/list.h>
    -+#include <linux/mod_devicetable.h>
    ++#include <linux/device-id/coreboot.h>
     +#include <linux/module.h>
     +#include <linux/mutex.h>
     +#include <linux/slab.h>
-- 
2.53.0

Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40F937F8C5
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 23:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889374; cv=pass; b=cGqwawsBsAb6pnq9DlsC+csQ9DheKwU58vQKtrCklyCknb57K2f6ciz0dmToOU8XRwOGEUKZCBIiH9hqlF4NwPpVqqBnuMlt89gXNQbLlyxY0ZV+N/s5hXPQazSu1Dmm1OL+RPeJTZMEDklxCRN8FPLv1ObCiMhp65jjC2PSeoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889374; c=relaxed/simple;
	bh=J6zBSnuv2VUk6bsTnE+sg32kVJnVvTzg2RryFVDgAJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyBQMEkynLMoA43TW8HdC/WapanLGGNf08jEZdQtIise0l7NiQROfo8exD+4AJWL0cWhAgsp+MRzZT4JD0ol+WF8OF4KY1U+BLvdxBpuADuY7YdYQDNZ4umSbDMiuN1PyU5FeLYKkNt4IyqInBmGf9PNzJ1gAet6rFHrxnpFAvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nevCftR9; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nevCftR9"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3878de20527so42012251fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 15:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771889371; cv=none;
        d=google.com; s=arc-20240605;
        b=VExjlTLIY4aRxL4Nf+Z4mkB/kDVt7+tWe36E+IV+IyIYs31Sbb8UHuUXdSA9GqB8JF
         ML7aGIqyaTaKEMefk7Cvf4yLkcwXn+u75gMYB0QeKcmAkw6Yaz1fqfXWwZlk2DcC8KGR
         /2QQBdYPXDBN/k1jM3tRsHRs264slvVxfjlIYhp2d5HRjEWRGqSDIE5YGZ+6HR28FpNW
         5U2jl0etwuSld/VLjJZx2F1s5ocCNaoaZvypkGXlH59ZIjYoNL1jcF/YiLtSotQDjS3f
         j5Ps4nCIOlzzDP64gpHEsaC3sIDV3S928IAPHyGXxmFpeH48MGvgy7SVcRhpARKHpknu
         jUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8WfeWRTrku2bTr2EuWBQJnzZIlU4RzO3uGEG8JLabpE=;
        fh=o+7F7tNPk46eVSyGARnMEgfudNO5dy1J25HmqDD01zA=;
        b=k7I1i0nTB4x7u72bHs3njdw3qF490P/5CbIX9Ueu+E2m3Nx0/7v9bw7KO1Z8MqMadE
         +0+Af/gZyg5xDSR4WFLaGyinFUAEL8wey73HERTDa7lwlkYJ+u5nt3h19O1DJvIb6bc9
         51SCIty9p17EQLGu1vGse1UQ+GoYISXJo0YHeNgADroN7xJ22DgWXpish7C/3VU3bE2d
         LuBf2f2kjbUZ7weXrNDei3GTW7V7bSdZmck9AZQElsTnGVu+zPGP+Lr82myRIMy3iMHh
         5NdazfwxN6GbMOfqxS+niJgpdSf2GYeNU465WIhlaAs82Bl0Kx1ZQ5852NV+pv4wjULY
         YTYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771889371; x=1772494171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WfeWRTrku2bTr2EuWBQJnzZIlU4RzO3uGEG8JLabpE=;
        b=nevCftR9AcRWGqYXWI1CDNO1KT1FavHDqplGfOdrQb0TohoQ+k1wd3vOxTBAvAlyJC
         tctF1YKqAQZzPABDHpC3Wq2cDvUOMrpa0ojmKtAFDX+9sUWrBgNFOs66mYFmvxRB/+sj
         2TMzAFFNsVscY+aHVp8lnOA1tSBqSUN0BJAPG3YoLoK2f1BQhmGEZrD7fYGc1qF/1h8o
         GwwTzzsIb3iBosONx0fA5jD+gFh6e/pQKAHFzKcFzXw5zEe/VrYaElIWJ8s6C1lgtVQb
         F7ruXjWis8DvjzYLlwV0vshL87NkxsGEm5Wt3cZUBYUhjFSQivzlD+q1B2aGCqWO9FZh
         JgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771889371; x=1772494171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8WfeWRTrku2bTr2EuWBQJnzZIlU4RzO3uGEG8JLabpE=;
        b=Y6xJIiVuHoClLYcwOGtGrEyZZXNY2zBV6vuKI+X7HHJmOb8bXm3WjhAqiKHpQbjREQ
         l1vbeIb0kKGqOl+bH7Idzs3VTL7PMFQ2xS395Imn7hTCSl0fpnzqEtFAFCAjQItFI64R
         9hYDqC3dxI93fiW2bNDRpLmi27tXvg+2zPBE0p08VKnb9d/jYB8lLYmJaA+2SaxSvTI1
         7SXu04gGe2HuNZ1JXZa6FCiqyBPvl/KTSrHmz9CHr+pse21Jyr2UyseFPPzSyXTd0X5X
         yJ0xCU1WGLz2C2MLEBUs3XUQeD4d0XudsPt47UwOVlfUiGg6P4i+UIM3Jh5bubssUIuY
         H0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg/TqqPS1YYc2xxx/Lt/Dh0yq9uycLY21T5gEum1q8t+ScT6zRh7tI0G1wIlYwkXMSDgrugDInUKM2f5QqLcPdIVYp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2eCyl0FL9bHn2zXQhpoLqrggRir9S4AIxQApqvK5LWsW1tsPm
	RCXKaAG5vRuuLe0LMHqgkctE5JCFqQGV7PfwxizxFRfHU017Hcy1VxE7QUTI9jTmLAtB23nGyBM
	iwgs5h9UsS2W9bmsKfUV3vqHRxnLsYCM=
X-Gm-Gg: ATEYQzzpCqWJfTGKMoLUpkS6TmTIVuMfarRvG1dJ0JE39hbHuZ4B6fDc9+9nG8PmVWz
	ziQU/E32YH537IJYiCbUMieNs4GuH/v0G0WuYElaBrQ9/8GHIrBGqFpNEh6NJx5jTqAeSs/rxu4
	mVfZj6KyXdwH04ZiFfSN9ES3M9+rXsxCvdzOHPxh3imU6cc9TzxEKAl48vHX3LxuZuArrj2Ezh2
	K0O5VK4Qis9h3YU9T71FxE+L1MXG3nug7SeaREvYYDac5gAssXz15wl30aOSATgu0S/Fu9Ob07A
	yZeCR1UqBvsaZkeSGQ==
X-Received: by 2002:a05:651c:31cb:b0:383:2537:f121 with SMTP id
 38308e7fff4ca-389a5dae7a4mr30229781fa.26.1771889370676; Mon, 23 Feb 2026
 15:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com>
In-Reply-To: <20260209063355.491189-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 24 Feb 2026 08:28:51 +0900
X-Gm-Features: AaiRm52DBKb5bl7l5Bo_mvwDqKR1GnB0ZMS9OrdzJgEL0ePOj09NuELgOXAuIX4
Message-ID: <CABxCQKvNO78SeVp9pAnBOSAF=x0eFn03F33ftW-x-rZCG0-84Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] TrackPoint doubletap enablement and user control
To: mpearson-lenovo@squebb.ca, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	hansg@kernel.org, corbet@lwn.net, derekjohn.clark@gmail.com, 
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping on this series.

This is v7 addressing all previous review comments.
Please let me know if any further changes are needed.

Thanks,
Vishnu


On Mon, Feb 9, 2026 at 3:34=E2=80=AFPM Vishnu Sankar <vishnuocv@gmail.com> =
wrote:
>
> This patch series adds support for TrackPoint doubletap with a clear and
> simple separation of responsibilities between drivers:
>
> 1. Firmware enablement (trackpoint.c):
>    Automatically enables doubletap on capable hardware during device
>    detection.
>
> 2. User control (thinkpad_acpi.c):
>    Provides a sysfs interface to enable or disable delivery of doubletap
>    events to userspace.
>
> The approach follows the KISS principle:
> - The TrackPoint driver enables hardware functionality by default.
> - The thinkpad_acpi driver controls whether ACPI doubletap events are
>   delivered, using existing hotkey filtering infrastructure.
> - No cross-driver APIs or dual filtering paths are introduced.
>
> Changes in v7:
> - Removed unwanted comments and logs
>
> Changes in v6:
> - Documentation: fix formatting of the doubletap_enable sysfs attribute
>   description (separate "Values" list)
>
> Changes in v5:
> - Rename sysfs attribute from doubletap_filter to doubletap_enable to
>   reflect actual behavior.
> - Fix inverted logic so events are delivered only when doubletap is
>   enabled.
> - Suppress ACPI hotkey delivery instead of injecting or filtering input
>   events.
> - Register the sysfs attribute via hotkey_attributes[] instead of
>   device_create_file().
> - Drop unnecessary helper wrappers and debug logging.
> - Update Documentation to reflect the new naming and semantics.
>
> Changes in v4:
> - Complete redesign based on reviewer feedback.
> - trackpoint.c: Simplified to only enable doubletap by default.
> - trackpoint.c: Removed all sysfs attributes and global variables.
> - trackpoint.c: Uses firmware ID detection with deny list.
> - thinkpad_acpi.c: Added sysfs interface for kernel-level event control.
> - thinkpad_acpi.c: No cross-driver dependencies.
> - Documentation: Updated to reflect simplified sysfs approach.
>
> Changes in v3:
> - No changes.
>
> Changes in v2:
> - Improved commit messages.
> - Removed unnecessary comments and debug messages.
> - Switched to strstarts() usage.
> - Simplified firmware capability detection logic.
>
> This version addresses the remaining review feedback by correcting the
> naming and logic inversion, aligning sysfs semantics with behavior, and
> fully integrating with existing thinkpad_acpi hotkey handling.
>
> Vishnu Sankar (3):
>   input: trackpoint - Enable doubletap by default on capable devices
>   platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint
>     double-tap
>   Documentation: thinkpad-acpi - Document doubletap_enable attribute
>
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++
>  drivers/input/mouse/trackpoint.c              | 45 +++++++++++++++++++
>  drivers/input/mouse/trackpoint.h              |  5 +++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
>  4 files changed, 106 insertions(+), 7 deletions(-)
>
> --
> 2.51.0
>


--

Regards,

      Vishnu Sankar

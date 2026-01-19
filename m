Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382B726C3BE
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 23:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864884; cv=pass; b=opvkmNAgz0wgmJizxLU2pykchSHbbBwNu48BzbxWtt3rewpTVjSiMT36oIcItVJ/vHoQftv+ictkCwo1F4iRfx6vckho+zmWbjr/kK2ElF33eo6txCxlTAp5nD7N8PfItRivwwFGdixA/bjQn/wJKdf9quMoop/ElhMI9LXlg2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864884; c=relaxed/simple;
	bh=YdLrpfctD2iaOxKslCuiUJ1fqUiNAufKSSGVvvwU4KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5JeqkfgtUg1jR15WW3Ob6mCC2IV4GfdQIf7cVYIcRaiNW1yhg6vxskg2ktYkAbGq1Al+FqQW06S0DWr9c/1RwjOKx4lJKNqNCKY9f4TquYzN0GoxxOYuxOdhQg2GGAZFe0Fh6vCcTL1PIVTrKv7W85j1nmcIqyafVP6Nz8PM/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaEVp/Om; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaEVp/Om"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so5248001e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 15:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768864880; cv=none;
        d=google.com; s=arc-20240605;
        b=UwzSHXryhiicykkGtRvcE79oXUp6Fbnk7001euQ/9A7BjHRT3ezBZpobWghrZKIDp8
         0F6gjr3X5tYbZdcvsruu2BlvkIGrlaLzTMAYD+bKZ6NDtgesWtu36KP9zDdy+Ht9nDXB
         L6lTHRj+Iv+lPVnPufHuqM/obSBaBYt84VtlXY98J3LcHHqJ+CPpvhFjJMSIvL+6oYEk
         QFWc4QQq3aTGCpVnkQjvkc6mPwTy/FpeJmtAjQhYClu5VkRTZcffpS1u7Imu5XEmCVf/
         L2bxtQYAvay7lc2wENMcs8/qBOVTauZHOCPTmfKHWl0N80yjDuEydOqPUxDLJhl41ba+
         oBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        fh=6K9dk1M5ZOhrOrSn7/1+CIo8Te3K2/Y3NoA3OQfBS8s=;
        b=IwCesnqIlH/fUzcnBciW4mwJPidCOcztNlfHAKyt7DJVvPhzur+TAkOVwKI/RySaPt
         sejiWgYXVbwrrYg1/Uw1o1soGYYgWpWwYmcQZB/Q818eL8sizWZdSTx7qOnFpl7BIkM1
         lvgppH+8+eulMl0ZUHpXQjq1Vb9OkTyUUxIqn2OTrISZ6sptV4J8e1vzy4HC0ZZa5A8t
         UrrkHzFpl/mnkmIjy/7l9pkfc22jPiE9dDA7//NvwGT/txWWYJ1sIAxnT7h1PrOorQLb
         rdMSS8lZMnLodYDn5RUT6n2s7A1MTmhtRMSMJ/UffwSeb0mccbj2bN4zGg21kIDdX/cl
         XwfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768864880; x=1769469680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        b=WaEVp/OmqKIqk17b8S2wMU0OTXVwqstcFUjOmf8MeZnII39fn5dFpnt71GEuGKwtKX
         KCs4kK0tEi/1Jnw7aD2Op1GCHfcEqG0cqrgmyxhNTXcvsUR8YTS4xGn1HaaR2ZxI6vTW
         5elfb91Rk6gZ3WH1zcMf8o2vVOJLfu+9J/v3565IL2j5Ni7s0dB6pcOS8FqVtH61LHrI
         ayiyJ0hkZ5/UQ9K7EA8ujjsKweMN6aZh69tV03q8owAamkBmtHzFt0QosbZKnpseko7D
         4kleJo3gV4JbN2do/DB2wRRerz2u2aSiZ3yrLkDOXDGaRccTpe3dUZ6NcSSRRrxjCixq
         WLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768864880; x=1769469680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        b=rMFDW9yC6LXktNZUYE/Im/L9q9JXTr98RLPlwGeAoTRPsLw2UzNERp1Wjn1/UQbbZY
         kLHrziGTVV0z5WoAhCvM0lsEDcSKLv7dzeK4k5GOwUNtrKSJYZBvZn+TvOMSlvZtsFuX
         BoGnJLUtj4X9IdEEkjtg6iwp1sopHy/uqSnmuAdXVL4Sqx6BoWuW/O+69j7s74M0Ai4f
         m9xXJdJvqX5+xWkNJMAXs/EKhzr5vFfYEGs1w17O6ENGTYwQg22WtBlYkjy11YpE0x/J
         A5xzsDHdAeGaksHrM/rEezybNUmolTYWzxMDJz6Jz3rkMaDw2qoLS4CG/ZnO1kYhiXSW
         1Y3w==
X-Forwarded-Encrypted: i=1; AJvYcCUXMqkm82Tjqx/lLkaT5BNNv49rxnxGD7gPgjTHaGcN5yd3S4wGljtmGjKVizLS9/YNSLspGvGVkDci2H4JpmzSk949@vger.kernel.org
X-Gm-Message-State: AOJu0YyhhblzolmYZTVZiNehqlF9uqCFR11rSKxCgYBLQuMpoCHoao9q
	EjE2TJHfDPzyC5FoquNBVGLWRHWDk05F4sjwchZ2pxTDgIlYvka4YQSaj9q1MmQ0xvzsADn2vE2
	/Zc/RHGt5GV9wRUmLUdWEJWe0anrD2E21Sd0oHBUHEQ==
X-Gm-Gg: AZuq6aIB8OmE8cnuqPAvuq9Hc1gLTbFrm/TBKVf/pgQeAOwegtP7VOzRz8rI8hx2rbq
	VO6mv6/0jZvHikczRf0FDn0y6mU7cAI69IgFNj3XvTazBMM6nHnrxKSUgr1eVy38UwlMSuHS9PY
	/NiEVBALHk3CkWx9+mLKHoQt+T1LdIKvWhWx+4RM93iK7hj+H4RuIUAzshFL8MetJ+dAv45Wuad
	Qua7E253E+FGvxDey/Q7kHlLiJn0lZg9m3rsOIvQtpOP1426H2x6LDBvZQWmDHCMAAmUzk=
X-Received: by 2002:a05:6512:3f0d:b0:59c:b818:c063 with SMTP id
 2adb3069b0e04-59dc8f11cc5mr49938e87.9.1768864879748; Mon, 19 Jan 2026
 15:21:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226235101.106451-1-vishnuocv@gmail.com>
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 20 Jan 2026 08:20:43 +0900
X-Gm-Features: AZwV_Qha_AGcHlqJSZIc-uaFh5iazIYWt2QyAkghgDolNbh_GArBAIYfPOiBrsA
Message-ID: <CABxCQKu35Gc_+axoWD6pWuyFkbgWyRc67RP4iTsP8xw3U713PA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] TrackPoint doubletap enablement and user control
To: dmitry.torokhov@gmail.com, hmh@hmh.eng.br, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, corbet@lwn.net, derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I=E2=80=99m writing to kindly follow up on the patch series I have submitte=
d.

I haven=E2=80=99t seen any review feedback yet, so I just wanted to check i=
f it might
have been missed in the queue. If there=E2=80=99s anything I should revise,=
 test, or
clarify, I=E2=80=99d be happy to provide it.

Thank you for your time, and sorry for the inconvenience.

On Sat, Dec 27, 2025 at 8:53=E2=80=AFAM Vishnu Sankar <vishnuocv@gmail.com>=
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
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 20 ++++++++
>  drivers/input/mouse/trackpoint.c              | 47 +++++++++++++++++++
>  drivers/input/mouse/trackpoint.h              |  5 ++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
>  4 files changed, 107 insertions(+), 7 deletions(-)
>
> --
> 2.51.0
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

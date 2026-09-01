Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F677459AF4
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247631; cv=pass; b=I9xvXIRN4skxAs5gRE2+GdfOmvChq+NjYKVFWKj+tD771crfyqhBiwEepKNp5Ge0MRg78x2ThcCqphGfj0OwACMqXlHnPQBrVHm3fVVtkJI2JR3cVv9l6xFeGrX7NBimeNvy3WrT0CqfoyFBgLZYwLTyZcVdloZxragjg7k7VUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247631; c=relaxed/simple;
	bh=TTiImoeuu6oqTfGi4FTKpcXaarsimrn8hK8+zbcbTXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=UekPP1VU/KWOg6pxf/b4buUeYGFMqbJ5sU5jHR/QJ0/byLjseoFMq/B7DVcpMNzYdxe9h9OHALFZQnBgxHoXeybFpJorgKsV5O7FcPV0PtII7E6gpU4rSwo5HWI3ocUQ8BSXihsPMWHHwFIt/A7+/cbOM6ENK+784EyMifbcHec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgY9UcWs; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgY9UcWs"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52de50e77ffso53670311cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2026 00:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788247629; cv=none;
        d=google.com; s=arc-20260327;
        b=RYQ+lJvaMUlgzZtRw03nAZv11A2n4ww6eyImK9ZugOeDu2PY6XpzE+wQxI+qwP/5Rh
         2aCZQVW4PdnX6hjDxNSySOiLmX3GHw6k1pPHSiZH0WQTr38ZVkI+iYjZOcjmJOXsr+P3
         uH8T4homgmtoE59k+bmSplpYUXpZf6H1Dpny8U/bCqtSVqulZ3cTylqGwTWFuGYhYJnY
         iZ3NqnTN8Q8LAosfqwILmIrMi5kCgP5W7MXP79rHu38K9b3vSEdztR/jU1I3m4Z45f1Z
         mE2hRCDpMgPoQKZmkuLQcDFQ4NsA3c5gpm3RZaOTzFyhNO9QAUsy+G9x+slxFU1MgXGX
         /pTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2m2vaigGoQsm/v/eKr50EmVOmqzIDlxfX3yYmCw2BWY=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=TTC31HtYP5AqPSVUf7NbVIdENzzH8VLYH2+Iuv9gnZySvVmmzYuJjtQ+Ik2iGLM/qW
         iiQOgasYZqR3QmXaBSUh46VTcYctMK8FqPmPzhNCXCaZOffJak23iYwmA7lU9jhCitQ2
         5JQD5t61Kb1e2qwvJANhQ/vax5q09uLqMnmKvkhuZF4S/knFjNLSkKDm96gduX7MpHPm
         HqQv86/maSWDwuWcMP4wHr948fg7T2EfGpR+KXXvSI6T2XV1nsKO1DhQDUzxcGmeG7l5
         iwCtEEhT6onInAmh5jXqagMR07Eb0qtyMzT8YaubDsu5xpxZO7xFMBtWssG1NMrObAsW
         NAuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788247629; x=1788852429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m2vaigGoQsm/v/eKr50EmVOmqzIDlxfX3yYmCw2BWY=;
        b=fgY9UcWsnInAhjBDQX9I0J/zmX4IUszHi11YBVzwBWCh+c13TFHTRt4uqEX4fWkHWW
         aRNm+Tt/kWs/W6PQaA/qK6235fwt7ATPf8FMBsKhs14Ppq9DDYJskJvjjroxC1WHu+S4
         Eafs6nmvfqxdz6YTzTpiiRxvkbVRL0lK3AiUJt3OL9ra7d/s+z8g+Qm2UXEZniwkrdzy
         y1sxfPC0qFdvXoWo/HUMvGjGH/8mQGJIApJiH4xarQzs/yfuIlrQXyKXXPm8b4H2KALa
         S3Yv10BNMEIL9rbEzAR2cLwvsNfA6eKmE02/VXm6Ym5H5fBUeyg47YQ5ZxVY2vo3dQJL
         UvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247629; x=1788852429;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2m2vaigGoQsm/v/eKr50EmVOmqzIDlxfX3yYmCw2BWY=;
        b=do51iaI+fYCPP5ZQtoe5V9sm0jm12wTABOdfVjGExQ+LjnQbYyflyD+IGmSytAOx4j
         GyozX8SVVtVtDby93J0IDk5vRmErdp2xna0Q/TvbhZDpJiStEKknDH4QqaCCmho0o5hw
         mNY5pg4RmNwZR5YohqjSN6J4xUPQgvocgMLP7y67xilhPrCinkzLP6yKCl6kx08bc+aQ
         x/HnbMpmMIu40TBX2eDp3mc5vkins4NJoE9huJSj6yck7TXXSF8aM3lL/6SwlrBd5C8W
         CsrG27eV8itrX/Y8a4ftTFv99eexZE0RlzC/w7Rap4IrJvXuZS9gLjHeL3OgVcVBgywQ
         TGdg==
X-Gm-Message-State: AFuF++lLdrWN8dz4Gj7Vr4e2qBfJ+Ti3X/soQuBbl9GeUs9/cNUVcLu4
	kuyoTNh08I2E374wN6BMXi0WYDo/wRpaJ7K3rEytGT5uPfiHmGNIz7xihx9eh4wd5e7cF9n7TON
	MLjaj5TmVwCeCjSCDx3q/a+Cyda0aYmS1fqNawec8Rw==
X-Gm-Gg: AR+sD13RDv/puwWCPv9SCRrbPUFwfrPxTaQJ5JzPxsdPSti1gR5SnssMffqcY702+0e
	FNh0hYAcmeBfOdHVH0Dgy6QwtO4oQ8cUYSbHGI2vhqwqcish2eS8wyK8utr76yq9HiAdm9NSSyz
	0ACrBkK01Vi2XEAgi/K8thqA84vWkxoDHVs5gAmALkq4/i5f8vOufQEVlZDceI/WWoMwIyIEtRn
	Pv7f+NAPoWQopcEmDFJK4vM6m6079noik0snHYJz1jG35QlmSlPgUf+z4OCKbZxsN1JtcK1cfUf
	YpruQD7arjeyrPN4/kS1UMZVr+KL6z8Ai7m1YZZlEz0VX54nNZCwOlx53SfEf7hV/tfD46BY3PS
	nGbAfZujOHCz5rw==
X-Received: by 2002:a05:622a:1e19:b0:51c:61a:50fa with SMTP id
 d75a77b69052e-52fb967d009mr436677171cf.39.1788247628910; Tue, 01 Sep 2026
 00:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAC2M2xn7ESd-E57smPvd71VNp_AiQP0HbTZF-L+p4jZ3ZNR0A@mail.gmail.com>
In-Reply-To: <CAAC2M2xn7ESd-E57smPvd71VNp_AiQP0HbTZF-L+p4jZ3ZNR0A@mail.gmail.com>
From: powerfullz <wleizc7319@gmail.com>
Date: Tue, 1 Sep 2026 15:26:54 +0800
X-Gm-Features: AcwNN1VtZ9yMUHF489Apk_f0vj8bMt3-t376pss2VQdtQxyUE6wKXZ6rnwk0JeE
Message-ID: <CAAC2M2zZu14OFYbQ65_Z8rVHCFUpnXQbZfLemV9kcsUBNvVC2Q@mail.gmail.com>
Subject: Fwd: [BUG] platform/x86: bitland-mifs-wmi: performance profiles
 unreachable on USB-C-only models (RedmiBook Pro 14S)
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A powerfullz <wleizc7319@gmail.com>
Date: 2026=E5=B9=B49=E6=9C=881=E6=97=A5=E5=91=A8=E4=BA=8C 15:14
Subject: [BUG] platform/x86: bitland-mifs-wmi: performance profiles
unreachable on USB-C-only models (RedmiBook Pro 14S)
To: qby140326@gmail.com <qby140326@gmail.com>
Cc: <latform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>

[Resend to the correct list address; the previous attempt had a typo in
the platform-driver-x86 address, so this never reached the list. The
driver author was already contacted directly.]

Hi Mingyou,

Thanks for getting this driver upstream -- fan/temperature monitoring and
keyboard backlight both work correctly on my machine.

However, the platform_profile implementation makes the two high-power
profiles permanently unreachable on USB-C-only models, and this breaks
power-profiles-daemon entirely.

System information
------------------
Model:     RedmiBook Pro 14S (dmidecode -s system-product-name)
CPU:       AMD (integrated graphics only, no dGPU)
Charging:  USB-C PD only -- this model has no barrel-jack DC input
Kernel:    7.2.2-zen1-1-zen (Arch Linux)
Userspace: power-profiles-daemon

Symptom
-------
  $ cat /sys/class/platform-profile/platform-profile-0/name
  bitland-mifs-wmi
  $ cat /sys/class/platform-profile/platform-profile-0/choices
  low-power balanced balanced-performance performance
  $ cat /sys/class/platform-profile/platform-profile-0/profile
  balanced

  $ sudo sh -c 'echo performance > /sys/firmware/acpi/platform_profile'
  sh: write error: Operation not supported

  $ powerprofilesctl set performance
  Failed to communicate with power-profiles-daemon: GDBus.Error:...:
  Failed to activate platform driver 'platform_profile': Failed to write
  to acpi_platform_profile: Error writing
  '/sys/firmware/acpi/platform_profile': Operation not supported (15)

'low-power' and 'balanced' work fine. Only 'performance' and
'balanced-performance' fail, and they fail regardless of whether the
USB-C charger is connected.

Analysis
--------
In bitland_check_performance_capability():

    /* Full-speed/performance mode requires DC power (not USB-C) */
    if (!power_supply_is_system_supplied())
            return -EOPNOTSUPP;

    ret =3D bitland_mifs_wmi_call(data, &input, &output);
    if (ret)
            return ret;

    if (output.data[0] !=3D WMI_SYSTEM_AC_CIRCULARHOLE)
            return -EOPNOTSUPP;

WMI_FN_SYSTEM_AC_TYPE can only ever report WMI_SYSTEM_AC_TYPEC on this
machine, because the barrel-jack connector does not physically exist.
The second check therefore evaluates to true unconditionally, and
PLATFORM_PROFILE_PERFORMANCE / PLATFORM_PROFILE_BALANCED_PERFORMANCE are
dead code on this hardware.

This looks like it was written for the barrel-jack gaming models
(Redmi G and similar), where gating full-speed mode on the high-wattage
adapter makes sense. The thin-and-light SKUs share the same MIFS WMI
interface but not the connector.

Secondary issue: API contract
-----------------------------
Independently of the hardware question, advertising a profile in
->probe() via set_bit() and then rejecting it in ->profile_set() is
problematic. Userspace reads 'choices' as the set of supported profiles,
so power-profiles-daemon loads the platform_profile driver, offers a
performance mode to the user, and then fails the whole transaction --
which also prevents the amd_pstate CPU driver from applying its EPP
change, even though amd_pstate alone would have worked fine.

Before 7.1 this machine had no platform_profile at all, ppd used
amd_pstate only, and performance mode worked. The new driver is thus a
functional regression for these models.

Workaround for other users
--------------------------
    sudo systemctl edit power-profiles-daemon.service

    [Service]
    ExecStart=3D
    ExecStart=3D/usr/lib/power-profiles-daemon --block-driver=3Dplatform_pr=
ofile

hwmon, keyboard backlight, hotkeys and the gpu_mode/kb_mode/fan_boost
attributes all keep working; only ppd's use of platform_profile is
disabled.

Proposed fix
------------
Patch below simply drops the connector-type check and keeps the
on-battery check. Rationale: the EC clamps the power limits according to
the negotiated PD contract anyway, so requesting full-speed mode over
USB-C is safe -- it just yields less headroom than a barrel-jack
adapter would.

If you would rather keep the restriction for the barrel-jack models, the
alternative is to move the capability probe into
platform_profile_probe() and only set_bit() the high-power profiles when
the machine actually supports them, so that 'choices' stays honest and
->profile_set() never fails for an advertised profile. I am happy to
respin in that direction if you prefer, and I can test either version on
the RedmiBook Pro 14S.

Thanks,
powerfullz

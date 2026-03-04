Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3692F5A13
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631059; cv=none; b=ZFwWPV8I01l4uCw/4lTlLSg/6gAfZgiOZ/BX1scCip+g0RZdyY7Bc+YaZ0oEMBdn+9dLlIvG05HgB7Ie9aY0bV1ZDfJFdOOeJMe4naMM+3hbfAIKG4hjWfgHlxXkgvDVPmbMuveIe9ZbrrmdR7yDeBywMTLHYPlQ1KZ8xTk6nv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631059; c=relaxed/simple;
	bh=+4Cqn61qwWF+EDiOYsXlrOjPgGwMStVI81kmw7NQD0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFZcb+7gX8+yk117GYmVzlZXuouWhlGDv8NXbCU5J9A8pdqK/snU1wYMz+7DRxEsATIvq9EzOzsMOq1B/K3TcfHE5xphDPmGkf2KxwxiAsStj5LMW9c+Px+3dj40t00UXy0u1xZ1SBW/39zA64Cm3twoz3kYaF3M2JPBVjUBv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=gnEX/LBa; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="gnEX/LBa"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id A423A407D4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 13:30:53 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id D0EBA407EA
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 13:30:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 38D571FEFE6
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 15:30:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772631052;
	bh=leeY6cV3k29bI/Fwbs+bBwPVMYErPv9f2Haczd5W5DY=;
	h=Received:From:Subject:To;
	b=gnEX/LBaxdfHKAT7KINM/9AZ2ilLXvOSdYXq0Fx1td8zhKU/FYW8kUbpa3fNUGsHE
	 CommCBW0W39QAurPGS0ub39iHM5j71dseTqSr6NU5UErEr9uBE8y/jmxtf+LnO14sV
	 OrQJjCeN+WI62WYETaSB4Vwcu3bmEz/Dp2xYS4gWJkWTYvbDhpoxYOBIhFdDTO2Qxq
	 zYaQgtKNacY0Wt44PVW2JluFG7DcH/eZbE5Q65sVB4jNcwXinA+sa0BhBShNUeqK2E
	 gEblKIohp1W2ug1mGXdMIbg/01X2anHWBQyw4wk7W1C1lVseh7cRPGCPWuafaYTfd1
	 d2WEqUQTR5oMg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2ae43042ea7so42136845ad.0
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 04 Mar 2026 05:30:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXgrIql3pv5q69f65SUG3PwPeXBDrJ9USVxMfaOjXf7TXEvKaADysLSvzCudTEOPe94h3UtrwfiBelESz0zBMZTz/MJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzoFp7i/Xm4lX6h/W5tk8LNDaR+C8NwephH69/lg9v+mU9u4lhR
	rOTHjQS+hjik1ztCJ63nsEOVJ8dCKrKYPNtsurTAhHfFls58Hr8bW3FEDILi1axC0wxKagk2AXj
	ycuhjV16NQqAuFC/QzRw1aYqPqTXGF3A=
X-Received: by 2002:a17:902:f541:b0:2aa:d65f:47a2 with SMTP id
 d9443c01a7336-2ae6ab06068mr23715645ad.41.1772631050873; Wed, 04 Mar 2026
 05:30:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304132608.33815-1-denis.benato@linux.dev>
In-Reply-To: <20260304132608.33815-1-denis.benato@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 4 Mar 2026 14:30:39 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGhr6hwRz5jBkDGQrmJf9oK8FDE3dCE9_sAAChP5qrTGQ@mail.gmail.com>
X-Gm-Features: AaiRm52JPPLY_B_QAJcIAh3tc-v0nUSJwfH6rA1XxgKgX9XlqXHpvQrN4T4aw40
Message-ID: 
 <CAGwozwGhr6hwRz5jBkDGQrmJf9oK8FDE3dCE9_sAAChP5qrTGQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: do not enforce a battery charge
 threshold
To: Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
 Derek John Clark <derekjohn.clark@gmail.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177263105241.1789845.2708414573704557660@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 4 Mar 2026 at 14:26, Denis Benato <denis.benato@linux.dev> wrote:
>
> Users are complaining for the battery limit being reset at 100% during
> the boot process while the general consensus appears to not apply
> unsolecited hardware changes, therefore stop resetting the battery

*unsolicited. But I would rephrase to using this causes the device to
reset its limits on boot, which might have been set by e.g. windows so
if userspace is not aware to restore them, this causes a functionality
degradation. This is the case with the current implementation by KDE.

> charge limit at boot and return -ENODATA on charge_end_threshold to
> signal for an unknown limit.
>
> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 6ba49bd375df..dc330a8ee2f2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
>                                                  struct device_attribute *attr,
>                                                  char *buf)
>  {
> -       return sysfs_emit(buf, "%d\n", charge_end_threshold);
> +       if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
> +               return sysfs_emit(buf, "%d\n", charge_end_threshold);
> +
> +       return -ENODATA;

Please verify this does not cause KDE to display a warning and block
modifying the energy consumption. If it does as has been my
experience, communicate with KDE devs or Gnome (if it has a similar
issue) and block this from merging until there is a solution from
their side.

Returning an error from this function when there is proper function is
a slight ABI change compared to current drivers that implement this
method.

Thanks,
Antheas

>  }
>
>  static DEVICE_ATTR_RW(charge_control_end_threshold);
> @@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>                 return -ENODEV;
>
>         /* The charge threshold is only reset when the system is power cycled,
> -        * and we can't get the current threshold so let set it to 100% when
> -        * a battery is added.
> +        * and we can't read the current threshold, however the majority of
> +        * platforms retains it, therefore signal the threshold as unknown
> +        * until user explicitly sets it to a new value.
>          */
> -       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
> -       charge_end_threshold = 100;
> +       charge_end_threshold = -1;
>
>         return 0;
>  }
> --
> 2.53.0
>
>


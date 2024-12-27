Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDD67F477;
	Fri, 27 Dec 2024 04:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735275571; cv=none; b=MsvXQwNVHNFrVeVxxvBnfkdwxY/YHK4RjexEh9CG1rip2MAozahRj2ig94Nmcul52cxTZzbMdsa56krl8H+P4SHEfpoQZI93umOIvCdLHHcYMxvzXNONAnpQR66KqqDGzW2TnN8cxuRa8jDTDtAFRK16OXBsABuD4lz7zGWLALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735275571; c=relaxed/simple;
	bh=MVRj4j8Oa80I3mSOTQ5gez666kQ5MiSYhlZ2LBVnxmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMxKdJeLYln1zcmHkDcgOIndmpcFH6u4JwO7gm+KEzBpKjHXdcEjDBiPbySXYcz3YVcoVekOes4cFMlpkyF/Jz1LaZ5pVZvzxniAlXda1UHNvXlpih5Tac6KeRhtO2CyPfckhocdvRHGYnbND1LBmqTh5DNZbiZE63eBoKPkLTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHQhxck7; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHQhxck7"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5174d53437eso4027822e0c.2;
        Thu, 26 Dec 2024 20:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735275569; x=1735880369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YP/9cDSjbyPpYa+2YRN1E9ffyReGWhGRiVNAMAWQRok=;
        b=FHQhxck7+GxK4MIhMfQ0S8Z0WDnuFziN7vQOAE8dbhdrQmy3lLMn8RW7tdALYAxyhB
         Bp+qwXM+ka/YgazkrmRRYaz9qL8vbZr0HpkRUx+EiQDOl+8gI8HphYqq9inwSU9zCjOc
         A09fLnadZMikqB8FB9gW6RO6xUUc+t276gI6+CjpOpOoCtU74DzqyjiNNjURiDZNA3h+
         pw4kORxvf9TkPkEKheoq5BLqMjrdpDlS9qcQhlahmMUgonMAYBv+FF4NEWbDYrEYFwqc
         l9pcRPUZNElD+iahtvPF2L5CDgKXiKaUM/zuiY9/V5W7pQJ1x+KZs5E640JLRg86cLlU
         3KHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735275569; x=1735880369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP/9cDSjbyPpYa+2YRN1E9ffyReGWhGRiVNAMAWQRok=;
        b=MgCQiorYcaf+bDxgRnI+IeJTcFpbi1Oxrkc4uSZM/e1UsVWJfomZDLfGrhEhLsj3Cl
         05ckzb/5dO5KehchrTLIRfNNPVasRU/QsVoRy/3fbF6rMHybqVf/9eW6aObnWs6HGgmL
         ymvAbA+PRmD7aAu3aaPj8tdG6+uH7iKr5BpiLilHa9iUHc/otqRiwPPwWQHWgr/0K1vG
         A8HVUKBkor3R7ew+wJZi6R/dprhqUsapwJ/P62D8cEYYaN1xqJHKuW3opUj0kBVitjAr
         2SmWFURXeXYEPoIoqs87KbIBnAg3FftTHjhh4OdNrpJInyPHsMTGslV4P6zjvUZpi9Em
         6ldQ==
X-Forwarded-Encrypted: i=1; AJvYcCXol96gOLHVOrmQHkHFifUfAf4QfS+ba7Hp/5DsDUtP2igXZ3mEXLw1Tybyh02kuPGRI5KqZtY9rAVtjqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CbyVjY1LdludRY5ppVOc7RDyEBwKqBpO6AFyJeyu9NBRY4IG
	VfBwX2XlIShy0i7qIS3rUxtZdKx1UrFVtOpZAu56wdjxj3nI2PsN
X-Gm-Gg: ASbGncu3zCzVtw2RSN7mkj/t514EunyhlxQ+0f+DTXJKIdKG7r2YZk2jaTqq2Vre0x7
	Pk0wROB2a4Ibzsi08/RYx9+Ed5qsh0bJOI5BuCxjuJeQ1Mi+c5VSnvz9JwbJlmgjaQrlap/7/UM
	k+s00NfLR912N+eWiu3XPFuIROxYpfuh2iiF9uKp3NshrDN9QfgGG4isEcQdjMOMpjflDfnIZOf
	s0dNEs0IpTmzztmt8enueICZSrrVTQgvqZPBHZiFJnpknn7Zg7n1w==
X-Google-Smtp-Source: AGHT+IG0w81XEq5khpVg/q4qbOLCJXsngG1hHaytPkRbGNa/6Sc5AKwZjIeU0s5MgUEBQxD2juIQqw==
X-Received: by 2002:a05:6122:d04:b0:518:79f2:9345 with SMTP id 71dfb90a1353d-51b75c57404mr21771494e0c.4.1735275568991;
        Thu, 26 Dec 2024 20:59:28 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68cd9a0asm1679111e0c.36.2024.12.26.20.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:59:28 -0800 (PST)
Date: Thu, 26 Dec 2024 23:59:25 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 19/20] platform/x86: Update alienware-wmi config entries
Message-ID: <znrmeluldzbh6gnczl3najtdmw3kydv7omtio5xufxa234pqaf@v5qwv6r2esiy>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-20-kuurtb@gmail.com>
 <0ae84512-46f4-4cd9-8fd8-ed9694d96ec8@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ae84512-46f4-4cd9-8fd8-ed9694d96ec8@gmx.de>

On Fri, Dec 27, 2024 at 05:08:03AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Add config entries for each WMI driver managed by the alienware-wmi
> > module to be able to conditionally compile them.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/Kconfig         | 30 +++++++++++++++++++----
> >   drivers/platform/x86/dell/Makefile        |  4 +--
> >   drivers/platform/x86/dell/alienware-wmi.h | 23 +++++++++++++++++
> >   3 files changed, 50 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> > index d09060aedd3f..f8a0dffcaab7 100644
> > --- a/drivers/platform/x86/dell/Kconfig
> > +++ b/drivers/platform/x86/dell/Kconfig
> > @@ -18,15 +18,35 @@ config ALIENWARE_WMI
> >   	tristate "Alienware Special feature control"
> >   	default m
> >   	depends on ACPI
> > +	depends on ACPI_WMI
> > +	depends on DMI
> >   	depends on LEDS_CLASS
> >   	depends on NEW_LEDS
> > -	depends on ACPI_WMI
> > +	help
> > +	 This is a driver for controlling Alienware WMI driven features.
> > +
> > +	 On legacy devices, it exposes an interface for controlling the AlienFX
> > +	 zones on Alienware machines that don't contain a dedicated
> > +	 AlienFX USB MCU such as the X51 and X51-R2.
> > +
> > +	 On newer devices, it exposes the AWCC thermal control interface through
> > +	 known Kernel APIs.
> > +
> > +config ALIENWARE_WMI_LEGACY
> > +	bool "Alienware Legacy WMI device driver"
> > +	default y
> > +	depends on ALIENWARE_WMI
> > +	help
> > +	 Legacy Alienware WMI driver with AlienFX LED control capabilities.
> > +
> > +config ALIENWARE_WMI_WMAX
> > +	bool "Alienware WMAX WMI device driver"
> > +	default y
> > +	depends on ALIENWARE_WMI
> >   	select ACPI_PLATFORM_PROFILE
> >   	help
> > -	 This is a driver for controlling Alienware BIOS driven
> > -	 features.  It exposes an interface for controlling the AlienFX
> > -	 zones on Alienware machines that don't contain a dedicated AlienFX
> > -	 USB MCU such as the X51 and X51-R2.
> > +	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep and
> > +	 AWCC thermal control capabilities.
> > 
> >   config DCDBAS
> >   	tristate "Dell Systems Management Base Driver"
> > diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> > index d5718ef34c48..8ac9a933c770 100644
> > --- a/drivers/platform/x86/dell/Makefile
> > +++ b/drivers/platform/x86/dell/Makefile
> > @@ -6,8 +6,8 @@
> > 
> >   obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
> >   alienware-wmi-objs				:= alienware-wmi-base.o
> > -alienware-wmi-y					+= alienware-wmi-legacy.o
> > -alienware-wmi-y					+= alienware-wmi-wmax.o
> > +alienware-wmi-$(CONFIG_ALIENWARE_WMI_LEGACY)	+= alienware-wmi-legacy.o
> > +alienware-wmi-$(CONFIG_ALIENWARE_WMI_WMAX)	+= alienware-wmi-wmax.o
> >   obj-$(CONFIG_DCDBAS)				+= dcdbas.o
> >   obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
> >   obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
> > index 78ac10122155..97b52e51cd7d 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.h
> > +++ b/drivers/platform/x86/dell/alienware-wmi.h
> > @@ -94,10 +94,33 @@ acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> >   int alienware_alienfx_setup(struct alienfx_platdata *pdata);
> >   void alienware_alienfx_exit(struct wmi_device *wdev);
> > 
> > +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
> >   int __init alienware_legacy_wmi_init(void);
> >   void __exit alienware_legacy_wmi_exit(void);
> > +#else
> > +int __init alienware_legacy_wmi_init(void)
> > +{
> > +	return 0;
> 
> Please return -EOPNOTSUPP here.

Maybe -ENODEV is better in this case?

Also this should be static inline, I'll fix it.

> 
> > +}
> > +
> > +void __exit alienware_legacy_wmi_exit(void)
> > +{
> > +}
> > +#endif
> > 
> > +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
> >   int __init alienware_wmax_wmi_init(void);
> >   void __exit alienware_wmax_wmi_exit(void);
> > +#else
> > +int __init alienware_wmax_wmi_init(void)
> > +{
> > +	return 0;
> 
> Same as above.
> 
> Thanks,
> Armin Wolf
> 
> > +}
> > +
> > +
> > +void __exit alienware_wmax_wmi_exit(void)
> > +{
> > +}
> > +#endif
> > 
> >   #endif

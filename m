Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD27AF9C3
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714385005; cv=none; b=LJDJZn6ww2OCIWQqrNbecKNt2AbkixX8bS5U0hvZvSHdIZdrks8OwCVpkcsydNEZ7HBPOjFXknkySe8RRj3m2hbaKtfc3iGn7yDLnhIbXOg0Mvl/4PtGkn5/2B9pEJT5kI+vSY/kahsYTsRxC+PGA6TKIe+YVRosp4kv0bnewxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714385005; c=relaxed/simple;
	bh=oVfMVbLyijYuFfMN6hUf1sTn44uQ3XqwyYLuiaXJXrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tk9mjPH07rMmUhGbj81kxX6MizbKowoUe3CCn3hwamLySgqMl2SG+Mfx2xDnDzzzanSaO6/rEtnd1onALbxSnX4jAzWENsU7kfocAKkbi7Nz8FhLTJrvEuoQjZmDaaEy71WAs4gBUUdMgnM8UXTm9ywSvz2Q4BeoqBnEeioEric=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxEC4MSb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxEC4MSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714385002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PzUmpvdVBytsKjWnnuuRd7g23jkctxgDxgPHUJ4d/0Y=;
	b=YxEC4MSbYUYpA1+KuOu5W9dzQIRQZS+gRPHo/Xe7X6TGD8mzhzAw38m3fiI9g6sDvgb9Z8
	iepX51VkSfXXqkF5jcQNTpjI+iusxMCTovIhF1RwKmQGUjDQHClYiYHmhXNfVMuf06kERp
	KyTLKK1J+JiF/lkMYPIMJEtNqdSRo+Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-B2elw54IMI-4aMuUaASkug-1; Mon, 29 Apr 2024 06:03:21 -0400
X-MC-Unique: B2elw54IMI-4aMuUaASkug-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-57273001cbbso523444a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 03:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714385000; x=1714989800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzUmpvdVBytsKjWnnuuRd7g23jkctxgDxgPHUJ4d/0Y=;
        b=n0rvASZPzbeVOHrBfLd0LDtZjPm2iGTtISvW32iW24YPNGcCIjMPFOn+L7gzzQj/Ad
         UVURbDOylntb891sAI12VG1a3xMcS2bPDts1GMHz3DP5XY/J0o8RYX/dOPsX9oktfOF8
         VFUTV9O5TWJs6H61TWyxUxdb91hm/p1wQSVPR2tFpCUano21vXVLWUrLWjpmqvpAiBxS
         iGZcyfjV5yBnbt+1Li07xuPAwvvoOohSaUhBDCc+5nmln+QJHNhIqnnh/IaUQ9QO5Pw+
         izUlOjCG8MOabg9r1RwQ2vcPSfyPV0hxH91rn4D2kZVDoGU/E1xWjvhUEm/rd/LLiddE
         m01g==
X-Forwarded-Encrypted: i=1; AJvYcCVRH0cLnT2ge7KzSXPnBDDndZuce3U+i+MdLkyZ07S4SiMU3+9xcySYk0IZ92CT1O70HZd7Zog2m97hoaMPgXo4AyAMDcCsgv8UKf1Et6X8oaoXWg==
X-Gm-Message-State: AOJu0YyKE+V3yCbE6LrAilDsmKGr9XPuqB9KDLt2y/jp45e2UKRI6aII
	tdXnLImXdNmAebRcQJYNsXU3T2MSkyXTGzW1M5l5Y5b0t9i5Hh32dit/73k417if3m8ouDj5ptc
	K00a4Dz+PqNfUh04rueVosCC1WBvtDqSkb56YJwihyZmVjQ7Clakuts+WGb+vdYIPmHaa35c=
X-Received: by 2002:a50:c082:0:b0:572:7ca5:1b58 with SMTP id k2-20020a50c082000000b005727ca51b58mr3085448edf.6.1714385000041;
        Mon, 29 Apr 2024 03:03:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfBD5o1twozr29Q9txzDwv6NEJTeDxpxq73kI2qd2RQT0U6IuHqP0m2j67tKYuyt17cxTtsQ==
X-Received: by 2002:a50:c082:0:b0:572:7ca5:1b58 with SMTP id k2-20020a50c082000000b005727ca51b58mr3085419edf.6.1714384999609;
        Mon, 29 Apr 2024 03:03:19 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m8-20020aa7d348000000b005723f796ebcsm4497423edr.28.2024.04.29.03.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:03:19 -0700 (PDT)
Message-ID: <95bb7a5e-7107-46bb-9fd3-3aa462490b30@redhat.com>
Date: Mon, 29 Apr 2024 12:03:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/24] platform/x86: thinkpad_acpi: Refactor hotkey
 handling and add support for some new hotkeys
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20240424122834.19801-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240424122834.19801-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 4/24/24 2:28 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my patch-series to refactor thinkpad_acpi's hotkey handling
> and to add support for some new hotkeys on new models.
> 
> Changes in v2:
> - Some small code style tweaks in response to reviews
> - Add various Reviewed-by and Tested-by tags
> 
> Relevant parts of v1 cover-letter:
> 
> I have been very careful to not introduce any changes wrt support for
> the original ThinkPad models / hotkeys which use the hotkey_*_mask
> related code.
> 
> I've also done my best to avoid any *significant* functional change but
> there are still some functional changes, which should all not impact
> userspace compatibility:
> 
> 1. Adaptive keyboard special keys will now also send EV_MSC events with
>    the scancode, just like all the other hotkeys.
> 
> 2. Rely on the input core for KEY_RESERVED suppression. This means that
>    keys marked as KEY_RESERVED will still send EV_MSC evdev events when
>    pressed (which helps users with mapping them to non reserved KEY_FOO
>    values if desired).
> 
> 3. Align the keycodes for volume up/down/mute and brightness up/down with
>    those set by userspace through udev upstream's hwdb. Note these are all
>    for keys which are suppressed by hotkey_reserved_mask by default.
>    So this is only a functional change for users who override the default
>    hotkey-mask *and* who do not have udev's default hwdb installed.
> 
> 4. Suppress ACPI netlink event generation for unknown 0x1xxx hkey events to
>    avoid userspace starting to rely on the netlink events for new hotkeys
>    before these have been added to the keymap, only to have the netlink
>    events get disabled by the adding of the new hotkeys to the keymap.
> 
>    This should not cause a behavior change for existing models since all
>    currently known 0x1xxx events have a mapping.
> 
> Here is a quick breakdown of the patches in this series:
> 
> Patch 1 - 2: Fix a small locking issue on rmmod the only problem here
>    really is a lockdep warning, so I plan to route these fixes through
>    for-next together with the rest to keep things simple.
> 
> Patch 3 - 14: Do a bunch of cleanups and refactoring
> 
> Patch 15: Implements functional change no 4. I really kinda want to just
>    completely disable ACPI netlink event generation when also sending evdev
>    events instead of reporting these twice. But for the 0x11xx / 0x13xx
>    hkey events the kernel has send ACPI netlink events for years now. So
>    this disables ACPI netlink events for any new hotkeys going forward.
> 
> Patch 16 - 18: Refactor / cleanup reserved key handling
> 
> Patch 19: Actually move to sparse-keymaps
> 
> Patch 20: Update the keymap for 2 adaptive kbd Fn row keys
> 
> Patch 21 - 24: Mark's original patches adding support for the new Fn + N
>    key combo and for trackpoint doubletap slightly reworked to use
>    the new sparse-keymap.

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> Hans de Goede (20):
>   platform/x86: thinkpad_acpi: Take hotkey_mutex during hotkey_exit()
>   platform/x86: thinkpad_acpi: Provide hotkey_poll_stop_sync() dummy
>   platform/x86: thinkpad_acpi: Drop setting send_/ignore_acpi_ev
>     defaults twice
>   platform/x86: thinkpad_acpi: Drop ignore_acpi_ev
>   platform/x86: thinkpad_acpi: Use tpacpi_input_send_key() in adaptive
>     kbd code
>   platform/x86: thinkpad_acpi: Do hkey to scancode translation later
>   platform/x86: thinkpad_acpi: Make tpacpi_driver_event() return if it
>     handled the event
>   platform/x86: thinkpad_acpi: Move adaptive kbd event handling to
>     tpacpi_driver_event()
>   platform/x86: thinkpad_acpi: Move special original hotkeys handling
>     out of switch-case
>   platform/x86: thinkpad_acpi: Move hotkey_user_mask check to
>     tpacpi_input_send_key()
>   platform/x86: thinkpad_acpi: Always call tpacpi_driver_event() for
>     hotkeys
>   platform/x86: thinkpad_acpi: Drop tpacpi_input_send_key_masked() and
>     hotkey_driver_event()
>   platform/x86: thinkpad_acpi: Move hkey > scancode mapping to
>     tpacpi_input_send_key()
>   platform/x86: thinkpad_acpi: Move tpacpi_driver_event() call to
>     tpacpi_input_send_key()
>   platform/x86: thinkpad_acpi: Do not send ACPI netlink events for
>     unknown hotkeys
>   platform/x86: thinkpad_acpi: Change hotkey_reserved_mask
>     initialization
>   platform/x86: thinkpad_acpi: Use correct keycodes for volume and
>     brightness keys
>   platform/x86: thinkpad_acpi: Drop KEY_RESERVED special handling
>   platform/x86: thinkpad_acpi: Switch to using sparse-keymap helpers
>   platform/x86: thinkpad_acpi: Add mappings for adaptive kbd
>     clipping-tool and cloud keys
> 
> Mark Pearson (4):
>   platform/x86: thinkpad_acpi: Simplify known_ev handling
>   platform/x86: thinkpad_acpi: Support for trackpoint doubletap
>   platform/x86: thinkpad_acpi: Support for system debug info hotkey
>   platform/x86: thinkpad_acpi: Support hotkey to disable trackpoint
>     doubletap
> 
>  drivers/platform/x86/thinkpad_acpi.c | 854 +++++++++++----------------
>  1 file changed, 353 insertions(+), 501 deletions(-)
> 


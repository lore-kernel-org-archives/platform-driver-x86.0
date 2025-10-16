Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397B931BCAE
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615844; cv=none; b=B+eh8UBDl59EZ4v/Ex5H8ayfAWUI9gmWgN3GnUk6nUbLXk3RQHh42ldS+XG6jRsM9JCFiZ0aQP+BOErSkfHNQFo/CDS51kLcRRLh9df/mrATfNTWsAqw4SwFHgDYmRxFKhl8FcDpAuaCngELSjuJyAB0edMbiWVeN2ZxJicxMAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615844; c=relaxed/simple;
	bh=sRF5+eiyyvDy6P35qPDSbZ1Op+KomFN+cO3tpPaTpzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNYHAvr20hnXpSC0FQPPE49D4V/p5AGAxkPVqc0zOmFkqaQwZWbzdPrJeEXkMJP1AdpJ+1b8bhkuh/CvwimOTn5RUP7LMzp8zBYm7thWHc0kDH5WZ4uUV6RGCjnd6HFqhK4UA2F0YylHIqlZeHVabTgjgvLL3b3CuXcgWvpMbkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfcK2pKv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfcK2pKv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e504975dbso5229565e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760615840; x=1761220640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArYuqC9d/+uAAMAhpyNsnKi2KHyS/I3ASJZL/VZkmq8=;
        b=dfcK2pKvABcBngobcpn9bxLPHj1BNp3/TEONd6n5S/U8Pc9aN2y6sEeLI0TmxwZxDn
         SekQ+9e7MuFKQ0aW5e/rhwiwoJ+IOt2lnH7tA1ytzBIWvTePmjqgvk2YKJ/OYbncewvm
         oMqOBOCIpUarE98Iin0xaYTPJPvsLcF2x64W+BitdIhBpocgOBNT8Zo9693wz9E5mNK9
         8nndjyyWuyyk+Amii3eCr9YWYlf9+Xc2WZ97DdiHfsPqd9MOZMKajPqWVH7kKc358FS1
         mAgvh01vAUPbA2R6Jm3iIRUZcwkM1iKVc99prQWDe9YmTkVazwoiu8DkWhj9/OVC+gZ+
         JnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760615840; x=1761220640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArYuqC9d/+uAAMAhpyNsnKi2KHyS/I3ASJZL/VZkmq8=;
        b=REHXB6sj+BaxAMLevoRv4Yw2dfArSS9qBcrHpJQ+PCa+R31KE+B948bTL1acqgPKpt
         oQX+4A6P5RXBfEyqPMnuN7SOXHTqCd/aihWASErNwZBfXwG2fP73hJ6LumPhOW182RPQ
         3LNeUfqIQOtqtTHukMxgh5IFyejzVVNQAu0hOgD8aVF32gMl98cflf0Uue4aXOPvt3F6
         hsmyoXUwIq/yBOtlCFSZ0peiOPpk3YPU7nMlPvt7eYl3F/h5gNaqgMqxaAFYvGs1JDJi
         WfQSvLoqt3RIHK+CCHcQ9tQVTzoJxV7jzMcoUbHxFcwnEGm0TbfCoI4+4MZiyLfu9HKb
         8YpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQNux+xPvRYo/s5tknKhRWybWL9XNZlAKoS7iGzqXetyAzlnywVaD+GogoiyHpKSISk482sXDu4qTNlQ/zPl8Xbusw@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjSpyG++oqbBIiGTkbHwmvnS8RvNeTDtvTw2Ft5pVKOn9dZUp
	9IB0VbwnB/PM1YnqYIre5km3EYUFDCwiG7l4gm4bfuMxYjwL9/KKiIRq
X-Gm-Gg: ASbGncu+FGtWxn3fVMPledvGTh/+srDixQzLsxvc4Pl6KK2f7E2ZkxojubXvJmGdDOa
	IKLvWDvEhPIEgMxcXxjFqoFllbUnz2L0GDPgyxapWtLQhUrXCydkoK14j2y3rCnTEgbe4jDoc7F
	6JuzmsrKJtyRUfsyNM+b4bITk/BCel4TGSAqvH/XaUeYvB1NhvBBuj6Z23rg85eaq4xJVP769pT
	IfObPt6hTi/y7UIETRyzloX1lZbZsmGZ1YJ92I0czJiCiNZWgz6x76/AnJR96kiheEBzzxIkpfF
	6XibRpPtFtwTfKekCpoiRBBDnmUURSA5DAqtbBPvNW9WJwLlER8nH5TUHRnpW+Wy3xQjivkmPAK
	F7KPYwiRXsPZumoNey9LPJsqUWyESt0NsoBsH8aZalbCmO91J4T6/7f0dBQv/itlAKKqfBd8jNY
	HuA6N46+jA3PnT0845GyLvjXtm
X-Google-Smtp-Source: AGHT+IELWh2FOBUasPrU4o/JTA9HAOtjaMyk6lZtLqKGYpqZSBBmNutJ4eN0jpuLE9Huxd8ZS6tGJA==
X-Received: by 2002:a05:600c:c0d6:b0:471:c04:a352 with SMTP id 5b1f17b1804b1-4710c04a443mr17476155e9.4.1760615840293;
        Thu, 16 Oct 2025 04:57:20 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114444b06sm22459765e9.12.2025.10.16.04.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 04:57:19 -0700 (PDT)
Message-ID: <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com>
Date: Thu, 16 Oct 2025 13:57:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251013201535.6737-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/13/25 22:15, Antheas Kapenekakis wrote:
> This is a two part series which does the following:
>   - Clean-up init sequence
>   - Unify backlight handling to happen under asus-wmi so that all Aura
>     devices have synced brightness controls and the backlight button works
>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
>
> For more context, see cover letter of V1. Since V5, I removed some patches
> to make this easier to merge.
>
> All comments with these patches had been addressed since V4.
I have loaded this patchset for users of asus-linux project to try out.

One of them opened a bug report about a kernel bug that happens
consistently when closing the lid of his laptop [1].

He also sent another piece of kernel log, but didn't specify anything more
about this [2].

[1] https://pastebin.com/akZx1w10
[2] https://pastebin.com/sKdczPgf

> ---
> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>
> Changes since V5:
>   - It's been a long time
>   - Remove addition of RGB as that had some comments I need to work on
>   - Remove folio patch (already merged)
>   - Remove legacy fix patch 11 from V4. There is a small chance that
>     without this patch, some old NKEY keyboards might not respond to
>     RGB commands according to Luke, but the kernel driver does not do
>     RGB currently. The 0x5d init is done by Armoury crate software in
>     Windows. If an issue is found, we can re-add it or just remove patches
>     1/2 before merging. However, init could use the cleanup.
>
> Changes since V4:
>   - Fix KConfig (reported by kernel robot)
>   - Fix Ilpo's nits, if I missed anything lmk
>
> Changes since V3:
>   - Add initializer for 0x5d for old NKEY keyboards until it is verified
>     that it is not needed for their media keys to function.
>   - Cover init in asus-wmi with spinlock as per Hans
>   - If asus-wmi registers WMI handler with brightness, init the brightness
>     in USB Asus keyboards, per Hans.
>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
>   - Fix oops when unregistering asus-wmi by moving unregister outside of
>     the spin lock (but after the asus reference is set to null)
>
> Changes since V2:
>   - Check lazy init succeds in asus-wmi before setting register variable
>   - make explicit check in asus_hid_register_listener for listener existing
>     to avoid re-init
>   - rename asus_brt to asus_hid in most places and harmonize everything
>   - switch to a spinlock instead of a mutex to avoid kernel ooops
>   - fixup hid device quirks to avoid multiple RGB devices while still exposing
>     all input vendor devices. This includes moving rgb init to probe
>     instead of the input_configured callbacks.
>   - Remove fan key (during retest it appears to be 0xae that is already
>     supported by hid-asus)
>   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
>   - removes fds from userspace and breaks backlight functionality. All
>   - current mainline drivers do not support backlight hotplugging, so most
>     userspace software (e.g., KDE, UPower) is built with that assumption.
>     For the Ally, since it disconnects its controller during sleep, this
>     caused the backlight slider to not work in KDE.
>
> Changes since V1:
>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>   - Fix ifdef else having an invalid signature (reported by kernel robot)
>   - Restore input arguments to init and keyboard function so they can
>     be re-used for RGB controls.
>   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
>     keyboard rename into it.
>   - Unregister brightness listener before removing work queue to avoid
>     a race condition causing corruption
>   - Remove spurious mutex unlock in asus_brt_event
>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
>     relocking the mutex and causing a deadlock when unregistering leds
>   - Add extra check during unregistering to avoid calling unregister when
>     no led device is registered.
>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
>     the driver to create 4 RGB handlers per device. I also suspect some
>     extra events sneak through (KDE had the @@@@@@).
>
> Antheas Kapenekakis (7):
>   HID: asus: refactor init sequence per spec
>   HID: asus: prevent binding to all HID devices on ROG
>   platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
>   HID: asus: listen to the asus-wmi brightness device instead of
>     creating one
>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>   platform/x86: asus-wmi: add keyboard brightness event handler
>   HID: asus: add support for the asus-wmi brightness handler
>
>  drivers/hid/hid-asus.c                     | 235 +++++++++++----------
>  drivers/platform/x86/asus-wmi.c            | 157 ++++++++++++--
>  include/linux/platform_data/x86/asus-wmi.h |  69 +++---
>  3 files changed, 291 insertions(+), 170 deletions(-)
>
>
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787

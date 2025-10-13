Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3C6BE49
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 21:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391408; cv=none; b=pLHJ0XuX4x6+B0qRMCqCmNA1gTwC1semD9O4Kd5WlQLxCn12BH9uJUmW0JKDPJcWl8ofwqCvLvcMoCgBPHR1DxVnXA8aqJkITVBgXHH6T4SORVzckx7uz9Ll9/ESn+HT62kD0ckrAKmsYOBlGHYjAZeHrzAGZDPaxHyHJx1JkEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391408; c=relaxed/simple;
	bh=s6j0ZYCaL08K3BVXigJwH67BJEXmUSYpWj75Dcit+PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fc+RZ3H1YqBZTo+pZSaiNYMSCKnOqNJQFt0wJ9IS/Ev+UbOBenau3gfir/yrOgca8mVhJOGhJOWaM4vxShfMMXPlV3Z52kH/+h4HyygcWHXqHL/76vOs/xR5xXsmM4+CZR+mRQhP8sCeOgROOGqYhEqftc9LVLjFyc3ztHr0jSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STVdBJ5n; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STVdBJ5n"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so40255185e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 14:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760391404; x=1760996204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nu5z4mg3xCRHNl5zheHeBL5r5Nli+aiOa9GaVNwhvDE=;
        b=STVdBJ5nI0CNyxGtQuTrHlVCmGTAo6uSwt5oo4VO8pBVoR9H5p3YvSe9zajRpiXXpJ
         fB8d39PByBtLfuU9FDvDwk2SEHkDgbXAFsCpXBbH0E8h1ap8vt/rA8lwzL8rC817/UAW
         Cyj9cJTHAgkVZCGyeM4yKwbEqGLr6yshaXmN4cYVuLIkrvscDVe9Vc4cmPeXGFqlfG6+
         I3aDsekAOOIH9D9lEi3Y+5u6/oBntxaPEy1ZVk6QBIAzcpCYcl7sCwviOZham8q80KHA
         1A29Q+1ByLSGQLeSExTRDFYiVnnuU+XlYAJz+p+QA1xiX+1Kij+sq5EU/Qrv31qSAarh
         sC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760391404; x=1760996204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu5z4mg3xCRHNl5zheHeBL5r5Nli+aiOa9GaVNwhvDE=;
        b=rJXTh6J+PHdSYy44InzPFIrqK+xUUgTc6aWz99c+B5d6LKkwQL9beaWfLPXkkK/DaB
         sXi3nb/AuDA4ogWgCF8r5s7MakXIIaXGBcJSp1ecSNMguJyR8kg0f4EVfpAktagzn1sU
         wB07uOHKY7ycXzsMEuaqrvjHzz0RrmtgLvg8yHt97O9NjLxHSoycuhcjGxY2Rn2cTt6N
         ChiYOemJ3zr83fKiUBqyNonnFFxvM8n+HmI56LECrlrkECQW9l1bTsWkrlzBHabREdsw
         h7PXUf/IjX3jULVJeFQhNP/Cr8ckhoK6prjPUfWvg5g9TFvISP0m7SVtrdy7BwPRHBlG
         A6PA==
X-Forwarded-Encrypted: i=1; AJvYcCVy5H64ZR3y2BSNwC4nSBZZNqjMTCi0uxHvn6+qdfVB7f2RhsUH9V2NIgfMRHV5z7mdXIaeAIQMbvUqYik0FZmV4PGd@vger.kernel.org
X-Gm-Message-State: AOJu0YwO5LlF3y1ze9Um3rIXIfY2gPj9p8WneUkgkL+xgmEAY1soSVC9
	zxS5nD5E4OTeUVWZ7mnqskicsOIRO+zELSheSuI3D2HJF8l78B6CBsho
X-Gm-Gg: ASbGncsdQG8Dh5a1eu9x603pQ6cuigol9hRpi/2jRdQPDV76ICYsPT7zt/vw1frOTTg
	dzPPiQ7hFTQ2qG2iZZVOG8qQB75juYedrY/ZiqDNqmPbHxR8kDaTTe6eehHHw3gwV2BSVgcNJma
	9Szf1vHjrEI3Ja6+9le9StztlUweO2xy23sTRHBQRyW6cnOzDdZsOuzUaWYMj2cBzKpbakM26nl
	PRkzPmYmbr3VL6pxCkjonBAXMdeeyeE+xSq16ekREaacRA12Bw3Iwff3ivpjnOix8nvP2SsmmdF
	71Q2u0/8HuGo3g9WpH4IZCi7s2YqNojZOXWpmkz6Il74y/OPXSzJv6E8uwEugt/iSQVBYRrLnSB
	1BUOqH0CJFASsPnK1Nb2WkfG8pKuBD8BC0p/WhORJRAkCh1b9yAuaKpWbhPVOb9sAkw==
X-Google-Smtp-Source: AGHT+IGMncAm63bsnpKtZ420DMDx3/1flo/2Ky3sEH0+wJMnWCS0rjcq+tvSA75zUV+PLkJe9itCag==
X-Received: by 2002:a5d:5d85:0:b0:3eb:5245:7c1f with SMTP id ffacd0b85a97d-42666ac46ffmr12236133f8f.2.1760391404109;
        Mon, 13 Oct 2025 14:36:44 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d4bbsm20448482f8f.2.2025.10.13.14.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 14:36:43 -0700 (PDT)
Message-ID: <f936d9c0-ab58-4205-afd2-2d6b857cad57@gmail.com>
Date: Mon, 13 Oct 2025 23:36:43 +0200
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
>
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
Hello and thanks for this,

I would like to see a set of objectives that this series is trying to reach clearly spelled out:
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html
section 2, basically.

I can deduct you are trying to fix certain keyboards having keys not properly changing
the backlight, but is that all there is to it?

These commits sure touches a lot of code to fix an (unspecified? Unclear to me at least) number of bugs.

Given the fact I expect regressions (nothing personal: ASUS has a very large pool of models,
many requiring specialized quirks as can be seen in the diff)
wouldn't it be wise to take the chance and expose the "static" lighting mode,
including colors handling, for every asus rog, tuf, tx and proart laptop
in existence in a way that most already-existing programs (including the KDE widget) can handle?
At least there would be a big incentive behind all these changes.

[^ the above paragraph is valid if the number of fixed bugs is small and there is at least another way to fix it/them].

Surely data needed to check what model support
what lighting mode is known at this point, would probably be wise
to put such data in the kernel and make good use of it.

Thanks,
Denis

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

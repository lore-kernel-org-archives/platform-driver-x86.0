Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FEE30C612
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764164293; cv=none; b=iZMIycRrR8WoF/KqgYqShTZPsbwgBchkBLTavFVmvVev9Cz+qMS0YO3gd1Kih3WxcPnqg6C8rCHWd8qAgiDvjHev7fZ8N7ciL6FHNXzYVpCa+4YEKSnUolOxDOWktzOO+5SklxmCDV7MHqg91Nh/QiqsXa6ZpJkTWD+ISAB5IhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764164293; c=relaxed/simple;
	bh=NKTThn6IhEL9qXNZymJa96klBMFVGxsSjJmdawKPr/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buuejq04c3Wkaj0W5dFEV2es9h+PTUjL5T/Ib+tGA0sXGvktR8BO8Va2YVeYUM4guUbctQVWVopU08eQhu/ZHfzG7tyHeTlsVGyAlTtB7zUpIS/Oa0kCWZFEZquWUoHBgtqpnd2EGDqYPfHu1dpMELLvGK3s9wSUWWjxhMRhvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=GBnQ3QPH; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="GBnQ3QPH"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id A5C6543FA4
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 13:38:03 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 69FF643FBE
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 13:38:01 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7D981200E2B
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 15:38:00 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1764164280;
	bh=KsSXi0xhr53qeXFv63sW0tMJiZOiheIJFgcW2MSe+DY=;
	h=Received:From:Subject:To;
	b=GBnQ3QPHT3bdLOgl00HxPzoCCnhBA7eoJqGF84ZqY4+2K5j+8zJzIGKHL4BmpqxeO
	 ug+7qi+3L5nUvcoeelmcXbSNKrN7kp+/QJt4qX4UUJMYA7fGYb3Ct+7ek84WNNEBE0
	 Es919JElFuFwVLB5OurANf+Y2uo1mjLfYk4EXFhcHteCgQS5YNZeYFsgL5x2Q9TXdq
	 V8kk0JCnBhY+uJcirnsYcTn+HRqi9KXH9HdbrG+040xNhaqQ9DTQkE8WDrxjzMuP59
	 IQJFUhzErjrHPozOaUjKciingRIMGW6W9TLFVKzjzk3HjnlgV1MexmL1fyTQ2XFFft
	 7PXvyausz1a4Q==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-37b983fbd45so22580681fa.3
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 26 Nov 2025 05:38:00 -0800 (PST)
X-Gm-Message-State: AOJu0YwIharWGOU3vYaK+BjqniNryg1xw6m41zG+cPKDUCySbHqRttdu
	xvz5rOcauhY0QQAibqyhUUww21c/y/ryBEr/HlAFe74vlTXPiNiVxrdazvl88qQugOjk0CjbiM2
	Nh5boAuUIOKBLb6PyVGVVP1WM0WDr2BQ=
X-Google-Smtp-Source: 
 AGHT+IFQjcRKcGkQZJq0QyE12vRC7aFyLjNlgElTo2iNiFM+uTqFExb2LlgWVLrmpCeAhoIIx6zi5JcOaTPoO6p+ris=
X-Received: by 2002:a05:651c:4416:10b0:37b:a395:fd68 with SMTP id
 38308e7fff4ca-37cd9174951mr50535601fa.10.1764164279438; Wed, 26 Nov 2025
 05:37:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122110032.4274-1-lkml@antheas.dev>
In-Reply-To: <20251122110032.4274-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 26 Nov 2025 14:37:47 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGwkBH_03JvPQrevQiszwDZ5R4uDBnzWVeVXLo8xRmeug@mail.gmail.com>
X-Gm-Features: AWmQ_bkiDD_r7LwyoYfIXRbrEbyiSWbCikUCl9k0gWIrbbRMan8SSR3x5OmfRgY
Message-ID: 
 <CAGwozwGwkBH_03JvPQrevQiszwDZ5R4uDBnzWVeVXLo8xRmeug@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176416428093.2010278.17336627380421557180@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 22 Nov 2025 at 12:01, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> This is a two part series which does the following:
>   - Clean-up init sequence
>   - Unify backlight handling to happen under asus-wmi so that all Aura
>     devices have synced brightness controls and the backlight button works
>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
>
> For more context, see cover letter of V1. Since V5, I removed some patches
> to make this easier to merge.

Slight bump on this. It addresses both of the remarks Denis made in
the previous version.

I begrudgingly argued a bit for those because I did not want to resend
the series and they were not functional changes, so sorry about that.
But they are fixed in this version incl. with the conflict with the
armoury patchset. Denis, you omitted a rby on "platform/x86: asus-wmi:
Add support for multiple kbd led handlers" even though I addressed
your comment, so you may want to add that.

As for "HID: asus: early return for ROG devices" changing the name of
the devices of this driver, I will veto backporting it if it happens,
so inputplumber will have the two full months to remove the name
match. This is not a breaking change in the sense that software cannot
be made to work on both previous and latter versions and there is no
other software to my knowledge relying on name matches for Asus
keyboards. Moreover, an early exit is needed to prevent ejecting HID
endpoints without an ->input parameter so it is a needed fix anyway.
Postponing it will prevent Xbox Ally users from having RGB control
through userspace on a stock kernel but it is also not worth arguing
about

It is also fine for me for this series to merge for 6.20, but I'd
rather we handle it now since there will be some turbulence for asus
users due to armoury merging so it makes sense to have this transition
once.

Antheas

> ---
> V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas.dev/
> V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.dev/
> V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
> V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>
> Changes since V9:
>   - No functional changes
>   - Rebase to review-ilpo-next
>   - Fix armoury series conflict by removing the file asus-wmi-leds-ids on
>     "remove unused keyboard backlight quirk" + imports
>     Dismiss Luke's review as this patch diverged
>   - Reword paragraph in "Add support for multiple kbd led handlers" to be
>     more verbose
>   - Use kfree in fortify patch
>   - Fix minor style quirks from --nonstict checkpatch run
>
> Changes since V8:
>   - No functional changes
>   - Move legacy init patch to second, modify first patch so that their
>     diff is minimized
>   - Split "prevent binding to all HID devices on ROG" into two patches:
>     - moving backlight initialization into probe
>     - early exit to skip ->init check and rename
>     - Remove skipping vendor fixups for non-vendor devices. It is not possible
>       to read usages before the report fixups are applied, so it did not work
>   - In that patch, reword a comment to be single line and make is_vendor a bool
>   - Dismiss Luke's tags from "Add support for multiple kbd led handlers" as it
>     has drifted too far since he reviewed/tested it.
>
> Changes since V7:
>   - Readd legacy init quirk for Dennis
>   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
>   - Fix warning due to enum_backlight receiving negative values
>
> Changes since V6:
>   - Split initialization refactor into three patches, update commit text
>     to be clearer in what it does
>   - Replace spinlock accesses with guard and scoped guard in all patches
>   - Add missing includes mentioned by Ilpo
>   - Reflow, tweak comment in prevent binding to all HID devices on ROG
>   - Replace asus_ref.asus with local reference in all patches
>   - Add missing kernel doc comments
>   - Other minor nits from Ilpo
>   - User reported warning due to scheduling work while holding a spinlock.
>     Restructure patch for multiple handlers to limit when spinlock is held to
>     variable access only. In parallel, setup a workqueue to handle registration
>     of led device and setting brightness. This is required as registering the
>     led device triggers kbd_led_get which needs to hold the spinlock to
>     protect the led_wk value. The workqueue is also required for the hid
>     event passthrough to avoid scheduling work while holding the spinlock.
>     Apply the workqueue to wmi brightness buttons as well, as that was
>     omitted before this series and WMI access was performed.
>   - On "HID: asus: prevent binding to all HID devices on ROG", rename
>     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fixup.
>     This allows other quirks to apply (applies quirk that fixes keyboard
>     being named as a pointer device).
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
> Antheas Kapenekakis (11):
>   HID: asus: simplify RGB init sequence
>   HID: asus: initialize additional endpoints only for legacy devices
>   HID: asus: use same report_id in response
>   HID: asus: fortify keyboard handshake
>   HID: asus: move vendor initialization to probe
>   HID: asus: early return for ROG devices
>   platform/x86: asus-wmi: Add support for multiple kbd led handlers
>   HID: asus: listen to the asus-wmi brightness device instead of
>     creating one
>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>   platform/x86: asus-wmi: add keyboard brightness event handler
>   HID: asus: add support for the asus-wmi brightness handler
>
>  drivers/hid/hid-asus.c                        | 205 ++++++++--------
>  drivers/platform/x86/asus-wmi.c               | 223 +++++++++++++++---
>  .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ----
>  include/linux/platform_data/x86/asus-wmi.h    |  28 +++
>  4 files changed, 322 insertions(+), 184 deletions(-)
>  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
>
>
> base-commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3
> --
> 2.52.0
>
>


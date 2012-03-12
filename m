From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/3] asus-wmi: report brightness key events
Date: Mon, 12 Mar 2012 09:57:29 +0100
Message-ID: <CAHR064iPLgxVsxNNWLKEQb9rt-=5oJ+deXXDx1DCicc02zYHbw@mail.gmail.com>
References: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
	<1331259429-6216-3-git-send-email-acelan.kao@canonical.com>
	<CAHR064jnpNcoL3XnounWq=iV0ZPrUGeuzxw6Dzfksj5unS_PTQ@mail.gmail.com>
	<CAMz9Wg9g=ifbNKnAjubfHzos7aOwTd7RV7DsgAnPu5R=dvTrXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:58148 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752691Ab2CLI5a (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 04:57:30 -0400
Received: by bkcik5 with SMTP id ik5so2372058bkc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Mar 2012 01:57:29 -0700 (PDT)
In-Reply-To: <CAMz9Wg9g=ifbNKnAjubfHzos7aOwTd7RV7DsgAnPu5R=dvTrXw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Mar 12, 2012 at 2:34 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> Dear Corentin,
>
> No, I don't use acpi_backlight=vendor or something like that.
> And there is no ACPI backlight functions in the BIOS.

Hum ok, I see. I would be curious to take a look at the DSDT, is this possible ?

> Yes, we just need to inform the userspace to update the backlight
> brightness status, and I found that using backlight_notify doesn't work, so I let it send
> the key event directly.

Here is how backlight notification work these days:

When a backlight related hotkey is received:
- The BIOS already have handled it and changed the brightness: we have
to call backlight_force_update(bd, BACKLIGHT_UPDATE_HOTKEY) to tell
userspace that the brightness have changed in response to an hotkey
- The BIOS haven't handled it: we should only send an input event
(KEY_BRIGHTNESSDOWN or KEY_BRIGHTNESSUP) and userspace will deal with
it (setting the appropriate sysfs file, and displaying an OSD).

When we call backlight_force_update(bd, BACKLIGHT_UPDATE_HOTKEY), it
do two things:
- send a change notification on  the actual_brightness file (userspace
can monitor it using inotify or related).
- send a uevent which can be catched by udev or others (with SOURCE
being an env variable containing the source of this change).

It's possible that some desktop components don't handle that correctly
yet (gnome-power-daemon, gnome-settings-daemon, powerdevil, xrandr,
etc..). But in this case you should send them a bug report.

ref: backlight: Allow drivers to update the core, and generate events
on changes - https://lwn.net/Articles/341289/

-- 
Corentin Chary
http://xf.iksaif.net

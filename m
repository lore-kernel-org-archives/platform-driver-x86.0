From: Alex Hung <alex.hung@canonical.com>
Subject: Re: hp-wmi rfkill change breaks systems
Date: Wed, 22 Jan 2014 16:29:32 +0800
Message-ID: <CAJ=jquZZcB9stcYn7cTnQZvTZkq+VZvvTTVCvA0zAOv+Yd2qbg@mail.gmail.com>
References: <20140121151702.GA2566@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:54220 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806AbaAVI3d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jan 2014 03:29:33 -0500
Received: by mail-oa0-f48.google.com with SMTP id l6so71331oag.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jan 2014 00:29:32 -0800 (PST)
In-Reply-To: <20140121151702.GA2566@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Matthew,

From the above code, I supposehp_wmi_rfkill_setup(device) successes
and hp_wmi_rfkill2_setup(device) fails. As hp_wmi_rfkill_setup(device)
does not run with 997daa1bd9aca412ab97955a35b26c460c0ec7a4.

From HP, it was claimed that HP WMI 0x05 is deprecated and replaced by
HP WMI 0x1B after 2009; however, this claim seems not true on on
nx6325. I would say this is a BIOS bug on either HP WMI 0x0D or WMI
0x1B.

The above code looks great on this bug except one problem:

On newer systems, WMI 0x1B (used in hp_wmi_rfkill2_setup) is also
depreciated with _OSI("Windows 2012") = TRUE, and it will return 04h
(invalid command type)*.

However, The Get for WMI 0x05 (used in hp_wmi_rfkill_setup) works but
Set for WMI 0x05 does not. If we are using
+       if (hp_wmi_rfkill2_setup(device))
+               hp_wmi_rfkill_setup(device);
we will have hp-wifi / hp-bluetooth in rfkill but we cannot change
their status on those systems.

I think a better solution may need to include testing both Set and Get
for HP WMI 0x05 in hp_wmi_rfkill_setup. We may be able to revert
997daa1bd9aca412ab97955a35b26c460c0ec7a4.

I will verify the above theory and update accordingly.

PS*: There needs no HP WMI for wireless. The wireless control is moved
to "HPQ6001" that I previous sent.

On Tue, Jan 21, 2014 at 11:17 PM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> Hi Alex,
>
> 997daa1bd9aca412ab97955a35b26c460c0ec7a4 seems to break some systems
> (https://bugzilla.kernel.org/show_bug.cgi?id=69131 for example). The
> simplest approach seems to be to simply do something like the following:
>
> @@ -883,8 +883,8 @@ static int __init hp_wmi_bios_setup(struct
> platform_device *device)
>         gps_rfkill = NULL;
>         rfkill2_count = 0;
>
> -       if (hp_wmi_bios_2009_later() || hp_wmi_rfkill_setup(device))
> -               hp_wmi_rfkill2_setup(device);
> +       if (hp_wmi_rfkill2_setup(device))
> +               hp_wmi_rfkill_setup(device);
>
> Do you know if there are any cases that would be broken by this?
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Cheers,
Alex Hung

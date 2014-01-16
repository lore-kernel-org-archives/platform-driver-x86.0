From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] hp-wireless: new driver for hp wireless button for
 Windows 8
Date: Thu, 16 Jan 2014 17:34:59 +0800
Message-ID: <CAJ=jqubF8QFf2zR8aT-0g4HYrmNVW-gK+fBxiVZMJx5h+J64AQ@mail.gmail.com>
References: <1389767381-10211-1-git-send-email-alex.hung@canonical.com>
	<1389792119.3720.5.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:44691 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751520AbaAPJfA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Jan 2014 04:35:00 -0500
Received: by mail-oa0-f45.google.com with SMTP id j17so2640735oag.32
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2014 01:34:59 -0800 (PST)
In-Reply-To: <1389792119.3720.5.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Matthew,

It is confirmed by manufacturer that "the primary function of this
device will be to send an ACPI notify (0x80)".

I will re-send a patch with hardcode of KEY_RFKILL.



On Wed, Jan 15, 2014 at 9:21 PM, Matthew Garrett
<matthew.garrett@nebula.com> wrote:
> Actually, just found an example - looks like I'm wrong and it's purely
> used for sending this event. In that case, don't bother with the keymap
> at all and just hardcode KEY_RFKILL.
> --
> Matthew Garrett <matthew.garrett@nebula.com>



-- 
Cheers,
Alex Hung

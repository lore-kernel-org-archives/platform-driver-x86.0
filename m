From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] Platform: x86: chromeos_laptop: defer probing if no i2c
 busses found
Date: Thu, 18 Apr 2013 15:05:47 -0700
Message-ID: <CAOesGMj6nyjYjxQ23Vk0L76fYQo7YPeKoKrPptq8TVdv7Cwa-g@mail.gmail.com>
References: <1366322130-19364-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:41739 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936482Ab3DRWFs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Apr 2013 18:05:48 -0400
Received: by mail-wi0-f182.google.com with SMTP id m6so3704029wiv.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2013 15:05:47 -0700 (PDT)
In-Reply-To: <1366322130-19364-1-git-send-email-olof@lixom.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benson Leung <bleung@chromium.org>, dirk@hohndel.org, Olof Johansson <olof@lixom.net>

On Thu, Apr 18, 2013 at 2:55 PM, Olof Johansson <olof@lixom.net> wrote:
> If chromeos_laptop is loaded before the DRM driver, the i2c busses will
> not yet be available. Defer probe for that case and try again later.
>
> Trickling the error up to the module init function is unfortuantely a
> little awkward, since the i2c bus lookup and device registration happens
> as a dmi callback.

Uh, wait, hold off on this. I'm returning -EPROBE_DEFER from the
module init function. It's not valid outside of the driver model.


-Olof

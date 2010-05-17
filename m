From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] Adding support for new keys (ASSIST, WEB and VAIO) of
 the laptop Vaio E Series.
Date: Tue, 18 May 2010 07:19:36 +0900
Message-ID: <20100517221936.GA22300@kamineko.org>
References: <AANLkTimzHRev7_RES6KVT3HysQoNdjmTobhoGivqrkMr@mail.gmail.com>
 <AANLkTilYw3bKQpXvQr9JRUqZ6G3uPYDI6ERGiUFlt9rA@mail.gmail.com>
 <AANLkTimYSSglpdSXOffJvYSNK0FxDy3smuiLGrIAX7Cy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:48179
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996Ab0EQWTj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 May 2010 18:19:39 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimYSSglpdSXOffJvYSNK0FxDy3smuiLGrIAX7Cy@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jorge Pereira <jpereiran@gmail.com>
Cc: Kernel - PlatformDriver-x86 <platform-driver-x86@vger.kernel.org>

Hi Jorge

On Sun, May 16, 2010 at 03:36:52AM -0300, Jorge Pereira wrote:
> Hi!
> 
>  Recently i bought the sony laptop model 'VPCEB15FB' and this model
> has Three buttons top of keyboard[1] that don't work until then.
> added support to all three keys at the driver sony-laptop.c and sonypi.h

Thanks for the patch, it's fundamentally ok but to be honest I'm not too
convinced about the naming. I'm not sure how "dedicated" the Web will
be after you pressed the DEDICATED_WEB button. :)
Also, you seem to have patched an old version of the driver, please
make sure the patch applies on current code.

See a couple of comments below.

...
> From d2c812270bfce82da57a88c40f43a7eea42ba1f2 Mon Sep 17 00:00:00 2001
> From: Jorge Pereira <jpereiran@gmail.com>
> Date: Fri, 14 May 2010 18:18:19 -0300
> Subject: [PATCH] Adding support for new keys (ASSIST, WEB and VAIO) of the laptop Vaio E Series.
> 
> ---

Please also Sign-off the patch in your commit log.

...
> +	58, /* 72 SONYPI_EVENT_DEDICATED_SUPPORT */
> +	59, /* 73 SONYPI_EVENT_DEDICATED_WEB */
> +	60, /* 74 SONYPI_EVENT_DEDICATED_VAIO */

Can't these just be SONYPY_EVENT_ASSIST_PRESSED,
SONYPI_EVENT_WEB_PRESSED and SONYPI_EVENT_VAIO_PRESSED?
If necessary you can describe what they were originally inteded to in
the commit message.

Thanks!
-- 
mattia
:wq!

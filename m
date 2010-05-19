From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] Adding support for new keys (ASSIST, WEB and VAIO) of
 the laptop Vaio E Series.
Date: Thu, 20 May 2010 07:48:31 +0900
Message-ID: <20100519224831.GA8432@kamineko.org>
References: <AANLkTimzHRev7_RES6KVT3HysQoNdjmTobhoGivqrkMr@mail.gmail.com>
 <AANLkTilYw3bKQpXvQr9JRUqZ6G3uPYDI6ERGiUFlt9rA@mail.gmail.com>
 <AANLkTimYSSglpdSXOffJvYSNK0FxDy3smuiLGrIAX7Cy@mail.gmail.com>
 <20100517221936.GA22300@kamineko.org>
 <AANLkTilC-1Vknft1al4o9eIbv5hzsSJZFsBgvAE3K46O@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:58280
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475Ab0ESWse (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 May 2010 18:48:34 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTilC-1Vknft1al4o9eIbv5hzsSJZFsBgvAE3K46O@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jorge Pereira <jpereiran@gmail.com>
Cc: Kernel - PlatformDriver-x86 <platform-driver-x86@vger.kernel.org>

On Tue, May 18, 2010 at 03:56:43AM -0300, Jorge Pereira wrote:
> Hi Mattia,

Hi Jorge,

...
> From 5b8ef2e688b64427afb82243a80af8822e063112 Mon Sep 17 00:00:00 2001
> From: Jorge Pereira <jpereiran@gmail.com>
> Date: Tue, 18 May 2010 03:56:04 -0300
> Subject: [PATCH] Adding support for new keys (ASSIST, WEB and VAIO) of the laptop Vaio E Series.
> 

Still missing your sign-off line, see Documentation/SubmittingPatches 

> ---
>  drivers/platform/x86/sony-laptop.c |   12 ++++++++++++
>  include/linux/sonypi.h             |    3 +++
>  2 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 1387c5f..3580ca4 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -235,6 +235,9 @@ static int sony_laptop_input_index[] = {
>  	57,	/* 70 SONYPI_EVENT_VOLUME_DEC_PRESSED */
>  	-1,	/* 71 SONYPI_EVENT_BRIGHTNESS_PRESSED */
>  	58,	/* 72 SONYPI_EVENT_MEDIA_PRESSED */
> +	59, /* 73 SONYPI_EVENT_ASSIST_PRESSED */
> +	60, /* 74 SONYPI_EVENT_WEB_PRESSED */
> +	61, /* 75 SONYPI_EVENT_VAIO_PRESSED */
>  };

and while we are at it, would you mind indenting those comments like the
previous ones are with at tab? (sorry for not mentioning it before)

>  
>  static int sony_laptop_input_keycode_map[] = {
> @@ -297,6 +300,9 @@ static int sony_laptop_input_keycode_map[] = {
>  	KEY_VOLUMEUP,	/* 56 SONYPI_EVENT_VOLUME_INC_PRESSED */
>  	KEY_VOLUMEDOWN,	/* 57 SONYPI_EVENT_VOLUME_DEC_PRESSED */
>  	KEY_MEDIA,	/* 58 SONYPI_EVENT_MEDIA_PRESSED */
> +	KEY_HELP, /* 59 SONYPI_EVENT_ASSIST_PRESSED */
> +	KEY_HOMEPAGE, /* 60 SONYPI_EVENT_WEB_PRESSED */
> +	KEY_SHOP, /* 61 SONYPI_EVENT_VAIO_PRESSED */
>  };

ditto

thanks
-- 
mattia
:wq!

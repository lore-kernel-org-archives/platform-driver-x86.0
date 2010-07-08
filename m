From: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Subject: Re: [PATCH] fujitsu-laptop: make needlessly global symbols static
Date: Fri, 9 Jul 2010 08:37:01 +0930 (CST)
Message-ID: <201007082307.o68N71vX031390@turbo.physics.adelaide.edu.au>
References: <1278553745.7162.6.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelphi.physics.adelaide.edu.au ([129.127.102.1]:52395 "EHLO
	adelphi.physics.adelaide.edu.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756762Ab0GHXHw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Jul 2010 19:07:52 -0400
In-Reply-To: <1278553745.7162.6.camel@mola> from "Axel Lin" at Jul 08, 2010 09:49:05 AM
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, platform-driver-x86@vger.kernel.org

Looks fine to me.

Acked-by: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>

> The following symbols are needlessly defined global:
> 
> logolamp_led
> kblamps_led
> 
> This patch makes the symbols static.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/platform/x86/fujitsu-laptop.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index e325aeb..a758d59 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -182,7 +182,7 @@ static enum led_brightness logolamp_get(struct led_classdev *cdev);
>  static void logolamp_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness);
>  
> -struct led_classdev logolamp_led = {
> +static struct led_classdev logolamp_led = {
>   .name = "fujitsu::logolamp",
>   .brightness_get = logolamp_get,
>   .brightness_set = logolamp_set
> @@ -192,7 +192,7 @@ static enum led_brightness kblamps_get(struct led_classdev *cdev);
>  static void kblamps_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness);
>  
> -struct led_classdev kblamps_led = {
> +static struct led_classdev kblamps_led = {
>   .name = "fujitsu::kblamps",
>   .brightness_get = kblamps_get,
>   .brightness_set = kblamps_set
> -- 
> 1.5.4.3
> 
> 
> 

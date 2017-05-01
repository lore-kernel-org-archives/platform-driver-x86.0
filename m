From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 02/10] platform/x86: fujitsu-laptop: shorten names of
 acpi_handle fields
Date: Mon, 1 May 2017 22:49:26 +0930
Message-ID: <20170501131926.GC25546@marvin.atrad.com.au>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170424133334.7064-3-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:59044 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1165177AbdEANUA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2017 09:20:00 -0400
Content-Disposition: inline
In-Reply-To: <20170424133334.7064-3-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 24, 2017 at 03:33:26PM +0200, Micha?? K??pie?? wrote:
> As both struct fujitsu_bl and struct fujitsu_laptop represent data
> associated with ACPI devices, drop the "acpi_" prefix from the names of
> the relevant fields of these structures to save some horizontal space.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 3f232967af04..3695e8075aa6 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -130,7 +130,7 @@
>  
>  /* Device controlling the backlight and associated keys */
>  struct fujitsu_bl {
> -	acpi_handle acpi_handle;
> +	acpi_handle handle;

I must admit I'm not entirely convinced about this change.  "handle" to me
is very generic and it's not immediately clear from the source usage what it
might be a handle of.  A later patch in the series introduces an additional
handle which includes a suitable suffix, which leaves us with generic and
specific handles within the code.  Although it consumes an additional 5
characters, my feeling is that the additional clarification is worth it.

Regards
  jonathan

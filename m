From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: [PATCH] classmate-laptop: fix sparse warning
Date: Fri, 6 Feb 2015 20:32:35 -0200
Message-ID: <20150206223234.GH2162@siri.cascardo.eti.br>
References: <1423148264-6877-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from trem.minaslivre.org ([148.251.208.85]:42650 "EHLO
	grilo.cascardo.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751115AbbBFWoG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Feb 2015 17:44:06 -0500
Content-Disposition: inline
In-Reply-To: <1423148264-6877-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Oliveira Nascimento <don@syst.com.br>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 05, 2015 at 02:57:44PM +0000, Lad Prabhakar wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> 
> this patch fixes following sparse warning:
> 
> classmate-laptop.c:523:61: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Acked-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

> ---
>  Found this issue on linux-next (gcc  version 4.9.2,
>  sparse version  0.4.5-rc1) and applies on top linux-next.
> 
>  drivers/platform/x86/classmate-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
> index 70d355a..55cf10b 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c
> @@ -520,7 +520,7 @@ static acpi_status cmpc_get_accel(acpi_handle handle,
>  {
>  	union acpi_object param[2];
>  	struct acpi_object_list input;
> -	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, 0 };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	unsigned char *locs;
>  	acpi_status status;
>  
> -- 
> 1.9.1
> 

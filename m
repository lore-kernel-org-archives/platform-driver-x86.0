From: Vaclav Mocek <vmocek@gmail.com>
Subject: Re: drivers/platform/x86/acer-wmi.c: Support for another Lenovo Ideapad
 S205
Date: Tue, 20 Mar 2012 00:45:30 +0000
Message-ID: <4F67D32A.8080902@gmail.com>
References: <4F600A1D.5060002@gmail.com> <1331872472.10557.251.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:59831 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757784Ab2CTApu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 20:45:50 -0400
Received: by wibhj6 with SMTP id hj6so4484798wib.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 17:45:49 -0700 (PDT)
In-Reply-To: <1331872472.10557.251.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>

Hi Joey,

>
> If you want, Please kindly try this patch.
[Re]tested, it works. Actually, it was the first thing I tried, but 
after that I found out there are other sixteen known product names.

Vaclav M.
>
> Thanks a lot!
> Joey Lee
>
> > From 02a341b8142f71190c09a1a4fe509922b8f055c4 Mon Sep 17 00:00:00 2001
> From: "Lee, Chun-Yi"<jlee@suse.com>
> Date: Fri, 16 Mar 2012 12:31:08 +0800
> Subject: [PATCH] acer-wmi: add support Lenovo Ideapad S205 Brazos
>
> acer-wmi: add support Lenovo Ideapad S205 Brazos
>
> Signed-off-by: Lee, Chun-Yi<jlee@suse.com>
> ---
>   drivers/platform/x86/acer-wmi.c |    9 +++++++++
>   1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 1e5290b..f158956 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -468,6 +468,15 @@ static struct dmi_system_id acer_quirks[] = {
>   	},
>   	{
>   		.callback = dmi_matched,
> +		.ident = "Lenovo Ideapad S205",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Brazos"),
> +		},
> +		.driver_data =&quirk_lenovo_ideapad_s205,
> +	},
> +	{
> +		.callback = dmi_matched,
>   		.ident = "Lenovo 3000 N200",
>   		.matches = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),

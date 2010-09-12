From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 03/10] WMI: fix wmi_gtoa() to actully terminate the string
Date: Sun, 12 Sep 2010 18:28:51 +0100
Message-ID: <201009121828.52244.carlos@strangeworlds.co.uk>
References: <20100826071442.7976.93972.stgit@localhost.localdomain> <20100826071453.7976.1882.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:35280 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753464Ab0ILR3W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Sep 2010 13:29:22 -0400
Received: by wyf22 with SMTP id 22so5250830wyf.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Sep 2010 10:29:21 -0700 (PDT)
In-Reply-To: <20100826071453.7976.1882.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thursday 26 August 2010 08:14:53 Dmitry Torokhov wrote:
> Courtesy of sparse...
> 
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
> 
>  drivers/platform/x86/wmi.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 030d5f2..63ad45e 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -232,7 +232,7 @@ static int wmi_gtoa(const char *in, char *out)
>  	for (i = 10; i <= 15; i++)
>  		out += sprintf(out, "%02X", in[i] & 0xFF);
> 
> -	out = '\0';
> +	*out = '\0';
>  	return 0;
>  }

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D

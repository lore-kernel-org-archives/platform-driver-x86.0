From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 03/17] platform/x86: dell-wmi: clean up wmi descriptor
 check
Date: Tue, 17 Oct 2017 20:44:45 +0200
Message-ID: <20171017184445.c5endis7tzncplrz@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <fee4013581cad412769a00c4b12eb8037c89e127.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:53595 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755591AbdJQSos (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 14:44:48 -0400
Content-Disposition: inline
In-Reply-To: <fee4013581cad412769a00c4b12eb8037c89e127.1508259916.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Tuesday 17 October 2017 13:21:47 Mario Limonciello wrote:
> Some cases the wrong type was used for errors and checks can be
> done more cleanly.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 2cfaaa8faf0a..ece2fe341f01 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -663,19 +663,19 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
>  
>  	buffer = (u32 *)obj->buffer.pointer;
>  
> -	if (buffer[0] != 0x4C4C4544 && buffer[1] != 0x494D5720) {
> -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
> -			8, buffer);
> +	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
> +			buffer);
>  		ret = -EINVAL;
>  		goto out;
>  	}
>  
>  	if (buffer[2] != 0 && buffer[2] != 1)
> -		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
>  			buffer[2]);

To be correct, buffer[2] is of type "u32", not of type "unsigned". So
this patch does not fix it properly.

>  
>  	if (buffer[3] != 4096)
> -		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%u)\n",
>  			buffer[3]);
>  
>  	priv->interface_version = buffer[2];

-- 
Pali Rohár
pali.rohar@gmail.com

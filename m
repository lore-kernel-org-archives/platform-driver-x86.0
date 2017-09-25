From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 02/12] platform/x86: dell-wmi: Don't match on descriptor
 GUID modalias
Date: Mon, 25 Sep 2017 18:06:27 +0200
Message-ID: <20170925160627.GH22190@pali>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <e095a34ec411e46a6e890f5215b1f85ee7338795.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34033 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934503AbdIYQGa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 12:06:30 -0400
Content-Disposition: inline
In-Reply-To: <e095a34ec411e46a6e890f5215b1f85ee7338795.1505999739.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com

On Thursday 21 September 2017 08:57:07 Mario Limonciello wrote:
> The descriptor GUID is not used to indicate that WMI notifications
> in the dell-wmi driver work properly.  As such a modalias should
> not be present that causes this driver to load on systems with this
> GUID.

Ok, understood. What we need there is to load driver in case both
aliases are present in system. But I have no idea if kernel supports
such logic. So, add my:

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 28d9f8696081..1fbef560ca67 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -51,7 +51,6 @@ MODULE_LICENSE("GPL");
>  static bool wmi_requires_smbios_request;
>  
>  MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
> -MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
>  
>  struct dell_wmi_priv {
>  	struct input_dev *input_dev;

-- 
Pali Rohár
pali.rohar@gmail.com

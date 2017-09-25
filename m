From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 03/12] platform/x86: dell-smbios: Add pr_fmt definition
 to driver
Date: Mon, 25 Sep 2017 18:07:48 +0200
Message-ID: <20170925160748.GI22190@pali>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <bb2f71df3e15c564e3603477b2288683c22250ff.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36202 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935462AbdIYQHv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 12:07:51 -0400
Content-Disposition: inline
In-Reply-To: <bb2f71df3e15c564e3603477b2288683c22250ff.1505999739.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com

On Thursday 21 September 2017 08:57:08 Mario Limonciello wrote:
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-smbios.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index 0a5723468bff..e9b1ca07c872 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -12,6 +12,7 @@
>   *  it under the terms of the GNU General Public License version 2 as
>   *  published by the Free Software Foundation.
>   */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>

After fixing Andy's comment, you can add my

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com

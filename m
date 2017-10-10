From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v6 12/14] platform/x86: dell-smbios-smm: test for WSMT
Date: Tue, 10 Oct 2017 21:11:09 +0200
Message-ID: <20171010191109.ojyulgtqe3n5dv6n@pali>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <ab0790382693e8fabe191bcaed5c572bdab47ebd.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:48700 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbdJJTLO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 15:11:14 -0400
Content-Disposition: inline
In-Reply-To: <ab0790382693e8fabe191bcaed5c572bdab47ebd.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>

On Monday 09 October 2017 17:51:50 Mario Limonciello wrote:
> WSMT is as an attestation to the OS that the platform won't
> modify memory outside of pre-defined areas.
> 
> If a platform has WSMT enabled in BIOS setup, SMM calls through
> dcdbas will fail.  The only way to access platform data in these
> instances is through the WMI SMBIOS calling interface.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-smbios-smm.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
> index 223531e43fea..ba315753e847 100644
> --- a/drivers/platform/x86/dell-smbios-smm.c
> +++ b/drivers/platform/x86/dell-smbios-smm.c
> @@ -25,6 +25,8 @@ static struct calling_interface_buffer *buffer;
>  struct platform_device *platform_device;
>  static DEFINE_MUTEX(smm_mutex);
>  
> +#define WSMT_EN_TOKEN	0x04EC

Maybe there should be some comment in code what does this WSMT
abbreviation mean...

>  static const struct dmi_system_id dell_device_table[] __initconst = {
>  	{
>  		.ident = "Dell laptop",

-- 
Pali Rohár
pali.rohar@gmail.com

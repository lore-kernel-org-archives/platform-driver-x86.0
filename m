From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad-acpi: recognize Lenovo as
 version string in newer V-series BIOS
Date: Sat, 10 Mar 2012 01:28:44 -0300
Message-ID: <20120310042844.GA14972@khazad-dum.debian.net>
References: <1331335944-4662-1-git-send-email-manoj.iyer@canonical.com>
 <1331335944-4662-2-git-send-email-manoj.iyer@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45251 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756281Ab2CJE2s (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Mar 2012 23:28:48 -0500
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id C5BA520FBE
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Mar 2012 23:28:47 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1331335944-4662-2-git-send-email-manoj.iyer@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Manoj Iyer <manoj.iyer@canonical.com>
Cc: linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On Fri, 09 Mar 2012, Manoj Iyer wrote:
> The newer V series bios reports product version as 'Lenovo'
> instead of 'ThinkPad'. Recoginze this new string so that
> the module can load.
> 
> Signed-off-by: Manoj Iyer <manoj.iyer@canonical.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index ea0c607..d68c000 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8658,7 +8658,7 @@ static int __must_check __init get_thinkpad_model_data(
>  	}
>  
>  	s = dmi_get_system_info(DMI_PRODUCT_VERSION);
> -	if (s && !strnicmp(s, "ThinkPad", 8)) {
> +	if (s && !(strnicmp(s, "ThinkPad", 8) && strnicmp(s, "Lenovo", 6))) {
>  		tp->model_str = kstrdup(s, GFP_KERNEL);
>  		if (!tp->model_str)
>  			return -ENOMEM;

So far so good, but what driver functionality works well in these new
lenovo boxes?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

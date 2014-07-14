From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] drivers/platform/x86/thinkpad_acpi.c: don't test
 unsigned int for negativity
Date: Mon, 14 Jul 2014 20:02:43 -0300
Message-ID: <20140714230243.GD5939@khazad-dum.debian.net>
References: <1405378581-12146-1-git-send-email-andrey.krieger.utkin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44747 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757203AbaGNXCu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Jul 2014 19:02:50 -0400
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id E3DBF226D6
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Jul 2014 19:02:49 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <1405378581-12146-1-git-send-email-andrey.krieger.utkin@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com

On Tue, 15 Jul 2014, Andrey Utkin wrote:
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80231
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index d82f196..4d59b09 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6144,7 +6144,7 @@ static int brightness_set(unsigned int value)
>  {
>  	int res;
>  
> -	if (value > bright_maxlvl || value < 0)
> +	if (value > bright_maxlvl)
>  		return -EINVAL;
>  
>  	vdbg_printk(TPACPI_DBG_BRGHT,

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

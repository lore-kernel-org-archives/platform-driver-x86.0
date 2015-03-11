From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Date: Wed, 11 Mar 2015 07:28:26 -0300
Message-ID: <1426069706.2792621.238809981.2F30EA7A@webmail.messagingengine.com>
References: <20150311093450.GA3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38274 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752119AbbCKK21 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Mar 2015 06:28:27 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id EBC3C2028C
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2015 06:28:24 -0400 (EDT)
In-Reply-To: <20150311093450.GA3564@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 11, 2015, at 06:34, Dan Carpenter wrote:
> This needs to be signed for the error handling to work.  Valid modes are
> small positive integers.
> 
> Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs attr')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 56eaddc..024861d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -2938,7 +2938,7 @@ static ssize_t adaptive_kbd_mode_show(struct device
> *dev,
>  			   struct device_attribute *attr,
>  			   char *buf)
>  {
> -       u32 current_mode;
> +       int current_mode;
>  
>  	current_mode = adaptive_keyboard_get_mode();
>  	if (current_mode < 0)
> @@ -3621,7 +3621,7 @@ static int adaptive_keyboard_get_next_mode(int
> mode)
>  
>  static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int
>  scancode)
>  {
> -       u32 current_mode = 0;
> +       int current_mode = 0;
>  	int new_mode = 0;
>  	int keycode;
>  

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

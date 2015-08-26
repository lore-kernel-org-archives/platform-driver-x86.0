From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Remove side effects from vdbg_printk ->
 no_printk macro
Date: Wed, 26 Aug 2015 15:27:12 -0300
Message-ID: <1440613632.3433387.366841089.60E02F29@webmail.messagingengine.com>
References: <1440612818.2780.24.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34237 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752594AbbHZS1N (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Aug 2015 14:27:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id CC0A622A98
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2015 14:27:12 -0400 (EDT)
In-Reply-To: <1440612818.2780.24.camel@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Aug 26, 2015, at 15:13, Joe Perches wrote:
> vdbg_printk when not using CONFIG_THINKPAD_ACPI_DEBUG uses
> no_printk which produces no logging output but always
> evaluates arguments.
> 
> Change the macro to surround the no_printk call with
> 	do { if (0) no_printk(...); } while (0)
> to avoid the unnecessary argument evaluations.
> 
> $ size drivers/platform/x86/thinkpad_acpi.o*
>    text       data     bss     dec     hex filename
>   60918      6184     824   67926   10956
>   drivers/platform/x86/thinkpad_acpi.o.new
>   60927      6184     824   67935   1095f
>   drivers/platform/x86/thinkpad_acpi.o.old

The code size savings of this change are really small...

> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -402,7 +402,7 @@ static const char *str_supported(int is_supported);
>  #else
>  static inline const char *str_supported(int is_supported) { return ""; }
>  #define vdbg_printk(a_dbg_level, format, arg...)        \
> -       no_printk(format, ##arg)
> +       do { if (0) no_printk(format, ##arg); } while (0)
>  #endif

And won't this change disable compile-time checking of 'format ## arg'
for issues?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Wed, 5 Jul 2017 11:51:13 +0200
Message-ID: <20170705095113.GI2102@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <20170613184228.GC22450@fury>
 <20170614154654.GA22981@pali>
 <201706171847.54407@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:33866 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbdGEJvR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Jul 2017 05:51:17 -0400
Content-Disposition: inline
In-Reply-To: <201706171847.54407@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, Dave Airlie <airlied@redhat.com>, Oleksij Rempel <linux@rempel-privat.de>, =?utf-8?B?Sm/Do28=?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Saturday 17 June 2017 18:47:54 Pali Rohár wrote:
> > So problematic drivers which use instance=1 without any comments are:
> > 
> >   acer-wmi
> >   asus-wmi
> >   mxm-wmi
> 
> Adding authors & maintainers of those drivers in loop.

Hi!

Dell drivers and acer-wmi are fixed now. So only asus-wmi and mxm-wmi
needs to be investigated.

Adding more people who developed those drivers recently in loop. Can you
check if instance number is used correctly or not?

> WMI instance number is indexed from zero and therefore first instance
> number is 0, not 1. Can you check if for drivers and wmi functions
> (specified below) is really correct to use WMI instance number one?
> 
> In case in _WDG is specified for particular GUID that instance_count is
> 1, it means the only allowed instance number is 0 (first and the only
> one).
> 
> In some cases, when there is only one instance for WMI method, ACPI WMI
> bytecode does not check instance number, so any passed value is
> accepted by ACPI. But in current patch I'm trying to fix check for
> valid instance number based on instance_count information from _WDG.
> 
> So I need to know if nothing would be broken. And in case those driver
> issue invalid/incorrect instance number, they needs to be fixed.
> 
> Can you look at it? Simple look into _WDG dump should be enough... just
> check if instance number called from wmi driver is less then
> instance_count from _WDG.
> 
> On Wednesday 14 June 2017 17:46:54 Pali Rohár wrote:
> > Function wmi_query_block:
> > 
> >   acer-wmi.c:
> >   instance=1 /* no comment why, guid=95764E09-FB56-4E83-B31A-37761F60994A */
> > 
>  
> > Function wmi_evaluate_method:
> > 
> >   acer-wmi.c:
> >   instance=1 /* no comment why, guid=67C3371D-95A3-4C37-BB61-DD47B491DAAB */
> >   instance=1 /* no comment why, guid=6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 */
> > 
> >   asus-wmi.c:
> >   instance=1 /* no comment why, guid=97845ED0-4E6D-11DE-8A39-0800200C9A66 */
> > 
> >   mxm-wmi.c:
> >   instance=1 /* no comment why, guid=F6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0 */
> 

-- 
Pali Rohár
pali.rohar@gmail.com

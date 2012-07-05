From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] drivers/platform/x86: Lenovo IdeaPad Z570 support
Date: Thu, 05 Jul 2012 19:09:58 +0800
Message-ID: <4FF57606.7070806@canonical.com>
References: <1338811006.17357.3.camel@lenovo-ideapad-z570.gentooroot.dyndns.org> <20120626183110.GA29375@srcf.ucam.org> <4FF41640.8060608@canonical.com> <4FF45C98.60305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59863 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753612Ab2GELKH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Jul 2012 07:10:07 -0400
In-Reply-To: <4FF45C98.60305@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Thanks. I have the patch tested on my ideapads. They all looks fine.

The last thing I need is ACK for psmouse patch.

On 07/04/2012 11:09 PM, Maxim Mikityanskiy wrote:
>> Hi Maxim,
>>
>> I separate your patch into three smaller patch. It makes me easier to understand the detail. Please review if all function are still working fine on your ideapad
> 
> Hello Ike,
> 
> I have tested these patches and there is one problem in the part 2 of patch.
> Build fails, because you missed '+#include <linux/i8042.h>' line of original
> patch. Errors are at lines:
> 
>> +             i8042_command(&param, value ? I8042_CMD_AUX_ENABLE :
>> +                             I8042_CMD_AUX_DISABLE);
> 
> When I add '#include <linux/i8042.h>' manually, build succeeds and all
> functions work properly. Please add missing include to the second patch.
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

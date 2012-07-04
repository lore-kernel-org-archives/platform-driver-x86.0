From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] drivers/platform/x86: Lenovo IdeaPad Z570 support
Date: Wed, 04 Jul 2012 18:09:12 +0300
Message-ID: <4FF45C98.60305@gmail.com>
References: <1338811006.17357.3.camel@lenovo-ideapad-z570.gentooroot.dyndns.org> <20120626183110.GA29375@srcf.ucam.org> <4FF41640.8060608@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:62698 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751450Ab2GDPJR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Jul 2012 11:09:17 -0400
Received: by bkwj10 with SMTP id j10so2721688bkw.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Jul 2012 08:09:16 -0700 (PDT)
In-Reply-To: <4FF41640.8060608@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

> Hi Maxim,
>
> I separate your patch into three smaller patch. It makes me easier to understand the detail. Please review if all function are still working fine on your ideapad

Hello Ike,

I have tested these patches and there is one problem in the part 2 of patch.
Build fails, because you missed '+#include <linux/i8042.h>' line of original
patch. Errors are at lines:

> +             i8042_command(&param, value ? I8042_CMD_AUX_ENABLE :
> +                             I8042_CMD_AUX_DISABLE);

When I add '#include <linux/i8042.h>' manually, build succeeds and all
functions work properly. Please add missing include to the second patch.

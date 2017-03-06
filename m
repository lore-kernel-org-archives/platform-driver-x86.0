From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list
Date: Mon, 6 Mar 2017 12:33:18 +0100
Message-ID: <20170306123318.00d46184@endymion>
References: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com>
        <CAHp75Ve4NxQ8=GQGOdwnURRzvgDOGYs1LAwd_NQE=qzWnUVMEg@mail.gmail.com>
        <CAHZJmOzdDhnts6-HUKBMoYC6FSj-Hkz=jpcfwV4gFTTEWdB7kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49640 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753010AbdCFLdX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Mar 2017 06:33:23 -0500
In-Reply-To: <CAHZJmOzdDhnts6-HUKBMoYC6FSj-Hkz=jpcfwV4gFTTEWdB7kg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>

Hi Vasile,

On Sat, 4 Mar 2017 22:58:26 +0100, Vasile Dumitrescu wrote:
> ok, but how? I am on Debian,  and I never in my life compiled a kernel...
> 
> What would I need to do?

If your Debian system has a kernel >= 3.13 and you are somewhat
familiar with compiling from sources, you could give a try to this
standalone driver:

http://jdelvare.nerim.net/devel/lm-sensors/drivers/dell-smm-hwmon/

Instructions are at:

http://jdelvare.nerim.net/devel/lm-sensors/drivers/INSTALL

-- 
Jean Delvare
SUSE L3 Support

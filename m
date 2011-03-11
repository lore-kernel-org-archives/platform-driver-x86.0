From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Fri, 11 Mar 2011 21:07:15 +0200
Message-ID: <4D7A72E3.1050407@gmail.com>
References: <20110225225055.GA5931@kroah.com> <4D787714.6060405@gmail.com> <20110310170143.GA24559@kroah.com> <AANLkTinyqJx76=nzepa9fe5VDzqiXRGCQ=E1SsKm2npE@mail.gmail.com> <20110310171940.GA24972@kroah.com> <4D790A20.3050105@gmail.com> <20110310180959.GA26927@kroah.com> <4D793D05.3070908@gmail.com> <20110310211519.GA11862@kroah.com> <4D79CB47.2030405@gmail.com> <20110311170313.GA10202@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110311170313.GA10202@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 03/11/2011 07:03 PM, Greg KH wrote:
> Are you sure this was the driver you just built that I sent you?  Can
> you send the output of 'modinfo samsung-laptop'?
Yes, I'm pretty sure. Here is the modinfo output:

filename: 
/lib/modules/2.6.37+/kernel/drivers/staging/samsung-laptop/samsung-laptop.ko
license:        GPL
description:    Samsung Backlight driver
author:         Greg Kroah-Hartman <gregkh@suse.de>
alias:          dmi*:svn*SAMSUNGELECTRONICSCO.,LTD.*:pn*N130*:rn*N130*:
alias:          dmi*:svn*SAMSUNGELECTRONICSCO.,LTD.*:pn*N128*:rn*N128*:
depends:        rfkill
staging:        Y
vermagic:       2.6.37+ SMP mod_unload modversions 686
parm:           force:Disable the DMI check and forces the driver to be 
loaded (bool)
parm:           debug:Debug enabled or not (bool)

However, there seems to be some problem with aliases.

Thank you :)

Sincerely,
Nick

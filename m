From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Fri, 11 Mar 2011 09:12:07 +0200
Message-ID: <4D79CB47.2030405@gmail.com>
References: <20110225210334.GB16860@kroah.com> <4D6823DD.6040809@gmail.com> <20110225225055.GA5931@kroah.com> <4D787714.6060405@gmail.com> <20110310170143.GA24559@kroah.com> <AANLkTinyqJx76=nzepa9fe5VDzqiXRGCQ=E1SsKm2npE@mail.gmail.com> <20110310171940.GA24972@kroah.com> <4D790A20.3050105@gmail.com> <20110310180959.GA26927@kroah.com> <4D793D05.3070908@gmail.com> <20110310211519.GA11862@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41958 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333Ab1CKHMK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Mar 2011 02:12:10 -0500
In-Reply-To: <20110310211519.GA11862@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 03/10/2011 11:15 PM, Greg KH wrote:
> Are you sure the driver is loaded?
It doesn't load - it fails on inserting.
I should've probably reminded you that in my recent messages.

> What happens if you do:
> 	rmmod samsung-laptop
> 	dmesg -c
> 	modprobe samsung-laptop debug=1
>
> can you send me the output of 'dmesg' after doing the above as root?
Sure:

nick@merry:~$ dmesg
nick@merry:~$ sudo modprobe samsung-laptop debug=1
FATAL: Error inserting samsung_laptop 
(/lib/modules/2.6.37+/kernel/drivers/staging/samsung-laptop/samsung-laptop.ko): 
No such device
nick@merry:~$ dmesg
[  179.689516] samsung_laptop: module is from the staging directory, the 
quality is unknown, you have been warned.
nick@merry:~$ sudo modprobe samsung-laptop debug=1 force=1
FATAL: Error inserting samsung_laptop 
(/lib/modules/2.6.37+/kernel/drivers/staging/samsung-laptop/samsung-laptop.ko): 
Invalid argument
nick@merry:~$ dmesg
[  179.689516] samsung_laptop: module is from the staging directory, the 
quality is unknown, you have been warned.
[  190.474615] samsung_laptop: module is from the staging directory, the 
quality is unknown, you have been warned.
[  190.479681] This computer does not support SABI
nick@merry:~$

Thank you.

Sincerely,
Nick

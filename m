From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Thu, 10 Mar 2011 23:05:09 +0200
Message-ID: <4D793D05.3070908@gmail.com>
References: <20110209224006.GA11202@kroah.com> <AANLkTikrr6Gu_qoq73ASC95E0HQC1p6KzDPLxo=J_rva@mail.gmail.com> <20110225210334.GB16860@kroah.com> <4D6823DD.6040809@gmail.com> <20110225225055.GA5931@kroah.com> <4D787714.6060405@gmail.com> <20110310170143.GA24559@kroah.com> <AANLkTinyqJx76=nzepa9fe5VDzqiXRGCQ=E1SsKm2npE@mail.gmail.com> <20110310171940.GA24972@kroah.com> <4D790A20.3050105@gmail.com> <20110310180959.GA26927@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:49013 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752934Ab1CJVGo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Mar 2011 16:06:44 -0500
In-Reply-To: <20110310180959.GA26927@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 03/10/2011 08:09 PM, Greg KH wrote:
> Great, here's a new version of the samsung-laptop.c file, can you
> replace it whereever you were building the previous one, rebuild it and
> test it for this machine to see if it works?
This is really strange.

It's all the same. I tried the new samsung-laptop.c on n230 and the previous
version on n210 - the results are the same as before.

Could it be that samsung-laptop has some dependencies unspecified?

I'm using the stock 2.6.32 kernel configuration on 2.6.37 after running make
menuconfig. I can' send it to you, if you wish.

Thank you :)

Sincerely,
Nick

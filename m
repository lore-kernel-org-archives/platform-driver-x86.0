From: Thomas Renninger <trenn@suse.de>
Subject: Re: How to read time stamp from HPET timer from device driver?
Date: Thu, 15 Jul 2010 18:39:35 +0200
Message-ID: <201007151839.35690.trenn@suse.de>
References: <AANLkTimTF1tNxpfd86a9h6PDKDeFiq9zQcHCbKyfTm5M@mail.gmail.com> <20100713130836.GD9114@barata.holoscopio.com> <AANLkTimILvk8XUGeoct6_DZKtAvjSSg9wmQwXRkt42_h@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43579 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933768Ab0GOQjb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Jul 2010 12:39:31 -0400
In-Reply-To: <AANLkTimILvk8XUGeoct6_DZKtAvjSSg9wmQwXRkt42_h@mail.gmail.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Samuel Xu <samuel.xu.tech@gmail.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, platform-driver-x86@vger.kernel.org

On Tuesday 13 July 2010 03:34:50 pm Samuel Xu wrote:
> Hi, Cascardo:
> Thanks for reply! I just want to get the guide on some sample code of
> HPET usage invoked from kernel mode driver.
You must not use hpet directly to keep track of the time.
There is HW which does not have an hpet, or the kernel may choose a better
(faster, eventually broken hpet timers workarounds, whatever...)
time source to retrieve the time.

> Any directly guide?
Have a look at: include/linux/time.h
An example making a bit use of it is:
drivers/cpufreq/cpufreq_ondemand.c
grepping for time shows some examples.

      Thomas

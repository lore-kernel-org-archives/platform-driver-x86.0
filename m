From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: platform/x86/peaq-wmi on non-peaq devices
Date: Tue, 31 Oct 2017 10:14:58 +0100
Message-ID: <41b5889c-a0aa-6337-8fde-2cc1b4446a77@redhat.com>
References: <CAPWNY8WUKOGSjCKrn9wkvMev8M_VX4eqXHk7uNF1CGH3=pGwNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55528 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750978AbdJaJPH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2017 05:15:07 -0400
In-Reply-To: <CAPWNY8WUKOGSjCKrn9wkvMev8M_VX4eqXHk7uNF1CGH3=pGwNQ@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

Hi,

On 31-10-17 10:13, Mantas Mikulėnas wrote:
> Hello,
> 
> Recently I have seen quite a few people (in Linux support channels I frequent) have issues with the peaq-wmi driver being autoloaded on *non* PEAQ devices and subsequently flooding the user with ghost keypresses. They end up having to blacklist the module locally.
> 
> I noticed that the WMI GUID used by the driver, {ABBC0F6F-8EA1-11D1-00A0-C90629100000}, is identical to a GUID used in *Windows driver examples* published by Microsoft. (For example, it shows up on Google at <https://github.com/Microsoft/Windows-driver-samples/blob/master/wmi/wmiacpi/device.asl>.)
> 
> So I'm guessing that quite a few manufacturers decided to copy&paste this GUID into their own drivers/firmwares, but use it for completely different things. Given that, instead of trying to build a DMI blacklist in the module, perhaps the right thing would be to add a DMI *whitelist*?

Correct this is already queued for 4.15, with a Cc: stable:

http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/shortlog/refs/heads/for-next

Regards,

Hans

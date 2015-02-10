From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH resend 5/6] toshiba_acpi: Add support to enable/disable
 USB 3
Date: Mon, 9 Feb 2015 21:46:07 -0700
Message-ID: <CAGdLNWGvqcTX09_kqZWScJFj96+L3=kjKE1d0aQKnQ_wrawazQ@mail.gmail.com>
References: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
	<1423539294-2941-6-git-send-email-coproscefalo@gmail.com>
	<20150210041138.GC37927@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:37116 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761701AbbBJEqJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Feb 2015 23:46:09 -0500
In-Reply-To: <20150210041138.GC37927@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-02-09 21:11 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Feb 09, 2015 at 08:34:53PM -0700, Azael Avalos wrote:
>> Toshiba laptops that come with USB 3 ports have a feature that lets
>> them disable USB 3 functionality and act as a regular USB 2 port, and
>> thus, saving power.
>>
>> This patch adds support to that feature, by creating a sysfs entry
>> named "usb_three", acceptig only two parameters, 0 to disable the
>> USB 3 (acting as a USB 2) and 1 to enable it.
>>
>
> Similar question, does the system BIOS allow you to configure this setting? If
> so, what would be the value for enabling it in the OS directly?

Yes.
A Toshiba provided app lets you configure all these parameters from Windows,
and so, I'm developing a similar app for this, a few clicks and your
settings are
changed on the next reboot :-)

>
> --
> Darren Hart
> Intel Open Source Technology Center

Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --

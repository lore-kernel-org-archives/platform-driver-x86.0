From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH resend 5/6] toshiba_acpi: Add support to enable/disable
 USB 3
Date: Mon, 9 Feb 2015 22:02:23 -0700
Message-ID: <CAGdLNWGSXLO7i6-0NRtAYYGtFiDn+DGcySSoCaJGF5KKHM2D+Q@mail.gmail.com>
References: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
	<1423539294-2941-6-git-send-email-coproscefalo@gmail.com>
	<20150210041138.GC37927@fury.dvhart.com>
	<CAGdLNWGvqcTX09_kqZWScJFj96+L3=kjKE1d0aQKnQ_wrawazQ@mail.gmail.com>
	<20150210045552.GF37927@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:59959 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750791AbbBJFC3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Feb 2015 00:02:29 -0500
In-Reply-To: <20150210045552.GF37927@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Len Brown <len.brown@intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

Hi Darren,

2015-02-09 21:55 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Feb 09, 2015 at 09:46:07PM -0700, Azael Avalos wrote:
>> Hi Darren,
>>
>> 2015-02-09 21:11 GMT-07:00 Darren Hart <dvhart@infradead.org>:
>> > On Mon, Feb 09, 2015 at 08:34:53PM -0700, Azael Avalos wrote:
>> >> Toshiba laptops that come with USB 3 ports have a feature that lets
>> >> them disable USB 3 functionality and act as a regular USB 2 port, and
>> >> thus, saving power.
>> >>
>> >> This patch adds support to that feature, by creating a sysfs entry
>> >> named "usb_three", acceptig only two parameters, 0 to disable the
>> >> USB 3 (acting as a USB 2) and 1 to enable it.
>> >>
>> >
>> > Similar question, does the system BIOS allow you to configure this setting? If
>> > so, what would be the value for enabling it in the OS directly?
>>
>> Yes.
>
> Yes it's available in the BIOS?

Yes, it is available in the BIOS, sorry for not making that clear.

>
>> A Toshiba provided app lets you configure all these parameters from Windows,
>> and so, I'm developing a similar app for this, a few clicks and your
>> settings are
>> changed on the next reboot :-)
>>
>
> And I understand now that independent of the BIOS question, Windows has a
> program to make these changes. Blech. Going to think on these overnight and get
> back to you.
>
> I'd welcome the thoughts of the previous maintainers as to whether we want to
> include these kinds of OS-parity changes in the kernel. I'm probably leaning
> toward taking them.

Just let me know as to send a refreshed set of patches.

>
> Matthew, Len, is there some kind of precedent I need to be aware of here?
>
> --
> Darren Hart
> Intel Open Source Technology Center

Cheers
Azael

-- 
-- El mundo apesta y vosotros apestais tambien --

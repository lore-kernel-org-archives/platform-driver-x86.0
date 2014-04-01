From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH v5 0/1] Add WMI driver to control AlienFX features
Date: Tue, 01 Apr 2014 17:18:00 -0500
Message-ID: <533B3B18.1030000@dell.com>
References: <1395842248-27868-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60pc101.us.dell.com ([143.166.85.206]:16348 "EHLO
	ausc60pc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751626AbaDAWSY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Apr 2014 18:18:24 -0400
In-Reply-To: <1395842248-27868-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "matthew.garrett@nebula.com" <matthew.garrett@nebula.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On 03/26/2014 08:57 AM, Limonciello, Mario wrote:
> This is a driver for the Alienware X51, X51 R2 and some future HW.
>   - For the X51 / X51 R2 it allows control of the color and brightness
>     of each zone via a sysfs interface for the color and a LED interface
>     for the brightness
>   - For the future HW it allows control of color and brightness as well
>     as an HDMI mux that's included in the HW.
>
> Changes from v4 to v5:
>   - Make zone control more like the thingm RGB LED in the kernel.  Brightness
>     control is independent of the RGB adjustment.  RGB adjustment takes a 24-bit
>     hexadecimal triplet.
>   - Introduced a new WMAX method for platforms that use HDMI as well as a new
>     lighting control interface.  This removes the present necessity of having
>     to do a DMI match on HDMI for now.
>   - Dynamically create number of sysfs zone nodes based on DMI data. Present
>     platforms have 3 nodes, but some future ones will have anywhere from 2
>     to 32 nodes.
>   - Make lighting control state and HDMI more readable and usable for
>     interacting. Rather than having to know numbers, cat'ing the nodes will
>     output the available options and the presently selected option (in a
>     single line)
>
> Mario Limonciello (1):
>    Add WMI driver for controlling AlienFX features on some Alienware
>      products
>
>   drivers/platform/x86/Kconfig         |  12 +
>   drivers/platform/x86/Makefile        |   2 +
>   drivers/platform/x86/alienware-wmi.c | 557 +++++++++++++++++++++++++++++++++++
>   3 files changed, 571 insertions(+)
>   create mode 100644 drivers/platform/x86/alienware-wmi.c
>
Matthew,

Any feedback to apply on this?

Thanks,

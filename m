From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 03 Mar 2011 15:11:01 +0800
Message-ID: <4D6F3F05.8000105@canonical.com>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com> <20110103204910.GA4223@srcf.ucam.org> <4D6EA053020000230002943D@novprvlin0050.provo.novell.com> <201103022109.51600.carlos@strangeworlds.co.uk> <4D6F0830.1090905@canonical.com> <4D6FD4C90200002300029504@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:45959 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753353Ab1CCHLP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Mar 2011 02:11:15 -0500
In-Reply-To: <4D6FD4C90200002300029504@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

On 03/03/2011 02:50 PM, Joey Lee wrote:
> Hi Ike, 
> 
> 
> Yes, I just simply check the Ideapad S12's DSDT that was dumped by
> Ville-Pekka Vaino, it also declare VPC2004 devices in EC block.
> 
> And, 
> per Vaino's mail, he said ideapad-laptop handle the killswitches better
> on Ideapad S12.
> 
> Did you have any plan to add the module alias for all known machines
> that were support VPC2004 devices?

I believe its already done. The ideapad-laptop driver will bind on
ACPI:VPC2004 device.

In drivers/platform/x86/ideapad-laptop.c

static const struct acpi_device_id ideapad_device_ids[] = {
        { "VPC2004", 0},
        { "", 0},
};
MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);

> 
> 
> Thank's
> Joey Lee
> 

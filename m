From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH v3 0/1] alienware-wmi: Update HDMI control methods
Date: Wed, 26 Feb 2014 18:16:55 -0600
Message-ID: <530E83F7.5060801@dell.com>
References: <1393458459-29353-1-git-send-email-mario_limonciello@dell.com> <1393459426.14900.56.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60pc101.us.dell.com ([143.166.85.206]:44641 "EHLO
	ausc60pc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754261AbaB0AQ4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Feb 2014 19:16:56 -0500
In-Reply-To: <1393459426.14900.56.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On 02/26/2014 06:03 PM, Matthew Garrett wrote
> Could you clarify what the HDMI mux is for? Is there any method in the
> HDMI WMI call to determine whether it's supported rather than relying on
> DMI? (I appreciate that in this kind of case there may not be)
>
The HDMI mux will control what's displayed on the HDMI output port. It can toggle between an HDMI input device and the system's standard video output.

Since the same GUID and WMI method are used both on platforms that support HDMI mux as well as platforms that support just lighting control I don't think it will be possible to determine if it's supported.  You could possibly make a WMI call and attempting to toggle or query, however the behavior is undefined for those arguments on firmware for other systems.  While I was initially putting this driver together I made mistakes with the arguments early on that caused very colorful corruption all over the display, so I think it would be better to restrict it by DMI data if possible.

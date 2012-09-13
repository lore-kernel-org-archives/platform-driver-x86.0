From: "Nathanael D. Noblet" <nathanael@gnat.ca>
Subject: Re: Acer-WMI disables touchpad and other issues
Date: Thu, 13 Sep 2012 09:47:06 -0600
Message-ID: <5051FFFA.3010506@gnat.ca>
References: <502BD214.6090700@gnat.ca>  <50516276.7010103@gnat.ca> <1347530718.705.23.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from idcmail-mo1so.shaw.ca ([24.71.223.10]:51018 "EHLO
	idcmail-mo1so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754719Ab2IMPrO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Sep 2012 11:47:14 -0400
In-Reply-To: <1347530718.705.23.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: jlee@novell.com, platform-driver-x86@vger.kernel.org, mjg@redhat.com

Hello Joey li,

On 09/13/2012 04:05 AM, joeyli wrote:
> On the other hand,
> I checked your dmideocde on brc#848720, the 0x82 is the RIGHT acpi code
> to you for touchpad_toggle key, that means acer-wmi should emit
> KEY_TOUCHPAD_TOGGLE to userland. There have another thing also listen
> the KEY_TOUCHPAD_TOGGLE and do the change. I checked the
> gnome-settings-daemon, it just show up OSD but didn't change touchpad
> status.

I was discussing this with Matthew Garrett in #fedora-kernel. He's 
telling me that if the hardware does the enabling/disabling that it 
should not emit _TOGGLE, but that it should emit KEY_TOUCHPAD_ON or 
KEY_TOUCHPAD_OFF instead. I'm in no place to know one way or the other. 
I've CC'd him on this so the discussion of the issue can continue to 
figure out what the source problem is.


Thanks again for the help, I'll get the acipdump and dmesg logs sometime 
today.

-- 
Nathanael d. Noblet
t 403.875.4613

From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Acer-WMI disables touchpad and other issues
Date: Thu, 13 Sep 2012 17:03:41 +0100
Message-ID: <20120913160341.GA13029@srcf.ucam.org>
References: <502BD214.6090700@gnat.ca>
 <50516276.7010103@gnat.ca>
 <1347530718.705.23.camel@linux-s257.site>
 <5051FFFA.3010506@gnat.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:44805 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758454Ab2IMQDy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Sep 2012 12:03:54 -0400
Content-Disposition: inline
In-Reply-To: <5051FFFA.3010506@gnat.ca>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Nathanael D. Noblet" <nathanael@gnat.ca>
Cc: joeyli <jlee@suse.com>, jlee@novell.com, platform-driver-x86@vger.kernel.org

On Thu, Sep 13, 2012 at 09:47:06AM -0600, Nathanael D. Noblet wrote:
> Hello Joey li,
> 
> On 09/13/2012 04:05 AM, joeyli wrote:
> >On the other hand,
> >I checked your dmideocde on brc#848720, the 0x82 is the RIGHT acpi code
> >to you for touchpad_toggle key, that means acer-wmi should emit
> >KEY_TOUCHPAD_TOGGLE to userland. There have another thing also listen
> >the KEY_TOUCHPAD_TOGGLE and do the change. I checked the
> >gnome-settings-daemon, it just show up OSD but didn't change touchpad
> >status.
> 
> I was discussing this with Matthew Garrett in #fedora-kernel. He's
> telling me that if the hardware does the enabling/disabling that it
> should not emit _TOGGLE, but that it should emit KEY_TOUCHPAD_ON or
> KEY_TOUCHPAD_OFF instead. I'm in no place to know one way or the
> other. I've CC'd him on this so the discussion of the issue can
> continue to figure out what the source problem is.

Right - TOUCHPAD_TOGGLE is a request from the hardware that the desktop 
environment change the state. In this case hitting the key is causing 
the hardware to change its state directly, and therefore it should just 
be sending KEY_TOUCHPAD_ON or KEY_TOUCHPAD_OFF.

-- 
Matthew Garrett | mjg59@srcf.ucam.org

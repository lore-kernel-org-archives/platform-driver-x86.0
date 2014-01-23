From: Stephan Mueller <smueller@chronox.de>
Subject: Sony Vaio Duo 11: getting middle mouse button to work
Date: Thu, 23 Jan 2014 17:21:10 +0100
Message-ID: <1674012.xCMptsh8XR@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:34781 "EHLO mail.eperm.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751169AbaAWQ3a (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jan 2014 11:29:30 -0500
Received: from myon.chronox.de
	by mail.eperm.de with [XMail 1.27 ESMTP Server]
	id <S3DE> for <platform-driver-x86@vger.kernel.org> from <smueller@chronox.de>;
	Thu, 23 Jan 2014 17:21:17 +0100
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi,

I hope this is the right list for my question -- if not, please help me 
finding the right destination.

I have a Sony Vaio Duo 11 where the middle mouse button does not work.

The device in lsusb is listed as:

Bus 001 Device 005: ID 26e1:c1a0

Greping through the kernel for device IDs I do not find a driver in the kernel 
that is explicitly written for that mouse. So, I expect the generic USB mouse 
picks this device up.

The input framework knows the device as:

/dev/input/event3:      Crucialtek co.,LTD Optical Track Pad

The problem now is that the middle mouse button does not seem to be activated 
at all:

- xev does not record any events

- playing around with debug modes of the sony_laptop does not indicate that it 
records any events for special keys

- using usbmon to sniff the raw USB events does not show any events being 
communicated when pressing/releasing the middle mouse button

Note, the right and left button work flawless.

As I am out of ideas. Does anybody have an idea on how to identify where the 
problem is? Would I need to send some "enabling" events to the mouse before it 
activates the middle mouse button? Or is there anything in Linux that could 
help me debug the situation?

As a side note: initially there was Windows on the box. And the middle mouse 
button worked on it. So, the hardware should have no problems.

Thanks a lot
Stephan
-- 
| Cui bono? |

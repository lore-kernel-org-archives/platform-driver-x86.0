From: "R, Durgadoss" <durgadoss.r@intel.com>
Subject: A new Subsystem for Current Management
Date: Sat, 5 Nov 2011 12:43:14 +0530
Message-ID: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:53498 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750938Ab1KEHNX convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 5 Nov 2011 03:13:23 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: Guenter Roeck <guenter.roeck@ericsson.com>, Alan Cox <alan@linux.intel.com>

Hi All,

[Very Sorry for the big e-mail]

As we all know, Linux is increasingly being used in handhelds.
The Hardware that supports the handhelds is also becoming
Performance-centric. With this, we need a way to efficiently
monitor the current consumption of the platform and take actions
when the platform draws more current, than it should.

Where does this happen ?
------------------------
In a handheld, there are many components that demand high
Current. For example, Camera Flash, Video Streaming, 3G Voice
Call etc. Typically, two or more of these components are used
simultaneously in a real-time scenario. When this happens, the
current draw of the platform surges. If this surge lasts for
more than a specific time, it could crash the platform irrecoverably.

How do we tackle this ?
-----------------------
In Intel Medfield (Atom based) platform we had a driver that
Configures the current limits. When the platform current draws
more current than the programmed limit, the hardware generates
interrupt. The driver receives this interrupt and notifies the
user space to take appropriate actions.
The patch and the subsequent discussions can be found here:
http://comments.gmane.org/gmane.linux.drivers.platform.x86.devel/1197

To Generalize:
--------------
With many more platforms to come, having a separate driver for each
results in heavy code duplication. Also, there arises a problem of
where to put these kind of drivers ? Hence I propose the idea of having
a Current Management subsystem.

This will provide a generic ABI, API, so that the platform specific
drivers can register with this framework (and thus avail the basic
needs) and handle the events in their own way.

In simple terms, this framework will offer something like this:
	Current[1-N]_limit - set of current limits
	Voltage[1-X]_limit - set of voltage limits
	Controllers[1-Y]_enable - These are the components by throttling/
      disabling which the current consumption can be brought down.

With the Controllers we can follow two approaches:
A) Each component driver registers with the current framework and gets
notified when the current surge happens. On receiving the notification,
it throttles its performance. There will be a follow-up notification,
indicating that 'we are out of the high current' situation; so that
the component resumes to operation at its full performance.

B) The Current framework forwards the notification to the upper
layers and lets them decide what to do.

I agree that A) bloats the size of all the component drivers a bit,
but considering the fact that the surge has to be brought down as
soon as possible (and the delay in reacting to the event if we
pass it to the upper layers) I am inclined towards A).

I would like to see the opinion of the community on this entire
stuff, before I start writing some code.

Please Help,
Durga

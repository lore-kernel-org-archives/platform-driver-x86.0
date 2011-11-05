From: Guenter Roeck <guenter.roeck@ericsson.com>
Subject: Re: A new Subsystem for Current Management
Date: Sat, 5 Nov 2011 08:50:54 -0700
Message-ID: <20111105155054.GC15329@ericsson.com>
References: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from imr4.ericy.com ([198.24.6.9]:51573 "EHLO imr4.ericy.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752723Ab1KEPwk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 5 Nov 2011 11:52:40 -0400
Content-Disposition: inline
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alan Cox <alan@linux.intel.com>

On Sat, Nov 05, 2011 at 03:13:14AM -0400, R, Durgadoss wrote:
> Hi All,
> 
> [Very Sorry for the big e-mail]
> 
> As we all know, Linux is increasingly being used in handhelds.
> The Hardware that supports the handhelds is also becoming
> Performance-centric. With this, we need a way to efficiently
> monitor the current consumption of the platform and take actions
> when the platform draws more current, than it should.
> 
> Where does this happen ?
> ------------------------
> In a handheld, there are many components that demand high
> Current. For example, Camera Flash, Video Streaming, 3G Voice
> Call etc. Typically, two or more of these components are used
> simultaneously in a real-time scenario. When this happens, the
> current draw of the platform surges. If this surge lasts for
> more than a specific time, it could crash the platform irrecoverably.
> 
> How do we tackle this ?
> -----------------------
> In Intel Medfield (Atom based) platform we had a driver that
> Configures the current limits. When the platform current draws
> more current than the programmed limit, the hardware generates
> interrupt. The driver receives this interrupt and notifies the
> user space to take appropriate actions.
> The patch and the subsequent discussions can be found here:
> http://comments.gmane.org/gmane.linux.drivers.platform.x86.devel/1197
> 
> To Generalize:
> --------------
> With many more platforms to come, having a separate driver for each
> results in heavy code duplication. Also, there arises a problem of
> where to put these kind of drivers ? Hence I propose the idea of having
> a Current Management subsystem.
> 
> This will provide a generic ABI, API, so that the platform specific
> drivers can register with this framework (and thus avail the basic
> needs) and handle the events in their own way.
> 
> In simple terms, this framework will offer something like this:
> 	Current[1-N]_limit - set of current limits
> 	Voltage[1-X]_limit - set of voltage limits
> 	Controllers[1-Y]_enable - These are the components by throttling/
>       disabling which the current consumption can be brought down.
> 
hwmon already has

power[1-*]_cap
power[1-*]_crit

with explicit mention of "the system is expected take drastic action to reduce
power consumption, such as a system shutdown or a forced powerdown of some devices".

We also have

curr[1-*]_crit

though with no explicit mention of any action to be taken. We also have a pending patch
(waiting for someone to comment on it) to add notification and uevent support to sysfs ABI.
It is at the tip of my staging tree:
http://git.kernel.org/?p=linux/kernel/git/groeck/linux-staging.git;a=shortlog;h=refs/heads/hwmon-staging

Using this would address reporting to userspace. Question is how to handle any actions.
The regulator subsystem may be better suited to handle this, as already suggested.
Another approach would be to have a kernel-internal notification mechanism, which 
was already suggested for the hwmon subsystem.

Either case, I don't think a framework should be restricted to currents.
Power may be an even more important factor to determine if the system needs to be throttled.
In some cases, it may be necessary to reduce (or increase ?) voltage to reduce
current. So I think this will need a more comprehensive approach.

Thanks,
Guenter

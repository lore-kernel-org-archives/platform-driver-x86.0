From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [lm-sensors] A new Subsystem for Current Management
Date: Sun, 6 Nov 2011 14:05:56 +0100
Message-ID: <20111106140556.569a1b21@endymion.delvare>
References: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:5337 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252Ab1KFNGM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 6 Nov 2011 08:06:12 -0500
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: lm-sensors@lm-sensors.org, platform-driver-x86@vger.kernel.org, Alan Cox <alan@linux.intel.com>

Hi Durga,

On Sat, 5 Nov 2011 12:43:14 +0530, R, Durgadoss wrote:
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

I would argue that leaving the actions to user-space is wrong by
design. For something as critical as hardware integrity, ideally the
hardware and BIOS would be enough to guarantee it under any
circumstances. If that is not possible then I would hope that the kernel
alone can handle it. User-space may not always be there (think of the
boot sequence, or missing/broken package on the system.) Furthermore,
user-space will inevitably need to ask kernel drivers to do the job, so
you do kernel -> user-space -> kernel, which is certainly not the way
to go if you care about response times to critical events.

If user-space notification is in addition to actions already taken
directly by the kernel, then it's OK. But I admit I'm not quite sure
what extra actions user-space could take.

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
> With the Controllers we can follow two approaches:
> A) Each component driver registers with the current framework and gets
> notified when the current surge happens. On receiving the notification,
> it throttles its performance. There will be a follow-up notification,
> indicating that 'we are out of the high current' situation; so that
> the component resumes to operation at its full performance.
> 
> B) The Current framework forwards the notification to the upper
> layers and lets them decide what to do.
> 
> I agree that A) bloats the size of all the component drivers a bit,
> but considering the fact that the surge has to be brought down as
> soon as possible (and the delay in reacting to the event if we
> pass it to the upper layers) I am inclined towards A).

It really depends on how much A) adds to individual drivers and how
much extra time B) takes in practice. Each option has a downside, so
it's very hard to decide without real-world numbers.

-- 
Jean Delvare

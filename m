From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [lm-sensors] A new Subsystem for Current Management
Date: Sun, 6 Nov 2011 14:13:02 +0100
Message-ID: <20111106141302.40365383@endymion.delvare>
References: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
	<CADkCAuv16KY4B-A-Oym-1pX+7WmP2WWzRZMsKeB_1=7-DfDASw@mail.gmail.com>
	<D6D887BA8C9DFF48B5233887EF04654109F102E436@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:4216 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752128Ab1KFNNK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 6 Nov 2011 08:13:10 -0500
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109F102E436@bgsmsx502.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, platform-driver-x86@vger.kernel.org, lm-sensors@lm-sensors.org, Alan Cox <alan@linux.intel.com>

On Sat, 5 Nov 2011 22:06:22 +0530, R, Durgadoss wrote:
> Hi,
> 
> On Nov 5, 2011 2:16 AM, "R, Durgadoss" <durgadoss.r@intel.com> wrote:
> >> Also, there arises a problem of
> >> where to put these kind of drivers ? Hence I propose the idea of having
> >> a Current Management subsystem.
> 
> > I love the idea. But is really more of an evolution of the regulator
> > framework rather than a completely distinct concept and API?
> 
> I agree. I went through the regulator framework to make this concept
> fit in there. But, realistically this complete thing does not fit in
> there exactly. Hence, my proposal for a new framework.

I believe you'll have to elaborate a bit more than just "this complete
thing does not fit in there exactly." The problem you are trying to
tackle may be new to x86, because x86 is relatively new to the
embedded / low-power systems, but other architectures have been doing
that for over a decade.

While the regulator subsystem presents itself as aiming at power
savings to improve battery life, it doesn't seem fundamentally
different from the need you described. Whether you lower current draw
to save battery life or to prevent the hardware from dying, makes
little difference, the underlying mechanisms should be pretty similar.

Sending this post to the x86 platform driver list is the wrong approach
IMHO. You'd rather ask on lists of other embedded architectures how
they solved the problem on their side, and then see what it would take
to build on their existing solutions.

-- 
Jean Delvare

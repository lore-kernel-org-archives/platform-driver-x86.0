From: "R, Durgadoss" <durgadoss.r@intel.com>
Subject: RE: [lm-sensors] A new Subsystem for Current Management
Date: Sat, 5 Nov 2011 22:06:22 +0530
Message-ID: <D6D887BA8C9DFF48B5233887EF04654109F102E436@bgsmsx502.gar.corp.intel.com>
References: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
 <CADkCAuv16KY4B-A-Oym-1pX+7WmP2WWzRZMsKeB_1=7-DfDASw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:54257 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753253Ab1KEQg3 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 5 Nov 2011 12:36:29 -0400
In-Reply-To: <CADkCAuv16KY4B-A-Oym-1pX+7WmP2WWzRZMsKeB_1=7-DfDASw@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Alan Cox <alan@linux.intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>

Hi,

On Nov 5, 2011 2:16 AM, "R, Durgadoss" <durgadoss.r@intel.com> wrote:
>> Also, there arises a problem of
>> where to put these kind of drivers ? Hence I propose the idea of having
>> a Current Management subsystem.

> I love the idea. But is really more of an evolution of the regulator
> framework rather than a completely distinct concept and API?

I agree. I went through the regulator framework to make this concept
fit in there. But, realistically this complete thing does not fit in
there exactly. Hence, my proposal for a new framework.

Thanks,
Durga

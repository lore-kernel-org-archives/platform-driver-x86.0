From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: don't yell on unsupported brightness interfaces
Date: Fri, 6 Nov 2015 15:19:43 +0100
Message-ID: <CANq1E4TQUunxqfuxMjwmJGfOD0tjoJuH8T548XaGkSKEp-Ep_g@mail.gmail.com>
References: <1445424370-4725-1-git-send-email-dh.herrmann@gmail.com>
	<1445438032.750540.416379153.1ECC9658@webmail.messagingengine.com>
	<20151021144410.GB29166@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:33653 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161370AbbKFOTp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Nov 2015 09:19:45 -0500
In-Reply-To: <20151021144410.GB29166@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, linux-kernel <linux-kernel@vger.kernel.org>

Hi Darren!

On Wed, Oct 21, 2015 at 4:44 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Oct 21, 2015 at 12:33:52PM -0200, Henrique de Moraes Holschuh wrote:
>> On Wed, Oct 21, 2015, at 08:46, David Herrmann wrote:
>> > The thinkpad_acpi driver currently emits error messages on unsupported
>> > brightness interfaces, giving the impression that someone will implement
>> > those. However, this error is spit out on nearly every thinkpad in
>> > production since 2 years now. Furthermore, the backlight interfaces on
>> > those devices are supported by the i915 driver just fine.
>> >
>> > Downgrade the error message to a normal pr_info() and stop telling people
>> > to report it to IBM.
>>
>> IBM?  Those reports go directly to me.
>>
>> > Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
>>
>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>
> Thanks, Queued.

Any particular reason this didn't show up in:
    [GIT PULL] platform-drivers-x86 for 4.4-1

Just a kind reminder, in case it slipped through the cracks.

Thanks
David

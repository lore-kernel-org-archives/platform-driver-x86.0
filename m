From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: don't yell on unsupported brightness
 interfaces
Date: Sat, 09 Jan 2016 15:32:38 -0200
Message-ID: <1452360758.672752.487412298.7D14D501@webmail.messagingengine.com>
References: <1445424370-4725-1-git-send-email-dh.herrmann@gmail.com>
 <1445438032.750540.416379153.1ECC9658@webmail.messagingengine.com>
 <20151021144410.GB29166@vmdeb7>
 <CANq1E4TQUunxqfuxMjwmJGfOD0tjoJuH8T548XaGkSKEp-Ep_g@mail.gmail.com>
 <20151106175706.GE18221@malice.jf.intel.com>
 <CANpvso5BV-i8eE24vnTFPH=VAYFDy04U2N-Q7YRqpzd9bkbhJA@mail.gmail.com>
 <CANq1E4SZZGxt21c3KpxJD_S=poMOttYaEOLYpDrSfmgXLQ+e7g@mail.gmail.com>
 <CANpvso73jhJsFDVyid9akNqcPUbSYT1b4LBb=ywUxj47PXQ7qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46862 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754221AbcAIRcj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jan 2016 12:32:39 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 679442076B
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jan 2016 12:32:38 -0500 (EST)
In-Reply-To: <CANpvso73jhJsFDVyid9akNqcPUbSYT1b4LBb=ywUxj47PXQ7qA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Curtin <ericcurtin17@gmail.com>, David Herrmann <dh.herrmann@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Jan 8, 2016, at 15:26, Eric Curtin wrote:
> As regards the "Unsupported brightness interface" log message will I
> add 101 to the switch statement so it doesn't get reported on my device
> or just remove it? This seems to be reporting many false positives (or
> negatives whatever way you want to look at it) on different machines so
> can I remove this logging?

Either remove the message, or leave it at debug level.  Do not add 101
to the switch case, please.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

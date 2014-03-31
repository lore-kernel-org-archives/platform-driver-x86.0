From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH V4 RESEND] Support Thinkpad X1 Carbon 2nd gen's adaptive
 keyboard
Date: Mon, 31 Mar 2014 14:49:49 -0300
Message-ID: <1396288189.17715.101062725.0503948F@webmail.messagingengine.com>
References: <531EECF9.1040600@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54756 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753329AbaCaRtu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 31 Mar 2014 13:49:50 -0400
In-Reply-To: <531EECF9.1040600@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Shuduo Sang <shuduo.sang@canonical.com>, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bruce.ma@canonical.com

On Tue, Mar 11, 2014, at 8:01, Shuduo Sang wrote:
> Resend patch V4. Support Thinkpad X1 Carbon 2nd generation's adaptive
> keyboard.
> 
> Hi Henrique, could you please have a chance to review it?

I am unable to do a full review right now, but we can always adjust
minor details of the feature with later patches and the previous reviews
did help clean up the feature.

However: as far as I am concerned, this is an experimental feature until
it matures for a while.  I'd rather we plug this somehow to the
thinkpad-acpi input map, for example.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

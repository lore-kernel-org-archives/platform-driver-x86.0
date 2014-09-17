From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] x86: thinkpad_acpi.c: fixed spacing coding style issue
Date: Wed, 17 Sep 2014 07:45:50 -0300
Message-ID: <20140917104550.GB8594@khazad-dum.debian.net>
References: <1410904868-10406-1-git-send-email-janvdberg@gmail.com>
 <20140916221236.GB12780@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57590 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751564AbaIQKqD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Sep 2014 06:46:03 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by gateway2.nyi.internal (Postfix) with ESMTP id D92DB20E52
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Sep 2014 06:46:02 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140916221236.GB12780@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jan van den Berg <janvdberg@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 16 Sep 2014, Darren Hart wrote:
> On Wed, Sep 17, 2014 at 12:01:08AM +0200, Jan van den Berg wrote:
> > Fixed 22 similar coding style issues: "ERROR: spaces required around that '?'"
> > 
> > Signed-off-by: Jan van den Berg <janvdberg@gmail.com>
> 
> Queued, thanks.

I usually refuse "fix whitespace" patches because git blame is not smart
enough to skip such commits.    They effectively pollute history for zero
gain.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

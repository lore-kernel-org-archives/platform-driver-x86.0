From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad-acpi: recognize Lenovo as
 version string in newer V-series BIOS
Date: Tue, 13 Mar 2012 17:07:45 -0300
Message-ID: <20120313200744.GA3260@khazad-dum.debian.net>
References: <1331335944-4662-1-git-send-email-manoj.iyer@canonical.com>
 <1331335944-4662-2-git-send-email-manoj.iyer@canonical.com>
 <20120310042844.GA14972@khazad-dum.debian.net>
 <1331387907.2833.33.camel@scapa>
 <20120310160609.GA6254@khazad-dum.debian.net>
 <alpine.DEB.2.02.1203121558340.3458@lazy>
 <20120312230213.GA20690@khazad-dum.debian.net>
 <alpine.DEB.2.02.1203121852500.6421@lazy>
 <alpine.DEB.2.02.1203131046540.4292@lazy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56523 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752370Ab2CMUHu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Mar 2012 16:07:50 -0400
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id D8B4220EF3
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Mar 2012 16:07:49 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1203131046540.4292@lazy>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Manoj Iyer <manoj.iyer@canonical.com>
Cc: Ike Pan <ike.pan@canonical.com>, Yves-Alexis Perez <corsac@debian.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Dennis Chua <dennis.chua@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, James Ferguson <james.ferguson@canonical.com>

On Tue, 13 Mar 2012, Manoj Iyer wrote:
> On Mon, 12 Mar 2012, Manoj Iyer wrote:
> >>> I am trying to get this patched module tested on other thinkpad and
> >>> ideapads that we have to see if there are any regression or other
> >>> issues. So, please let me know if this something worth supporting.
> >> 
> >> Yes, it looks like it is worth supporting alright.
> >
> > ok great. So, as I said earlier I will try and get this patched module tested 
> > on other ideapads to make sure we are not breaking existing systems. 
> > Unfortunately the systems are with our Taiwan engineers and will take a 
> > couple of days for them to get back with results.
> 
> The patch was tested by the following people on ThinkPads, V480, and 
> ideapads, and found to work as expected. I am informed that it does not 
> break existing thinkpads, and it fixes issues mentioned on the V480. Can 
> you please add the following tested-by when you apply the patch to your 
> tree?
> 
> Tested-by: James Ferguson <james.ferguson@canonical.com>
> Tested-by: Dennis Chua <dennis.chua@canonical.com>
> Tested-by: Ike Pan <ike.pan@canonical.com>

Very well,

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Matthew, can you please pick it?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

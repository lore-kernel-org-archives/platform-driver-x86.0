From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] save and restore adaptive keyboard mode
 for suspend and, resume
Date: Thu, 3 Apr 2014 12:47:40 -0300
Message-ID: <20140403154740.GC32027@khazad-dum.debian.net>
References: <5333F821.20704@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50343 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752697AbaDCQJm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Apr 2014 12:09:42 -0400
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id EA91D20FFD
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Apr 2014 12:09:41 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <5333F821.20704@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Shuduo Sang <shuduo.sang@canonical.com>
Cc: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, joey.zheng@canonical.com, bruce.ma@canonical.com

On Thu, 27 Mar 2014, Shuduo Sang wrote:
> Dan Aloni has submitted a patch to set adaptive mode to function mode
> when system resume back. Thanks Dan. :)
> 
> Following patch can make it to be restored to previous mode like What
> Windows does.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/1] thinkpad_acpi: Add support for status (external
 cover) LED
Date: Sun, 7 May 2017 20:49:03 -0300
Message-ID: <20170507234903.GA15137@khazad-dum.debian.net>
References: <20170119172132.36029-1-agoode@google.com>
 <20170507163812.GA14896@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55597 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751270AbdEGXtM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 May 2017 19:49:12 -0400
Content-Disposition: inline
In-Reply-To: <20170507163812.GA14896@xo-6d-61-c0.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Adam Goode <agoode@google.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 07 May 2017, Pavel Machek wrote:
> On Thu 2017-01-19 12:21:32, Adam Goode wrote:
> > This allows the control of the red status LED, which is the dot of the "i"
> > in the word "ThinkPad" on the outside cover of newer models.
> > 
> > In the manual, both this LED and the power LED are referred to as
> > the "system-status indicators" without distinction between the two, so
> > I chose "status" as the LED name.
> 
> Could we name it something like external_status or something? "status" is way too generic.

"thinkdot" ;-)

-- 
  Henrique Holschuh

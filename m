From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v1 2/3] platform/x86: thinkpad_acpi: Join string literals
 back
Date: Wed, 10 May 2017 10:21:41 -0300
Message-ID: <20170510132141.GA2168@khazad-dum.debian.net>
References: <20170509141721.15841-1-andriy.shevchenko@linux.intel.com>
 <20170509141721.15841-2-andriy.shevchenko@linux.intel.com>
 <20170509171040.GD19242@khazad-dum.debian.net>
 <1494351185.30052.94.camel@linux.intel.com>
 <1494375875.1064702.971453736.29BB0B11@webmail.messagingengine.com>
 <1494413508.30052.100.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47433 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751419AbdEJNVp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2017 09:21:45 -0400
Content-Disposition: inline
In-Reply-To: <1494413508.30052.100.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 10 May 2017, Andy Shevchenko wrote:
> Okay, what I'm going to do is:
> 1) drop patch 1 for now;
> 2) split patch 2 into two patches (and append your Ack on both);
> 3) push to our testing branch (I can send v2 if we need one more round
> of review).
> 
> Tell me if there is any objection.

Eh, I already went through the patch and acked it, so you can send it
as-is if you want to.  That said, I am also fine if you break it into
two and add my ack to both.

-- 
  Henrique Holschuh

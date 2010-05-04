From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 3/3] X86 platfrom wmi: Add debug facility to dump WMI data in a readable way
Date: Tue, 4 May 2010 18:40:09 +0100
Message-ID: <201005041840.09161.carlos@strangeworlds.co.uk>
References: <1272893417-3481-1-git-send-email-trenn@suse.de> <1272893417-3481-3-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:40999 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755682Ab0EDRkP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 4 May 2010 13:40:15 -0400
Received: by mail-wy0-f174.google.com with SMTP id 20so2572124wye.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 May 2010 10:40:14 -0700 (PDT)
In-Reply-To: <1272893417-3481-3-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com

On Monday 03 May 2010 14:30:17 Thomas Renninger wrote:
> Signed-off-by: Thomas Renninger <trenn@suse.de>
> CC: platform-driver-x86@vger.kernel.org
> CC: mjg59@srcf.ucam.org
> CC: corentin.chary@gmail.com

I don't really see the point of this one - this information is all obtainable 
from the DSDT.

If you really want it, then I don't mind, it just seems redundant...

-Carlos
-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D

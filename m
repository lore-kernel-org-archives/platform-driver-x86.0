From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 1/3] X86 platform wmi: Introduce debug param to log all WMI events
Date: Tue, 4 May 2010 18:39:57 +0100
Message-ID: <201005041839.57611.carlos@strangeworlds.co.uk>
References: <1272893417-3481-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:40999 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754924Ab0EDRkG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 4 May 2010 13:40:06 -0400
Received: by wye20 with SMTP id 20so2572124wye.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 May 2010 10:40:05 -0700 (PDT)
In-Reply-To: <1272893417-3481-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com

On Monday 03 May 2010 14:30:15 Thomas Renninger wrote:
> To give people easily an idea what could be WMI driven on their system.
> Introduces:
> wmi.debug=[01]
> 
> Tested on an acer:
> ACPI: WMI: DEBUG Event INTEGER_TYPE - 65535
> 
> Situation where a driver registers for specific event and debug
> handler gets overridden and set again if the registering driver gets
> unloaded again is untested, but should work.
> 
> Signed-off-by: Thomas Renninger <trenn@suse.de>

Signed-off-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> CC: platform-driver-x86@vger.kernel.org
> CC: mjg59@srcf.ucam.org
> CC: corentin.chary@gmail.com
-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D

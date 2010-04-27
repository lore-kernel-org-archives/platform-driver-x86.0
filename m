From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] classmate-laptop: Add RFKILL support.
Date: Tue, 27 Apr 2010 17:22:27 +0100
Message-ID: <20100427162227.GA5645@srcf.ucam.org>
References: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:38237 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756253Ab0D0QWk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Apr 2010 12:22:40 -0400
Content-Disposition: inline
In-Reply-To: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: platform-driver-x86@vger.kernel.org, don@syst.com.br, johannes@sipsolutions.net, rpurdie@rpsys.net

On Tue, Apr 27, 2010 at 01:15:00PM -0300, Thadeu Lima de Souza Cascardo wrote:
> The RFKILL device shares the same ACPI device used for backlight. So, it
> required a new struct sharing both a backlight_device and a rfkill
> device.

Is this purely a software-controlled toggle, or can the firmware change 
the state as well? If the latter, how is synchronisation between 
hardware and OS state handled?

-- 
Matthew Garrett | mjg59@srcf.ucam.org

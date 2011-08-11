From: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Subject: Re: [PATCH 21/34] drivers/platform changes for SMBIOS and System
  Firmware
Date: Thu, 11 Aug 2011 14:00:57 +0930
Message-ID: <20110811043057.GD15940@marvin.atrad.com.au>
References: <1310994528-26276-1-git-send-email-prarit@redhat.com>
 <1310994528-26276-22-git-send-email-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:60709 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685Ab1HKExZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 11 Aug 2011 00:53:25 -0400
Content-Disposition: inline
In-Reply-To: <1310994528-26276-22-git-send-email-prarit@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Prarit Bhargava <prarit@redhat.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jwoithe@physics.adelaide.edu.au

On Mon, Jul 18, 2011 at 09:08:35AM -0400, Prarit Bhargava wrote:
> - Replace old dmi* structures and functions with new sysfw* and smbios*
> structures and functions in individual drivers
> - cleanup sysfw_id lookup tables
> - add exactmatch functionality
> - edit udev notifiers
> - cleanup of includes for dmi.h and mod_devicetable.h which were included in
> some files that did not need them
> 
> [v2]: Re-exported dmi MODULE_ALIAS
> :
>  drivers/platform/x86/fujitsu-laptop.c |   41 ++++----
> :

In-so-far as I can tell with a quick inspection, this looks ok for the
fujitsu-laptop.c module.

Acked-by: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>

At the risk of looking ill-informed, I assume the DMI infrastructure has
been deprecated by the more general sysfw.

Regards
  jonathan

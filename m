From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] acpi ec_sys: Be more cautious about ec write access
Date: Fri, 30 Jul 2010 13:37:17 -0300
Message-ID: <20100730163717.GB32120@khazad-dum.debian.net>
References: <201007292216.13568.trenn@suse.de>
 <1280435424-19656-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1.smtp.messagingengine.com ([66.111.4.25]:48353 "EHLO
	out1.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750841Ab0G3Qh1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 30 Jul 2010 12:37:27 -0400
Content-Disposition: inline
In-Reply-To: <1280435424-19656-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, astarikovskiy@suse.de

On Thu, 29 Jul 2010, Thomas Renninger wrote:
> - Only allow root to read/write io file (sever bug!)

I'd go further, and only allow CAP_SYS_RAWIO.

> +	  The kernel accesses the EC through ACPI parsed code provided by BIOS
> +	  tables. This option allows to access the EC directly without ACPI
> +	  code being involved.

This is not really true.  Kernel drivers can, and do access the EC without
help from the AML firmware (DSDT, SSDT...).

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

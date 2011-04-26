From: Peter Feuerer <peter@piie.net>
Subject: Re: [PATCH] acerhdf: Clean up includes
Date: Tue, 26 Apr 2011 16:12:29 +0200
Message-ID: <cone.1303827149.155725.4025.1000@deskpiie>
References: <20110424180755.7c1759ff@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay06.ispgateway.de ([80.67.31.101]:49964 "EHLO
	smtprelay06.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756006Ab1DZOVG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Apr 2011 10:21:06 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

Jean Delvare writes:

> * The acerhdf driver isn't an ACPI driver, so it needs not include
>   <acpi/acpi_drivers.h>. All it uses is ec_read() and ec_write(), for
>   which <linux/acpi.h> is sufficient.
> * I couldn't find any reason why <linux/fs.h> and <linux/sched.h> were
>   included.
> 
> This should avoid unneeded rebuilds of the acerhdf driver.
> 
> Signed-off-by: Jean Delvare <khali@linux-fr.org>

Acked-by: Peter Feuerer <peter@piie.net>

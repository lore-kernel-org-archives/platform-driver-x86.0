From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe@gmx.de>
Subject: Re: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Wed, 15 Dec 2010 21:35:35 +0100
Message-ID: <201012152135.35941.PeterHuewe@gmx.de>
References: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.23]:59119 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
	id S1751053Ab0LOUfo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Dec 2010 15:35:44 -0500
In-Reply-To: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Am Donnerstag 09 Dezember 2010, 00:29:30 schrieb Peter Huewe:
> This patch removes a recursive dependency which causes a build failure
> [1-3] by changing the ASUS_WMI from select ACPI_WMI to depend on
> ACPI_WMI as most other _WMI config options do.
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
> Error Message:
> drivers/platform/x86/Kconfig:422:error: recursive dependency detected!
> drivers/platform/x86/Kconfig:422:	symbol EEEPC_WMI depends on ACPI_WMI
> drivers/platform/x86/Kconfig:438:	symbol ACPI_WMI is selected by ACER_WMI
> drivers/platform/x86/Kconfig:18:	symbol ACER_WMI depends on LEDS_CLASS
> drivers/leds/Kconfig:10:	symbol LEDS_CLASS is selected by EEEPC_WMI
> 
> 
> References:
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/3607123/
> [2] http://kisskb.ellerman.id.au/kisskb/buildresult/3607218/
> [3] http://kisskb.ellerman.id.au/kisskb/buildresult/3607139/
> 
> KernelVersion: linux-next-20101208
> 


Ping - Any updates yet ?

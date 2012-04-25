From: Peter Meiser <meiser@gmx-topmail.de>
Subject: Re: Dell Vostro V131: special hotkey not working
Date: Wed, 25 Apr 2012 16:19:51 +0200
Message-ID: <4F980807.6000705@gmx-topmail.de>
References: <4F97FA4C.9040201@gmx-topmail.de> <20120425135328.GA13385@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:33417 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752073Ab2DYOTy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Apr 2012 10:19:54 -0400
In-Reply-To: <20120425135328.GA13385@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

Hello Matthew,

Am 25.04.2012 15:53, schrieb Matthew Garrett:
> watch -n 0.1 cat /proc/interrupts

When running "watch -n 0,1 cat /proc/interrupts" (watch -n 0.1 errors out, maybe because of German environment???), the following row increases after each press:

  9:          5          0          0          0   IO-APIC-fasteoi   acpi


Others increase more quickly, but they are iwlwifi, i915, "Local timer interrupts" and "Rescheduling interrupts" which are out of interest, right?

Best regards,
Peter

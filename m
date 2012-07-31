From: Mattia Dongili <malattia@linux.it>
Subject: Re: ACPI keys for Sony VAIO VPC-Z23A4R laptop
Date: Wed, 1 Aug 2012 06:38:00 +0900
Message-ID: <20120731213758.GA6206@kamineko.org>
References: <CAN_LGv17f+DHvPO0DOpuBp10Rf6W-FSFu2Juk9OA-8_+atfbhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:48447 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751789Ab2GaViB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 Jul 2012 17:38:01 -0400
Content-Disposition: inline
In-Reply-To: <CAN_LGv17f+DHvPO0DOpuBp10Rf6W-FSFu2Juk9OA-8_+atfbhw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Alexander E. Patrakov" <patrakov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Hi,

On Tue, Jul 31, 2012 at 08:38:10PM +0200, Alexander E. Patrakov wrote:
> Hello.
> 
> The current sony-laptop driver supports some, but not all of the Sony
> VAIO VPC-Z23A4R special keys. Please improve it, I am ready to test
> patches!
> 
> So here is what the special keys produce on /proc/acpi/event (first
> line = press, second line = release):

I assume you're using linux 3.5.
Not all key events are handled via the SNC device (which sony-laptop is
a driver for).
Could you produce the same reports loading sony-laptop with debug=1 and
maybe only for those keys that are not handled correctly.
Also, could you please send ma copy of your laptop's DSDT?

Thanks!
-- 
mattia
:wq!

From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/2] Make WMI be selected automatically when needed
Date: Fri, 23 Apr 2010 20:20:59 +0100
Message-ID: <20100423192059.GA32705@srcf.ucam.org>
References: <4BC8FF9D.7050500@tremplin-utc.net> <20100416173127.6b968fd4.randy.dunlap@oracle.com> <4BC907B5.2050104@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:49778 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750993Ab0DWTVI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Apr 2010 15:21:08 -0400
Content-Disposition: inline
In-Reply-To: <4BC907B5.2050104@tremplin-utc.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?=C9ric?= Piel <Eric.Piel@tremplin-utc.net>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@osdl.org>, "Brown, Len" <len.brown@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Apr 17, 2010 at 02:58:29AM +0200, =C9ric Piel wrote:

>  config LEDS_DELL_NETBOOKS
>  	tristate "External LED on Dell Business Netbooks"
> -	depends on X86 && ACPI_WMI
> +	depends on X86
> +	depends on ACPI
> +	select ACPI_WMI

I dislike this. The originally stated dependencies are correct and more=
=20
accurately represent what the code requires, and changing that for the=20
sake of making it easier for people to find the driver sounds like it's=
=20
trying to cover up shortcomings in our configuration system more than=20
anything else.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

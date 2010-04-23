From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/2] Make WMI be selected automatically when needed
Date: Fri, 23 Apr 2010 21:04:15 +0100
Message-ID: <20100423200415.GA1009@srcf.ucam.org>
References: <4BC8FF9D.7050500@tremplin-utc.net> <20100416173127.6b968fd4.randy.dunlap@oracle.com> <4BC907B5.2050104@tremplin-utc.net> <20100423192059.GA32705@srcf.ucam.org> <4BD1FA5A.6060406@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:38672 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755309Ab0DWUEc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Apr 2010 16:04:32 -0400
Content-Disposition: inline
In-Reply-To: <4BD1FA5A.6060406@tremplin-utc.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?=C9ric?= Piel <Eric.Piel@tremplin-utc.net>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@osdl.org>, "Brown, Len" <len.brown@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Apr 23, 2010 at 09:51:54PM +0200, =C9ric Piel wrote:

> Currently there are 2 modules which select ACPI_WMI and 4 which depen=
d
> on it. There are 7 modules which select BACKLIGHT_CLASS_DEVICE and as
> many which depend on it. Making usage of the select functionality all
> the time would avoid these inconsistencies.

Using select for ACPI_WMI is pretty clearly wrong since it fails in=20
cases where ACPI isn't enabled. But I don't think the appropriate way t=
o=20
handle that is to encode the dependency between ACPI_WMI and ACPI=20
multiple times - they should just be switched to depend on it instead.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

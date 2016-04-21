From: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: Re: [PATCH v2 2/2] asus-laptop: correct error handling in
 sysfs_acpi_set
Date: Thu, 21 Apr 2016 09:35:51 +0300
Message-ID: <20160421063551.GA12510@tyrael>
References: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
 <1460764917-1042-2-git-send-email-giedrius.statkevicius@gmail.com>
 <20160420201955.GA35572@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34483 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172AbcDUGf4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Apr 2016 02:35:56 -0400
Content-Disposition: inline
In-Reply-To: <20160420201955.GA35572@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 20, 2016 at 01:19:55PM -0700, Darren Hart wrote:
> On Sat, Apr 16, 2016 at 03:01:57AM +0300, Giedrius Statkevi=C4=8Dius =
wrote:
> > Properly return rv back to the caller in the case of an error in
> > parse_arg. In the process remove a unused variable 'out'.
>=20
> The initial problem if I recall was value being uninitialized. Is tha=
t correct?
No, 'out' was just removed as it was unused. Then you caught the issue =
with
error handling in this function so I've updated this patch to fix that =
as well.

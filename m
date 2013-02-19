From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: do not use 'devices' uninitialized
Date: Tue, 19 Feb 2013 23:09:47 +0800
Message-ID: <1361286587.6635.29.camel@linux-s257.site>
References: <1359033178.1325.15.camel@x61.thuisdomein>
	 <1361241494.6635.2.camel@linux-s257.site>
	 <1361261230.26423.9.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:57610 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932551Ab3BSPKw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Feb 2013 10:10:52 -0500
In-Reply-To: <1361261230.26423.9.camel@x61.thuisdomein>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>

=E6=96=BC =E4=BA=8C=EF=BC=8C2013-02-19 =E6=96=BC 09:07 +0100=EF=BC=8CPa=
ul Bolle =E6=8F=90=E5=88=B0=EF=BC=9A
> Joey.
>=20
> On Tue, 2013-02-19 at 10:38 +0800, joeyli wrote:
> > Zhang Rui sent similar patch for fix the warning:
> > http://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg=
04016.html
>=20
> I see. It didn't make it into the v3.8 release. Could someone please
> send a note to the stable list once Zhang's patch hits mainline
> (presumably in one of the v3.9 release candidates)?
>=20
>=20
> Paul Bolle
>=20
> .

I will track this patch and send the note to stable kernel when it
merged to platform driver git.


Thanks a lot!
Joey Lee

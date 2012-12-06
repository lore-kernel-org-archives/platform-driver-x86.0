From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v2 8/8] msi-wmi: Add MSI Wind support
Date: Thu, 06 Dec 2012 11:44:06 +0800
Message-ID: <1354765446.21227.1644.camel@linux-s257.site>
References: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
	 <1354291477-8788-9-git-send-email-maxtram95@gmail.com>
	 <20121130182209.329bebd0@destiny.ordissimo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:53677 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752291Ab2LFDpP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Dec 2012 22:45:15 -0500
In-Reply-To: <20121130182209.329bebd0@destiny.ordissimo>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Anisse Astier <anisse@astier.eu>

Hi Maxim,=20

=46irst, thanks for your effort for transform your patch to msi-wmi.

=E6=96=BC =E4=BA=94=EF=BC=8C2012-11-30 =E6=96=BC 18:22 +0100=EF=BC=8CAn=
isse Astier =E6=8F=90=E5=88=B0=EF=BC=9A
>=20
> There's a lot of restructuring in here that aren't directly related t=
o
> adding support for new hardware (enums, init path for backlight,
> quirk,
> etc.), which make this patch hard to review. You should try to put
> these
> in separate patches.
>=20
> Regards,
>=20
> Anisse=20

I also reviewed this patch and I agree Anisse's suggestion. This patch
is big, it not just add the Wind series support and also do some source
code clear up and refactory.=20

Please try to separate them.


Thanks a lot!
Joey Lee

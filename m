From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH 3.0.y] acer-wmi: No wifi rfkill on Lenovo machines
Date: Mon, 19 Mar 2012 09:48:16 -0500
Message-ID: <20120319144816.GB11180@burratino>
References: <1327546404.15260.18.camel@linux-s257.site>
 <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
 <20120314215327.GA1510@burratino>
 <20120314220251.GB14166@kroah.com>
 <20120314221749.GF31686@burratino>
 <4F62BB9E.3070508@canonical.com>
 <1331878281.10557.257.camel@linux-s257.site>
 <20120316172040.GB6711@kroah.com>
 <1332122914.10557.271.camel@linux-s257.site>
 <4F67294C.9040309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:62655 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752766Ab2CSOs3 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 10:48:29 -0400
Content-Disposition: inline
In-Reply-To: <4F67294C.9040309@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrey <andrey.k.p@gmail.com>
Cc: joeyli <jlee@suse.com>, Greg KH <gregkh@linuxfoundation.org>, Ike Panhc <ike.pan@canonical.com>, stable@vger.kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Hi Andrey,

Andrey wrote:
>> =E6=96=BC =E4=BA=94=EF=BC=8C2012-03-16 =E6=96=BC 10:20 -0700=EF=BC=8C=
Greg KH =E6=8F=90=E5=88=B0=EF=BC=9A

>>> Ok, I've queued up a number of acer-wmi patches for the 3.0-stable =
tree
>>> now, all should be good.
[...]
> Please notify me when patches will be present in git. For testing.
> Thanks!

The patches can be found in the git repository here:

  git://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git

in the queue-3.0 subdirectory so you are free to test them today. ;-)

When Greg announces the next release of the 3.0.y kernel, they will
also be available from the linux-3.0.y branch of

  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

assuming nobody has found problems with the patches by then.

Hope that helps,
Jonathan

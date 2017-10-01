From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 4/8] platform/x86: wmi: create character devices when
 requested by drivers
Date: Sun, 1 Oct 2017 14:25:00 +0000
Message-ID: <eb4f96b91dc34e59a0d3b3ee7b434161@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <17fcf9748e83ede2751a00d8248cb32cbdc610d6.1506571188.git.mario.limonciello@dell.com>
 <20170930015228.GC13307@fury> <20170930081205.GA22980@kroah.com>
 <81ddaac76f15420b800db365d694e156@ausx13mpc120.AMER.DELL.COM>
 <20171001132336.GA26295@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa8.dell-outbound.iphmx.com ([68.232.149.218]:5867 "EHLO
        esa8.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750988AbdJAOZD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2017 10:25:03 -0400
In-Reply-To: <20171001132336.GA26295@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Sunday, October 1, 2017 8:24 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.=
org;
> quasisec@google.com; pali.rohar@gmail.com; rjw@rjwysocki.net;
> mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v3 4/8] platform/x86: wmi: create character devices w=
hen
> requested by drivers
>=20
> On Sat, Sep 30, 2017 at 07:26:57PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > I think what's Darren's most interested in is the that conceptually thi=
s is
> > an approach you can agree with.
> >
> > "A WMI vendor driver binds to the WMI bus and requests the WMI bus to
> create
> > a character device.  The WMI bus creates a character device /dev/wmi/$d=
river
> > which the WMI vendor driver will process all various file operations."
>=20
> We've been over this before, let's see that actual implementation which
> defines the "will process all..." implementation to see if that is
> actually an acceptable thing.
>=20
> thanks,
>=20
> greg k-h

I'm working on changes still (that you'll be CC on), but I don't expect thi=
s specific=20
concept to change in the future changes:

Bus creating character device:
https://patchwork.kernel.org/patch/9975283/

Driver requesting character device:
https://patchwork.kernel.org/patch/9975263/
